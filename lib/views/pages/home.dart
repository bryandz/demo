import 'package:demo_project/views/pages/course.dart';
import 'package:demo_project/views/widgets/container.dart';
import 'package:demo_project/views/widgets/hero.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: 'Login', nextPage: CoursePage(),),
            Gap(20),
            ...List.generate(5, (index) {
              return ContainerWidget(
                title: 'Basic Layout',
                description: 'This is a description demo',
              );
            }),
          ],
        ),
      ),
    );
  }
}
