import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/customer/home_page_widget.dart';
import 'package:flutter_app/pages/customer/settings.dart';
import 'package:flutter_app/pages/customer/best_places.dart';
import 'package:flutter_app/pages/auth/register_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/pages/customer/coffee_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/backend/user/user_service.dart';
import 'package:flutter_app/backend/user/auth_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_app/pages/barista/barista_qr_code.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_app/backend/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  Future<String?> checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshTokenPref = prefs.getString('refresh');
    if (refreshTokenPref == null || refreshTokenPref.isEmpty) {
      return null;
    }
    AuthService authService = AuthService();
    try {
      await authService.refreshToken(refreshTokenPref);
    } catch (e) {
      return null;
    }
    String? accessToken = prefs.getString('access');
    String? userRole = prefs.getString('user_role');
    if (accessToken != null && accessToken.isNotEmpty) {
      return userRole;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          home: PermissionCheckScreen(),
        );
      },
    );
  }
}

class PermissionCheckScreen extends StatefulWidget {
  @override
  _PermissionCheckScreenState createState() => _PermissionCheckScreenState();
}

class _PermissionCheckScreenState extends State<PermissionCheckScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      _navigateToNextScreen();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _requestPermissions() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      _navigateToNextScreen();
    }
  }

  Future<void> _navigateToNextScreen() async {
    setState(() {
      isLoading = true;
    });
    String? userRole = await MyApp().checkLoggedIn();
    if (userRole != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(userRole: userRole),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 345.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Container(
                        color: Color(0xFF4B3832),
                        padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 70.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Добро пожаловать в',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w800,
                                fontSize: 32.sp,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            Text(
                              'Coffee club',
                              style: GoogleFonts.getFont(
                                'Sanchez',
                                fontWeight: FontWeight.w400,
                                fontSize: 60.sp,
                                color: Color(0xFFFFF4E6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 180.h,
                      child: SvgPicture.asset(
                        'assets/vectors/container_x2.svg',
                        width: MediaQuery.of(context).size.width,
                        height: 165.5.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 140.h,
                      child: Image.asset(
                        'assets/images/image_15.png',
                        width: 180.w,
                        height: 195.h,
                      ),
                    ),
                    Positioned(
                      right: 130.w,
                      top: 230.h,
                      child: SvgPicture.asset(
                        'assets/vectors/star_11_x2.svg',
                        width: 11.w,
                        height: 12.h,
                      ),
                    ),
                    Positioned(
                      right: 50.w,
                      top: 180.h,
                      child: SvgPicture.asset(
                        'assets/vectors/star_2_x2.svg',
                        width: 14.w,
                        height: 15.h,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(31.2.w, 0, 30.5.w, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isLoading) ...[
                      SizedBox(height: screenHeight * 0.1),
                      Text(
                        'Для доступа к кофейням необходимы разрешения на определение местоположения.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Roboto Condensed',
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * 0.025,
                          color: Color(0xFF4B3832),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _requestPermissions,
                        child: Text('Дать разрешение'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xFFFFF4E6),
                          backgroundColor: Color(0xFF4B3832),
                          textStyle: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ] else ...[
                      SizedBox(height: screenHeight * 0.4),
                      CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF4B3832)),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final String userRole;
  final int selectedIndex;

  MainPage({required this.userRole, this.selectedIndex = 0});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex;

  static final List<Widget> _customerOptions = <Widget>[
    HomePageWidget(), // Your existing pages
    BestPlaces(),
    CoffeeMap(),
    SettingsPage(),
  ];

  static final List<Widget> _baristaOptions = <Widget>[
    QRCodeScannerPage(), // Barista's page
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    // Ensure the selected index is within range
    if (_selectedIndex >= (_customerOptions.length)) {
      _selectedIndex = 0;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _sendLocationOnLogin() async {
    Position position = await _determinePosition();
    String? token = await getToken();
    if (token != null) {
      UserLocation location =
          UserLocation(lat: position.latitude, lng: position.longitude);
      await sendUserLocation(location, token);
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final isCustomer = widget.userRole == 'customer';
    final widgetOptions = isCustomer ? _customerOptions : _baristaOptions;

    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: isCustomer
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/vectors/home.svg',
                    width: 24.w,
                    height: 24.h,
                    color: _selectedIndex == 0 ? Colors.brown : Colors.grey,
                  ),
                  label: 'Главное',
                  activeIcon: SvgPicture.asset(
                    'assets/vectors/home.svg',
                    width: 24.w,
                    height: 24.h,
                    color: Colors.brown,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/vectors/thunder.svg',
                    width: 24.w,
                    height: 24.h,
                    color: _selectedIndex == 1 ? Colors.brown : Colors.grey,
                  ),
                  label: 'Best Places',
                  activeIcon: SvgPicture.asset(
                    'assets/vectors/thunder.svg',
                    width: 24.w,
                    height: 24.h,
                    color: Colors.brown,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/vectors/MAP.svg',
                    width: 24.w,
                    height: 24.h,
                    color: _selectedIndex == 2 ? Colors.brown : Colors.grey,
                  ),
                  label: 'Map',
                  activeIcon: SvgPicture.asset(
                    'assets/vectors/MAP.svg',
                    width: 24.w,
                    height: 24.h,
                    color: Colors.brown,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/vectors/settings.svg',
                    width: 24.w,
                    height: 24.h,
                    color: _selectedIndex == 3 ? Colors.brown : Colors.grey,
                  ),
                  label: 'Settings',
                  activeIcon: SvgPicture.asset(
                    'assets/vectors/settings.svg',
                    width: 24.w,
                    height: 24.h,
                    color: Colors.brown,
                  ),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.brown,
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            )
          : null,
    );
  }
}
