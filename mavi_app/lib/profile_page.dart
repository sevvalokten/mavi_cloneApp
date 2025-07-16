import 'package:flutter/material.dart';
import 'package:mavi_app/Profil%20Sayfalar%C4%B1/adreslerim_page.dart';
import 'package:mavi_app/Profil%20Sayfalar%C4%B1/favorilerim_page.dart';
import 'package:mavi_app/Profil%20Sayfalar%C4%B1/hediye_page.dart';
import 'package:mavi_app/Profil%20Sayfalar%C4%B1/sifre_guvenlik_page.dart';
import 'package:mavi_app/Profil%20Sayfalar%C4%B1/siparislerim_page.dart';
import 'package:mavi_app/Profil%20Sayfalar%C4%B1/yardim_page.dart';
import 'package:mavi_app/hesapBilgilerim_page.dart';
import 'package:mavi_app/kartus_page.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text("Profil", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true, //Başlığı ortalıyor.
        actions: [
          IconButton(
            icon:  Icon(Icons.tune),
            onPressed: () {
              // Ayarlar butonu tıklanınca
            },
          ),
        ],
      ),
      body: ListView( //kaydırılabilir Liste
        children: [
          //Özel fonksiyonla list item (ListTile) eklendi
          _buildListItem(context, Icons.home_outlined, "Hesap Bilgilerim", const HesapbilgilerimPage()),
          _buildDivider(),

          _buildListItem(context, Icons.shopping_cart_outlined, "Siparişlerim", const SiparislerimPage()),
          _buildDivider(),

          _buildListItem(context, Icons.location_on_outlined, "Adreslerim", const AdreslerimPage()),
          _buildDivider(),

          _buildListItem(context,Icons.credit_card_outlined, "Kartuş Kartım", const KartusPage()),
          _buildDivider(),

          _buildListItem(context, Icons.card_giftcard_outlined, "Hediye Kartlarım", const HediyePage()),
          _buildDivider(),

          _buildListItem(context, Icons.lock_outline, "Şifre ve Güvenlik", const SifreGuvenlikPage()),
          _buildDivider(),

          _buildListItem(context, Icons.favorite_border, "Favorilerim", const FavorilerimPage()),
          _buildDivider(),

          _buildListItem(context, Icons.help_outline, "Yardım", const YardimPage()),
          _buildDivider(),
SizedBox(height: 230,),
          ListTile( // bir satırlık liste öğesi oluşturmaya yarayan bir widget
            visualDensity:  VisualDensity(vertical: 3), //dikey boşluk daraltır
            contentPadding:  EdgeInsets.symmetric(horizontal: 16), //Yatay boşluk ayarlanır
            leading:  Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
            title:  Text("Çıkış Yap"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  LoginPageMavi()),
              );
            },
          ),
        ],
      ),
    );
  }

  // Ortak kullanılan list item
  Widget _buildListItem(BuildContext context, IconData icon, String title, Widget? page) {
    return ListTile(
      visualDensity:  VisualDensity(vertical: 1), // dikey boşluğu azaltır
      contentPadding:  EdgeInsets.symmetric(horizontal: 16), // yatay boşluk
      leading: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
       title: Text(title),
    onTap: page != null ? () => navigateToPage(context, page) : null,
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
