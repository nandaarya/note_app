import 'package:flutter/material.dart';

class ListNote extends StatelessWidget {
  const ListNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Daftar Catatan')),
      ),
      body: SafeArea(
        child: Column(
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
        ),
      ) ,
    );
  }
}
