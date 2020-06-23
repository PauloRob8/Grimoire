class Activity{
  String name;
  String description;
  DateTime date;
  String activityTime;
  String id;

  Activity({
    this.name,
    this.description,
    this.date,
    this.activityTime,
    this.id,
  });

  factory Activity.fromHasura(value){
    return Activity(
      id: value['id'],
      activityTime: value['activity_time'],
      date: DateTime.parse(value['date']),
      name: value['name'],
      description: value['description'],
    );
  }
}