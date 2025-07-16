import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

@override
Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text("Üye Ol",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18,
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
          hintText: 'E-Posta Adresi*',
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
       SizedBox(height: 16),
       TextFormField(
       controller: _confirmPasswordController,
       obscureText: true,
       style: TextStyle(color: Colors.white),
       decoration: InputDecoration(
       hintText: 'Şifre Tekrar*',
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
                        return 'Şifre tekrar boş olamaz';
                      }
                      if (value != _passwordController.text) {
                        return 'Şifreler eşleşmiyor';
                      }
                      return null;
                    },
                  ),
                   SizedBox(height: 8),
                   Align(alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Şifreniz en az 8 karakter olmalıdır.\n1 büyük harf, 1 küçük harf ve 1 rakam içermelidir.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
            textAlign: TextAlign.start,
          ),
        ),
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
        child: Text("Kayıt Ol",
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
