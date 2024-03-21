import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData () async {
    // simulate network request username
    String username = await Future.delayed(Duration(seconds: 2), (){
      return 'yosh ';
      });

  // simulate network request to get bio
    String bio = await Future.delayed(Duration(seconds: 5),(){
      return 'i like reading books';
    });

    print('$username - $bio');
  }

  int countr= 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState function ran');
    getData();
  }
  @override
  Widget build(BuildContext context) {
    print('build function ran');
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
