import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AdminPublikPage.dart';
import 'AdminBusinessPage.dart';
import 'IlmuKomunikasiPage.dart';
import 'HubInterPage.dart';
import 'PariwisataPage.dart';
import 'LinginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> programStudi = [
    {
      'prodi': 'Administrasi Publik',
      'logo': 'assets/psapupn.jpg',
      'page': AdminPublikPage(),
    },
    {
      'prodi': 'Administrasi Bisnis',
      'logo': 'assets/adbisupn.jpg',
      'page': AdminBusinessPage(),
    },
    {
      'prodi': 'Ilmu Komunikasi',
      'logo': 'assets/ikomupn.jpg',
      'page': IlmuKomunikasiPage(),
    },
    {
      'prodi': 'Hubungan Internasional',
      'logo': 'assets/hiupn.jpg',
      'page': HubInterPage(),
    },
    {
      'prodi': 'Pariwisata',
      'logo': 'assets/pariwisataupn.jpg',
      'page': PariwisataPage(),
    },
    {
      'prodi': 'Linguistik Indonesia',
      'logo': 'assets/linginupn.jpg',
      'page': LinginPage(),
    },
  ];

  final List<Map<String, dynamic>> developerProfiles = [
    {
      'name': 'Arisa Rizatul Zahra',
      'photo': 'arisa.jpg',
      'github': 'https://github.com/Iniarisa/Iniarisa',
      'page': ArisaPage(),
    },
    {
      'name': 'Berlian viga septiani',
      'photo': 'berlian.jpg',
      'github': 'https://github.com/username_berlian',
      'page': BerlianPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/logoupn.png', // Letakkan file logo universitas di folder assets
                height: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Fakultas Ilmu Sosial dan Ilmu Politik',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/fisip.jpg', // Letakkan file foto fakultas di folder assets
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 253, 242, 143),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Keberadaan Fakultas Ilmu Sosial dan Ilmu Politik diawali dengan berdirinya Fakultas Ilmu Administrasi Negara dan Administrasi Niaga. Satu tahun kemudian Fakultas Ilmu Administrasi membuka satu jurusan baru yaitu jurusan Ilmu Komunikasi pada tahun ajaran 1994/1995. Dalam perkembangan selanjutnya terbit Surat Keputusan Rektor UPN “Veteran” Jawa Timur Nomor : Skep/101/IX/2005 tanggal 6 Mei 2005 tentang Pergantian nama Fakultas Ilmu Administrasi UPN”Veteran” Jawa Timur menjadi Fakultas Ilmu Sosial dan Ilmu Politik.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Daftar Program Studi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: programStudi.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.yellow,
                    child: ListTile(
                      leading: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(programStudi[index]['logo']),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      title: Text(programStudi[index]['prodi']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => programStudi[index]['page'],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Developer Profiles',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  developerProfiles.length,
                  (index) => DeveloperProfileTile(
                    name: developerProfiles[index]['name'],
                    photo: developerProfiles[index]['photo'],
                    page: developerProfiles[index]['page'],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeveloperProfileTile extends StatelessWidget {
  final String name;
  final String photo;
  final Widget page;

  const DeveloperProfileTile({
    required this.name,
    required this.photo,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.yellow,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(photo),
            ),
            SizedBox(width: 20),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ArisaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arisa Rizatul Zahra'),
      ),
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.yellow[400]!, Colors.yellow[900]!],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120),
                Center(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage('arisa.jpg'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Desainer Grafis',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileItem(
                            label: 'Nama', value: 'Arisa Rizatul Zahra'),
                        ProfileItem(
                            label: 'Tempat, Tanggal Lahir',
                            value: '18 Maret 2003'),
                        ProfileItem(
                            label: 'Alamat',
                            value: 'JL. Kendangsari Gg. IV No. 88'),
                        ProfileItem(
                            label: 'Nomer Telephone', value: '08993546250'),
                        ProfileItem(
                            label: 'Email',
                            value: 'Iniarisa15@gmail.com',
                            link: 'Iniarisa15@gmail.com'),
                        ProfileItem(
                            label: 'GitHub Profile',
                            value: 'https://github.com/Iniarisa/Iniarisa',
                            link: 'https://github.com/Iniarisa/Iniarisa'),
                        ProfileItem(
                            label: 'Riwayat Pendidikan', value: 'SMK Negeri'),
                        ProfileItem(label: 'Penghargaan', value: '-'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BerlianPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berlian Viga Septiani'),
      ),
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.yellow[400]!, Colors.yellow[900]!],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120),
                Center(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage('berlian.jpg'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Programmer',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileItem(
                            label: 'Nama', value: 'Berlian Viga Septiani'),
                        ProfileItem(
                            label: 'Tempat, Tanggal Lahir',
                            value: 'Kediri 13 september 2003'),
                        ProfileItem(
                            label: 'Alamat',
                            value: 'Desa Jabang, Kec. Kras, Kab. Kediri'),
                        ProfileItem(
                            label: 'Nomer Telephone', value: '081553268764'),
                        ProfileItem(
                            label: 'Email',
                            value: 'berlianviga@gmail.com',
                            link: 'berlianviga@gmail.com'),
                        ProfileItem(
                            label: 'Github Profile',
                            value: 'https://github.com/berlianviga',
                            link: 'https://github.com/berlianviga'),
                        ProfileItem(label: 'Pendidikan', value: 'SMA'),
                        ProfileItem(label: 'Penghargaan', value: '-'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String label;
  final String value;
  final String? link;

  const ProfileItem({
    required this.label,
    required this.value,
    this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (link != null) {
                  if (label.toLowerCase() == 'email') {
                    _launchEmail(value);
                  } else {
                    _launchURL(link!);
                  }
                }
              },
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: link != null
                      ? Colors.blue
                      : Colors
                          .black, // Biru untuk link, hitam untuk yang lainnya
                  decoration: link != null ? TextDecoration.underline : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchEmail(String email) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    final String emailLaunchUriString = _emailLaunchUri.toString();
    if (await canLaunch(emailLaunchUriString)) {
      await launch(emailLaunchUriString);
    } else {
      throw 'Could not launch $emailLaunchUriString';
    }
  }
}
