import 'package:flutter/material.dart';
import 'ProfilIkomPage.dart';
import 'VisiIkomPage.dart'; 
import 'MisiIkomPage.dart';
import 'AkreditasiIkomPage.dart';
import 'KaprodiIkomPage.dart';
import 'DosenIkomPage.dart';
import 'WebIkomPage.dart';
import 'PrestasiIkomPage.dart';

class IlmuKomunikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ilmu Komunikasi'),
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
                  image: AssetImage('assets/ikomupn.jpg'),
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
                  _buildFeatureItem(Icons.account_circle, 'Profile', context, ProfilIkomPage()),
                  _buildFeatureItem(Icons.visibility, 'Visi', context, VisiIkomPage()),
                  _buildFeatureItem(Icons.assignment, 'Misi', context, MisiIkomPage()),
                  _buildFeatureItem(Icons.school, 'Akreditasi', context, AkreditasiIkomPage()),
                  _buildFeatureItem(Icons.people, 'Kaprodi', context, KaprodiIkomPage()),
                  _buildFeatureItem(Icons.people_outline, 'Dosen', context, DosenIkomPage()),
                  _buildFeatureItem(Icons.language, 'Website', context, WebIkomPage()),
                  _buildFeatureItem(Icons.star, 'Prestasi', context, PrestasiIkomPage()),
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
