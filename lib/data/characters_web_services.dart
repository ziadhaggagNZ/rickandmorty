import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;
  String Base_Url = "https://rickandmortyapi.com/api";
  int Page_Number = 1;

  CharactersWebServices() {
    dio = Dio();
  }



   Map<String, dynamic> convertJsonMap(dynamic json) {
    if (json is Map<String, dynamic>) {
      return json;
    }
    try {
      return Map<String, dynamic>.from(json);
    } catch (e) {
      print("Error converting : ${e}");
      return {};
    }
  }



  Future<List<dynamic>> getAllCharacters() async {
    try{
      Response response = await dio.get("${Base_Url}/character?page=${Page_Number.toString()}");
      if(response.statusCode == 200)
      {
         //print("Response Data: ${response.data}");
         Map<String, dynamic> data = convertJsonMap(response.data);
         var characters = data['results'];
        return characters;
      }
      else
      {
        print("ERROR with statusCode  : ${response.statusCode}");
        return [];
      }
    }
    catch(e)
    {
      print("ERROR : ${e}");
      return [];
    }
     }
  }


