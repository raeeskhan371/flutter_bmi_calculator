import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(bmiapp());
}

class bmiapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI APPLICATION",
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: bmiDash(),
    );
  }
}

class bmiDash extends StatefulWidget {
  @override
  State<bmiDash> createState() => _bmiDashState();
}

class _bmiDashState extends State<bmiDash> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var bgColor;


  var results = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI APPLICATION ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor:  Colors.deepPurpleAccent,
      ),

      body: Container( color:bgColor??Colors.deepPurple.shade200,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 40),),
                SizedBox(height: 15,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    labelText: "Enter Your  Weight(in KG )",
                    prefixIcon: Icon(
                      Icons.monitor_weight_outlined,
                      color: Colors.grey,
                    ),

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    labelText: "Enter Your  height(in ft)",
                    prefixIcon: Icon(
                      Icons.height,
                      color: Colors.grey,
                    ),

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    labelText: "Enter Your  height(in inch )",
                    prefixIcon: Icon(
                      Icons.height,
                      color: Colors.grey,
                    ),

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();
                  if(wt!="" && ft!="" && inch!=""){

                    //bmi caclculation

                    var iwt=int.parse(wt);
                    var ift=int.parse(ft);
                    var iInch=int.parse(inch);

                    var tInch=(ift*12)+iInch;
                    var tcm=tInch*2.54;
                    var tM=tcm/100;
                    var tBmi= iwt/(tM*tM);
                    var msg="";

                    if(tBmi>25){

                      msg="You are Over Weight";
                      bgColor = Colors.red;


                    }
                    else if(tBmi<18){
                      msg="You are Under Weight";
                      bgColor=Colors.yellowAccent;


                    } else{
                      msg="you Are Healthy";
                      bgColor=Colors.green;

                    }


                    setState(() {
                      results =
                          " $msg \n Your Bmi is : ${tBmi.toStringAsFixed(2)}";
                    });


                  }else {

                    setState(() {
                      results="Please fill all the required fields";
                    });
                  }

                }, child: Text("Calculated")),
                SizedBox(height: 10,),

                Text(results,style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
