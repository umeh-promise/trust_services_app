import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_services_app/features/auth/presentation/cubit/auth_cubit.dart';

class HomeScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (ctx) => HomeScreen());
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(Icons.logout_outlined),
            onTap: () => context.read<AuthCubit>().logout(),
          ),
        ],
      ),
      body: Center(child: Text('Logged In')),
    );
  }
}
