import 'package:flutter/material.dart';
import 'package:flutter_application/blocs/download_pdf_bloc.dart';
import 'package:flutter_application/views/screens/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => DownloadPdfBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}