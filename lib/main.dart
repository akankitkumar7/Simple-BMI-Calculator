import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.indigo,
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = "";
  var bgcolor = Colors.indigo.shade200;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text('BMI Calculator',style: TextStyle(fontSize:23,color: Colors.yellowAccent),),
      ),
      body:Container(
        color: bgcolor,
        child: Center(
          child:Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('BMI',style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700),),
                const SizedBox(height: 21,),
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      )

                    ),
                    label: const Text('Enter Your Weigth (in kg)'),
                    prefixIcon: const Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 21),
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        )

                    ),
                    label: const Text('Enter Your Heigth (in Feet)'),
                    prefixIcon: const Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 21,),
                TextField(
                  controller: inchcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        )

                    ),
                    label: const Text('Enter Your Heigth (in Inch)'),
                    prefixIcon: const Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height:15),

                ElevatedButton(onPressed: (){
                  var wt = wtcontroller.text.toString();
                  var ft = ftcontroller.text.toString();
                  var inch = inchcontroller.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    //BMI Calculation
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (ift*12)+iInch;
                    var tCm = tInch*2.54;
                    var tM = tCm/100;
                    var bmi = iwt/(tM*tM);

                    var msg="";
                    if (bmi>25){
                      msg =" You are OverWeigth!";
                      bgcolor = Colors.orange.shade200;

                    }else if(bmi<18){
                      msg = "You are UnderWeigth!";
                      bgcolor=Colors.red.shade200;

                    }else{
                      msg = "You are Normal!";
                      bgcolor=Colors.green.shade200;

                    }
                    setState(() {
                      result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";

                    });


                  } else{
                    setState(() {
                      result = 'Please Fill the Required details!!';
                    });
                  }
                },child:const Text('Calculate',style: TextStyle(
                    fontSize: 15,
                    color: Colors.orange,
                  fontWeight: FontWeight.w700,
                ),)),
                const SizedBox(height: 11,),
                Text(result,style: const TextStyle(fontSize: 15,color: Colors.purple),),
              ],
            ),
          ),
        ),
      )
    );
  }
}