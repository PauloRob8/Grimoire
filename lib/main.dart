import 'package:GrimoireApp/pages/activities/activites_page.dart';
import 'package:GrimoireApp/pages/activities/activities_store.dart';
import 'package:GrimoireApp/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  HasuraConnect connect;
  ActivityStore activityStore;

  @override
  void initState() {
    super.initState();
    connect = HasuraConnect('https://grimoire-application.herokuapp.com/v1/graphql');
    activityStore = ActivityStore(connect);    
    
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: DrawerUI(),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Grimoire"),
          bottom: TabBar(tabs: <Widget>[
            Tab(icon: Icon(Icons.event_note),),
            Tab(icon: Icon(FontAwesomeIcons.trophy),),
            Tab(icon: Icon(FontAwesomeIcons.scroll),)
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            ActivitiesPage(activityStore),
            Center(child:Text('nhaam')),
            Center(child:Text('nhaam'))
          ],
        ),
      ),
    );
  }
}
