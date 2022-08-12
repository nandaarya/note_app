/// kelas data catatan/note
class Note {
  ///deklarasi tipe data variabel/ field object Note
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority, _color;

  Note(this._title, this._date, this._priority, this._color,
      [this._description]);

  Note.withId(this._id, this._title, this._date, this._priority, this._color,
      [this._description]);

  /// property getter
  int get id {
    return _id;
  }
  String get title {
    return _title;
  }
  String get description {
    return _description;
  }
  int get priority {
    return _priority;
  }
  int get color {
    return _color;
  }
  String get date {
    return _date;
  }

  /// property setter
  /// title/judul tidak boleh lebih dari 255 karakter
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  /// Deskripsi tidak boleh lebih dari 255 karakter
  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  /// Prioritas 1 sampai 3
  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  /// Color/warna dalam rentang 0-9
  set color(int newColor) {
    if (newColor >= 0 && newColor <= 9) {
      _color = newColor;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  /// Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['color'] = _color;
    map['date'] = _date;

    return map;
  }

  /// Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _description = map['description'];
    _priority = map['priority'];
    _color = map['color'];
    _date = map['date'];
  }
}