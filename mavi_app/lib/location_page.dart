import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String? selectedCity;
  String? selectedDistrict;

  // İl - İlçe eşleştirmesi
  Map<String, List<String>> cityDistrictMap = {
    'İstanbul': ['Kadıköy', 'Beşiktaş', 'Şişli'],
    'Ankara': ['Çankaya', 'Keçiören', 'Yenimahalle'],
    'İzmir': ['Konak', 'Bornova', 'Karşıyaka'],
    'Denizli': ["Kale", "Tavas", "Kaklık", "Pamukkale",],
    'Sivas': ["Koyulhisar", "Zara", "Divriği", "Suşehri", "Şarkışla"]
  };

  @override
  Widget build(BuildContext context) {
    List<String> cities = cityDistrictMap.keys.toList();
    List<String> districts = selectedCity != null ? cityDistrictMap[selectedCity]! : [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "En Yakın Mavi",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                // Örneğin mesaj göster:
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Listele tıklandı')),
                );
              },
              child: Text(
                'Listele',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Harita görseli
          Image.asset(
            "images/harita.jpeg",
            width: double.infinity,
            height: 500,
            fit: BoxFit.fitWidth,
          ),
SizedBox(height: 200,),
          // Dropdown ve Buton
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    // İl seçimi
                    Expanded(
  child: DropdownButtonFormField<String>(
    value: selectedCity,
    decoration: InputDecoration(
      labelText: 'İl*',
      labelStyle: TextStyle(fontSize: 14, color: Colors.grey[700]),
      hintText: 'Seçiniz',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    ),
    onChanged: (value) {
      setState(() {
        selectedCity = value;
        selectedDistrict = null;
      });
    },
    items: cities.map((city) {
      return DropdownMenuItem(
        value: city,
        child: Text(city),
      );
    }).toList(),
  ),
),
                    SizedBox(width: 10),

  // İlçe seçimi
  Expanded(
    child: DropdownButtonFormField<String>(
      value: selectedDistrict,
      decoration: InputDecoration(
        labelText: 'İlçe*',
        labelStyle: TextStyle(fontSize: 14, color: Colors.grey[700]),
        hintText: 'Seçiniz',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      onChanged: (value) {
        setState(() {
          selectedDistrict = value;
        });
      },
      items: districts.map((district) {
        return DropdownMenuItem(
          value: district,
          child: Text(district),
        );
      }).toList(),
    ),
  ),
],
                ),

                SizedBox(height: 20),

                // Mağaza Ara butonu
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      if (selectedCity != null && selectedDistrict != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Seçilen: $selectedCity / $selectedDistrict")),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Mağaza Ara", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
