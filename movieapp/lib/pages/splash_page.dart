import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/model/app_config.dart';
import 'package:movieapp/services/http_service.dart';
import 'package:movieapp/services/movie_service.dart';

class SplashPage extends StatefulWidget{
  final VoidCallback onInitialComplete;
  
  const SplashPage({Key? key,required this.onInitialComplete}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class  _SplashPageState extends State<SplashPage>{

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) => _setup(context).then((_) => widget.onInitialComplete()));
  }

  Future<void> _setup(BuildContext _context) async{
    final getIt=GetIt.instance;

    final configFile=await rootBundle.loadString("assets/config/main.json");
    final configData=jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(
      AppConfig(
        API_KEY: configData["API_KEY"], 
        BASE_API_URL: configData["BASE_API_URL"], 
        BASE_IMAGE_API_URL: configData["BASE_IMAGE_API_URL"]
      )
    );

    getIt.registerSingleton<HttpService>(HttpService());
    getIt.registerSingleton<MovieService>(MovieService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MovieShow",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          height: 600,
          width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/msLogo.png")
            ),
            //color: Colors.white
          ),
          //color: Colors.white,
        ),
      ),
    );
  }
}