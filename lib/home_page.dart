import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:weather_app/forecast.dart';
import 'package:weather_app/information.dart';
import 'package:weather_app/secrets.dart';
import 'package:weather_app/theme/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getWeather() async {
    try {
      var response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey"));

      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return jsonData;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      return e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CupertinoSwitch(
              trackColor: Colors.grey.shade800.withOpacity(0.5),
              activeColor: Colors.grey.shade200.withOpacity(0.5),
              value: Provider.of<ThemeServices>(context).isDarkMode,
              onChanged: (val) =>
                  Provider.of<ThemeServices>(context, listen: false)
                      .toggleTheme(),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getWeather(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          final data = snapshot.data;
          double temp_1 = data["list"][0]["main"]["temp"];
          var icon = data["list"][0]["weather"][0]["main"];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: 250,
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  child: Card(
                    elevation: 5,
                    color: Colors.deepPurple,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "${(temp_1).toString()} °F",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Icon(
                          Icons.cloud,
                          size: 60,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          icon,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Weather Forecast",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      final forecastDate =
                          data["list"][index + 1]["dt_txt"].toString();
                      final forecast =
                          data["list"][index + 1]["main"]["temp"].toString();
                      return Forecast(
                          forecastDate: forecastDate, forecast: forecast);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Additional Information",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Information(
                        upper: "Humidity",
                        icon: Icons.water_drop,
                        lower: data["list"][0]["main"]["humidity"].toString()),
                    Information(
                        upper: "Wind Speed",
                        icon: Icons.air,
                        lower: data["list"][0]["wind"]["speed"].toString()),
                    Information(
                        upper: "Pressure",
                        icon: Icons.umbrella,
                        lower: data["list"][0]["main"]["pressure"].toString()),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
