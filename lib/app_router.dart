import 'package:go_router/go_router.dart';

import 'pages/home_page.dart';
import 'pages/calc_equipment.dart';
import 'pages/vuelos.dart';
import 'pages/prioridad.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: '/calc-equip',
      builder: (_, __) => const CalcPage(),
    ),
    GoRoute(
      path: '/vuelos',
      builder: (_, __) => const VuelosPage(),
    ),
    GoRoute(
      path: '/prio',
      builder: (_, __) => const PrioridadPage(),
    ),/*
    GoRoute(
      path: '/tasas',
      builder: (_, __) => const TasasPage(),
    ),*/
  ],
);
