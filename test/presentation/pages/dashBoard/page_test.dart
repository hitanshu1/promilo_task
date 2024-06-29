
    // DashBoardPage renders correctly with all UI components
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:promilo_task/presentation/bloc/dashboard/bloc.dart';
import 'package:promilo_task/presentation/pages/dashBoard/bottomNavigationBar.dart';
import 'package:promilo_task/presentation/pages/dashBoard/home/homeTab.dart';
import 'package:promilo_task/presentation/pages/dashBoard/page.dart';


class MockDashBoardBloc extends Mock implements DashBoardBloc {}

void main() {
  testWidgets('dashboard_page_renders_correctly', (WidgetTester tester) async {
    final mockDashBoardBloc = MockDashBoardBloc();

    await tester.pumpWidget(
     ScreenUtilInit(
         
        child: MaterialApp(
          home: BlocProvider<DashBoardBloc>(
            create: (_) => mockDashBoardBloc,
            child: const DashBoardPage(),
          ),
        ),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Individual Meetup'), findsOneWidget);
    expect(find.byType(HomeTab), findsOneWidget);
    expect(find.byType(DashBoardNavigationBar), findsOneWidget);
  });
}
