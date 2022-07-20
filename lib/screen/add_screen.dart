import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 500, maxWidth: 800),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (isNewNote)
                            addNote();
                          else {
                            print(index);
                            if (index != null) updateNote(index);
                          }
                        }
                      },
                      icon: Icon(Icons.check_outlined),
                    ),
                    kHSpace,
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.clear),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _noteTitleController,
                  decoration: InputDecoration(
                    hintText: 'Judul',
                    // label: Text('Title'),
                    // isCollapsed: true,
                    fillColor: Colors.transparent,
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return kLabelMandatory;
                    }
                    return null;
                  },
                ),
                kVSpace,
                Expanded(
                  child: TextFormField(
                    controller: _noteTextController,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: 'Content',
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
