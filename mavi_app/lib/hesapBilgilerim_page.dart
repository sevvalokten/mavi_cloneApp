import 'package:flutter/material.dart';

class HesapbilgilerimPage extends StatefulWidget {
  const HesapbilgilerimPage({super.key});

  @override
  State<HesapbilgilerimPage> createState() => _HesapbilgilerimPageState();
}

class _HesapbilgilerimPageState extends State<HesapbilgilerimPage> {
     String? selectedGender;
     bool smsChecked = false;
     bool emailChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Hesap Bilgilerim", style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                 alignment: Alignment.center,
                  child: Image.asset("images/hesapfoto1.png",fit: BoxFit.cover,),
                ),
                SizedBox(height: 15,),
            
    TextField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
    hintText: 'Ad*',
    hintStyle: TextStyle(color: Colors.black54),
    isDense: true, // Bu, TextField'ı daha kompakt hale getirir
    contentPadding: EdgeInsets.symmetric(vertical: 20), // Dikey aralık
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black12),
    ),
    // Eğer odaklanınca rengi de değiştirmek istersen
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade700),
    ),
  ),
),

  SizedBox(height: 15,),
            
    TextField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
    hintText: 'Soyad*',
    hintStyle: TextStyle(color: Colors.black54),
    isDense: true, // Bu, TextField'ı daha kompakt hale getirir
    contentPadding: EdgeInsets.symmetric(vertical: 20), // Dikey aralık
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black12),
    ),
    // Eğer odaklanınca rengi de değiştirmek istersen
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade700),
    ),
  ),
),
              SizedBox(height: 15,),
            
                TextField(
  style: TextStyle(color: Colors.black),
  decoration: InputDecoration(
    hintText: 'Telefon Numarası*',
    hintStyle: TextStyle(color: Colors.black54),
    isDense: true, // Bu, TextField'ı daha kompakt hale getirir
    contentPadding: EdgeInsets.symmetric(vertical: 20), // Dikey aralık
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black12),
    ),
    // Eğer odaklanınca rengi de değiştirmek istersen
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade700),
    ),
  ),
),
              SizedBox(height: 15,),
            
                TextField(
  style: TextStyle(color: Colors.black),
  decoration: InputDecoration(
    hintText: 'Doğum Tarihi*',
    hintStyle: TextStyle(color: Colors.black54),
    isDense: true, // Bu, TextField'ı daha kompakt hale getirir
    contentPadding: EdgeInsets.symmetric(vertical: 20), // Dikey aralık
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black12),
    ),
    // Eğer odaklanınca rengi de değiştirmek istersen
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade700),
    ),
  ),
),
              SizedBox(height: 15,),
            
              DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
          ),
             hint: Text("Cinsiyet"),
             onChanged: (newValue) {
             setState(() {
             selectedGender = newValue;
             });
           },
             items: [
            DropdownMenuItem(value: "Kadın", child: Text("Kadın")),
            DropdownMenuItem(value: "Erkek", child: Text("Erkek")),
            DropdownMenuItem(value: "Belirtmek İstemiyorum", child: Text("Belirtmek İstemiyorum")),
           ],
          ),
           TextField(
  style: TextStyle(color: Colors.black),
  decoration: InputDecoration(
    hintText: 'E-Posta*',
    hintStyle: TextStyle(color: Colors.black54),
    isDense: true, // Bu, TextField'ı daha kompakt hale getirir
    contentPadding: EdgeInsets.symmetric(vertical: 20), // Dikey aralık
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black12),
    ),
    // Eğer odaklanınca rengi de değiştirmek istersen
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade700),
    ),
  ),
),
              SizedBox(height: 30,),
        
          Row(
          children: [
          Checkbox(
            value: smsChecked,
            onChanged: (value) {
              setState(() {
                smsChecked = value!;
              });
            },
            activeColor: Colors.green,  // seçili olduğunda kutu rengi YEŞİL
            checkColor: Colors.white,   // tik işareti beyaz
          ),
          Expanded(
            child: Text(
              "Mavi Giyim San. ve Tic. A.Ş.'nin tarafıma SMS ile ticari elektronik ileti göndermesine burada belirtilen izni veriyorum.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
            ),
          SizedBox(height: 15,),
        
            Row(
          children: [
          Checkbox(
            value: emailChecked,
            onChanged: (value) {
              setState(() {
                emailChecked = value!;
              });
            },
            activeColor: Colors.green,  // seçili olduğunda kutu rengi YEŞİL
            checkColor: Colors.white,   // tik işareti beyaz
          ),
          Expanded(
            child: Text(
              "Mavi Giyim San. ve Tic. A.Ş.'nin tarafıma SMS ile ticari elektronik ileti göndermesine burada belirtilen izni veriyorum.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
            ),
           SizedBox(height: 40,),
        
                 SizedBox(
                  width: double.infinity,
                  height: 50,
                   child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding:  EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child:  Text('Güncelle', style: TextStyle(fontSize: 16),),
                    ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}