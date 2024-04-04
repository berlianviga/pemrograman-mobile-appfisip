import 'package:flutter/material.dart';
import 'ProfilHIPage.dart';
import 'VisiHIPage.dart'; 
import 'MisiHIPage.dart';
import 'AkreditasiHIPage.dart';
import 'KaprodiHIPage.dart';
import 'DosenHIPage.dart';
import 'WebHIPage.dart';
import 'PrestasiHIPage.dart';

class HubInterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hubungan Internasional'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/hiupn.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildFeatureItem(Icons.account_circle, 'Profile', context, ProfilHIPage()),
                  _buildFeatureItem(Icons.visibility, 'Visi', context, VisiHIPage()),
                  _buildFeatureItem(Icons.assignment, 'Misi', context, MisiHIPage()),
                  _buildFeatureItem(Icons.school, 'Akreditasi', context, AkreditasiHIPage()),
                  _buildFeatureItem(Icons.people, 'Kaprodi', context, KaprodiHIPage()),
                  _buildFeatureItem(Icons.people_outline, 'Dosen', context, DosenHIPage()),
                  _buildFeatureItem(Icons.language, 'Website', context, WebHIPage()),
                  _buildFeatureItem(Icons.star, 'Prestasi', context, PrestasiHIPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData iconData, String label, BuildContext context, [Widget? page]) {
    return InkWell(
      onTap: () {
        // Navigasi ke halaman yang sesuai saat item diklik
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Fitur $label belum diimplementasikan')),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 40, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
