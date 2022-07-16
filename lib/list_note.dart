import 'package:flutter/material.dart';

class ListNote extends StatelessWidget {
  const ListNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Daftar Catatan'),
            ),
            SizedBox(height: 8,),
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
