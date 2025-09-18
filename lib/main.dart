import 'package:b_m_i/SplashPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result  = "";
  var bgColor  = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Center(child: Text("yourBMI")),
        ),

      body:
        Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BMI",style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500  ),),

                  SizedBox(height: 21,),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text("enter your weight (in kg)"),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    keyboardType: TextInputType.number,
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text("enter your height (in feet)"),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    keyboardType: TextInputType.number,
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text("enter your height (in inches)"),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),

                  SizedBox(height: 21,),

                  ElevatedButton(onPressed: (){
                    var wt = wtController.text.toString();
                    var ft  = ftController.text.toString();
                    var inch  = inController.text.toString();

                    if(wt!="" && ft!="" && inch!=""){
                      var iwt = int.parse(wt);
                      var ift  = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (ift*12) + iInch;
                      var tCm = tInch*2.54;
                      var tm = tCm/100;
                      var bmi = iwt/(tm*tm);

                      var msg = "";

                      if(bmi>25){
                        msg = "You are Overweight!";
                        bgColor = Colors.orange.shade100;

                      } else if(bmi<18){
                        msg = " you are UnderWeight!";
                        bgColor = Colors.red.shade100;

                      } else {
                        msg  = "You are Healthy!";
                        bgColor = Colors.green.shade100;
                      }

                      setState(() {
                        result = " $msg \n your BMI is : ${bmi.toStringAsFixed(3)}";
                      });
                      // bmi calculation
                    }else{
                      setState(() {
                        result = " please fill all required blanks";
                      });
                    }
                  }, child:Text("Calculate"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.indigo
                    )
                  ),
                  SizedBox(height: 11,),
                  Text(result, style: TextStyle(fontSize: 19),),
                ],
              ),
            ),
          ),
        )
    );
  }
}
