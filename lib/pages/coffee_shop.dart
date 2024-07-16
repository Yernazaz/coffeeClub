import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/backend/coffee_shops/coffee_shops.dart';

class CoffeeShopPage extends StatelessWidget {
  final CoffeeShop coffeeShop;

  CoffeeShopPage({super.key, required this.coffeeShop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E6), // добавлен цвет фона

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTV75u3ySWZClZ0gKauKayvQZ6P9ER2cLiIg&s',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeShop.name,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                      '${coffeeShop.street}, ${coffeeShop.city}, ${coffeeShop.region}',
                      style: const TextStyle(fontSize: 16)),
                  const Text('Расстояние: 00 км',
                      style: TextStyle(fontSize: 16)),
                  Text('График работы: ${coffeeShop.openingHours} - 22:00',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  const Text(
                    'Бонусная система',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  BonusSystemWidget(),
                  const SizedBox(height: 16),
                  const Text(
                    'При покупке кофе необходимо показать кассиру QR-код. Чтобы получить 10-ю чашку кофе бесплатно, нужно собрать 9 штампов за предыдущие покупки.',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Меню',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  MenuWidget(menuItems: coffeeShop.menuItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BonusSystemWidget extends StatelessWidget {
  const BonusSystemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      // height: screenHeight,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 1,
              mainAxisSpacing: 50,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              String assetName;
              String text;
              if (index == 9) {
                assetName = 'assets/vectors/free_cup.svg';
                text = 'Бесплатно';
              } else if (index < 5) {
                assetName = 'assets/vectors/cup_filled.svg';
                text = '01.01.24';
              } else {
                assetName = 'assets/vectors/cup.svg';
                text = '';
              }
              return Column(
                children: [
                  SvgPicture.asset(
                    assetName,
                    width: 48,
                    height: 70,
                  ),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final List<MenuItem> menuItems;

  MenuWidget({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.5,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/vectors/cup_filled.svg',
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${item.price} тг',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
