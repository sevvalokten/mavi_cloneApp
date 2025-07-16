import 'package:flutter/material.dart';
import 'package:mavi_app/data/globals.dart';
import 'package:mavi_app/sepetim_page.dart';

class ProductDetailPage extends StatelessWidget {

  final String imagePath;
  final String name;
  final String subtitle;
  final String price;
  final String oldPrice;
  final String discount;

  const ProductDetailPage({
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.oldPrice,
    required this.discount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    
  final List<Color> renkler = [
  Colors.blueGrey,
  Colors.indigo,
  Colors.black,
  Colors.grey,
  Colors.blue,
  Colors.lightBlue,
];
  
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
  padding: EdgeInsets.all(14.0),
  child: Row(
    children: [
      // Fiyat kısmı
      Expanded(
        flex: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 6),
            Text(
              oldPrice,
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(width: 6),
            Text(
              discount,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      // Buton kısmı
      Expanded(
  flex: 2,
  child: ElevatedButton(
    onPressed: () {
      // 1. Ürünü sepete ekle
      cartItems.add({
        "imagePath": imagePath, // bu bilgileri o sayfadan al
        "name": name,
        "oldPrice": oldPrice,
        "price": price,
        "size": "22/30", // varsayılan beden
      });

      // 2. Sepetim sayfasına yönlendir
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SepetimPage(
            cartItems: cartItems,
            onRemoveItem: (index) {
              cartItems.removeAt(index);
            },
          ),
        ),
      );
    },
    child: Text("Sepete Ekle"),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  ),
),

    ],
  ),
),

      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(imagePath,
              fit: BoxFit.fitWidth,
              width: double.infinity,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
  children: [
    Text(
      name,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
    Spacer(),
    GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Paylaşıldı"),
          ),
        );
      },
      child: Icon(Icons.ios_share),
    ),
    SizedBox(width: 10),
    GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Favorilere Eklendi")),
        );
      },
      child: Icon(Icons.favorite_border),
    ),
  ],
),

                 Text(subtitle, style: TextStyle(color: Colors.black87, fontSize: 12)),
                    SizedBox(width: 50,),
                    
                SizedBox(height: 8),
                Row(
                  children: [
                    Text("4.3"),
                    Icon(Icons.star, size: 18, color: Colors.black),
                    Icon(Icons.star, size: 18, color: Colors.black),
                    Icon(Icons.star, size: 18, color: Colors.black),
                    Icon(Icons.star_half, size: 18, color: Colors.black),
                    Icon(Icons.star_border, size: 18, color: Colors.black),
                    SizedBox(width: 8),
                    Text("(7 Değerlendirme)", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 16),
            
                Row(
  children: List.generate(6, (index) {
    return Container(
      margin: EdgeInsets.only(right: 12), // daireler arası boşluk
      width: 20, // genişlik
      height: 20, // yükseklik
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: renkler[index],

      ),
    );
  }),
),

                SizedBox(height: 12),
                Text("1010763-89244 - AÇIK MAVİ", style: TextStyle(color: Colors.black87, fontSize: 12)),

                 SizedBox(height: 16),
Row(
  children: [
    Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text("Beden / Boy Seç",style: TextStyle(color: Colors.black87, fontSize: 14),),
            value: null,
            isExpanded: true,
            onChanged: (value) {},
            items: ["25", "26", "27", "28", "29"].map((beden) {
              return DropdownMenuItem(
                value: beden,
                child: Text(beden),
              );
            }).toList(),
          ),
        ),
      ),
    ),
    SizedBox(width: 8),
    Expanded(
      flex: 2,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search, size: 18),
              SizedBox(width: 6),
              Text("Bedenini Bul", style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    ),
  ],
),
SizedBox(height: 10,),
Divider(thickness: 0.5, ),
SizedBox(height: 16),

Center(
  child: Text(
    "Akdeniz Koleksiyonunu Keşfet",
    style: TextStyle(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w500,
    ),
  ),
),

SizedBox(height: 16),

Row(
  children: [
    Expanded(
          flex: 2,
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(Icons.checkroom, size: 18),
                  SizedBox(width: 6),
                  Text("Kombini İncele", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
        ),

        SizedBox(width: 10,),

         Expanded(
          flex: 2,
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_pin, size: 18),
                  SizedBox(width: 6),
                  Text("Mağazada Bul", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
        ),
  ],
),
SizedBox(height: 10,),
Divider(thickness: 0.5, ),

SizedBox(height: 20),
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Text(
      "Ürün Özellikleri",
      style: TextStyle(fontSize: 14),
    ),
    Spacer(),
    GestureDetector(
      onTap: () {
        // Snackbar gösterimi
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Ürün özelliklerine gidildi"),
            duration: Duration(seconds: 1), // 1 saniye ekranda kalsın
          ),
        );
      },
      child: Icon(Icons.chevron_right),
    ),
  ],
),



SizedBox(height: 20),
Text(
  "Mavi’nin Maviterranean Koleksiyonundan Malibu Blocking Denim Jean Pantolon. Bel ve basene oturan, basenden sonra açılarak genişleyen Wide Leg Jean. Geniş paça. Mavi’nin Akdenizli ruhundan ilham alan yazın gelişini kutlayan yeni Maviterranean Koleksiyonu seni kendi yaz hikayeni yazmaya davet ediyor. Pamuk içeren ürünlerimizi tercih ederek Better Cotton misyonuna yaptığımız yatırımı destekliyorsunuz. Bu ürün kütle denge modeli aracılığıyla tedarik edildiği için Better Cotton içermeyebilir.",
  style: TextStyle(fontSize: 14),
),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
