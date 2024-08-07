import 'package:flutter/material.dart';

class NoteEditorScreen extends StatefulWidget {
  NoteEditorScreen(this.doc, {key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteEditorScreenState> createState() => _NoteEditorScreenState();
}

Class _NoteEditorScreenState extends State<NoteEditorScreen> {

  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Add a new Note", style: Colors.black,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            crossAxisAlignment: CrossAxisAlignment.start,
            TextField(
              controller:  _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              style: AppStyle.mainTitle,
            ),
            SizedBox(height: 8.0,),
            Text(
              date, style: AppStyle.dateTitle,
            ),
            SizedBox(height: 28.0,),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoratiion: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note content',
              ),
              style: AppStyle.mainContent,
            )
          ],
        )
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppStyle.accentColor,
          onPressed: () async{
            FirebaseFireStore.instance.collection('Notes').add({
              "note_title":_titleController.text,
              "creation_date":date,
              "note_content": _mainController.text,
              "color_id":color_id
            }).then((value){
              print(value.id);
            }).catchError((error) => print("Failed to add new Note due to $error"));
          },
          child: Icon(Icons.save),
        )
      )
    );
  }
}