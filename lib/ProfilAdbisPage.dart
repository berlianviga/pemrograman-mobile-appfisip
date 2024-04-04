import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class ProfilAdbisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar( 
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton( 
          icon: Icon(Icons.arrow_back),
          onPressed: (){ 
            Navigator.pop(context);
          }
        ),
      ),
      backgroundColor: Colors.yellow[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('adbishead.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.6), // Lebih gelap
                      Colors.black.withOpacity(0.2), // Lebih transparan
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tentang Administrasi Bisnis',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 5,
                color: Colors.yellow[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deskripsi:',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Keberadaan Fakultas Ilmu Sosial dan Ilmu Politik diawali dengan berdirinya Fakultas Ilmu Administrasi Negara dan Administrasi Niaga. Dalam perkembangan selanjutnya terbit Surat Keputusan Rektor UPN “Veteran” Jawa Timur Nomor : Skep/101/IX/2005 tanggal 6 Mei 2005 tentang Pergantian nama Fakultas Ilmu Administrasi UPN”Veteran” Jawa Timur menjadi Fakultas Ilmu Sosial dan Ilmu Politik. Selanjutnya status UPN “Veteran” Jawa Timur yang semula berstatus sebagai Perguruan Tinggi kedinasan berubah menjadi Perguruan Tinggi Swasta dibawah Kopertis Wilayah VII sesuai dengan Surat Keputusan Bersama antara Menhankam dengan Mendikbud nomor : 0307/0/1994 KEP/10/XI/1994 Tanggal 29 Nopember 1995 tentang Peningkatan Pengabdian UPN “Veteran” melalui Pelaksanaan Keterkaitan dan Keterpaduan. Sejak tahun 2009 Fakultas Ilmu Sosial dan Ilmu Politik memiliki empat Program Studi yaitu : Ilmu Administrasi Negara, Ilmu Administrasi Bisnis, Ilmu Komunikasi, dan Hubungan Internasional. Selanjutnya UPN “Veteran” Jawa timur berdasarkan Peraturan Presiden Republik Indonesia Nomor 122 Tahun 2014 tentang Pendirian Universitas Pembangunan Nasional “Veteran” Jawa Timur sebagai Perguruan Tinggi Negeri. Program Studi Administrasi Publik Fakultas Ilmu Sosial dan Ilmu Politik UPN “Veteran” Jawa Timur (FISIP-UPNVJT) diselenggarakan berdasarkan keputusan Rektor 92/ UN63/KP/2020 tentang perubahan nama Program Studi Administrasi Publik. Mulai tahun 2022 hingga tahun 2026 Prodi Administrasi Publik terakreditasi UNGGUL. Selain itu juga Prodi Administrasi Publik telah terakreditasi Internasional FIBAA. Program Studi Administrasi Publik Fakultas Ilmu Sosial dan Ilmu Politik UPN “Veteran” Jawa Timur (FISIP-UPNVJT) didirikan untuk memenuhi kebutuhan tenaga professional dalam bidang Administrasi Publik dan membantu pemerintah dalam menyediakan tenaga professional yang kompeten dan memiliki daya saing. Selain itu, Program Studi Administrasi Publik Fakultas Ilmu Sosial dan Ilmu Politik UPN “Veteran” Jawa Timur (FISIP-UPNVJT) didirikan untuk menghasilkan Sarjana Administrasi Publik yang memiliki integritas, kepribadian, kepekaan sosial dan karakter yang tangguh serta kompetensi keilmuan yang memadai dan daya saing tinggi, beriman dan bertaqwa kepada Tuhan yang Maha Esa sekaligus menjunjung tinggi nikai-nilai dan semangat bela Negara yang siap untuk mendharmabaktikan dirinya pada kepentingan masyarakat, bangsa dan Negara.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
             Container(
              color: Colors.yellow,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hubungi Kami:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Telepon: 123-456-7890',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                    GestureDetector( 
                    onTap: (){ 
                      _launchEmail('adbis@upnjatim.ac.id');
                    },
                    child: Text('Email: adbis@upnjatim.ac.id',
                    style: TextStyle(
                      fontSize: 12,
                    ),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  _launchEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak dapat membuka $url';
    }
  }
}
