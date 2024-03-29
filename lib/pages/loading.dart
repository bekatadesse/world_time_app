import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location:'Addis Ababa', flag: 'ethiopian.png', url: 'Africa/Addis_Ababa');
    await instance.getTime();

    //pass the data to the home screen using Navigator
    Navigator.pushReplacementNamed(context, '/home', arguments:{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
