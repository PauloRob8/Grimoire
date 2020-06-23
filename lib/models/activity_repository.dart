import 'package:GrimoireApp/models/activity.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

class ActivityRepository{
  final HasuraConnect _connection;

  ActivityRepository(this._connection);

  Stream<List<Activity>> listenActivities() async*{
    String docQuery = """
      query {
        activities(order_by: {date: desc}) {
          activity_time
          date
          description
          id
          name
        }
      }
    """;
    var snapshot = _connection.subscription(docQuery);
    var data;
    await for (data in snapshot){
      List activities = data['data']['activities'];
      yield ObservableList.of(activities?.map((value) => Activity.fromHasura(value)) ?? []);
    }

  }

  Future<void> addActivity(String name, String description,String activityTime, DateTime date) async {
    String addQuery = """
      mutation insert_activities(\$name: String!, \$date: timestamp, \$description: String!, \$activity_time: String!) {
        insert_activities(objects: [{name: \$name, date: \$date, activity_time: \$activity_time, description: \$description}]) {
          returning {
            id
            name
          }
        }
      }
    """;
    await _connection.mutation(addQuery,variables:{
      'name': name,
      'description': description,
      'date': date,
      'activity_time': activityTime,
    });
  }

}