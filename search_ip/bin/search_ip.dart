import 'Ip_request.dart';
import 'package:time/time.dart';


void main(List<String> args){
    print("[*] Identificando protocolo de identificação externa...");
    timer(5);
    Request req = Request("ipinfo.io", "json");
    timer(5);
    req.getUrl();
}

//temporizador
void timer(int time) async {
    await time.seconds.delay;
}