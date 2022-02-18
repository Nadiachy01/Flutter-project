import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_app/assistant/fetch_all_api.dart';
import 'package:islamic_app/model/get_all_audio.dart';
import 'package:islamic_app/model/get_all_ayah.dart';
import 'package:islamic_app/model/get_all_surah.dart';
import 'package:islamic_app/model/get_all_translation.dart';

class Controller extends GetxController{
  
  var loadingAyah = true.obs;
  var loadingSurah = true.obs;
  var loadingAudio = true.obs;
  var loadingTranslation = true.obs;
  
 var dataAyah= List<GetAllAyah>.empty().obs;
 var dataTranslation= List<GetAllTranslation>.empty().obs;
 var dataAudio= List<GetAllAudio>.empty().obs;
 var dataSurah= List<GetAllSurah>.empty().obs;
 
 void init(BuildContext context){
 // getAyah();
 // getAudio();
 // getTranslation();
   getSurah();
   getTranslation();
   getAudio();
}
  void getSurah()async{
    try{
      print("jghefdj");
      loadingSurah(true).obs;
      var data = await FetchAllApiData.fetchAllSurah();
      print("nhvg");
      
      if(data != null){
        print("Surah data retrieved");
        dataSurah.value = data ;
        var ayah = dataSurah[3].ayahs[0].text;
        if(ayah.contains("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ")){
          print("1");
        }
        // ayah.replaceAll("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ", "");
        // print(ayah);
      }
    }catch(e){
      print(e.toString()+ "Surah Error1");
    }finally{
      loadingSurah(false).obs;
    }
  }
  void getTranslation()async{
    try{
      print("ts1");
      loadingTranslation(true).obs;
      var data = await FetchAllApiData.fetchAllTranslation();
      print("ts2");
      
      if(data != null){
        print("Translation data retrieved");
        dataTranslation.value = data ;
      }
    }catch(e){
      print(e.toString()+ "Translation Error1");
    }finally{
      loadingTranslation(false).obs;
    }
  }
  void getAudio()async{
    try{
      print("ad1");
      loadingAudio(true).obs;
      var data = await FetchAllApiData.fetchAllAudio();
      print("ad2");
      
      if(data != null){
        print("audio data retrieved");
        dataAudio.value = data ;
      }
    }catch(e){
      print(e.toString()+ "Translation Error1");
    }finally{
      loadingAudio(false).obs;
    }
  }

}