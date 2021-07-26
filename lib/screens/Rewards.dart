import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grocery_onlineapp/screens/rewardsecond.dart';
import 'package:scratcher/scratcher.dart';

class Rewards extends StatefulWidget {
  const Rewards({Key  key}) : super(key: key);

  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  var _current = 0;
  double _opacity = 0.0;
  Future<void> scratchCardDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'You\'ve won a scratch card',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          content: StatefulBuilder(builder: (context, StateSetter setState) {

            return Scratcher(
              accuracy: ScratchAccuracy.low,
              threshold: 25,
              brushSize: 50,
              onThreshold: () {
                setState(() {
                  _opacity = 1;
                });
              },
              color: Colors.black,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 250),
                opacity: _opacity,
                child: Card(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  rewardsecond()),
                      );
                    },
                    child: Container(
                      height: 250,
                      width: 250,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Icon(Icons.radio_button_checked,size: 100, color: Colors.grey,),
                          SizedBox(height: 40,),
                          Text('Cashback Won', style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          SizedBox(height: 10,),
                          Text('Rs. 29', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(height: 10,),
                          Text('11 August 2019', style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
  List banner = [
    {"images": "assets/images/banner-1.jpg"},
    {"images": "assets/images/banner-1.jpg"},
    {"images": "assets/images/banner-1.jpg"},
    {"images": "assets/images/banner-1.jpg"},
    {"images": "assets/images/banner-1.jpg"},
    {"images": "assets/images/banner-1.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rewards',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 100,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: true,
                viewportFraction: 1.0,
                initialPage: 0,
                autoPlayInterval: Duration(seconds: 7),
                autoPlayAnimationDuration:
                Duration(milliseconds: 1000),
                pauseAutoPlayOnTouch: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, abc) {
                  _current = index;
                }),
            itemCount: banner.length,
            itemBuilder: (ctx,index,i)
            {
              return Container(
                width: MediaQuery.of(context).size.width*0.95,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                        image: AssetImage(banner[index]["images"]),fit: BoxFit.fill)),
              );
            },
          ),
          SizedBox(height: 10,),
          Card(
            child: Container(
              height: 100,
              width: 450,
              child: Row(
                children: [
                  //SizedBox(width: 30,),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                         Icon(
                         Icons.ac_unit,size: 30,
                          color: Colors.red,),
                        SizedBox(width: 10,),
                        Text('Cashbacks'),
                        Text('Rs.36'),
                      ],
                    ),
                  ),
                  //SizedBox(width: 30,),
                  Container(
                    height: 90,
                    width: 1,
                    color: Colors.black12,
                  ) ,
                  //SizedBox(width: 40,),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Icon(
                          Icons.account_balance_rounded,size: 30,
                          color: Colors.red,),
                        Text('Offers'),
                        Text('Rs.22'),
                      ],
                    ),
                  ),
                  //SizedBox(width: 60,),
                  Container(
                    height: 90,
                    width: 1,
                    color: Colors.black12,
                  ),
                  //SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Icon(
                          Icons.account_circle_outlined,size: 30,
                          color: Colors.red,),
                        Text('Coupons'),
                        Text('112'),
                      ],
                    ),
                  ),
                ],
              ),
              //color: Colors.black12,
            ),
          ),
          SizedBox(height: 15,),
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
                      scratchCardDialog(context);
                    },
                    behavior: HitTestBehavior.opaque,
                    child:  Card(
                      elevation: 1,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Icon(Icons.wallet_travel,size: 60,color: Colors.red,),
                          Text('PhonePe Wallet Top..',style: TextStyle(color: Colors.grey,fontSize: 15)),
                          SizedBox(height: 10,),
                          Text('Get flat Rs.10',style: TextStyle(fontSize: 15)),
                        Text('Cashback*',style: TextStyle(fontSize: 15)),
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
