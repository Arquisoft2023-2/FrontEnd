import 'dart:async';
import './storage_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quickalert/quickalert.dart';
import '../map_page.dart' as mapPage;


const envNot = String.fromEnvironment('envUrl');
const String notificationUrl = envNot + "/apiNotification";
//const notificationUrl = "http://localhost:1000/apiNotification";

void recurrentQuery() async {
  Timer.periodic(Duration(minutes: 1), (timer) async {
    String? plate = await SecureStorage().readSecureData("plate");
    String graphQLQuery = ' { getNotifications(id: "$plate"){ message } }';
    print(graphQLQuery);
    try {
      var response = await http.post(Uri.parse(notificationUrl),
          headers: {"Content-type": "application/json"},
          body: json.encode({'query': graphQLQuery}));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var notifications = data["data"]["getNotifications"];
        //iterate over the notifications and send quickalert for each notification
        for (var notification in notifications) {
          QuickAlert.show(
            context: mapPage.MapPage().context,
            title: notification["message"],
            type: QuickAlertType.warning,
          );
        }
      }
    } catch (e) {
      print(e);
    }
  });
}
