import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class  ProfilParwisPage extends StatelessWidget {
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
                      'Tentang Program Studi Pariwisata',
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
                        'Program Studi Pariwisata UPN “Veteran” Jawa Timur berdiri pada tanggal tanggal 8 April 2020 berdasarkan Keputusan Menteri Pendidikan dan Kebudayaan Republik Indonesia Nomor: 433/M/2020. Pendirian program studi ini untuk menjawab tantangan dan perkembangan industri pariwisata di Indonesia dan dunia.',
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
                      _launchEmail('humas@upnjatim.ac.id');
                    },
                    child: Text('Email: humas@upnjatim.ac.id',
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