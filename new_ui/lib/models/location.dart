class LocationModel{

  final String name;
  final String place;
  final String temperature;
  final String wind;
  final String humidity;
  final String routes;
  final String distance;

  const LocationModel({

required this.name,
required this.place,
required this.temperature,
required this.wind,
required this.humidity,
required this.routes,
required this.distance
  });
}

const sampleLocation=[
LocationModel(name: "Mount Everest", 
place: "Himalayas, India",
 temperature: "-20",
  wind: "4 m/s",
  humidity: "87%",
  routes: "5", distance: "34"),

LocationModel(name: "Kuttanad",
 place: "Alappuzha, Kerala",
  temperature: "-5 C", wind: "8 m/s",
   humidity: "65%",
    routes: "7", 
    distance: "52",),
];