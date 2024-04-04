import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class PrestasiAdbisPage extends StatelessWidget{
  final List<Map<String, dynamic>> dataPrestasi = [
    {'nama': 'Juara 2 Badminton Ganda Campuran Fisip Fest 14', 'photo': 'assets/prestasiadbis1.jpg' },
    {'nama': 'Juara 2 Badminton Ganda Putra Fisip Fest 14', 'photo': 'assets/prestasiadbis2.jpg'},
    {'nama': 'Juara 2 Mobile Legend Fisip Fest 14', 'photo': 'assets/prestasiadbis3.jpg'},
  ];

  @override 
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Prestasi Mahasiswa'),
      ),
      body: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
            Container(
              height: 300,
              decoration: BoxDecoration( 
                image: DecorationImage( 
                  image: AssetImage('assets/prestasimhs.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container( 
                decoration: BoxDecoration( 
                  gradient: LinearGradient( 
                    begin: Alignment.topCenter, 
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity( 0.6),
                      Colors.black.withOpacity(0.2),
                    ],
                  ),
                ),
                child: Center( 
                  child: Text( 
                    'Prestasi Mahasiswa Administrasi Bisnis',
                    style: TextStyle( 
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding( 
              padding: EdgeInsets.all( 20),
              child: ListView.builder( 
              shrinkWrap: true,
              itemCount: dataPrestasi.length,
              itemBuilder: (context, index){
                return Card(  
                  elevation: 2,
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        ClipRRect( 
                           borderRadius: BorderRadius.circular(15),
                           child:  Image(image: AssetImage(dataPrestasi[index]['photo']), height: 150,
                        width: 150, 
                      ),
                        ),
                        SizedBox( 
                          height: 14,
                        ),
                        Text(dataPrestasi[index]['nama'], style: const TextStyle( 
                          fontSize: 14,
          fontWeight: FontWeight.w700,
                        ),)
                      ],
                    ),
                    ),
                     
                );
              },
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
          ] 
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

 