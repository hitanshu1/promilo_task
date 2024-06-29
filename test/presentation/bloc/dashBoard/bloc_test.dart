    // Emitting ChangeTabDashBoardEvent updates the state with the correct pageIndex
import 'package:bloc_test/bloc_test.dart';
import 'package:promilo_task/presentation/bloc/dashboard/bloc.dart';
import 'package:promilo_task/presentation/bloc/dashboard/event.dart';
import 'package:promilo_task/presentation/bloc/dashboard/state.dart';


void main() {
  blocTest<DashBoardBloc, DashBoardState>(
    'emitting_change_tab_dashboard_event_updates_state_with_correct_page_index',
    build: () => DashBoardBloc(),
    act: (bloc) => bloc.add(const ChangeTabDashBoardEvent(1)),
    expect: () => [const DashBoardState(pageIndex: 1)],
  );
}
