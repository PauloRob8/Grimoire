// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ActivityStore on _ActivityBase, Store {
  final _$listActivitiesAtom = Atom(name: '_ActivityBase.listActivities');

  @override
  List<Activity> get listActivities {
    _$listActivitiesAtom.reportRead();
    return super.listActivities;
  }

  @override
  set listActivities(List<Activity> value) {
    _$listActivitiesAtom.reportWrite(value, super.listActivities, () {
      super.listActivities = value;
    });
  }

  @override
  String toString() {
    return '''
listActivities: ${listActivities}
    ''';
  }
}
