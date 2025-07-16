import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mavi_app/data/globals.dart';
import 'package:mavi_app/product%20detail%20page/product_detail_page.dart';
import 'package:mavi_app/sepetim_page.dart';

class TumjeanlerPage extends StatefulWidget {
  const TumjeanlerPage({super.key});

  @override
  State<TumjeanlerPage> createState() => _TumjeanlerPageState();
}

class _TumjeanlerPageState extends State<TumjeanlerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
      slivers: [
          // Üstte görsel ama başlık görünmesin
      SliverAppBar(
      pinned: true,
      expandedHeight: 150,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
      builder: (context, constraints) {
      final isScrolled = constraints.biggest.height <= kToolbarHeight + 10;

      return FlexibleSpaceBar(
        background: Image.asset("images/jean_anasayfa.jpg",fit: BoxFit.cover,
        ),
        title: isScrolled
        ? Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Ortadaki başlık
            Center(
              child: Text("Tüm Jean'ler",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,
                ),
              ),
            ),
            // Sağ üstteki ikon
            Positioned(
  right: 0,
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SepetimPage(
            cartItems: cartItems,         // varsa mevcut sepet verilerini gönder
            onRemoveItem: (index) {
              cartItems.removeAt(index); // veya setState ile dışarıdan güncelle
            },
          ),
        ),
      );
    },
    child: Icon(Icons.shopping_bag_outlined, color: Colors.black),
  ),
),
          ],
        ),
      )
    : null,

        titlePadding: EdgeInsets.zero,
      );
    },
  ),
),

          // Altına yatay kaydırılabilir yazılar
          SliverToBoxAdapter(
            child: Padding(
             padding: EdgeInsets.only(right: 8.0, top: 16.0, bottom: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryText("Wide Leg"),
                    CategoryText("Straight"),
                    CategoryText("Flare - Bootcut"),
                    CategoryText("Mom"),
                    CategoryText("Baggy"),
                    CategoryText("Skinny"),
                    CategoryText("Slim Straight"),
                    CategoryText("Boyfriend"),CategoryText("Büyük Beden / Curvy Plus"),
                    CategoryText("Hamile / Maternity"),
                  ],
                ),
              ),
            ),
          ),

          // Jean kartları yatay scroll
          SliverToBoxAdapter(
            child: SizedBox(
              height: 270,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  JeanCard(
                    imagePath: "images/straight.png"),
                  JeanCard(
                    imagePath: "images/mom.png"),
                  JeanCard(
                    imagePath: "images/wide_leg.png"),
                    JeanCard(
                    imagePath: "images/flare_bootcut.png"),
                    JeanCard(
                    imagePath: "images/baggy.png"),
                    JeanCard(
                    imagePath: "images/slim_straight.png"),
                    JeanCard(
                    imagePath: "images/boyfrien.png"),
                    JeanCard(
                    imagePath: "images/skinny.png"),
                    JeanCard(
                    imagePath: "images/maternity.png"),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Filtrele Butonu
            GestureDetector(
              onTap: () {
                print("Filtrele'ye tıklandı");
                // burada filtreleme sayfası açılabilir
              },
            child:   // Filtrele Butonu
           GestureDetector(
           onTap: () {
           ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("Filtrele'ye tıklandı")),
        );
      },
  child: Row(
    children: [
      Icon(Icons.tune, size: 20, color: Colors.black),
      SizedBox(width: 4),
      Text("Filtrele", style: TextStyle(fontSize: 14)),
    ],
  ),
),
            ),
SizedBox(width: 16),

// Sırala Butonu
GestureDetector(
  onTap: () {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Sırala'ya tıklandı")),
    );
  },
  child: Row(
    children: [
      Icon(Icons.sort, size: 20, color: Colors.black),
      SizedBox(width: 4),
      Text("Sırala", style: TextStyle(fontSize: 14)),
    ],
  ),
),

            SizedBox(width: 16),

            // Görünüm Butonu
            GestureDetector(
              onTap: () {
                _showCupertinoViewPicker(context); // modal bottom sheet aç
              },
              child: Row(
                children: [
                  Icon(Icons.grid_view, size: 20, color: Colors.black),
                  SizedBox(width: 4),
                  Text("Görünüm", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),

        // Ürün Sayısı
        Text(
          "166 Ürün",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[500],
          ),
        ),
      ],
    ),
  ),
),

