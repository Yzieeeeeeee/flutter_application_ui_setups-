import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.cloudy_snowing, size: 76, color: Colors.white),
        const SizedBox(width: 14),
        const Text('-8°',
            style: TextStyle(
                color: Colors.white,
                fontSize: 46,
                fontWeight: FontWeight.w600)),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("It's Cloudy Day",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Flexible(
                    child: Text('Monday, 20 Oct 8:30AM',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.refresh,
                      size: 12, color: Colors.white.withOpacity(0.9)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
