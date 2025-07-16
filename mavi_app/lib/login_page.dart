import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mavi_app/forgot_password_page.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPageMavi extends StatefulWidget {
  const LoginPageMavi({super.key});

  @override
  State<LoginPageMavi> createState() => _LoginPageMaviState();
}

class _LoginPageMaviState extends State<LoginPageMavi> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showLoadingAndNavigate(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == 'sevvalokten1@gmail.com' && password == '12345') {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>  LoadingDialog(),
      );
      Future.delayed( Duration(seconds: 3), () {
        if (mounted) {
          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) =>  HomePage()),
          );
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('E-posta veya şifre yanlış')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/hikaye10.png', // arka plan görseli
            fit: BoxFit.cover,
          ),
          // BLUR EKLEMEK İÇİN:
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // bulanıklık seviyesi
              child: Container(
                color: Colors.black.withOpacity(0), // şeffaf katman
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 SizedBox(height: 80),
                Image.asset(
                  'images/maviBeyaz.png', // logo resmi
                  width: 150,
                  height: 150,
                ),
                 SizedBox(height: 60),
                TextField(
                  controller: _emailController,
                  style:  TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'E-posta',
                    hintStyle:  TextStyle(color: Colors.white),
                    enabledBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                 SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style:  TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Şifre',
                    hintStyle:  TextStyle(color: Colors.white),
                    enabledBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                 SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => _showLoadingAndNavigate(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding:  EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child:  Text('Giriş Yap', style: TextStyle(fontSize: 16),),
                ),
                 SizedBox(height: 20),
 Row(
  mainAxisAlignment: MainAxisAlignment.center,
   children: [
     Text(
          'Şifreni mi unuttun?',
          style: TextStyle(color: Colors.white70),
        ),
         SizedBox(width: 5),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
        );
      },
      child: Text(
        "Sıfırla",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
   ],
 ),
   
                 SizedBox(height: 10),
               Row(
  mainAxisAlignment: MainAxisAlignment.center,
   children: [
     Text(
          'Hesabın mı yok?',
          style: TextStyle(color: Colors.white70),
        ),
         SizedBox(width: 5),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      },
      child: Text(
        "Üye Ol",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
   ],
 ),
              ],
            ),
          ),
        ],
      ),
    );
    
 }
}
class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(color: Colors.blue),
            SizedBox(height: 16),
            Text(
              "Hoş Geldiniz!",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}