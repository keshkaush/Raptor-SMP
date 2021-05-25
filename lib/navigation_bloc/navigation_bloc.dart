import 'package:bloc/bloc.dart';
import 'package:smp_app/sidebar/pages/historical_data_analysis.dart';
import 'package:smp_app/sidebar/pages/json_reports.dart';
import 'package:smp_app/sidebar/pages/online_news.dart';
import 'package:smp_app/sidebar/pages/people_comments.dart';
import 'package:smp_app/sidebar/pages/present_data_analysis.dart';

enum NavigationEvents {
  PresentAnalyticsClickedEvent,
  HistoricalAnalyticsClickedEvent,
  CommentsAnalyticsClickedEvent,
  MyNewsClickedEvent,
  MyJSONClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => JSONReports();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.MyJSONClickedEvent:
        yield JSONReports();
        break;
      case NavigationEvents.PresentAnalyticsClickedEvent:
        yield PresentData();
        break;
      case NavigationEvents.HistoricalAnalyticsClickedEvent:
        yield Overview();
        break;
      case NavigationEvents.CommentsAnalyticsClickedEvent:
        yield PeopleComments();
        break;
      case NavigationEvents.MyNewsClickedEvent:
        yield NewsEvents();
        break;
    }
  }
}
