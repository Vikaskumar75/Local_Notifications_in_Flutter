import 'package:flutter/material.dart';
import 'widgets.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            PlantImage(),
            SizedBox(height: 24),
            DummyStatistics(),
          ],
        ),
      ),
    );
  }
}
