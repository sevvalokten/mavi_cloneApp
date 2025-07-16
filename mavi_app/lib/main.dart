import 'package:flutter/material.dart';
import 'package:mavi_app/category_page.dart';
import 'package:mavi_app/data/globals.dart';
import 'package:mavi_app/hesapBilgilerim_page.dart';
import 'package:mavi_app/home_page.dart';
import 'package:mavi_app/jeanler/tumjeanler_page.dart';
import 'package:mavi_app/kartus_page.dart';
import 'package:mavi_app/location_page.dart';
import 'package:mavi_app/profile_page.dart';
import 'package:mavi_app/sepetim_page.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPageMavi(),
      routes: {
        '/sepetim': (context) => SepetimPage(
          cartItems: cartItems,
          onRemoveItem: (index) {
            cartItems.removeAt(index);
          },
        ),
      },
    );
  }
}

