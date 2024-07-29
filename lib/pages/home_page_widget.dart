import 'package:flutter/material.dart';
import 'package:flutter_app/backend/user/auth_service.dart';
import 'package:flutter_app/pages/barista_qr_code.dart';
import 'package:flutter_app/pages/coffee_shop.dart';
import 'package:flutter_app/pages/register_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/backend/coffee_shops/coffee_shops.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String? username;
  late Future<List<CoffeeShop>> coffeeShopsFuture;

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _loadCoffeeShops();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('user_name');
    });
  }

  void _loadCoffeeShops() {
    setState(() {
      coffeeShopsFuture = () async {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        return CoffeeShopsService()
            .fetchCoffeeShops(position.latitude, position.longitude);
      }();
    });
  }

  Future<void> _updateCoffeeShopsCache() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await CoffeeShopsService()
        .updateCoffeeShopsCache(position.latitude, position.longitude);
    _loadCoffeeShops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _updateCoffeeShopsCache,
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFFF4E6),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 41, 0, 0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Добрый день, ${username}.',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                height: 1,
                                color: const Color(0xFF4B3832),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 7),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 6.3, 0),
                                child: SizedBox(
                                  width: 18.8,
                                  height: 25,
                                  child: SvgPicture.asset(
                                    'assets/vectors/vector_110_x2.svg',
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 3, 0, 2),
                                child: Text(
                                  'Астана',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                    height: 1,
                                    color: const Color(0xFF4B3832),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 7),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFECECEC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding:
                                const EdgeInsets.fromLTRB(7.4, 6.4, 15.4, 7.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 5.5, 0),
                                      width: 21.1,
                                      height: 21.1,
                                      child: SizedBox(
                                        width: 21.1,
                                        height: 21.1,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_105_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 2.6, 0, 3.5),
                                      child: Text(
                                        'Поиск...',
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          height: 1,
                                          color: const Color(0xFF4B3832),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 4, 0, 3.9),
                                  width: 13.2,
                                  height: 13.2,
                                  child: SizedBox(
                                    width: 13.2,
                                    height: 13.2,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_62_x2.svg',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF4B3832),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.fromLTRB(7, 8, 7, 7),
                              child: Text(
                                'Все',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 1,
                                  color: const Color(0xFFFFF4E6),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QRCodeScannerPage(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFECECEC),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(6.3, 8, 6.3, 7),
                                child: Text(
                                  'Рядом',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 1,
                                    color: const Color(0xFF4B3832),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFECECEC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(11.5, 8, 11.5, 7),
                              child: Text(
                                'С бонусами',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 1,
                                  color: const Color(0xFF4B3832),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFECECEC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(11.5, 8, 11.5, 7),
                              child: Text(
                                'Избранное',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 1,
                                  color: const Color(0xFF4B3832),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<List<CoffeeShop>>(
                        future: coffeeShopsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text('Failed to load coffee shops'));
                          } else if (snapshot.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final coffeeShop = snapshot.data![index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CoffeeShopPage(
                                            coffeeShop: coffeeShop),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        16, 0, 16, 13),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 6),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(11),
                                                topRight: Radius.circular(11),
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  'https://www.coffeebeancompany.co.uk/app/uploads/2017/04/Coffee-Shop-1024x765.jpg',
                                                ),
                                              ),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: 150,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              12, 0, 12, 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  coffeeShop.name,
                                                  style: GoogleFonts.getFont(
                                                    'Roboto Condensed',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    height: 1,
                                                    color:
                                                        const Color(0xFF000000),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 16,
                                                  ),
                                                  SizedBox(width: 2),
                                                  Text(
                                                    coffeeShop.rating
                                                        .toString(),
                                                    style: GoogleFonts.getFont(
                                                      'Roboto Condensed',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      height: 1,
                                                      color: const Color(
                                                          0xFF4B3832),
                                                    ),
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    'оценок',
                                                    style: GoogleFonts.getFont(
                                                      'Roboto Condensed',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1,
                                                      color: const Color(
                                                          0xFF4B3832),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              12, 0, 12, 3),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '${coffeeShop.street}, ${coffeeShop.city}',
                                              style: GoogleFonts.getFont(
                                                'Roboto Condensed',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1,
                                                color: const Color(0xFF4B3832),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              12, 0, 12, 8),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Расстояние: ${coffeeShop.distance}, ${coffeeShop.openingHours}',
                                              style: GoogleFonts.getFont(
                                                'Roboto Condensed',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1,
                                                color: const Color(0xFF4B3832),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              12, 0, 12, 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 8, 4),
                                                child: Text(
                                                  'ЕСТЬ БОНУСЫ',
                                                  style: GoogleFonts.getFont(
                                                    'Roboto Condensed',
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 16,
                                                    height: 1,
                                                    color:
                                                        const Color(0xFF03AD00),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(0, 0, 5, 0),
                                                      child: SizedBox(
                                                        width: 28,
                                                        height: 25,
                                                        child: SvgPicture.asset(
                                                          'assets/vectors/vector_118_x2.svg',
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 18.8,
                                                      height: 25,
                                                      child: SvgPicture.asset(
                                                        'assets/vectors/vector_66_x2.svg',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                                child: Text('No coffee shops found'));
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
