import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/pages/barista/barista_settings.dart';
import 'package:flutter_app/pages/barista/barista_qr_code.dart';
import 'package:flutter_app/backend/bonus/barista.dart';

class BaristaInfoPage extends StatefulWidget {
  final Map<String, dynamic> userDetails;
  final int shopId;
  final int userId;

  BaristaInfoPage(
      {required this.userDetails, required this.shopId, required this.userId});

  @override
  _BaristaInfoPageState createState() => _BaristaInfoPageState();
}

class _BaristaInfoPageState extends State<BaristaInfoPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Coffee Club',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  textStyle: const TextStyle(
                    fontSize: 40,
                    color: Color(0xFF4B3832),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Бариста: ',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Алексей Андреев',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            buildInfoField('Имя клиента:', widget.userDetails['name']),
            buildInfoField('Телефон клиента:', widget.userDetails['phone']),
            buildInfoField('Количество бонусных чашек:',
                widget.userDetails['bonus_glasses'].toString()),
            buildInfoField('Скидка постоянного клиента:',
                widget.userDetails['is_permanent_discount'] ? 'Да' : 'Нет'),
            buildInfoField('Подписка:',
                widget.userDetails['has_subscription'] ? 'Да' : 'Нет'),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () async {
                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          BaristaBonus barista = BaristaBonus();
                          await barista.giveBonus(widget.userId, widget.shopId);
                          Navigator.pop(context);
                        } catch (e) {
                          print(e);
                        } finally {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4B3832),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Выдать чашку кофе',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add your functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4B3832),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Выдать подписку',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.delete, color: Colors.black),
                const SizedBox(width: 10),
                Text(
                  'Удалить последнюю запись',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.qr_code, color: Colors.black),
                const SizedBox(width: 10),
                Text(
                  'Сканированные сегодня:',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  ' 7',
                  style: GoogleFonts.getFont(
                    'Roboto Condensed',
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          child: Container(
            height: 50,
            color: const Color(0xFFFFF4E6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.qr_code, color: Colors.brown),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRCodeScannerPage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.tune, color: Colors.brown),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BaristaSettingsPage(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoField(String label, String value) {
    return Container(
      width: double.infinity,
      height: 40, // Adjusted height for single line
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF4B3832), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '$label ',
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              TextSpan(
                text: value,
                style: GoogleFonts.getFont(
                  'Roboto Condensed',
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
