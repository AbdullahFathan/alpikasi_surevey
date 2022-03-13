import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuisoner_app/cubit/cubit/auth_cubit.dart';
import 'package:kuisoner_app/cubit/cubit/kriteriadomisili_cubit.dart';
import 'package:kuisoner_app/screen/login.dart';
import 'package:kuisoner_app/services/auth_services.dart';
import 'package:kuisoner_app/screen/tambahkuisoner.dart';
import 'package:kuisoner_app/services/kriteria_domisili.dart';
import 'package:kuisoner_app/widget/bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(AuthServices())..checkAuth()),
        BlocProvider(create: (_) => KriteriadomisiliCubit(KriteriaDomisili()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated || state is AuthSuccess)
                return CustomBottomNavBar();
              else if (state is AuthLoading)
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              else
                return LoginScreen();
            },
          )),
    );
  }
}
