import 'package:flutter/material.dart';
import 'package:mavi_app/location_page.dart';
import 'package:mavi_app/profile_page.dart';
import 'package:mavi_app/category_page.dart';
import 'package:mavi_app/kartus_page.dart';
import 'package:mavi_app/kesfet_page.dart';
import 'package:mavi_app/sepetim_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Map<String, String>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeContent(),
      CategoryPage(),
      KartusPage(),
      KesfetPage(),
      SepetimPage(
        cartItems: cartItems,
        onRemoveItem: (index) {
          cartItems.removeAt(index);
          setState(() {});
        },
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade100,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:  TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle:  TextStyle(fontWeight: FontWeight.normal),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("images/nav_home.jpg", width: 24),
            label: "Ana Sayfa",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/nav_search.jpg", width: 24),
            label: "Kategoriler",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/nav_kartus.jpg", width: 24),
            label: "Kartuş Genç",
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Keşfet",
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Sepetim",
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagesPaths = [
      "images/hikaye1.jpg",
      "images/hikaye2.jpg",
      "images/hikaye3.jpg",
      "images/hikaye4.jpg",
      "images/hikaye5.jpg",
      "images/hikaye6.jpg",
      "images/hikaye7.jpg",
      "images/hikaye8.jpg",
      "images/hikaye9.jpg",
      "images/hikaye10.png",
    ];

    List<String> gridImages = [
      "images/anasayfaKadın.jpg",
      "images/anasayfaErkek.jpg",
      "images/anasayfaCanta.jpg",
      "images/anasayfaParfum.jpg",
      "images/anasayfaKız.jpg",
      "images/anasayfaCocuk.jpg",
    ];

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding:  EdgeInsets.only(left: 13.0, top: 5, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 85,
                  height: 60,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/mavi_beyaz_logo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocationPage()),
                        );
                      },
                      child: _buildIcon(Icons.location_on_outlined),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      child: _buildIcon(Icons.person_outline),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(imagesPaths.length, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: ClipOval(
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              child: Image.asset(imagesPaths[index]),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Image.asset("images/indirimEkranı.jpg", width: double.infinity, fit: BoxFit.cover),
                  Image.asset("images/anasayfa1.jpg", width: double.infinity, fit: BoxFit.cover),
                  Image.asset("images/anasayfa2.jpg", width: double.infinity, fit: BoxFit.cover),
                  Image.asset("images/anasayfa4.jpg", width: double.infinity, fit: BoxFit.cover),
                ],
              ),
              SizedBox(
              height: 350,
              child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2,
              physics: NeverScrollableScrollPhysics(), // GridView'in kendi scroll özelliğini kapatır
              children: List.generate(gridImages.length, (index) {
              return Container(
             alignment: Alignment.center, // İçeriği ortalar
             decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage(gridImages[index]),
            fit: BoxFit.cover, // Görselin tamamı görünür, boşluk olabilir
          ),
        ),
      );
    }),
  ),
),

              Image.asset("images/anasayfaDeniz.jpg", width: double.infinity, fit: BoxFit.cover),
              Image.asset("images/anasayfa3.jpg", width: double.infinity, fit: BoxFit.cover),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 3,
            offset:  Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Icon(icon, size: 20, color: Colors.black),
      ),
    );
  }
}
