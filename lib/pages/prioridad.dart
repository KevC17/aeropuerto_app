import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrioridadPage extends StatefulWidget {
  const PrioridadPage({super.key});

  @override
  State<PrioridadPage> createState() => _PrioridadPageState();
}

class _PrioridadPageState extends State<PrioridadPage> {
  String pasajero = 'Adulto mayor';
  String boleto = 'Economico';
  String resultText = '';

  void _calcPrio() {
    if (boleto == 'Ejecutiva' || pasajero == 'Adulto mayor') {
      setState(() {
        resultText = 'Alta';
      });
      return;
    } else if (pasajero == 'Familia con niños') {
      setState(() {
        resultText = 'Media';
      });
      return;
    } else {
      setState(() {
        resultText = 'Baja';
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prioridad de embarque'),
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
              const Text(
                'Prioridad de Embarque',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),
              const Text('Tipo de pasajero'),
              DropdownButton<String>(
                value: pasajero,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Adulto mayor',
                    child: Text('Adulto mayor'),
                  ),
                  DropdownMenuItem(
                    value: 'Familia con niños',
                    child: Text('Familia con niños'),
                  ),
                  DropdownMenuItem(
                    value: 'Pasajero regular',
                    child: Text('Pasajero regular'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    pasajero = value;
                  });
                },
              ),
              
              const Text('Tipo de boleto'),
              DropdownButton<String>(
                value: boleto,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Economico',
                    child: Text('Económico'),
                  ),
                  DropdownMenuItem(
                    value: 'Ejecutiva',
                    child: Text('Ejecutiva'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    boleto = value;
                  });
                },
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _calcPrio,
                child: const Text('Calcular prioridad'),
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