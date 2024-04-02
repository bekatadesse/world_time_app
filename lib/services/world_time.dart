import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time = '';
  String flag;
  String url;
  bool isDay = true;//location url for api endpoint

  //constructor
  WorldTime({this.location='', this.flag='', this.url=''});


  Future<void> getTime() async {
    try {
      //make the request
      Response response = await get(
          Uri.parse("http://worldtimeapi.org/api/timezone/$url"));

      //get properties from data
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      //print(data);
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.subtract(Duration(hours: int.parse(offset)));

      // change am to pm
      if (now.hour < 12) {
        now = now.add(Duration(hours: 6));
      }

      //set the time property
      isDay = now.hour > 6 && now.hour < 20 ? true : false;
      time =  DateFormat.jm().format(now);

    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}