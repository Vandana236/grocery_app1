import 'package:flutter/material.dart';

class condition extends StatelessWidget {
  const condition({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TERMS & CONDITION',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.2,
                width: MediaQuery.of(context).size.width*0.95,
                // color: Colors.black54,
                child: Image.asset('assets/images/fruits.png'),
                ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gogrocer is a online Delivery Mobile App as a',style: TextStyle(fontSize: 18),),
                  Text('Service.We are committed to nurturing neutral',style: TextStyle(fontSize: 15,color: Colors.black54),),
                  Text('platfrom and are helping food establishment',style: TextStyle(fontSize: 15,color: Colors.black54),),
                  Text('maintain high standards through hyperpure',style: TextStyle(fontSize: 15,color: Colors.black54),),
                  Text('food hygiene ratings is a conveted mark of',style: TextStyle(fontSize: 15,color: Colors.black54),),
                  Text('quality among our restaurant partners',style: TextStyle(fontSize: 15,color: Colors.black54),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
