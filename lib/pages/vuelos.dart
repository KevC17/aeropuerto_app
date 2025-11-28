import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VuelosPage extends StatefulWidget {
  const VuelosPage({super.key});

  @override
  State<VuelosPage> createState() => _VuelosPageState();
}

class _VuelosPageState extends State<VuelosPage> {
  String vuelosCountText = '';
  int vuelosCount = 0;
  String resultText = '';

  final List<TextEditingController> duracionControllers = [];

  void _generateVuelos() {
    final parsed = int.tryParse(vuelosCountText) ?? 0;

    if (parsed <= 0 || parsed > 8) {
      setState(() {
        resultText = 'Ingrese una cantidad de vuelos entre 1 y 8';
        vuelosCount = 0;
        duracionControllers.clear();
      });
      return;
    }

    vuelosCount = parsed;
    duracionControllers.clear();

    for (int i = 0; i < vuelosCount; i++) {
      duracionControllers.add(TextEditingController());
    }

    setState(() {
      resultText = 'Ingrese el tiempo para cada vuelo.';
    });
  }

  void _calculateTiempo(){
    if (vuelosCount == 0) {
      setState(() {
        resultText = 'Primero indique cuántos vuelos tiene y genere el formulario.';
      });
      return;
    }

    int totalTiempo = 0;
    final List<String> lines = [];

    for (int i = 0; i < vuelosCount; i++) {
      final tiempo = int.tryParse(
            duracionControllers[i].text.trim(),
          ) ??
          0;

      totalTiempo += tiempo;
      lines.add('- $tiempo minutos');
    }
    double promedio = totalTiempo / vuelosCount;

    setState(() {
      resultText =
        'Tiempos registrados registradas:\n'
        '${lines.join('\n')}\n\n'
        'Total de tiempo: $totalTiempo\n'
        'Tiempo promedio: $promedio';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan de viaje'),
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
                'Plan de Viaje',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de Vuelos',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  vuelosCountText = value;
                },
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _generateVuelos,
                child: const Text('Generar vuelos'),
              ),

              const SizedBox(height: 16),

              if (vuelosCount > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: vuelosCount,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: duracionControllers[index],
                                decoration: const InputDecoration(
                                  labelText: 'Tiempo',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: 16),
              if (vuelosCount > 0)
                ElevatedButton(
                  onPressed: _calculateTiempo,
                  child: const Text('Calcular tiempo total'),
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