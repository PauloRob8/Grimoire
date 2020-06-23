import 'package:GrimoireApp/pages/activities/activities_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ActivitiesPage extends StatelessWidget{

 final ActivityStore activityStore;

 ActivitiesPage(this.activityStore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Observer(
          builder: (_){
            return activityStore.listActivities.length > 0 ? 
            ListView.builder(
              itemCount: activityStore.listActivities.length,
              itemBuilder: (_, index){
                return Card(
                  color: Colors.orange,
                  elevation: 2,
                  child: ListTile(
                    title: Text(activityStore.listActivities[index].name),
                    subtitle: Text(activityStore.listActivities[index].description),
                  ),
                );
              },
            ): Center(
              child: Text("Você ainda não possui nenhuma atividade"),
            );
          },
        )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print(activityStore.listActivities.length);
        }
      ),
    );
  }
}