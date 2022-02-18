import 'dart:convert';
import 'package:islamic_app/model/get_all_audio.dart';
import 'package:islamic_app/model/get_all_ayah.dart';
import 'package:http/http.dart' as http;
import 'package:islamic_app/model/get_all_surah.dart';
import 'package:islamic_app/model/get_all_translation.dart';

class FetchAllApiData{
  
  //  static Future<GetAllAyah?> fetchAllAyah() async{
  //   var url = Uri.parse('http://api.alquran.cloud/v1/quran/quran-uthmani');
  //   var heroResponse= await http.get(url);
  //   if(heroResponse.statusCode==200) {
  //     var jsonDecode= json.decode(heroResponse.body);
  //     var convertData= json.encode(jsonDecode);
  //     return getAllAyahFromJson(convertData);
  //   }
  //   return null;
  // }
  // static Future<GetAllTranslation?> fetchAllTranslation() async{
  //   var url = Uri.parse('http://api.alquran.cloud/v1/quran/en.asad');
  //   var heroResponse= await http.get(url);
  //   if(heroResponse.statusCode==200) {
  //     var jsonDecode= json.decode(heroResponse.body);
  //     var convertData= json.encode(jsonDecode);
  //     return getAllTranslationFromJson(convertData);
  //   }
  //   return null;
  // }
  // static Future<GetAllAudio?> fetchAllAudio() async{
  //   var url = Uri.parse('http://api.alquran.cloud/v1/quran/en.asad');
  //   var heroResponse= await http.get(url);
  //   if(heroResponse.statusCode==200) {
  //     var jsonDecode= json.decode(heroResponse.body);
  //     var convertData= json.encode(jsonDecode);
  //     return getAllAudioFromJson(convertData);
  //   }
  //   return null;
  // }
   static Future<List<GetAllSurah>?> fetchAllSurah() async{
     var url = Uri.parse('http://api.alquran.cloud/v1/quran/quran-uthmani');
     var heroResponse= await http.get(url,headers: {"Content-Type": "application/json"});
     print(heroResponse.statusCode);
     if(heroResponse.statusCode==200) {
       print(heroResponse.statusCode);
       var jsonDecode= json.decode(heroResponse.body);
       var convertData= json.encode(jsonDecode['data']['surahs']);
       print(convertData);
       return getAllSurahFromJson(convertData);
     }else{
       print("error");
     }
     return null;
   }
   static Future<List<GetAllTranslation>?> fetchAllTranslation() async{
     var url = Uri.parse('http://api.alquran.cloud/v1/quran/en.asad');
     var heroResponse= await http.get(url,headers: {"Content-Type": "application/json"});
     print(heroResponse.statusCode);
     if(heroResponse.statusCode==200) {
       print(heroResponse.statusCode);
       var jsonDecode= json.decode(heroResponse.body);
       var convertData= json.encode(jsonDecode['data']['surahs']);
       print(convertData);
       return getAllTranslationFromJson(convertData);
     }else{
       print("error");
     }
     return null;
   }
   static Future<List<GetAllAudio>?> fetchAllAudio() async{
     var url = Uri.parse('http://api.alquran.cloud/v1/quran/ar.alafasy');
     var heroResponse= await http.get(url,headers: {"Content-Type": "application/json"});
     print(heroResponse.statusCode);
     if(heroResponse.statusCode==200) {
       print(heroResponse.statusCode);
       var jsonDecode= json.decode(heroResponse.body);
       var convertData= json.encode(jsonDecode['data']['surahs']);
       print(convertData);
       return getAllAudioFromJson(convertData);
     }else{
       print("error");
     }
     return null;
   }
}