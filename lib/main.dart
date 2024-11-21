import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomacare/presentation/auth/bloc/auth_bloc.dart';
import 'package:tomacare/presentation/auth/page/register.dart';
import 'package:tomacare/presentation/comunity/bloc/comunity_bloc.dart';
import 'package:tomacare/presentation/comunity/page/community_page.dart';
import 'package:tomacare/presentation/page/home_page.dart';
import 'package:tomacare/presentation/plants/pages/plant.dart';
import 'package:tomacare/presentation/splashscreen.dart';
// import 'package:tomacare/presentation/page/home_page.dart';
import 'presentation/auth/page/login.dart';
// import 'presentation/page/register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        routes: {
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => BlocProvider(
                create: (context) => ComunityBloc(),
                child: CommunityPage(),
              ),
          '/': (context) => Splashscreen(),
        },
      ),
    ),
  );
}
