import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aeropuerto Inteligente')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenido a la app del aeropuerto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => context.go('/calc-equip'),
              child: const Text('Calculadora de Equipaje'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/vuelos'),
              child: const Text('Plan de vuelos'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/prio'),
              child: const Text('Prioridad de embarque'),
            ),/*
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/tasas'),
              child: const Text('Tasas de embarque'),
            ),*/
          ],
        ),
      ),
    );
  }
}
