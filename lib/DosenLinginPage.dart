import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DosenLinginPage extends StatelessWidget{
  final List<Map<String, dynamic>> dosenData = [
    {'nama': 'Dewi Puspa Arum, S.Pd., M.Pd.', 'photo': 'assets/profilepict.jpg' },
    {'nama': 'Adelia Savitri, S.Hum., M.Hum.', 'photo': 'assets/profilepict.jpg'},
    {'nama': 'Ilmatus Sa’diyah, S.Pd., M.Hum.', 'photo': 'assets/profilepict.jpg'},
  ];

  @override 
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Dosen'),
      ),
      body: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
            Container(
              height: 300,
              decoration: BoxDecoration( 
                image: DecorationImage( 
                  image: AssetImage('assets/dosenpict.jpg'),
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
                    'Dosen Linguistik Indonesia',
                    style: TextStyle( 
                      color: Colors.white,
                      fontSize: 30,
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
              itemCount: dosenData.length,
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
                        Image(image:  AssetImage(dosenData[index]['photo']),
                        height: 150,
                        width: 150,),
                        SizedBox( 
                          height: 14,
                        ),
                        Text(dosenData[index]['nama'], style: const TextStyle( 
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
                    'Telepon: +62 857-3194-8161',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector( 
                    onTap: (){ 
                      _launchEmail('linguistik@upnjatim.ac.id');
                    },
                    child: Text('Email: linguistik@upnjatim.ac.id',
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

 