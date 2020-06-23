



import 'dart:async';

import 'package:GrimoireApp/models/activity.dart';
import 'package:GrimoireApp/models/activity_repository.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

part 'activities_store.g.dart';

class ActivityStore = _ActivityBase with _$ActivityStore;

abstract class _ActivityBase with Store {
  final HasuraConnect _connection;
  StreamSubscription activities;
  ActivityRepository _activityRepository;

  @observable
  List<Activity> listActivities = ObservableList.of([]);

  _ActivityBase(this._connection){
    _activityRepository = ActivityRepository(_connection);
    _listenActivities();
  }


  void _listenActivities(){
    activities = _activityRepository.listenActivities().listen((data) { 
      listActivities = data;
    });
  }

  void addActivity(String name, String description, String time, DateTime date){
    _activityRepository.addActivity(name, description, time, date);
  }

  void dispose(){
    activities.cancel();
  }

}