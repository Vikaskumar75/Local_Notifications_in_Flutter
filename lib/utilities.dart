import 'package:flutter/material.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime {
  NotificationWeekAndTime({
    required this.dayOfTheWeek,
    required this.timeOfDay,
  });
  final int dayOfTheWeek;
  final TimeOfDay timeOfDay;
}

Future<NotificationWeekAndTime?> pickSchedule(BuildContext context) async {
  List<String> weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  int? selectedDay;
  TimeOfDay? timeOfDay;

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          'I want to be reminded every:',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        content: Wrap(
          alignment: WrapAlignment.center,
          spacing: 3,
          children: List<Widget>.generate(weekDays.length, (index) {
            return ElevatedButton(
              onPressed: () {
                selectedDay = index + 1;
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.teal,
                ),
              ),
              child: Text(weekDays[index]),
            );
          }),
        ),
      );
    },
  );

  if (selectedDay != null) {
    timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        DateTime.now().add(
          Duration(minutes: 1),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Colors.teal,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  if (timeOfDay != null) {
    return NotificationWeekAndTime(
      dayOfTheWeek: selectedDay!,
      timeOfDay: timeOfDay,
    );
  }

  return null;
}


