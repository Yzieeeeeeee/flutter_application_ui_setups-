import 'package:flutter/material.dart';
import 'package:tisser_application_test/models/location.dart';
import 'package:tisser_application_test/screens/mountain_screen.dart';
import 'package:tisser_application_test/themes/colors.dart';
import 'package:tisser_application_test/widgets/current_weather.dart';
import 'package:tisser_application_test/widgets/hourly_forcast.dart';
import 'package:tisser_application_test/widgets/location_card.dart';
import 'package:tisser_application_test/widgets/weather_stat.dart';
import 'package:tisser_application_test/widgets/weather_top_bar.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeatherColors.panel,
      body: Stack(
        children: [
          // sky background
          Container(
            height: 480,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [WeatherColors.skyTop, WeatherColors.skyBottom],
              ),
            ),
            child: Opacity(
              opacity: 0.55,
              child: Image.network(
                'https://images.unsplash.com/photo-1534088568595-a066f410bcda?w=900',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox(),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
                  child: Column(
                    children: const [
                      WeatherTopBar(),
                      SizedBox(height: 26),
                      CurrentWeather(),
                      SizedBox(height: 22),
                      WeatherStatsRow(),
                      SizedBox(height: 22),
                      HourlyForecast(),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Container(
                  padding: const EdgeInsets.fromLTRB(14, 16, 14, 30),
                  decoration: const BoxDecoration(
                    color: WeatherColors.panel,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      for (final l in sampleLocation) ...[
                        LocationCard(data: l,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const MountainScreen()));
                        },),
                        const SizedBox(height: 14),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
