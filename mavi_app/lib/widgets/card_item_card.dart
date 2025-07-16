import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final String oldPrice;
  final String size;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.size,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey.shade400, width: 0.5)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8, bottom: 16),
        child: Column(
          children: [
            // Üst: Ürün Kodu ve Sil Butonu
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Ürün Kodu: 1010152-88986",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: onRemove,
                     padding: EdgeInsets.all(0),
                     constraints: BoxConstraints(), // Gereksiz boşluğu kaldırmak için
                  ),
                ),
              ],
            ),

            SizedBox(height: 8),

            // Orta kısım: Resim + Bilgiler
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ürün resmi
                ClipRRect(
                  child: Image.asset(
                    imagePath,
                    width: 100,
                    height: 135,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),

                // Ürün Bilgileri
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: TextStyle(
                              fontSize: 14,)),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            oldPrice,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(price,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      Text("Beden: $size",
                          style: TextStyle(fontSize: 13, color: Colors.black87)),
                      SizedBox(height: 25),
                      Text("* Kazancınız 150 TL",
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[500])),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            // Alt: Adet Seçimi
           Align(
  alignment: Alignment.centerLeft,
  child: Container(
    width: 100,
    height: 30,
    padding: EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white, // Arka plan rengi
      border: Border.all(color: Colors.grey.shade400), // Kenarlık rengi ve kalınlığı
      borderRadius: BorderRadius.circular(6), // İsteğe bağlı köşe yumuşatma
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value: "1 Adet",
        items: ["1 Adet", "2 Adet", "3 Adet", "4 Adet", "5 Adet"]
            .map((value) => DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 12),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          // Seçim işlemi
        },
        style: TextStyle(fontSize: 14, color: Colors.black),
        icon: Icon(Icons.keyboard_arrow_down, size: 18),
      ),
    ),
  ),
),



          ],
        ),
      ),
    );
  }
}
