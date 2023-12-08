import 'package:books_app/Core/injection_control.dart' as di;
import 'package:books_app/Data/Models/bookmodel.dart';
import 'package:books_app/Presentation/homepage.dart';
import 'package:books_app/Resources/Theme/theme_data.dart';
import 'package:books_app/Resources/routes_manager.dart';
import 'package:books_app/cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<BookCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: getApplicationtheme(false),
        home: BlocProvider(
          create: (context) => di.sl<BookCubit>(),
          child: const HomePage(),
        ),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.homeRoute,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {
      BlocProvider.of<BookCubit>(context).loadBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomePage()),
    );
  }
}
