import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/sample_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SampleProvider()),
      ],
      child: MaterialApp(
        title: 'GroovePad',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF1a1a1a),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
