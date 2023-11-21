import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/68258601?v=4",
                      ),
                      radius: 25,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'MONDAY 16',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'TODAY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      '·',
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    for (var i = 17; i < 21; i++)
                      Text(
                        '$i',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                          fontSize: 36,
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const ScheduleCard(
                  startHour: '11',
                  startMinute: '30',
                  endHour: '12',
                  endMinute: '20',
                  detail: 'DESIGN\nMEETING',
                  people: ['ALEX', 'HELENA', 'NANA'],
                  backgroundColor: Colors.yellow,
                ),
                const SizedBox(
                  height: 10,
                ),
                const ScheduleCard(
                  startHour: '12',
                  startMinute: '35',
                  endHour: '14',
                  endMinute: '10',
                  detail: 'DAILY\nPROJECT',
                  people: ['ME', 'RICHARD', 'CIRY', '+4'],
                  backgroundColor: Colors.purple,
                ),
                const SizedBox(
                  height: 10,
                ),
                const ScheduleCard(
                  startHour: '15',
                  startMinute: '00',
                  endHour: '16',
                  endMinute: '30',
                  detail: 'WEEKLY\nPLANNING',
                  people: ['DEN', 'NANA', 'MARK'],
                  backgroundColor: Colors.limeAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String startHour, startMinute, endHour, endMinute, detail;
  final Color backgroundColor;
  final List people;

  final _blackColor = const Color(0xFF1F2123);

  const ScheduleCard({
    super.key,
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
    required this.detail,
    required this.people,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      startHour,
                      style: TextStyle(
                        color: _blackColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      startMinute,
                      style: TextStyle(
                        color: _blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 36,
                      width: 1.5,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      color: _blackColor,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      endHour,
                      style: TextStyle(
                        color: _blackColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      endMinute,
                      style: TextStyle(
                        color: _blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  detail,
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                for (var p in people) ...{
                  Text(
                    p,
                    style: TextStyle(
                      color: p == 'ME'
                          ? Colors.black
                          : Colors.black.withOpacity(0.5),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                }
              ],
            )
          ],
        ),
      ),
    );
  }
}
