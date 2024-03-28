import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time = '';
  String flag;
  String url;  //location url for api endpoint

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
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now.add(Duration(hours: int.parse(offset)));

      //set the time property
      time =  DateFormat.jm().format(now);

    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}