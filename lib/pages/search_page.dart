import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_provider/models/weather_model.dart';
import 'package:weatherapp_provider/providers/weather_provider.dart';
import 'package:weatherapp_provider/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({super.key, this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data)
            {
               cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              WeatherService service = WeatherService();

              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                           Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: const Text('search'),
              suffixIcon: GestureDetector(
                
                onTap : () async 
                {
                    WeatherService service = WeatherService();

              WeatherModel? weather =
            await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                           Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

              Navigator.pop(context);
                },
                child: const Icon(Icons.search)),
              border: const OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}