SliverToBoxAdapter(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    child: GridView.count(
      crossAxisCount: 2, // her satırda 2 kart
      shrinkWrap: true, // dış scroll'a bırak
      physics: NeverScrollableScrollPhysics(), // Sliver scroll'uyla kaydırılsın
      crossAxisSpacing: 7, //yatay boşluk
      mainAxisSpacing: 8, //dikey boşluk
      childAspectRatio: 0.6, // oranı düşür kartı büyüt
      children: [
        JeanCardProduct(
          imagePath: "images/siena.png",
          name: "SIENA",
          subtitle: "Wide Leg, Yüksek Bel",
          price: "899,99 TL",
          oldPrice: "1.049,99 TL",
          discount: "%14",
        ),
        JeanCardProduct(
          imagePath: "images/maria.png",
          name: "MARIA",
          subtitle: "Flare - Bootcut, Normal Bel",
          price: "999,99 TL",
          oldPrice: "1.599,99 TL",
          discount: "%14",
        ),
        JeanCardProduct(
          imagePath: "images/lisa.png",
          name: "LISA",
          subtitle: "Baggy, Normal Bel",
          price: "799,99 TL",
          oldPrice: "1.399,99 TL",
          discount: "%14",
        ),
        JeanCardProduct(
          imagePath: "images/lisette.png",
          name: "LISETTE",
          subtitle: "Straight, Normal Bel",
          price: "959,99 TL",
          oldPrice: "1.119,99 TL",
          discount: "%14",
        ),
        JeanCardProduct(
          imagePath: "images/leila.png",
          name: "LEILA",
          subtitle: "Baggy, Yüksek Bel",
          price: "1.049,99 TL",
          oldPrice: "1.449,99 TL",
          discount: "%14",
        ),
        JeanCardProduct(
          imagePath: "images/rosina.png",
          name: "JANE",
          subtitle: "Straight, Normal Bel",
          price: "1.299,99 TL",
          oldPrice: "1.599,99 TL",
          discount: "%14",
        ),
        JeanCardProduct(
          imagePath: "images/joy.png",
          name: "JOY",
          subtitle: "Straight, Yüksek Bel",
          price: "959,99 TL",
          oldPrice: "1.119,99 TL",
          discount: "%14",
        ),
        JeanCardProduct(
          imagePath: "images/emilia.png",
          name: "EMILIA",
          subtitle: "Flare - Bootcut, Normal Bel",
          price: "1.099,99 TL",
          oldPrice: "1.599,99 TL",
          discount: "%14",
        ),
        JeanCardProduct(
          imagePath: "images/malibu.png",
          name: "MALIBU",
          subtitle: "Slim Straight, Normal Bel",
          price: "1.099,99 TL",
          oldPrice: "1.299,99 TL",
          discount: "%14",
        ),
        JeanCardProduct(
          imagePath: "images/rosina.png",
          name: "ROSINA",
          subtitle: "Wide Leg, Yüksek Bel",
          price: "899,99 TL",
          oldPrice: "1.049,99 TL",
          discount: "%14",
        ),
 
      ],
    ),
  ),
),

  ],
),
    );
  }
}



// Kategori yazıları için widget
class CategoryText extends StatelessWidget {
  final String text;
  const CategoryText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}

class JeanCard extends StatelessWidget {
  final String imagePath;


  const JeanCard({
    required this.imagePath,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
               width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//görünüm kısmı
void _showCupertinoViewPicker(BuildContext context) {
  int selectedIndex = 1;

  showCupertinoModalPopup(
    context: context,
    builder: (_) => Container(
      height: 250,
      color: Colors.white,
      child: Column(
        children: [
          // Üst bar (İptal - Görünüm - Tamam)
          Container(
            height: 44,
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('İptal', style: TextStyle(color: CupertinoColors.activeBlue)),
                  onPressed: () {},
                ),
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Görünüm', style: TextStyle(color: CupertinoColors.black)),
                  onPressed: () => Navigator.pop(context),
                ),
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Tamam', style: TextStyle(color: CupertinoColors.activeBlue)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

          // Picker
          Expanded(
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              itemExtent: 50, // Her item yüksekliği
              scrollController: FixedExtentScrollController(initialItem: selectedIndex),
              onSelectedItemChanged: (index) {
                selectedIndex = index;
              },
              children: ['1', '2', '4'].map((e) {
                return Center(
                  child: Text(
                    e,
                    style: TextStyle(fontSize: 24), // Büyük font kullan
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    ),
  );
}




class JeanCardProduct extends StatelessWidget {
  final String imagePath;
  final String name;
  final String subtitle;
  final String price;
  final String oldPrice;
  final String discount;

  const JeanCardProduct({
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
    return GestureDetector(
      onTap: ()  {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailPage(
        imagePath: imagePath,
        name: name,
        subtitle: subtitle,
        price: price,
        oldPrice: oldPrice,
        discount: discount,
      ),
    ),
  );
},
  child: Card(
  elevation: 0,
  color: Colors.white,
  margin: EdgeInsets.only(bottom: 2),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
    side: BorderSide.none,
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Üst görsel ve kalp ikonu
      Stack(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.fill,
            width: double.infinity,
            height: 300,
          ),
          Positioned(
            top:8,
            left: 8,
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),

      // Yazı alanı
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ürün adı
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            // Açıklama
            Text(
              subtitle,
              style: TextStyle(fontSize: 11, color: Colors.black54),
            ),

            SizedBox(height: 4),

            // Fiyat bilgileri
            Row(
              children: [
                Text(price,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  oldPrice,
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  discount,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
)

    );
  }
}

