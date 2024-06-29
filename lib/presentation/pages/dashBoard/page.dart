import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/dashboard/bloc.dart';
import '../../bloc/login/bloc.dart';
import '../../bloc/login/event.dart';
import 'bottomNavigationBar.dart';
import 'home/homeTab.dart';

/// dash board page
class DashBoardPage extends StatelessWidget {
  /// constructor
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashBoardBloc>(
        create: (_) => DashBoardBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Individual Meetup',
            ),
            actions: [IconButton(onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
  
            },
             icon: const Icon(Icons.logout))],
          ),
          body: _body(),
          bottomNavigationBar: const DashBoardNavigationBar(),
        ));
  }

  Widget _body() {
    return const HomeTab();
  }
}
