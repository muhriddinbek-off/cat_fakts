import 'package:cat_fakts/bloc/cats_random/cat_fakts_random_bloc.dart';
import 'package:cat_fakts/bloc/detail/detail_bloc.dart';
import 'package:cat_fakts/models/data/provider/cats_provider.dart';
import 'package:cat_fakts/models/data/repository/cats_repository.dart';
import 'package:cat_fakts/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => CatsRepository(
      CatsProvider(),
    ),
    child: MultiBlocProvider(providers: [
      BlocProvider(create: (context) => CatFaktsRandomBloc(context.read<CatsRepository>())),
      BlocProvider(create: (context) => DetailBloc(context.read<CatsRepository>())),
    ], child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
