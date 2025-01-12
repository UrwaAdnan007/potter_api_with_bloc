import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potter_api_bloc/potter_bloc/potter_bloc.dart';
import 'package:potter_api_bloc/service/potter_api_service.dart';
import 'package:potter_api_bloc/ui/potter_ui_page..dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => PotterBloc(ApiService()),
        child: const PotterUIPage(),
      ),
    );
  }
}
