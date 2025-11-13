import 'package:flutter/material.dart';
import 'dart:async';
import './pages/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Mobile App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Setelah 5 detik pindah ke Dashboard
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => DashboardPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // ambil ukuran layar agar elemen responsif
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( 
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Text(
                  'Aplikasi Mobile UTS',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08, 
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: screenWidth * 0.18, 
                  backgroundImage: const AssetImage('assets/images/profile.jpeg'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Nama: Ahmad Fauzan',
                  style: TextStyle(fontSize: screenWidth * 0.05),
                ),
                Text(
                  'NIM: 152024601',
                  style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.grey[700]),
                ),
                const SizedBox(height: 40),
                const CircularProgressIndicator(),
                SizedBox(height: screenHeight * 0.1),
                Text(
                  'Loading...',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
