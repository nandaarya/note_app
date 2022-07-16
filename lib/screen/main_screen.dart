import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070706),
      appBar: AppBar(
        title: Center(child: Text('Daftar Catatan')),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Text('Judul'),
                Text('Isi Catatan'),
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}
