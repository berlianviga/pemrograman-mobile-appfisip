
import 'package:flutter/material.dart';
import 'ProfileAdpubPage.dart';
import 'AkreditasiAdpubPage.dart';
import 'DosenAdpubPage.dart';
import 'KaprodiAdpubPage.dart';
import 'VisiAdpubPage.dart';
import 'MisiAdpubPage.dart';
import 'PrestasiAdpubPage.dart';
import 'WebAdpubPage.dart';


class AdminPublikPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Administrasi Publik'),
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
                      image: AssetImage('assets/psapupn.jpg'),
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
                      _buildFeatureItem(Icons.account_circle, 'Profile', context, ProfileAdpubPage()),
                      _buildFeatureItem(Icons.visibility, 'Visi', context, VisiAdpubPage()),
                      _buildFeatureItem(Icons.assignment, 'Misi', context, MisiAdpubPage()),
                      _buildFeatureItem(Icons.school, 'Akreditasi', context, AkreditasiAdpubPage()),
                      _buildFeatureItem(Icons.people, 'Kaprodi', context, KaprodiAdpubPage()),
                      _buildFeatureItem(Icons.people_outline, 'Dosen', context, DosenAdpubPage()),
                      _buildFeatureItem(Icons.language, 'Website', context, WebAdpubPage()),
                      _buildFeatureItem(Icons.star, 'Prestasi', context, PrestasiAdpubPage()),
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
        padding: EdgeInsets.all(5), // Tambahkan padding di sini untuk membuat kotak kuning lebih kecil
        decoration: BoxDecoration(
          color: Colors.yellow, // Warna kuning
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 40, color: Colors.blue), // Ubah ukuran ikon
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

