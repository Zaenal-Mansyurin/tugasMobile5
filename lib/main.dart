import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DaduPage(),
    );
  }
}

class DaduPage extends StatefulWidget {
  const DaduPage({super.key});

  @override
  State<DaduPage> createState() => _DaduPageState();
}

class _DaduPageState extends State<DaduPage> {
  int nilaiDaduPertama = 1;
  int nilaiDaduKedua = 2;
  
  void acakDadu() {
    final random = Random();
    setState(() {
      nilaiDaduPertama = random.nextInt(6) + 1;
      nilaiDaduKedua = random.nextInt(6) + 1;
    });
  }

  // Fungsi untuk membuat titik dadu dengan posisi yang diperbaiki
  List<Widget> buatTitikDadu(int nilai) {
    switch (nilai) {
      case 1:
        return [
          const Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(child: DotDadu()),
          ),
        ];
      case 2:
        return [
          const Positioned(top: 20, right: 20, child: DotDadu()),
          const Positioned(bottom: 20, left: 20, child: DotDadu()),
        ];
      case 3:
        return [
          const Positioned(top: 20, right: 20, child: DotDadu()),
          const Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(child: DotDadu()),
          ),
          const Positioned(bottom: 20, left: 20, child: DotDadu()),
        ];
      case 4:
        return [
          const Positioned(top: 20, left: 20, child: DotDadu()),
          const Positioned(top: 20, right: 20, child: DotDadu()),
          const Positioned(bottom: 20, left: 20, child: DotDadu()),
          const Positioned(bottom: 20, right: 20, child: DotDadu()),
        ];
      case 5:
        return [
          const Positioned(top: 20, left: 20, child: DotDadu()),
          const Positioned(top: 20, right: 20, child: DotDadu()),
          const Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(child: DotDadu()),
          ),
          const Positioned(bottom: 20, left: 20, child: DotDadu()),
          const Positioned(bottom: 20, right: 20, child: DotDadu()),
        ];
      case 6:
        return [
          const Positioned(top: 20, left: 20, child: DotDadu()),
          const Positioned(top: 20, right: 20, child: DotDadu()),
          const Positioned(
            top: 0,
            bottom: 0,
            left: 20,
            child: Center(child: DotDadu()),
          ),
          const Positioned(
            top: 0,
            bottom: 0,
            right: 20,
            child: Center(child: DotDadu()),
          ),
          const Positioned(bottom: 20, left: 20, child: DotDadu()),
          const Positioned(bottom: 20, right: 20, child: DotDadu()),
        ];
      default:
        return [
          const Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(child: DotDadu()),
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Acak Dadu',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        backgroundColor: const Color.fromARGB(255, 117, 184, 120),
        actions: const [],
      ),
      backgroundColor: const Color.fromARGB(255, 5, 128, 210),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Dadu pertama
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: buatTitikDadu(nilaiDaduPertama),
                ),
              ),
              // Dadu kedua
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: buatTitikDadu(nilaiDaduKedua),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: acakDadu,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Acak Dadu',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget terpisah untuk titik dadu
class DotDadu extends StatelessWidget {
  const DotDadu({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.black,
    );
  }
}