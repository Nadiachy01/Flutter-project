

import 'package:meta/meta.dart';
import 'dart:convert';

List<GetAllSurah> getAllSurahFromJson(String str) => List<GetAllSurah>.from(json.decode(str).map((x) => GetAllSurah.fromJson(x)));

String getAllSurahToJson(List<GetAllSurah> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllSurah {
  GetAllSurah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  String revelationType;
  List<Ayah> ayahs;

  factory GetAllSurah.fromJson(Map<String, dynamic> json) => GetAllSurah(
    number: json["number"],
    name: json["name"],
    englishName: json["englishName"],
    englishNameTranslation: json["englishNameTranslation"],
    revelationType: json["revelationType"],
    ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
    "englishName": englishName,
    "englishNameTranslation": englishNameTranslation,
    "revelationType": revelationType,
    "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
  };
}

class Ayah {
  Ayah({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  int number;
  String text;
  int numberInSurah;
  int juz;
  int manzil;
  int page;
  int ruku;
  int hizbQuarter;
  bool sajda;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
    number: json["number"],
    text: json["text"],
    numberInSurah: json["numberInSurah"],
    juz: json["juz"],
    manzil: json["manzil"],
    page: json["page"],
    ruku: json["ruku"],
    hizbQuarter: json["hizbQuarter"],
    sajda: json["sajda"] == true ? true : false,
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "text": text,
    "numberInSurah": numberInSurah,
    "juz": juz,
    "manzil": manzil,
    "page": page,
    "ruku": ruku,
    "hizbQuarter": hizbQuarter,
    "sajda": sajda,
  };
}
// To parse this JSON data, do
//
//     final getAllSurah = getAllSurahFromJson(jsonString);
//
// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// GetAllSurah getAllSurahFromJson(String str) => GetAllSurah.fromJson(json.decode(str));
//
// String getAllSurahToJson(GetAllSurah data) => json.encode(data.toJson());
//
// class GetAllSurah {
//   GetAllSurah({
//     required this.surahs,
//     required this.edition,
//   });
//
//   List<Surah> surahs;
//   Edition edition;
//
//   factory GetAllSurah.fromJson(Map<String, dynamic> json) => GetAllSurah(
//     surahs: List<Surah>.from(json["surahs"].map((x) => Surah.fromJson(x))),
//     edition: Edition.fromJson(json["edition"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "surahs": List<dynamic>.from(surahs.map((x) => x.toJson())),
//     "edition": edition.toJson(),
//   };
// }
//
// class Edition {
//   Edition({
//     required this.identifier,
//     required this.language,
//     required this.name,
//     required this.englishName,
//     required this.format,
//     required this.type,
//   });
//
//   String identifier;
//   String language;
//   String name;
//   String englishName;
//   String format;
//   String type;
//
//   factory Edition.fromJson(Map<String, dynamic> json) => Edition(
//     identifier: json["identifier"],
//     language: json["language"],
//     name: json["name"],
//     englishName: json["englishName"],
//     format: json["format"],
//     type: json["type"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "identifier": identifier,
//     "language": language,
//     "name": name,
//     "englishName": englishName,
//     "format": format,
//     "type": type,
//   };
// }
//
// class Surah {
//   Surah({
//     required this.number,
//     required this.name,
//     required this.englishName,
//     required this.englishNameTranslation,
//     required this.revelationType,
//     required this.ayahs,
//   });
//
//   int number;
//   String name;
//   String englishName;
//   String englishNameTranslation;
//   String revelationType;
//   List<Ayah> ayahs;
//
//   factory Surah.fromJson(Map<String, dynamic> json) => Surah(
//     number: json["number"],
//     name: json["name"],
//     englishName: json["englishName"],
//     englishNameTranslation: json["englishNameTranslation"],
//     revelationType: json["revelationType"],
//     ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "number": number,
//     "name": name,
//     "englishName": englishName,
//     "englishNameTranslation": englishNameTranslation,
//     "revelationType": revelationType,
//     "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
//   };
// }
//
// class Ayah {
//   Ayah({
//     required this.number,
//     required this.text,
//     required this.numberInSurah,
//     required this.juz,
//     required this.manzil,
//     required this.page,
//     required this.ruku,
//     required this.hizbQuarter,
//     required this.sajda,
//   });
//
//   int number;
//   String text;
//   int numberInSurah;
//   int juz;
//   int manzil;
//   int page;
//   int ruku;
//   int hizbQuarter;
//   bool sajda;
//
//   factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
//     number: json["number"],
//     text: json["text"],
//     numberInSurah: json["numberInSurah"],
//     juz: json["juz"],
//     manzil: json["manzil"],
//     page: json["page"],
//     ruku: json["ruku"],
//     hizbQuarter: json["hizbQuarter"],
//     sajda: json["sajda"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "number": number,
//     "text": text,
//     "numberInSurah": numberInSurah,
//     "juz": juz,
//     "manzil": manzil,
//     "page": page,
//     "ruku": ruku,
//     "hizbQuarter": hizbQuarter,
//     "sajda": sajda,
//   };
// }
// To parse this JSON data, do
//
//     final getAllSurah = getAllSurahFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// List<GetAllSurah> getAllSurahFromJson(String str) => List<GetAllSurah>.from(json.decode(str).map((x) => GetAllSurah.fromJson(x)));
//
// String getAllSurahToJson(List<GetAllSurah> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class GetAllSurah {
//   GetAllSurah({
//     required this.number,
//     required this.audio,
//     required this.audioSecondary,
//     required this.text,
//     required this.numberInSurah,
//     required this.juz,
//     required this.manzil,
//     required this.page,
//     required this.ruku,
//     required this.hizbQuarter,
//     required this.sajda,
//   });
//
//   int number;
//   String audio;
//   List<String> audioSecondary;
//   String text;
//   int numberInSurah;
//   int juz;
//   int manzil;
//   int page;
//   int ruku;
//   int hizbQuarter;
//   bool sajda;
//
//   factory GetAllSurah.fromJson(Map<String, dynamic> json) => GetAllSurah(
//     number: json["number"],
//     audio: json["audio"],
//     audioSecondary: List<String>.from(json["audioSecondary"].map((x) => x)),
//     text: json["text"],
//     numberInSurah: json["numberInSurah"],
//     juz: json["juz"],
//     manzil: json["manzil"],
//     page: json["page"],
//     ruku: json["ruku"],
//     hizbQuarter: json["hizbQuarter"],
//     sajda: json["sajda"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "number": number,
//     "audio": audio,
//     "audioSecondary": List<dynamic>.from(audioSecondary.map((x) => x)),
//     "text": text,
//     "numberInSurah": numberInSurah,
//     "juz": juz,
//     "manzil": manzil,
//     "page": page,
//     "ruku": ruku,
//     "hizbQuarter": hizbQuarter,
//     "sajda": sajda,
//   };
// }
//
