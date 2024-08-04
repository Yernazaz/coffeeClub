import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:flutter_app/backend/user/user_service.dart';
import 'package:flutter_app/main.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  String? username;
  String? userPhone;
  String? profilePic;
  File? _localImage;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController(text: "+77777777777");
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('user_name') ?? '';
      userPhone = prefs.getString('user_phone') ?? '+77777777777';
      profilePic = prefs.getString('profile_pic');
      _nameController.text = username!;
      _phoneController.text = userPhone!;
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _localImage = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _saveUserData(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пароли не совпадают')),
      );
      return;
    }

    try {
      await updateUser(
        name: _nameController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
        profilePic: _localImage,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Данные сохранены')),
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user_name', _nameController.text);
      prefs.setString('user_phone', _phoneController.text);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => MainPage(
            userRole: 'customer',
            selectedIndex: 3, // Navigate to SettingsPage
          ),
        ),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка при сохранении данных: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4E6),
      appBar: AppBar(
        title: Text('Личные данные'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    backgroundImage: _localImage != null
                        ? FileImage(_localImage!)
                        : profilePic != null
                            ? NetworkImage(profilePic!) as ImageProvider<Object>
                            : NetworkImage(''),
                    child: (_localImage == null && profilePic == null)
                        ? Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Ваше имя',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите ваше имя';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Номер телефона',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите номер телефона';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Подтвердите пароль',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                ElevatedButton(
                  onPressed: () {
                    _saveUserData(context);
                  },
                  child: Text('Сохранить'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xFFFFF4E6),
                    backgroundColor: Color(0xFF4B3832), // Text color
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> updateUser({
  required String name,
  required String phone,
  required String password,
  File? profilePic,
}) async {
  updateUserCall(
      name: name, phone: phone, password: password, profilePic: profilePic);
}
