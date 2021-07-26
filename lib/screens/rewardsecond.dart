import 'package:flutter/material.dart';

class rewardsecond extends StatelessWidget {
  const rewardsecond({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cashbacks'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 480,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Value Received',style: TextStyle(color: Colors.white,fontSize: 20),),
                Text('Rs.36',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
                SizedBox(height: 10,),
                Text('Last updated 01 Mar 2021',style: TextStyle(color: Colors.white,fontSize: 15),),

              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child:GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                    },
                    behavior: HitTestBehavior.opaque,
                    child:  Card(
                      elevation: 1,
                      child: Column(
                        children: [
                          Icon(Icons.radio_button_checked,size: 60, color: Colors.grey,),
                          SizedBox(height: 20,),
                          Text('Cashback Won', style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                          SizedBox(height: 10,),
                          Text('Rs. 29', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.black),
                          ),
                          //SizedBox(height: 10,),
                          Text('11 August 2019', style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
