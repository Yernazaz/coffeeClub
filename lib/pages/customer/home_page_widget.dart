import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/backend/user/auth_service.dart';
import 'package:flutter_app/pages/customer/coffee_shop_detail.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/backend/coffee_shops/coffee_shops.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String? username;
  late Future<List<CoffeeShop>> coffeeShopsFuture;
  List<CoffeeShop>? coffeeShops;
  List<CoffeeShop>? filteredCoffeeShops;
  bool showNearby = false;
  String searchQuery = '';
  bool permissionGranted = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _checkAndRequestPermissions();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('user_name');
    });
  }

  Future<void> _checkAndRequestPermissions() async {
    setState(() {
      isLoading = true;
    });

    var status = await Permission.location.status;

    if (status.isGranted) {
      setState(() {
        permissionGranted = true;
        isLoading = false;
      });
      _loadCoffeeShops();
    } else if (status.isDenied) {
      var result = await Permission.location.request();
      if (result.isGranted) {
        setState(() {
          permissionGranted = true;
          isLoading = false;
        });
        _loadCoffeeShops();
      } else {
        setState(() {
          permissionGranted = false;
          isLoading = false;
        });
      }
    } else {
      setState(() {
        permissionGranted = false;
        isLoading = false;
      });
    }
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
    if (permissionGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      await CoffeeShopsService()
          .updateCoffeeShopsCache(position.latitude, position.longitude);
      _loadCoffeeShops();
    }
  }

  void _sortCoffeeShopsByDistance() {
    setState(() {
      coffeeShops?.sort((a, b) {
        double distanceA = double.parse(a.distance.split(' ').first);
        double distanceB = double.parse(b.distance.split(' ').first);
        return distanceA.compareTo(distanceB);
      });
      showNearby = true;
    });
  }

  void _filterCoffeeShops(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredCoffeeShops = coffeeShops;
      } else {
        filteredCoffeeShops = coffeeShops?.where((coffeeShop) {
          return coffeeShop.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  Future<void> _requestPermissions() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      setState(() {
        permissionGranted = true;
      });
      _loadCoffeeShops();
    } else {
      setState(() {
        permissionGranted = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _updateCoffeeShopsCache,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFF4E6),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.fromLTRB(0, 41, 0, 0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    if (isLoading)
                      Center(child: CircularProgressIndicator())
                    else if (!permissionGranted)
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Location permissions are required to fetch coffee shops.',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _requestPermissions,
                              child: Text('Grant Permissions'),
                            ),
                          ],
                        ),
                      )
                    else
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildGreetingContainer(),
                            _buildLocationContainer(),
                            _buildSearchContainer(),
                            _buildFilterOptions(),
                            _buildCoffeeShopsList(),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingContainer() {
    return Container(
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
    );
  }

  Widget _buildLocationContainer() {
    return Container(
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
    );
  }

  Widget _buildSearchContainer() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 7),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFECECEC),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 5.5, 0),
              width: 21.1,
              height: 21.1,
              child: SvgPicture.asset(
                'assets/vectors/vector_105_x2.svg',
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: _filterCoffeeShops,
                decoration: InputDecoration(
                  hintText: 'Поиск...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 4, 0, 3.9),
              width: 13.2,
              height: 13.2,
              child: SvgPicture.asset(
                'assets/vectors/vector_62_x2.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOptions() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                showNearby = false;
              });
            },
            child: _buildFilterOption(
              'Все',
              showNearby ? const Color(0xFFECECEC) : const Color(0xFF4B3832),
              showNearby ? const Color(0xFF4B3832) : const Color(0xFFFFF4E6),
              !showNearby,
            ),
          ),
          GestureDetector(
            onTap: _sortCoffeeShopsByDistance,
            child: _buildFilterOption(
              'Рядом',
              showNearby ? const Color(0xFF4B3832) : const Color(0xFFECECEC),
              showNearby ? const Color(0xFFFFF4E6) : const Color(0xFF4B3832),
              showNearby,
            ),
          ),
          _buildFilterOption(
            'С бонусами',
            const Color(0xFFECECEC),
            const Color(0xFF4B3832),
            false,
          ),
          _buildFilterOption(
            'Избранное',
            const Color(0xFFECECEC),
            const Color(0xFF4B3832),
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(
      String text, Color bgColor, Color textColor, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.fromLTRB(11.5, 8, 11.5, 7),
      child: Text(
        text,
        style: GoogleFonts.getFont(
          'Roboto Condensed',
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          fontSize: 16,
          height: 1,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildCoffeeShopsList() {
    return FutureBuilder<List<CoffeeShop>>(
      future: coffeeShopsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildSkeletonLoader();
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const Center(child: Text('Failed to load coffee shops'));
        } else if (snapshot.hasData) {
          coffeeShops = snapshot.data!;
          if (showNearby) {
            coffeeShops!.sort((a, b) {
              double distanceA = double.parse(a.distance.split(' ').first);
              double distanceB = double.parse(b.distance.split(' ').first);
              return distanceA.compareTo(distanceB);
            });
          }
          filteredCoffeeShops = coffeeShops;
          if (searchQuery.isNotEmpty) {
            filteredCoffeeShops = coffeeShops!.where((coffeeShop) {
              return coffeeShop.name
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase());
            }).toList();
          }
          return _buildCoffeeShops(filteredCoffeeShops!);
        } else {
          return const Center(child: Text('No coffee shops found'));
        }
      },
    );
  }

  Widget _buildSkeletonLoader() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          5, // Adjust the number based on how many skeletons you want to show
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 13),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 12, 5),
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 12, 3),
                  child: Container(
                    width: double.infinity,
                    height: 14,
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                  child: Container(
                    width: double.infinity,
                    height: 14,
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Container(
                    width: double.infinity,
                    height: 16,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCoffeeShops(List<CoffeeShop> coffeeShops) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: ListView.builder(
        key: ValueKey<int>(coffeeShops.length),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: coffeeShops.length,
        itemBuilder: (context, index) {
          final coffeeShop = coffeeShops[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoffeeShopPage(coffeeShop: coffeeShop),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 13),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(11),
                          topRight: Radius.circular(11),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
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
                    margin: const EdgeInsets.fromLTRB(12, 0, 12, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            coffeeShop.name,
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1,
                              color: const Color(0xFF000000),
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
                              coffeeShop.rating.toString(),
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 1,
                                color: const Color(0xFF4B3832),
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'оценок',
                              style: GoogleFonts.getFont(
                                'Roboto Condensed',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                height: 1,
                                color: const Color(0xFF4B3832),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(12, 0, 12, 3),
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
                    margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
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
                    margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 8, 4),
                          child: Text(
                            'ЕСТЬ БОНУСЫ',
                            style: GoogleFonts.getFont(
                              'Roboto Condensed',
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              height: 1,
                              color: const Color(0xFF03AD00),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
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
      ),
    );
  }
}
