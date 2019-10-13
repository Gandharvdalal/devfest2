import 'package:devfest_demo/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'index.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;
  @override
  void initState(){
    super.initState();
    setupApp();
  }


  setupApp(){
    configBloc=ConfigBloc();         //here we are creating the object for the first time 
   //after the above the object is going to be same thats why we are using singleton

   //now we want to check if our prefrance (dark mode )is on or not
   //if not we are going to set the boolean value to false

   configBloc.darkModeOn=Devfest.prefs.getBool(Devfest.darkModePref)?? false;

  }



  @override
  Widget build(BuildContext context) {
    //when ever we are using block pattern or flutter we have to use blocprovider
    //its an inherited widget
    return BlocProvider(
      builder: (context)=>configBloc,
      child: BlocBuilder<ConfigBloc,ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Google Devfest',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              //* Custom Google Font
              fontFamily: Devfest.google_sans_family,
              primarySwatch: Colors.red,
              primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  configBloc.darkModeOn ? Colors.black : Colors.grey[50],
              brightness:
                  configBloc.darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: configBloc.darkModeOn
                      ? ColorScheme.dark()
                      : ColorScheme.light()),
              appBarTheme: AppBarTheme(
                elevation: 0.0,
              ),
            ),
            home: Scaffold(
              appBar: AppBar(),
              body: Container(),
            ),
          );
        },
      ),
    );
  }
}