class Book {
  int? id;
  String tittle;
  int year;
  int autorId;
  int editorialId;
  bool available;

  Book({
    this.id,
    required this.tittle,
    required this.year,
    required this.autorId,
    required this.editorialId,
    required this.available,
  });

  Book.empty()
    : id = 0,
      tittle = '',
      year = 0,
      autorId = 0,
      editorialId = 0,
      available = false;

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as int?,
      tittle: map['tittle'] as String,
      year: map['year'] as int,
      autorId: map['autorId'] as int,
      editorialId: map['editorialId'] as int,
      available: map['available'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tittle': available,
      'year': year,
      'autorId': autorId,
      'editorialId': editorialId,
      'available': available,
    };
  }

  bool isEmpty() {
    return id == 0 &&
        tittle.isEmpty &&
        year == 0 &&
        autorId == 0 &&
        editorialId == 0 &&
        !available;
  }
}
