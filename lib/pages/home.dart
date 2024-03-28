import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    //
    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    print(data);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 13.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/choose_location');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[400]),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_location), // Your desired icon
                    SizedBox(width: 5.0), // Add some spacing
                    Text(
                      'Edit Location',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70.0),

              Text(
                data['location'],
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.grey[600],
                ) ,),
              SizedBox(height: 20.0),

              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.grey[600],
                ),
              ),
              
              Image.asset("assets/ethiopian.png"),



            ],
          ),
        ),
      ),

    );
  }
}
