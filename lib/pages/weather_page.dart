import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  final Map<String, String> data = {
    'city': 'Bandung',
    'temp': '26°C',
    'humidity': '78%',
    'condition': 'Hujan ringan',
    'image': 'assets/weather_rain.gif'
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        Text('${data['city']}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Image.asset(data['image']!, height: 120),
        Text('${data['temp']}', style: TextStyle(fontSize: 22)),
        Text('Kelembapan: ${data['humidity']}'),
        SizedBox(height: 8),
        Card(child: ListTile(title: Text('Kondisi'), subtitle: Text(data['condition']!))),
      ]),
    );
  }
}
