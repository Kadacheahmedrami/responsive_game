import 'package:flutter/material.dart';
bool show=false;
bool condition=false;
late double S=300;
double old_value= 300 ;
late num height;
late num weidth;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
final WI = MediaQuery.of(context).size.width;
final HE = MediaQuery.of(context).size.height;
height = HE.toInt();
weidth = WI.toInt();

//S=((height+weidth)/4);

    return Scaffold(

      body:Center(
        child :

            game(),

        )





    );
  }
}
class game extends StatefulWidget {



  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {




  @override
  Widget build(BuildContext context) {
    if (!condition) {
      return Ink(
          color: Colors.deepPurple,
        child:   InkWell(
          splashColor: Colors.grey,
          onTap: (){
            setState(() {
              S = S + 1;

              if (S >= height || S >= weidth)
              {
                condition = true;
              }
              else if (S >= height-20 || S >= weidth-20)
              {
                S=old_value;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // Return an AlertDialog widget
                    return AlertDialog(
                      title: Text("Brute force won't help you."),
                      content: Text(
                          'try a diffrent way'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
if(!show)
              {
                show=!show;
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // Return an AlertDialog widget
                  return AlertDialog(
                    title: Text('how to win'),
                    content: Text(
                        'you win by making the box touch the edge of the web browser'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
            });
          },
          child : Container(
              height: S,
              width: S ,

              child: Center(
                child :
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text("click me ",style: TextStyle(fontSize: S/6 ,color: Colors.white),),
                  SizedBox(height: S/3.5,),
                  Text("Box size : ${S}",style: TextStyle(color: Colors.red,fontSize: S/14),)
                  ],


                ),
              )
          ),
        )

      );
    } else {
      return Center(
        child: Text('you won', style: TextStyle(color: Colors.amber,fontSize: 50),),
      );
    }
  }
}