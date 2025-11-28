import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const AeropuertoApp());
}

class AeropuertoApp extends StatelessWidget {
  const AeropuertoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aeropuerto Inteligente',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
