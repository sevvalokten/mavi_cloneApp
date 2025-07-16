import 'package:flutter/material.dart';
import 'package:mavi_app/Profil%20Sayfalar%C4%B1/hediye_page.dart';
import 'package:mavi_app/kategoriler/cocuk_kategori_page.dart';
import 'package:mavi_app/kategoriler/erkek_kategori_page.dart';
import 'package:mavi_app/kategoriler/jean_kategori.dart';
import 'package:mavi_app/kategoriler/kadin_kategori_page.dart';
import 'package:mavi_app/kategoriler/maviallblue_kategori.dart';
import 'package:mavi_app/kategoriler/outlet_kategori_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key,});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  final List<String> categories = const [
    "Kadın",
    "Erkek",
    "Çocuk",
    "Jean",
    "Mavi All Blue",
    "Outlet",
    "Hediye Kartı"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text("Kategoriler", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Arama Kutusu
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Ne arıyorsun?",hintStyle: TextStyle(color: Colors.black12),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.qr_code_scanner), // sağdaki küçük ikon
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

// Kategori Listesi
  Expanded(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: ListView.separated(
      itemCount: categories.length,
      separatorBuilder: (_, __) => Divider(height: 1),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          title: Text(categories[index]),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _getCategoryPage(categories[index])),
            );
          },
        );
      },
    ),
  ),
),


          // Müşteri Hizmetleri Butonu
  Padding(
    padding: EdgeInsets.all(12),
    child: SizedBox(
    width: double.infinity,
    height: 45, // yükseklik biraz azaltıldı
    child: OutlinedButton(
    onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Müşteri Hizmetleri tıklandı")),
    );
  },
    style: OutlinedButton.styleFrom(
    side: BorderSide(color: Colors.grey.shade300), // ince gri çerçeve
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8), // köşe yuvarlaklığı
    ),
  ),
  child: Text("Müşteri Hizmetleri",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal, // kalın değil
        ),
      ),
    ),
  ),
),
        ],
      ),
    );
  }
  
 Widget _getCategoryPage(String category) {
  switch (category) {
    case "Kadın":
      return KadinKategoriPage();
    case "Erkek":
      return ErkekKategoriPage();
    case "Çocuk":
      return CocukKategoriPage();
    case "Jean":
      return JeanKategori();
    case "Mavi All Blue":
      return MaviallblueKategori();
    case "Outlet":
      return OutletKategoriPage();
    case "Hediye Kartı":
      return HediyePage();
    default:
      return CategoryPage();
  }
}

}
