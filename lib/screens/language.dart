 import 'package:flutter/material.dart';

 class Languages extends StatefulWidget {
   const Languages({Key  key}) : super(key: key);

   @override
   _LanguagesState createState() => _LanguagesState();
 }

 class _LanguagesState extends State<Languages> {

   String _isChecked = 'Hindi';
   List<String> text = ["Hindi", "English", "Urdu","Bengali","Tamil","Gujarati","Punjabi","Odia","Malayalam","Sanskrit","Marathi","Telugu","Kashmiri"];
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Languages', style: TextStyle(color: Colors.black),),
       ),
       resizeToAvoidBottomInset: false,
       body: Container(

         child: Column(
           children: <Widget>[
             //SizedBox(height: 10,),
             Container(
               height: MediaQuery.of(context).size.height*0.2,
               width: MediaQuery.of(context).size.width*0.95,
               //color: Colors.black54,
               child: Image.asset('assets/images/fruits.png'),
             ),
             Expanded(
                 child: SingleChildScrollView(
                   child: Column(
                     children: text
                         .map((t) =>
                         CheckboxListTile(
                             title: Text(t),
                             value: _isChecked == t,
                             onChanged: (val) =>
                             setState (() {
                              this. _isChecked = t;
                              // print(text.length);
                              // print(text.indexOf(t));
                             },)
                         ))
                         .toList(),
                   ),
                 )
             ),
             Container(
               height: 50,
               width: 600,
               child: RaisedButton(
                 child: Text('SUBMIT', style: TextStyle(fontSize: 20.0),),
                 color: Colors.red,
                 //textColor: Colors.white,
                 onPressed: () {
                   //CardDialog(context);
                 },
               ),
             )
           ],
         ),
       ),
     );
   }
 }
