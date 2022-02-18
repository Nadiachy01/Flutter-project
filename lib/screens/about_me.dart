
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatefulWidget {
  
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("About Me"),
        backgroundColor: Color(0xFF03254c),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage("images/profile.jpeg"),
                  radius: 70,
                  child: Text("Nadia Chowdhury",style: TextStyle(),),
                )
              ],
            ),
            SizedBox(height: 30,),
            Text("Nadia Sultana Chowdhury",style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Color(0xFF03254c),
                decoration: TextDecoration.underline
            ),),
            SizedBox(height: 20,),
            Text("Student ",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 20,),
            Text("Metropolitan University,Bangladesh",style: TextStyle(
                //color: Colors.blue,
                fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                child: Icon(Icons.mail_outline,size: 20),
                ),
                
                Text(
                    "Email: ",
                 style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: 17,
            ),
                ),
                
                TextButton(onPressed: ()async{
                  await launch("mailto:nimmichowdhury32@gmail.com");
                },
                    child: Text(
                      "Nadia Chowdhury",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 17,
                          decoration: TextDecoration.underline
                      ),
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}