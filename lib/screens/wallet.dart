import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _Value = 'Select Documentions';
    Future<void> CardDialog(BuildContext context) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
           // shape:
           // RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          content: StatefulBuilder(builder: (context, StateSetter setState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 500,
                  width: 300,
                  //color: Colors.red,
                    child: Column(children: [
                        SizedBox(height: 20,),
                        Text('Please submit following details to ',style: TextStyle(color: Colors.black54,fontSize: 15),),
                        Text('add money to your wallet',style: TextStyle(color: Colors.black54,fontSize: 15),),
                        SizedBox(height: 20,),
                        Card(
                          child: Container(
                            // height: 50,
                            // width: MediaQuery.of(context).size.width*0.80,
                           // color: Colors.black54,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red)
                            ),
                            child:Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: DropdownButton<String>(
                                //dropdownColor: Colors.red,
                                value: _Value,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _Value = newValue;
                                  });
                                },
                                items: <String>['Select Documentions','PAN Card', 'Driving Licence', 'Votel ID', 'Passport']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        // TextField(
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(),
                        //     labelText: 'PAN CARD'
                        //   ),
                        // ),
                        SizedBox(height: 20,),
                        TextField(
                          decoration: InputDecoration(
                              //border: OutlineInputBorder(),
                              labelText: 'PAN NUMBER'
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextField(
                          decoration: InputDecoration(
                            //border: OutlineInputBorder(),
                              labelText: 'PAN Holder Name'
                          ),
                        ),
                        SizedBox(height: 50,),
                        Container(
                          height: 70,
                          width: 600,
                          child: RaisedButton(
                            child: Text('SUBMIT', style: TextStyle(fontSize: 20.0),),
                            color: Colors.red,
                            onPressed: () {
                              CardDialog(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          )
          );
        }
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('Wallet',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Card(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Low Balance',style: TextStyle(color: Colors.red,fontSize: 18),),
                      Text('Rs. 0',style: TextStyle(color: Colors.red,fontSize: 40),),
                      Container(
                        height: 1,
                        width: 500,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10,),
                      Text('Topup Wallet',style: TextStyle(color: Colors.black,fontSize: 20),),
                      SizedBox(height: 20,),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter amount',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                       // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('We will remind you to keep your wallet loaded',style: TextStyle(fontSize: 15,color: Colors.black54),),
                          Text('Disable reminders under profie Bill Notifications',style: TextStyle(fontSize: 15,color: Colors.black54),),
                        ],
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('Debit Form',style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Expanded(child: Text('UPI',style: TextStyle(fontSize: 15,color: Colors.red),)),
                        SizedBox(width: 30,),
                        Expanded(child: Text('DEBIT CARD',style: TextStyle(fontSize: 12,color: Colors.black54),)),
                        SizedBox(width: 30,),
                        Expanded(child: Text('CREDIT CARD',style: TextStyle(fontSize: 12,color: Colors.black54),))
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 1,
                    width: 500,
                    color: Colors.black12,
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.radio_button_checked,size: 30, color: Colors.blue,),
                        SizedBox(width: 13,),
                        Expanded(child: Text('State Bank of India-6413',style: TextStyle(fontSize: 14,color: Colors.black54),)),
                        SizedBox(width: 20,),
                        Text('Rs.20',style: TextStyle(fontSize: 15,color: Colors.black),),
                        SizedBox(width: 20,),
                        Icon(Icons.radio_button_checked,size: 30, color: Colors.green,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 1,
                    width: 500,
                    color: Colors.black54,
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('ADD  ANOTHER BANK ACCOUNT',style: TextStyle(fontSize: 16,color: Colors.red),),
                  ),
                  SizedBox(height: 40,),
                  Center(
                    child: Column(
                      children: [
                        Text('Powered by ',style: TextStyle(fontSize: 12,color: Colors.black54),),
                        Text('BHIM/UPI',style: TextStyle(fontSize: 20,color: Colors.black54,),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 600,
              color: Colors.red,
              child: RaisedButton(
                child: Text('TOPUP WALLET', style: TextStyle(fontSize: 20.0),),
                color: Colors.red,
                //textColor: Colors.white,
                onPressed: () {
                  CardDialog(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
