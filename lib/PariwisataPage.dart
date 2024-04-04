import 'package:flutter/material.dart';
import 'ProfilParwisPage.dart';
import 'VisiParwisPage.dart'; 
import 'MisiParwisPage.dart';
import 'AkreditasiParwisPage.dart';
import 'KaprodiParwisPage.dart';
import 'DosenParwisPage.dart';
import 'WebParwisPage.dart';
import 'PrestasiParwisPage.dart';

class PariwisataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pariwisata'),
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
                  image: AssetImage('assets/pariwisataupn.jpg'),
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
                  _buildFeatureItem(Icons.account_circle, 'Profile', context, ProfilParwisPage()),
                  _buildFeatureItem(Icons.visibility, 'Visi', context, VisiParwisPage()),
                  _buildFeatureItem(Icons.assignment, 'Misi', context, MisiParwisPage()),
                  _buildFeatureItem(Icons.school, 'Akreditasi', context, AkreditasiParwisPage()),
                  _buildFeatureItem(Icons.people, 'Kaprodi', context, KaprodiParwisPage()),
                  _buildFeatureItem(Icons.people_outline, 'Dosen', context, DosenParwisPage()),
                  _buildFeatureItem(Icons.language, 'Website', context, WebParwisPage()),
                  _buildFeatureItem(Icons.star, 'Prestasi', context, PrestasiParwisPage()),
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
