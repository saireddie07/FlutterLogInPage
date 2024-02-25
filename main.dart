import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LogIn Page",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal,brightness: Brightness.light)
      ),
      home: LogInPage(),
    );
  }
}
class LogInPage extends StatefulWidget{
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> with SingleTickerProviderStateMixin{
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;
  @override
  void initState(){
    super.initState();
    _iconAnimationController=AnimationController(vsync: this,
    duration: Duration(microseconds: 500)
    );
    _iconAnimation= CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut);

    _iconAnimation.addListener(()=> this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(image: AssetImage("assets/background.PNG"),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: _iconAnimation.value * 150,
              ),
              Form(
                child: Theme(data: ThemeData(
                  brightness: Brightness.dark,
                  primaryColor: Colors.teal,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0)
                    )
                  ),
              child:Container(
                padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text("Enter Email")
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text("Enter Password")
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true
                    ,
                  ),
                  Padding(padding: EdgeInsets.only(top:20),
                  ),
                  MaterialButton(onPressed: (){},
                    height: 40.0,
                    minWidth: 100.0,
                  color: Colors.teal,
                  child: Text("Log In"),
                  splashColor: Colors.redAccent,
                  )
                ])
              )
              )
            ,
                  )
                  ]
          )
        ],
      ),
    );
  }
}

