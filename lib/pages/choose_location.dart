import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Addis Ababa', flag: 'ethiopian.png', url: 'Africa/Addis_Ababa'),
    WorldTime(location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'Chicago', flag: 'us.jpg', url: 'America/Chicago'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.jpg', url: 'Asia/Jakarta'),
    WorldTime(location: 'Khartoum', flag: 'sudan.jpg', url: 'Africa/Khartoum'),
    WorldTime(location: 'London', flag: 'uk.jpg', url: 'Europe/London'),
    WorldTime(location: 'Nairobi', flag: 'kenya.jpg', url: 'Africa/Nairobi'),
    WorldTime(location: 'New York', flag: 'us.jpg', url: 'America/New_York'),
    WorldTime(location: 'Paris', flag: 'france.jpg', url: 'Europe/Paris'),
    WorldTime(location: 'Seoul', flag: 'south_korea.jpg', url: 'Asia/Seoul'),
    WorldTime(location: 'Tokyo', flag: 'japan.jpg', url: 'Asia/Tokyo'),
  ];

  void updateTime(index) async {
    WorldTime  instance = locations[index];
    await instance.getTime();

    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }

  int countr= 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print('build function ran');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text('Choose a Location',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,),),
        centerTitle: true,
        ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder:(context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                   // print(locations[index].location);
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
