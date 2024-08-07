import 'package:flutter/material.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreenState> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.doc["note_title"], style:AppStyle.mainTitle,),
          SizedBox(height: 4.0,),
          Text(widget.doc["creation_date"], style:AppStyle.dateTitle,),
          SizedBox(height: 28.0,),
          Text(widget.doc["note_content"], style:AppStyle.mainContent,
          ),
        ],
      )
    );
  }
}
