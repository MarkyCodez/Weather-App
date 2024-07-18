import 'package:flutter/material.dart';

class Forecast extends StatelessWidget {
  final String forecastDate;
  final String forecast;
  const Forecast(
      {super.key, required this.forecastDate, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        elevation: 5,
        color: Colors.deepPurple,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20),
              child: Text(
                overflow: TextOverflow.clip,
                forecastDate,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            const Icon(
              Icons.cloud,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              forecast,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
