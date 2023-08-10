import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_provider/pages/home_page.dart';
import 'package:weatherapp_provider/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
     create: (context) {
        return WeatherProvider();
      },
    child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ?  Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()  ,
     // brightness: Brightness.dark
      ),
      home: HomePage(),
    );
  }
}
