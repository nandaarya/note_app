import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';

/// classs search note/ pencari catatan
class NotesSearch extends SearchDelegate<Note> {
  final List<Note> notes;
  List<Note> filteredNotes = [];
  NotesSearch({this.notes});

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context).copyWith(
        hintColor: Colors.grey,
        primaryColor: Colors.black,
        textTheme: const TextTheme(
          headline6:  TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ));
    assert(theme != null);
    return theme;
  }

  /// appBar action button
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        splashRadius: 22,
        icon: const Icon(
          Icons.clear,
          color: Colors.white54,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  /// appBar leading button
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      splashRadius: 22,
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white54,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == '') {
      return Container(
        color: Colors.black,
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.search,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Masukan judul untuk mencari dalam daftar catatan.',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )),
      );
    } else {
      filteredNotes = [];
      getFilteredList(notes);
      if (filteredNotes.isEmpty) {
        return Container(
          color: Colors.black,
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.sentiment_dissatisfied,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Tidak ada catatan yang cocok.',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )),
        );
      } else {
        return Container(
          color: Colors.black,
          child: ListView.builder(
            itemCount: filteredNotes.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(
                  Icons.note,
                  color: Colors.white54,
                ),
                title: Text(
                  filteredNotes[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.grey),
                ),
                subtitle: Text(
                  filteredNotes[index].description,
                  style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                onTap: () {
                  close(context, filteredNotes[index]);
                },
              );
            },
          ),
        );
      }
    }
  }

  /// fungsi algoritma pencarian/filter catatan
  /// jika sebuah title/description note(i) mengandung (query), maka tambahkan note(i) tersebut kedalam filteredNotes list.
  /// lalu kembalikan/return filterNotes list.
  List<Note> getFilteredList(List<Note> note) {
    for (int i = 0; i < note.length; i++) {
      if (note[i].title.toLowerCase().contains(query) ||
          note[i].description.toLowerCase().contains(query)) {
        filteredNotes.add(note[i]);
      }
    }
    return filteredNotes;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return Container(
        color: Colors.black,
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.search,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Masukan judul untuk mencari dalam daftar catatan.',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )),
      );
    } else {
      filteredNotes = [];
      getFilteredList(notes);
      /// cek apakah filteredNotes list kosong
      if (filteredNotes.isEmpty) {
        return Container(
          color: Colors.black,
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.sentiment_dissatisfied,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Tidak ada catatan yang cocok.',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )),
        );
      } else {
        return Container(
          color: Colors.black,
          child: ListView.builder(
            itemCount: filteredNotes.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(
                  Icons.note,
                  color: Colors.white54,
                ),
                title: Text(
                  filteredNotes[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.grey),
                ),
                subtitle: Text(
                  filteredNotes[index].description,
                  style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                onTap: () {
                  close(context, filteredNotes[index]);
                },
              );
            },
          ),
        );
      }
    }
  }
}