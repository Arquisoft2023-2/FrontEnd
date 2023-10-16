import 'dart:async';
import './storage_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const notificationUrl = "http://localhost:1000/apiNotification";

void recurrentQuery() async {
  Timer.periodic(Duration(minutes: 1), (timer) async {
    String? plate = await SecureStorage().readSecureData("plate");
    String graphQLQuery = ' { getNotifications(id: "$plate"){ message } }';
    print(plate);
    try {
      var response = await http.post(Uri.parse(notificationUrl),
          headers: {"Content-type": "application/json"},
          body: json.encode({'query': graphQLQuery}));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
      }
    } catch (e) {
      print(e);
    }
  });
}
