import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text("Şifreyi Sıfırla",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18,
      ),
    ),
   ),
  body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color.fromARGB(255, 51, 108, 161),Color(0xFF05012C),],
    ),
  ),
  child: Center(
    child: Padding(
      padding: EdgeInsets.all(30),
      child: Form(key: _formKey,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
        controller: _emailController,
        style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
          hintText: 'E-Posta Adresi / Telefon Numarası*',
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
          focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'E-posta boş olamaz';
            }
            if (!value.contains('@') || !value.contains('.')) {
              return 'Geçerli bir e-posta girin';
            }
            return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
          controller: _passwordController,
          obscureText: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
          hintText: 'Şifre*',
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
          focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
          return 'Şifre boş olamaz';
        }
          if (value.length < 8) {
          return 'En az 8 karakter olmalı';
        }
          if (!RegExp(r'[A-Z]').hasMatch(value)) {
          return 'En az 1 büyük harf olmalı';
        }
          if (!RegExp(r'[a-z]').hasMatch(value)) {
          return 'En az 1 küçük harf olmalı';
        }
          if (!RegExp(r'\d').hasMatch(value)) {
          return 'En az 1 rakam olmalı';
        }
        return null;
        },
      ),
                  
      SizedBox(height: 24),
      SizedBox(
       width: double.infinity,
       height: 50,
       child: ElevatedButton(
          onPressed: () {
          if (_formKey.currentState!.validate()) {
          // Başarılı kayıt veya yönlendirme
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kayıt başarılı!')),
        );
        }
        },
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue.shade700,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
        child: Text("Giriş Yap",
               style: TextStyle(
               fontSize: 16, fontWeight: FontWeight.bold,
            ),
            ),
            ),
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