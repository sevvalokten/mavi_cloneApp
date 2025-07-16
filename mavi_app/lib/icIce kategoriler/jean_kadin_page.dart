import 'package:flutter/material.dart';
import 'package:mavi_app/jeanler/ceket_page.dart';
import 'package:mavi_app/jeanler/elbise_page.dart';
import 'package:mavi_app/jeanler/etek_page.dart';
import 'package:mavi_app/jeanler/gomlek_page.dart';
import 'package:mavi_app/jeanler/seninfit_page.dart';
import 'package:mavi_app/jeanler/sort_page.dart';
import 'package:mavi_app/jeanler/tulum_page.dart';
import 'package:mavi_app/jeanler/tumjeanler_page.dart';
import 'package:mavi_app/jeanler/yelek_page.dart';
import 'package:mavi_app/jeanler/yenijeanler_page.dart';

class JeanKategori extends StatefulWidget {
  const JeanKategori({super.key});

  @override
  State<JeanKategori> createState() => _JeanKategoriState();
}

class _JeanKategoriState extends State<JeanKategori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       title: Text("Jean", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        centerTitle: true, //Başlığı ortalıyor.
      ),
      body: ListView( //kaydırılabilir Liste
        children: [
          //Özel fonksiyonla list item (ListTile) eklendi
          _buildListItem(context, "Tüm Jean'ler", const TumjeanlerPage()),
          _buildDivider(),

          _buildListItem(context, "Yeni Jean'ler", const YenijeanlerPage()),
          _buildDivider(),

          _buildListItem(context, "Şort", const SortPage()),
          _buildDivider(),

         _buildListItem(context, "Etek", const EtekPage ()),
          _buildDivider(),

           _buildListItem(context, "Elbise", const ElbisePage()),
          _buildDivider(),

           _buildListItem(context, "Tulum", const TulumPage()),
          _buildDivider(),

          _buildListItem(context, "Gömlek", const GomlekPage()),
          _buildDivider(),

          _buildListItem(context, "Yelek", const YelekPage()),
          _buildDivider(),

           _buildListItem(context, "Ceket", const CeketPage()),
          _buildDivider(),

           _buildListItem(context, "Tüm Jean Koleksiyonu", const TumjeanlerPage()),
          _buildDivider(),

           _buildListItem(context, "Senin Fit'in Hangisi?", const SeninfitPage()),
          _buildDivider(),
        ],
      ),
    );
  }

  // Ortak kullanılan list item
  Widget _buildListItem(BuildContext context, String title, Widget? page) {
  return ListTile(
    visualDensity:  VisualDensity(vertical: 1),
    contentPadding:  EdgeInsets.symmetric(horizontal: 16),
    title: Text(title),
    trailing:  Icon(Icons.chevron_right), // sağdaki çentik ikonu
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
