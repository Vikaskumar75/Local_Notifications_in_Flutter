import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'statistics_page.dart';

class AppBarActionButton extends StatelessWidget {
  const AppBarActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => StatisticPage()),
        );
      },
      icon: const FaIcon(
        FontAwesomeIcons.solidChartBar,
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        FaIcon(FontAwesomeIcons.seedling),
        Text('Green Thumbs'),
      ],
    );
  }
}

class PlantImage extends StatelessWidget {
  const PlantImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/plant.png',
      height: MediaQuery.of(context).size.height * 0.5,
    );
  }
}

class HomeButtons extends StatelessWidget {
  const HomeButtons({
    Key? key,
    this.onPressedOne,
    this.onPressedTwo,
    this.onPressedThree,
  }) : super(key: key);
  final Future<void> Function()? onPressedOne;
  final Future<void> Function()? onPressedTwo;
  final Future<void> Function()? onPressedThree;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          onPressed: onPressedOne,
          icon: FontAwesomeIcons.dollarSign,
          buttonText: 'Plant Food',
        ),
        CustomButton(
          onPressed: onPressedTwo,
          icon: FontAwesomeIcons.tint,
          buttonText: 'Water',
        ),
        CustomButton(
          onPressed: onPressedThree,
          icon: FontAwesomeIcons.solidTimesCircle,
          buttonText: 'Cancel',
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.buttonText,
  }) : super(key: key);

  final Future<void> Function()? onPressed;
  final IconData icon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.teal[600],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            size: 14,
            color: Colors.teal[50],
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            buttonText,
            style: TextStyle(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}

class DummyStatistics extends StatelessWidget {
  const DummyStatistics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: const Text(
        'Dummy Statistics',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
