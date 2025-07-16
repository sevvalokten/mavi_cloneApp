import 'package:flutter/material.dart';

class KartusPage extends StatefulWidget {
  const KartusPage({super.key});

  @override
  State<KartusPage> createState() => _KartusPageState();
}

class _KartusPageState extends State<KartusPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Kartuş'um tıklandı")));
                    },
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 18, 18, 160),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Align(alignment: Alignment.center, child: Text("Kartuş'um", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),)),
                    ),
                  ),
                  SizedBox(width: 10,),
                      
                 GestureDetector(
                  onTap: () {
                    print("Kampanyalarım tıklandı");
                  },
                   child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Align(alignment: Alignment.center, child: Text("Kampanyalarım", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),)),
                    ),
                 ),
                  SizedBox(width: 10,),
                      
                   GestureDetector(
                    onTap: () {
                      print("Puan Hareketleri tıklandı");
                    },
                     child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Align(alignment: Alignment.center, child: Text("Puan Hareketleri", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),)),
                                       ),
                   ),
                  SizedBox(width: 10,),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                child: Image(image: AssetImage("images/kartus.jpg")),
              ),
              SizedBox(height: 20,),
             SizedBox(
             width: double.infinity,
             height: 50,
             child: ElevatedButton.icon(
             onPressed: () {
           // Tıklandığında yapılacak işlem 
            },
            icon: Icon(Icons.qr_code, color: Colors.white),
            label: Text("Kartuş'u Kullan", style: TextStyle(color: Colors.white),
            ),
           style: ElevatedButton.styleFrom(
           backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // köşeleri yuvarlatır
        ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        TextButton(
          onPressed: () {}, 
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          child: Text("Kartuş profilimi göster", style: TextStyle(decoration: TextDecoration.underline),),
          ),
          SizedBox(height: 15,),
          Container(
                child: Image(image: AssetImage("images/kartus1.jpg")),
              ),
            ],
          ),
        ),
      ),
     
    );
  }
}