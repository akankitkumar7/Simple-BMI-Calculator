import 'package:calbmi/main.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class IntroPage extends StatelessWidget{
  var namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Ankit..'),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome',style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                height: 11,
              ),
              TextField(
                controller: namecontroller ,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:(context) => MyHomePage(),

                        ));

                  }, child: Text('Calculate BMI')),
            ],
          ),
        ),
      ),
    );

  }

}







