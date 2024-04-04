import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class  ProfilIkomPage extends StatelessWidget {
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
                      'Tentang Ilmu Komunikasi',
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
                        'Sumber Daya Manusia prodi ilmu komunikasi adalah staf pengajar yang memiliki kualifikasi pendidikan Ilmu Komunikasi berpendidikan Doktor dan Master lulusan universitas bonafide baik dari dalam maupun luar negeri. Staf Kependidikan dan Laboran handal yang selalu mensupport serta dibantu oleh para praktisi di bidang Ilmu Komunikasi yang telah sangat berpengalaman. Dosen Ilmu Komunikasi UPN “Veteran” Jawa Timur juga dipercaya oleh lembaga terkait sebagai Asesor Perguruan Tinggi, Komisi Penyiaran, Konsultan Komunikasi menggambarkan tingkat kompetensi yang handal dibidang Ilmu Komunikasi.',
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
                      _launchEmail('ilkom@upnjatim.ac.id');
                    },
                    child: Text('Email: ilkom@upnjatim.ac.id',
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
