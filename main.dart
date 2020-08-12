import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:http/http.dart'as http;

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}




class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var data;
  String x;
  web(i) async {
  var url = "http://192.168.29.26/cgi-bin/web.py?x=$i";
  var r =  await http.get(url);
  
  setState(() {
     data = r.body;
  });
  
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Icon(Icons.monetization_on , size:28),
          Text("  "),        ],
        backgroundColor: Colors.green.shade800,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          
          child: Stack(
            children: <Widget>[
              Container(
                height: 775,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/salarypred.png"),
                ),
              ),
               
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(""),
                   Text(""),
                   Text(""),
                    Text(""),
                    Text(""),
                    Center(
                    child: Text(
                      "Enter Years of Experience? : ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,

                      ),
                    ),
                  ),
                    TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value){
                       x = value;
                        
                      },
                    ),
                    FlatButton(
                      color: Colors.green.shade800,
                      onPressed: (){
                        web(x);
                      },
                      child: Text("Predict"),
                    ),
                    Text(data ?? "Output will display here",style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold,backgroundColor:Colors.amber),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
