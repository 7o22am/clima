import 'package:http/http.dart' as http ;
import 'dart:convert';
class NetworkHelper{
  NetworkHelper(this.urll);
  final String urll;
  Future getData() async{
    var response;
    Future<http.Response> fetchAlbum() async {
        response = await http.get(Uri.parse(urll));
      return response;
    }

     if(response.statusCode==200){
       String data = response.body;
       return jsonDecode(data);
     }
     else
       {
         print(response.statusCode);
       }


  }
}