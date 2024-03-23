import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {



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
      body: ElevatedButton.icon(
        onPressed: (){
          setState(() {
            countr += 1;
          });
        },
        icon: Icon(Icons.add_location),
        label: Text('Add Location'),
      ),
    );
  }
}
