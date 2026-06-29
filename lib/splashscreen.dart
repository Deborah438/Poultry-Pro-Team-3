import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:poultry/onboard_screen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: Lottie.asset('assets/Hatch.json')),
          Row(
            children: [
              SizedBox(width: 100),
              Text('Welcome to ', style: TextStyle(fontSize: 25)),
              Text(
                'Nestly',
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
            ],
          ),
          //  const SizedBox(height: 180,),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onboard()),
                );
              },
              child: Text('Continue', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
