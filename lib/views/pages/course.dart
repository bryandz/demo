import 'package:demo_project/data/classes/Album.dart';
import 'package:demo_project/views/widgets/container.dart';
import 'package:demo_project/views/widgets/hero.dart';
import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<Album> getData() async {
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    );

    if (response.statusCode == 200) {
      return Album.fromJson(
        convert.jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(future: getData(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting  ) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          Album? album = snapshot.data;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [HeroWidget(title: 'Flutter Mapp'),
                ContainerWidget(title: album?.title ?? '',
                    description: '${(album?.id ?? 1)}')
              ]),
            ),
          );
        } else {
          return Center(
            child: Text('Error'),
          );
        }
      },),
    );
  }
}
