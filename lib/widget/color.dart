import 'package:flutter/material.dart';

//list Color untuk warna pilihan warna tiap catatan
List<Color> colors = [
  const Color(0xFFA69C9C),
  const Color(0xffFE9A37),
  const Color(0xFFCBDB57),
  const Color(0xFF9585BA),
  const Color(0xFF5C4F45),
  const Color(0xFFF96A4B),
  const Color(0xFFDEA44D),
  const Color(0xFF9E5C32),
];

//kelas untuk menentukan prioritas catatan dalam daftar/list
class PriorityPicker extends StatefulWidget {
  final Function(int) onTap;
  final int selectedIndex;
  const PriorityPicker({Key key, this.onTap, this.selectedIndex}) : super(key: key);
  @override
  _PriorityPickerState createState() => _PriorityPickerState();
}

class _PriorityPickerState extends State<PriorityPicker> {
  int selectedIndex;
  List<String> priorityText = ['Rendah', 'Tinggi', 'Tertinggi'];
  List<Color> priorityColor = [Colors.green, Colors.lightGreen, Colors.red];
  @override
  Widget build(BuildContext context) {
    selectedIndex ??= widget.selectedIndex;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTap(index);
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: width / 3,
              height: 70,
              child: Container(
                child: Center(
                  child: Text(priorityText[index],
                      style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? priorityColor[index]
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                    border: selectedIndex == index
                        ? Border.all(width: 2, color: Colors.white)
                        : Border.all(width: 0,color: Colors.transparent)),
              ),
            ),
          );
        },
      ),
    );
  }
}

//kelas pemilihan warna catatan
class ColorPicker extends StatefulWidget {
  final Function(int) onTap;
  final int selectedIndex;
  const ColorPicker({Key key, this.onTap, this.selectedIndex}) : super(key: key);
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    selectedIndex ??= widget.selectedIndex;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTap(index);
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: 50,
              height: 50,
              child: Container(
                child: Center(
                    child: selectedIndex == index
                        ? const Icon(Icons.done)
                        : Container()),
                decoration: BoxDecoration(
                    color: colors[index],
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black)),
              ),
            ),
          );
        },
      ),
    );
  }
}
