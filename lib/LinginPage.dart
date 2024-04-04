import 'package:flutter/material.dart';
import 'ProfilLinginPage.dart';
import 'VisiLinginPage.dart'; 
import 'MisiLinginPage.dart';
import 'AkreditasiLinginPage.dart';
import 'KaprodiLinginPage.dart';
import 'DosenLinginPage.dart';
import 'WebLinginPage.dart';
import 'PrestasiLinginPage.dart';

class LinginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linguistik Indonesia'),
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
                  image: AssetImage('assets/linginupn.jpg'),
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
                  _buildFeatureItem(Icons.account_circle, 'Profile', context, ProfilLinginPage()),
                  _buildFeatureItem(Icons.visibility, 'Visi', context, VisiLinginPage()),
                  _buildFeatureItem(Icons.assignment, 'Misi', context, MisiLinginPage()),
                  _buildFeatureItem(Icons.school, 'Akreditasi', context, AkreditasiLinginPage()),
                  _buildFeatureItem(Icons.people, 'Kaprodi', context, KaprodiLinginPage()),
                  _buildFeatureItem(Icons.people_outline, 'Dosen', context, DosenLinginPage()),
                  _buildFeatureItem(Icons.language, 'Website', context, WebLinginPage()),
                  _buildFeatureItem(Icons.star, 'Prestasi', context, PrestasiLinginPage()),
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
