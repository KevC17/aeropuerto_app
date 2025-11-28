import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  String peso = '';
  String limite = '';
  String resultText = '';

  void calcular(){
    final peso_d = double.tryParse(peso) ?? 0.0;
    final limite_d = double.tryParse(limite) ?? 0.0;
    final diff = peso_d - limite_d;

    if (diff >= 0){
      setState(() {
        resultText = 'Aprobado: Peso dentro del límite';
      });
      return;
    } else{
      setState(() {
        resultText = 'No Aprobado: Peso fuera del límite';
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculo de equipaje'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/avion.jpg',
                    fit: BoxFit.cover,
                    width: 16,
                  ),
                ),
              ),
              const Text(
                'Calculadora de equipaje',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                    border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                    peso = value;
                },
              ),
              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                    labelText: 'Límite de Peso (kg)',
                    border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                    limite = value;
                },
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calcular,
                child: const Text('Verificar equipaje'),
              ),

              const SizedBox(height: 16),
              Text(resultText),
            ],
          ),
        ),
      ),
    );
  }
}
