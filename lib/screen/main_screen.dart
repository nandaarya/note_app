import 'package:flutter/material.dart';
import 'package:note_app/widget/note_card_grid.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070706),
      // extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        onPressed: () {},
        backgroundColor: Colors.grey,
      ),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(child: Text('Daftar Catatan')),
      ),
      body: NoteCardGrid(),
    );
  }
}
