

import 'package:flutter/material.dart';
import 'ProfilAdbisPage.dart';
import 'VisiAdbisPage.dart'; 
import 'MisiAdbisPage.dart';
import 'AkreditasiAdbisPage.dart';
import 'KaprodiAdbisPage.dart';
import 'DosenAdbisPage.dart';
import 'WebAdbisPage.dart';
import 'PrestasiAdbisPage.dart';

class AdminBusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrasi Bisnis'),
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
                  image: AssetImage('assets/adbisupn.jpg'),
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
                  _buildFeatureItem(Icons.account_circle, 'Profile', context, ProfilAdbisPage()),
                  _buildFeatureItem(Icons.visibility, 'Visi', context, VisiAdbisPage()),
                  _buildFeatureItem(Icons.assignment, 'Misi', context, MisiAdbisPage()),
                  _buildFeatureItem(Icons.school, 'Akreditasi', context, AkreditasiAdbisPage()),
                  _buildFeatureItem(Icons.people, 'Kaprodi', context, KaprodiAdbisPage()),
                  _buildFeatureItem(Icons.people_outline, 'Dosen', context, DosenAdbisPage()),
                  _buildFeatureItem(Icons.language, 'Website', context, WebAdbisPage()),
                  _buildFeatureItem(Icons.star, 'Prestasi', context, PrestasiAdbisPage()),
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
