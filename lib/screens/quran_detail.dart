import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:islamic_app/assistant/fetch_all_api.dart';
import 'package:islamic_app/model/get_all_ayah.dart';

import '../assistant/controller.dart';

class QuranDetail extends StatefulWidget {
   QuranDetail({required this.i}) ;
   int i;

  @override
  _QuranDetailState createState() => _QuranDetailState(i:i);
}

class _QuranDetailState extends State<QuranDetail> {
  
  final _controller = Get.put(Controller());
  
  _QuranDetailState({required this.i}) ;
  int i;
  
  AudioPlayer audioPlayer= AudioPlayer();
  
  
  @override
  void initState() {
    super.initState();
    _controller.getSurah();
    _controller.getTranslation();
    _controller.getAudio();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Al-Quran',
            style: TextStyle(
                color:Color(0xFF03254c),
              fontSize: 30
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color:Color(0xFF03254c) ,size: 30),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child:  Stack(
                    children: <Widget>[
                      Container(
                        height:MediaQuery.of(context).size.height*.15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            // image: DecorationImage(
                            //     image: AssetImage('images/quran5.jpeg'),
                            //     fit: BoxFit.fill
                            // ),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blueAccent,
                                  Color(0xFF03254c)
                                ]
                            )
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Text(
                                  _controller.dataSurah[i].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(10),
                                  child:Text(
                                  _controller.dataSurah[i].englishName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ) ,
                                )
                              ],
                            )
                            
                        ),
      
                      )
                    ],
                  ),
              ),
              
              Container(
                //height: 600,
                height: MediaQuery.of(context).size.height*.70,
                child: Obx(() {
                  if(_controller.loadingSurah.value){
                    return Center(child: CircularProgressIndicator());
                  }
                  else
                  {
                    return ListView.builder(
                        itemCount: _controller.dataSurah[i].ayahs.length,
                        itemBuilder: (context, index){
                          return Column(
                             // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(20),
                                child:Text(
                                    _controller.dataSurah[i].ayahs[index].text,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF03254c)
                                  ),
                                  textAlign: TextAlign.end,
                                ) ,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10,bottom: 10,left: 5),
                                  child:Text(
                                    _controller.dataTranslation[i].ayahs[index].text,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400
                                    ),
                                    //textAlign: TextAlign.left,
                                  ) ,
                                ),
  
                                // IconButton(
                                //   onPressed: (){
                                //     audio?initAudio(_controller.dataAudio[i].ayahs[index].audio):pauseAudio();
                                //     audio=!audio;
                                //     icon=!icon;
                                //     // setState(() {
                                //     //   play=icon? Icon(Icons.pause):Icon(Icons.play_arrow);
                                //     //   icon=!icon;
                                //     // });
                                //
                                //   },
                                //   icon:icon? Icon(Icons.pause):Icon(Icons.play_arrow)
                                //   //play,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        initAudio(_controller.dataAudio[i].ayahs[index].audio);
                                      },
                                      icon: Icon(Icons.play_arrow),
                                    ),
                                    IconButton(
                                      onPressed: (){
                                        pauseAudio();
                                      },
                                      icon: Icon(Icons.pause),
                                    ),
                                  ],
                                ),
                                
                                
                                Divider(
                                thickness: 2,
                                )
                              ]
                          );
                        }
                    );
                  }
                }
                ),
              ),
            ],
          ),
        )
      )
    );
  }
  initAudio(String aud){
    audioPlayer.play(aud);
  }
  pauseAudio(){
    audioPlayer.pause();
  }
}
