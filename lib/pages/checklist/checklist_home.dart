import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChecklistHome extends StatelessWidget {
  const ChecklistHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checklist'),
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Checklist')),
            ElevatedButton(onPressed: () {}, child: const Text('Checklist')),
            ElevatedButton(onPressed: () {}, child: const Text('Checklist')),
          ],
        ));
  }
}
