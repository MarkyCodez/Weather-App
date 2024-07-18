import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final String upper;
  final IconData icon;
  final String lower;
  const Information(
      {super.key,
      required this.upper,
      required this.icon,
      required this.lower});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 125,
      child: Card(
        color: Colors.deepPurple,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                upper,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 35,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                lower,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
