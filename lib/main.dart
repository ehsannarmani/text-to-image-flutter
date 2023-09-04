import 'package:asmr_text_to_image_ai/di.dart';
import 'package:asmr_text_to_image_ai/presentation/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/bloc/app_bloc.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  // setup get it
  setup();

  runApp(MultiBlocProvider(
    child: const MyApp(),
    providers: [
      BlocProvider(create: (_)=>locator<AppBloc>())
    ],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

