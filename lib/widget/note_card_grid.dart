import 'package:flutter/material.dart';

class NoteCardGrid extends StatefulWidget {
  const NoteCardGrid({Key? key}) : super(key: key);

  @override
  State<NoteCardGrid> createState() => _NoteCardGridState();
}

class _NoteCardGridState extends State<NoteCardGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: GridView.count(
        crossAxisCount: 2,
        children: [Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "judul",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "isi catatan",
                        maxLines: 6,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'waktu',
                          style: TextStyle(color: Colors.black54, fontSize: 12.0),
                        ),
                        Text(
                            'Tanggal',
                          style: TextStyle(color: Colors.black54, fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),],
      ),
    );
  }
}
