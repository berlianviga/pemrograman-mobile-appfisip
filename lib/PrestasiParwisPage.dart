import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class PrestasiParwisPage extends StatelessWidget{
  final List<Map<String, dynamic>> dataPrestasi = [
    {'nama': 'Juara 3 Tour Package Competition', 'photo': 'assets/prestasiparwis1.jpg' },
    {'nama': 'Juara 3 Tourism Scientific Writing', 'photo': 'assets/prestasiparwis2.jpg'},
    {'nama': 'Juara 3 Lomba Karya Tulis Ilmiah', 'photo': 'assets/prestasiparwis3.jpg'},
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
                    'Prestasi Mahasiswa Program Studi Pariwisata',
                    style: TextStyle( 
                      color: Colors.white,
                      fontSize: 16,
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

 