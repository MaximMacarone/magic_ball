import 'dart:isolate';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:intl/intl.dart';
import 'web_api.dart';


Future<void> main() async {
  final IWebApi bebra = WebApi();
  final stream = printCurrentTime();
  stream.listen((value) => print(value));

  while (true) {
    var inp = stdin.readLineSync();
    if(inp == '') {
      break;
    }
    switch(inp) {
      case 'A':

      case '':

      case '':
        break;
    }
  }

  final response = await bebra.getRandomAdvice();
  print(response);
  final response2 = await bebra.getAnswer("Vitek huesos?", true);
  print(response2);
}



Stream<String> printCurrentTime() async* {
  while(true) {
    await Future.delayed(Duration(seconds: 1));
    final dateTime = DateTime.now();
    final formatter = DateFormat('d.M H:m:s');
    yield formatter.format(dateTime);
  }
}