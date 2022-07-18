import 'package:flutter/material.dart';
import 'package:note_app/widget/note_card_grid.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070706),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(child: Text('Daftar Catatan')),
      ),
      body: NoteCardGrid(),
    );
  }
}
