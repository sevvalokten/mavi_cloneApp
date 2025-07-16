import 'package:flutter/material.dart';
import 'package:mavi_app/icIce%20kategoriler/aksesuar_page.dart';
import 'package:mavi_app/icIce%20kategoriler/giyim_kadin.dart';
import 'package:mavi_app/icIce%20kategoriler/jean_kadin_page.dart';
import 'package:mavi_app/icIce%20kategoriler/koleksiyonlar_page.dart';
import 'package:mavi_app/icIce%20kategoriler/kozmetik_page.dart';
import 'package:mavi_app/icIce%20kategoriler/oneCikanlar_page.dart';
import 'package:mavi_app/icIce%20kategoriler/plajGiyim_page.dart';
import 'package:mavi_app/icIce%20kategoriler/tisort_page.dart';

class KadinKategoriPage extends StatefulWidget {
  const KadinKategoriPage({super.key});

  @override
  State<KadinKategoriPage> createState() => _KadinKategoriPageState();
}

class _KadinKategoriPageState extends State<KadinKategoriPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       title: Text("Kadın", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        centerTitle: true, //Başlığı ortalıyor.
      ),
      body: ListView( //kaydırılabilir Liste
        children: [
          //Özel fonksiyonla list item (ListTile) eklendi
          _buildListItem(context, "Jean", const JeanKategori()),
          _buildDivider(),

          _buildListItem(context, "Giyim", const GiyimKadin()),
          _buildDivider(),

          _buildListItem(context, "Tişört", const TisortPage()),
          _buildDivider(),

         _buildListItem(context, "Plaj Giyim", const PlajgiyimPage()),
          _buildDivider(),

           _buildListItem(context, "Kozmetik", const KozmetikPage()),
          _buildDivider(),

           _buildListItem(context, "Aksesuar", const AksesuarPage()),
          _buildDivider(),

          _buildListItem(context, "Öne Çıkanlar", const OnecikanlarPage()),
          _buildDivider(),

          _buildListItem(context, "Koleksiyon", const KoleksiyonlarPage()),
          _buildDivider(),
        ],
      ),
    );
  }

  // Ortak kullanılan list item
  Widget _buildListItem(BuildContext context, String title, Widget? page) {
  return ListTile(
    visualDensity: const VisualDensity(vertical: 1),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    title: Text(title),
    trailing: const Icon(Icons.chevron_right), // sağdaki çentik ikonu
    onTap: page != null
        ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => page))
        : null,
  );
}


  // Ortak kullanılan divider
  Widget _buildDivider() {
    return Divider(
      color: Colors.grey.withOpacity(0.2),
      thickness: 0.7,
      height: 10, // üst-alt boşluğu daraltıldı
    );
  }
  
  void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

}
