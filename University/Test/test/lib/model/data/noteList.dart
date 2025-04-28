import 'package:test/model/data/note.dart';

class Notelist {
	List<Note> notes = [];

	Notelist(){
		notes.add(
			Note(
				title: 'Market',
				dateTime: DateTime.now()
			)
		);
		notes.add(
			Note(
				title: 'My Stuff',
				dateTime: DateTime.now(),
				text: 'password password text text more text'
			)
		);
	}

	List<Note> GetListNotes(){
		return notes;

	}

	
  
}
