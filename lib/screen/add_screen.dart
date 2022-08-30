import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/database.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/widget/color.dart';

/// kelas untuk detail catatan
class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  const NoteDetail(this.note, this.appBarTitle, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(note, appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  DatabaseHelper helper = DatabaseHelper();
  String appBarTitle;
  Note note;
  int color;
  bool isEdited = false;

  NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    descriptionController.text = note.description;
    color = note.color;
    return WillPopScope(
        onWillPop: () async {
          /// cek jika catatan diubah, maka munculkan discard dialog. jika tidak, kembali ke layar terakhir
          isEdited ? showDiscardDialog(context) : moveToLastScreen();
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              appBarTitle,
              style: Theme.of(context).textTheme.headline5,
            ),
            backgroundColor: const Color(0xff070706),
            leading: IconButton(
                splashRadius: 22,
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  /// cek jika catatan diubah, maka munculkan discard dialog. jika tidak, kembali ke layar terakhir
                  isEdited ? showDiscardDialog(context) : moveToLastScreen();
                }),
            actions: <Widget>[
              IconButton(
                splashRadius: 22,
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                onPressed: () {
                  /// mengecek apakah titleController kosong atau tidak dan menjalankan fungsi _save()
                  titleController.text.isEmpty
                      ? showEmptyTitleDialog(context)
                      : _save();
                },
              ),
              IconButton(
                splashRadius: 22,
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: () {
                  showDeleteDialog(context);
                },
              )
            ],
          ),
          body: Container(
            color: const Color(0xff070706),
            child: Column(
              children: <Widget>[
                PriorityPicker(
                  selectedIndex: 3 - note.priority,
                  onTap: (index) {
                    isEdited = true;
                    note.priority = 3 - index;
                  },
                ),
                ColorPicker(
                  selectedIndex: note.color,
                  onTap: (index) {
                    setState(() {
                      color = index;
                    });
                    isEdited = true;
                    note.color = index;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: TextField(
                    controller: titleController,
                    maxLength: 255,
                    style: Theme.of(context).textTheme.bodyText2,
                    onChanged: (value) {
                      updateTitle();
                    },
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Judul',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      maxLength: 255,
                      controller: descriptionController,
                      style: Theme.of(context).textTheme.bodyText1,
                      onChanged: (value) {
                        updateDescription();
                      },
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Isi Catatan',
                        hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  /// membuat fungsi untuk memperingatkan user tentang pembatalan perubahan/discard
  void showDiscardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          shape: const RoundedRectangleBorder(
              borderRadius:  BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Batalkan perubahan?",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          content: Text("Apa kamu yakin ingin membatalkan perubahan?",
              style: Theme.of(context).textTheme.bodyText1),
          actions: <Widget>[
            TextButton(
              child: Text("Tidak",
                  style: Theme.of(context).textTheme.bodyText2),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Ya",
                  style: Theme.of(context).textTheme.bodyText2),
              onPressed: () {
                Navigator.of(context).pop();
                moveToLastScreen();
              },
            ),
          ],
        );
      },
    );
  }

  /// fungsi untuk memperingatkan user saat judul catatan kosong
  void showEmptyTitleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Judul belum terisi!",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          content: Text('Judul catatan tidak boleh kosong.',
              style: Theme.of(context).textTheme.bodyText1),
          actions: <Widget>[
            TextButton(
              child: Text("Oke",
                  style: Theme.of(context).textTheme.bodyText2),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// fungsi untuk memperingatkan user untuk menghapus catatan
  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all( Radius.circular(10.0))),
          title: Text(
            "Hapus Catatan?",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          content: Text("Apa kamu yakin ingin menghapus catatan ini?",
              style: Theme.of(context).textTheme.bodyText1),
          actions: <Widget>[
            TextButton(
              child: Text("Tidak",
                  style: Theme.of(context).textTheme.bodyText2),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Ya",
                  style: Theme.of(context).textTheme.bodyText2),
              onPressed: () {
                Navigator.of(context).pop();
                _delete();
              },
            ),
          ],
        );
      },
    );
  }

  /// fungsi navigasi/intent pop untuk kembali ke screen sebelumnya
  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  /// fungsi memperbaharui judul
  void updateTitle() {
    isEdited = true;
    note.title = titleController.text;
  }

  /// fungsi memperbaharui isi catatan
  void updateDescription() {
    isEdited = true;
    note.description = descriptionController.text;
  }

  /// fungsi untuk menyimpan data/state ke database
  void _save() async {
    moveToLastScreen();

    note.date = DateFormat('dd/MM/yyyy').format(DateTime.now());

    if (note.id != null) {
      await helper.updateNote(note);
    } else {
      await helper.insertNote(note);
    }
  }

  /// fungsi untuk menghapus data/state pada database
  void _delete() async {
    await helper.deleteNote(note.id);
    moveToLastScreen();
  }
}

