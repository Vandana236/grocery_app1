import 'package:flutter/material.dart';

class help extends StatelessWidget {
  const help({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help center ',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
            //  SizedBox(height: 20,),
              Container(
                  // height: MediaQuery.of(context).size.height*0.1,
                  // width: MediaQuery.of(context).size.width*0.95,
                  // color: Colors.black54,
                  child: Image.asset('assets/images/fruits.png')),
              SizedBox(height: 20,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('What issues are you facing ?',style: TextStyle(fontSize: 22,),),
                    SizedBox(height: 10,),
                    Text('I want to track my order',style: TextStyle(fontSize: 18,),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('Check order status & call the delivery agent',style: TextStyle(fontSize: 13,color: Colors.black54),),
                        SizedBox(width: 30,),
                        Icon(Icons.arrow_drop_down,size: 30, color: Colors.black,),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width*0.95,
                color: Colors.black12,
              ),
              SizedBox(height: 20,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('I want to track my order',style: TextStyle(fontSize: 18,),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('Check order status & call the delivery agent',style: TextStyle(fontSize: 13,color: Colors.black54),),
                        SizedBox(width: 30,),
                        Icon(Icons.arrow_drop_down,size: 30, color: Colors.black,),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width*0.95,
                color: Colors.black12,
              ),
              SizedBox(height: 20,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('I want to track my order',style: TextStyle(fontSize: 18,),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('Check order status & call the delivery agent ',style: TextStyle(fontSize: 13,color: Colors.black54),),
                        SizedBox(width: 30,),
                        Icon(Icons.arrow_drop_down,size: 30, color: Colors.black,),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width*0.95,
                color: Colors.black12,
              ),
              SizedBox(height: 20,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('I want to track my order',style: TextStyle(fontSize: 18,),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('Check order status & call the delivery agent ',style: TextStyle(fontSize: 13,color: Colors.black54),),
                        SizedBox(width: 30,),
                        Icon(Icons.arrow_drop_down,size: 30, color: Colors.black,),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width*0.95,
                color: Colors.black12,
              ),
              SizedBox(height: 20,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('I want to track my order',style: TextStyle(fontSize: 18,),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('Check order status & call the delivery agent ',style: TextStyle(fontSize: 13,color: Colors.black54),),
                        SizedBox(width: 30,),
                        Icon(Icons.arrow_drop_down,size: 30, color: Colors.black,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
