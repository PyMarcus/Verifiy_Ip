import 'package:http/http.dart' as http;
import 'package:time/time.dart';
import 'dart:convert' as convert;


class Request{
  String _url = "";
  String _path = "";

  //constructor
  Request(this._url, this._path);

  //setters and getters
  String get url{
    return _url;
  }
  set url(String newUrl){
    _url = newUrl;
  }

  String get path{
    return _path;
  }
  set path(String newPath){
    _path = newPath;
  }

  //methods
   getUrl () async{
    var request = Uri.https(_url, _path);
    print("[*] Requisição feita à: " + request.toString());
    timer(2);
    print("[*] Aguardando...");
    timer(2);
    var response = await http.get(request);
    if(response.statusCode == 200){
      timer(5);
      print("[*] Convertendo saída...");
      timer(5);

      var json = convert.jsonDecode(response.body) as Map<String, dynamic>;

      print("");
      print("ip: ${json["ip"]}");
      print("provedora: ${json["hostname"]}");
      print("cidade: ${json["city"]}");
      print("estado: ${json["region"]}");
      print("país: ${json["country"]}");
      print("coordenadas geográficas: ${json["loc"]}");
      print("cep: ${json["postal"]}");

    }else{
      print("[*] opss...${response.statusCode}");
    }

  }

  //temporizador
  static timer(int time) async {
    await time.seconds.delay;
  }

}