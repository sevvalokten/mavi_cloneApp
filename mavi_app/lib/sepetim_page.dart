import 'package:flutter/material.dart';
import 'package:mavi_app/data/globals.dart';
import 'package:mavi_app/widgets/card_item_card.dart';

class SepetimPage extends StatefulWidget {
  final List<Map<String, String>> cartItems;
  final Function(int) onRemoveItem;

  const SepetimPage({
    super.key,
    required this.cartItems,
    required this.onRemoveItem,
  });

  @override
  State<SepetimPage> createState() => _SepetimPageState();
}

class _SepetimPageState extends State<SepetimPage> {
  @override
  Widget build(BuildContext context) {
    double siparisToplam = 0.0;
    double indirim = 0.0;

for (var item in widget.cartItems) {
  // Fiyatlardan TL ve noktalama temizle
  String rawOldPrice = item["oldPrice"]?.replaceAll(" TL", "").replaceAll('.', '').replaceAll(',', '.') ?? "0";
  String rawPrice = item["price"]?.replaceAll(" TL", "").replaceAll('.', '').replaceAll(',', '.') ?? "0";

  double oldPrice = double.tryParse(rawOldPrice) ?? 0.0;
  double price = double.tryParse(rawPrice) ?? 0.0;

  siparisToplam += oldPrice;
  indirim += (oldPrice - price);
}

double araToplam = siparisToplam - indirim;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Sepetim", style: TextStyle(fontWeight: FontWeight.w300),),
        centerTitle: true,
        ),

      bottomNavigationBar: Container(
  color: Colors.white,
  padding: EdgeInsets.all(16),
  child: SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Satın alma işlemi başarıyla gerçekleştirildi!"),
            duration: Duration(seconds: 2),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text("Satın Al", style: TextStyle(color: Colors.white)),
    ),
  ),
),

    body: widget.cartItems.isEmpty
    ? Center(
        child: Text(
          "Sepetinizde ürün bulunmamaktadır",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      )
    : ListView(
        padding: EdgeInsets.only(bottom: 24),
        children: [
          // Ürün Kartları
          ...List.generate(widget.cartItems.length, (index) {
            final item = widget.cartItems[index];
            return CartItemCard(
              imagePath: item["imagePath"] ?? '',
              name: item["name"] ?? '',
              oldPrice: item["oldPrice"] ?? '',
              price: item["price"] ?? '',
              size: item["size"] ?? "22/30",
              onRemove: () {
                widget.onRemoveItem(index);
                setState(() {});
              },
            );
          }),

    
          // Sepet Toplamı Alanı
         Container(
            color: Colors.grey.shade50,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sepet Toplamı", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(height: 20),
                _buildPriceRow("Sipariş Toplamı", "${siparisToplam.toStringAsFixed(2)} TL"),
                _buildPriceRow("Ürün İndirimi", "-${indirim.toStringAsFixed(2)} TL"),
                _buildPriceRow("Ara Toplam", "${araToplam.toStringAsFixed(2)} TL"),
                _buildPriceRow("Kargo", "Ücretsiz"),
                SizedBox(height: 10),
                Divider(thickness: 1, color: Colors.grey),
                SizedBox(height: 8),
                _buildPriceRow("Ödenecek Toplam Tutar", "${araToplam.toStringAsFixed(2)} TL", isBold: true),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ), // sepet boşsa hiçbir şey gösterme
      );
  }

  Widget _buildPriceRow(String title, String value, {bool isBold = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6), // satırlar arası boşluk
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
}
