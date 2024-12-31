import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FA),

      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Report',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCard(
                title: "Today's Report",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildReportItem('5', 'Total'),
                    buildReportItem('3', 'Taken'),
                    buildReportItem('1', 'Missed'),
                    buildReportItem('1', 'Snoozed'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              buildCard(
                title: "Check Dashboard",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Here you will find everything related to your active and past medicines.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 60,
                      height: 60,
                      child: CustomPaint(
                        painter: MultiColorCirclePainter(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Check History Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Check History',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xff6f8bef),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  final days = [
                    'Sun',
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat'
                  ];
                  return Column(
                    children: [
                      Text(
                        days[index],
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor:
                            index == 0 ? Color(0xff6f8bef) : Colors.grey[200],
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: index == 0 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(height: 16),
              // Morning Medicines Section
              buildTimeSection('Morning 08:00 am', [
                buildMedicineCard(
                  icon: Icons.local_drink,
                  iconColor: Colors.purple[100]!,
                  medicineName: 'Calpol 500mg Tablet',
                  timing: 'Before Breakfast',
                  day: 'Day 01',
                  statusIcon: Icons.notifications_none_rounded,
                  statusColor: Colors.green,
                  statusText: 'Taken',
                ),
                buildMedicineCard(
                  icon: Icons.tablet,
                  iconColor: Colors.pink[100]!,
                  medicineName: 'Calpol 500mg Tablet',
                  timing: 'Before Breakfast',
                  day: 'Day 27',
                  statusIcon: Icons.notifications_none_rounded,
                  statusColor: Colors.red,
                  statusText: 'Missed',
                ),
              ]),
              // Afternoon Medicines Section
              buildTimeSection('Afternoon 02:00 pm', [
                buildMedicineCard(
                  icon: Icons.water_drop,
                  iconColor: Colors.blue[100]!,
                  medicineName: 'Calpol 500mg Tablet',
                  timing: 'After Food',
                  day: 'Day 01',
                  statusIcon: Icons.notifications_paused,
                  statusColor: Colors.orange,
                  statusText: 'Snoozed',
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  Widget buildReportItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff6f8bef),
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget buildTimeSection(String time, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Column(children: cards),
        SizedBox(height: 16),
      ],
    );
  }

  Widget buildMedicineCard({
    required IconData icon,
    required Color iconColor,
    required String medicineName,
    required String timing,
    required String day,
    required IconData statusIcon,
    required Color statusColor,
    required String statusText,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicineName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        timing,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        day,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                statusIcon,
                color: statusColor,
              ),
              SizedBox(height: 4),
              Text(
                statusText,
                style: TextStyle(
                  fontSize: 12,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MultiColorCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    double radius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    paint.color = Colors.green;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      pi,
      false,
      paint,
    );

    paint.color = Colors.red;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + pi,
      pi * 0.6,
      false,
      paint,
    );

    paint.color = Colors.orange;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + pi + pi * 0.6,
      pi * 0.4,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MultiColorCircleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi-Color Circle"),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: CustomPaint(
            painter: MultiColorCirclePainter(),
          ),
        ),
      ),
    );
  }
}


