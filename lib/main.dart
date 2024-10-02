import 'package:app_random_numbers/app/core/dependency_injector/dependecy_injector.dart';
import 'package:app_random_numbers/app/core/themes/theme_config.dart';
import 'package:app_random_numbers/app/ui/home/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  DependecyInjector.start();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeConfig.theme,
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tela Inicial'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('Bem-vindo à Tela Inicial!'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/second');
//               },
//               child: const Text('Ir para a Segunda Tela'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/third');
//               },
//               child: const Text('Ir para a Terceira Tela'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Segunda Tela'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('Esta é a Segunda Tela!'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context); // Volta para a Tela Inicial
//               },
//               child: const Text('Voltar para a Tela Inicial'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ThirdScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Terceira Tela'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('Esta é a Terceira Tela!'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context); // Volta para a Tela Inicial
//               },
//               child: const Text('Voltar para a Tela Inicial'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
