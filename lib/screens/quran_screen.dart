import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:islamic_app/assistant/controller.dart';
import 'package:islamic_app/assistant/fetch_all_api.dart';
import 'package:islamic_app/model/get_all_ayah.dart';
import 'package:islamic_app/screens/about_me.dart';
import 'package:islamic_app/screens/quran_detail.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);
  
  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  
  final _controller = Get.put(Controller());
  
  ScrollController scrollControl= ScrollController();
  bool closeContainer= false;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getSurah();
    _controller.getTranslation();
    _controller.getAudio();
    
    //print(_controller.dataSurah.length);
    
    scrollControl.addListener(() {
    setState(() {
      closeContainer= scrollControl.offset>50;
    });
    });
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        title: Text(
            'Al Quran',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
        centerTitle: true,
        backgroundColor: Color(0xFF03254c),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/drawerpic.jpeg'),fit: BoxFit.fill
                )
              ),
                child:Text('')
                // Stack(
                //   children: [
                //     Positioned(
                //         child: Text('Nadia',style: TextStyle(color: Colors.white)),
                //       left: 5,
                //       bottom: 5,
                //     )
                //   ],
                // ),
              
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                onTap: (){
                      Navigator.of(context).push(
                     MaterialPageRoute(builder: (context)=>AboutMe()));
                },
                child: Row(
                children: [
                  Icon(Icons.person,size: 30),
                  SizedBox(width: 20),
                  Text(
                    "About me",
                    style: TextStyle(fontSize: 20,color:Color(0xFF03254c) ),
                  )
                ],
              ),
              )
            )
          ],
        ),
      ),
      // body: Container(
      // child: FutureBuilder(
      //     future: _ayah,
      //   builder: (context,AsyncSnapshot snapshot){
      //   if (snapshot.connectionState == ConnectionState.done) {
      //   if (snapshot.hasData) {
      //         return //Column(children: [
      //               ListView.builder(
      //                   itemCount: 114,
      //                   itemBuilder: (context, index){
      //                     return Column(
      //                       children: [
      //                         GestureDetector(child:
      //                     ListTile(
      //                               title:Row(
      //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                   children: [
      //                                     Text(snapshot.data!.data.surahs[index].englishName) ,
      //                                     Text(snapshot.data!.data.surahs[index].name),
      //                                   ]
      //                               )
      //                           ),
      //                             onTap:() {Navigator.of(context).push(
      //                         MaterialPageRoute(builder: (context) => QuranDetail(i: index,)));},
      //                         )
      //                       ]
      //                     );
      //                   }
      //                   //Text(snapshot.data!.data.surahs[0].ayahs[index].text)
      //         );
      //        // ]
      //         //);
      //       }
      //   else {
      //     return Text('error');
      //   }
      //    }
      //
      //     return Center(child:  CircularProgressIndicator());
      //    }
      //
      //
      //     )
      // ),
      body:SingleChildScrollView(
          child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height*.90,
            child:ListView(
              children: [
                AnimatedContainer(
                  height:closeContainer?0:MediaQuery.of(context).size.height*.25,
                    //color: Colors.blueAccent,
                    duration: Duration(milliseconds: 500),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
                    child: Container(
                      height:MediaQuery.of(context).size.height*.20,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
                            height:MediaQuery.of(context).size.height*.17,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage('images/quran4.jpeg'),
                                    fit: BoxFit.fill
                                )
                              // gradient: LinearGradient(
                              //   colors: [
                              //     Colors.blueAccent,
                              //     Color(0xFF03254c)
                              //   ]
                              // )
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.all(20),
                          //   child: Container(
                          //       alignment: Alignment.topLeft,
                          //       child: Text(
                          //         'Show text here',
                          //         style: TextStyle(
                          //             color: Colors.white70,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 22.0
                          //         ),
                          //       )
                          //   ),
                          // )
                        ],
                      ),
                    ),

                  ),
                ),
                // Padding(
                //     padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
                //   child: Container(
                //     height:MediaQuery.of(context).size.height*.20,
                //     child: Stack(
                //       children: <Widget>[
                //         Container(
                //           //padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
                //           height:MediaQuery.of(context).size.height*.17,
                //           alignment: Alignment.center,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(20),
                //               image: DecorationImage(
                //                   image: AssetImage('images/quran5.jpeg'),
                //                   fit: BoxFit.fill
                //               )
                //             // gradient: LinearGradient(
                //             //   colors: [
                //             //     Colors.blueAccent,
                //             //     Color(0xFF03254c)
                //             //   ]
                //             // )
                //           ),
                //         ),
                //         Padding(
                //             padding: EdgeInsets.all(20),
                //           child: Container(
                //               alignment: Alignment.topLeft,
                //               child: Text(
                //                 'Show text here',
                //                 style: TextStyle(
                //                     color: Colors.white70,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 22.0
                //                 ),
                //               )
                //           ),
                //
                //         )
                //       ],
                //     ),
                //     //color:Colors.cyan ,
                //     //height:MediaQuery.of(context).size.height*.40 ,
                //     //child: Text('Al_Quran'),
                //   ),
                //
                // ),
             
                  Container(
                  color: Colors.white,
                  height: height*.90,
                  child: Obx(() {
                    if(_controller.loadingSurah.value){
                      return Center(child: CircularProgressIndicator());
                    }
                    else
                    {
                      return ListView.builder(
                          controller: scrollControl,
                          itemCount: _controller.dataSurah.length,
                          itemBuilder: (context, index){
                            return GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>QuranDetail(i: index,)));
                              },
                              child:ListTile(
                                  leading:Container(
                                    height: 40,
                                    width: 40,
                                    //color: Colors.blueAccent,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('images/icon1.jpg'),
                                              fit: BoxFit.fill
                                            )
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child:Text('${_controller.dataSurah[index].number}',
                                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  
                                  title:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(_controller.dataSurah[index].englishName,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ) ,
                                        Text(_controller.dataSurah[index].name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color:Color(0xFF03254c),
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                            );
                          }
                      );
                    }
                  }
                  ),
              )
            ],)
      )
      ),
      
    );
  }
}

