import 'package:flutter/material.dart';

import 'package:chikista/view/screens/profile/profile_screen.dart';

import 'custom_alert.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> dates = [
    'Saturday, Sep 2',
    'Saturday, Sep 3',
    'Saturday, Sep 4',
    'Saturday, Sep 5',
    'Saturday, Sep 6',
  ];

  String selectedDate = 'Saturday, Sep 3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FA),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Harry!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '5 Medicines Left',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.medical_services,
                  color: Color(0xff6f8bef),
                  size: 28,
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileSettingsPage(),
                      )),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage("assets/images/profile-icon.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: dates.map((date) {
                final isSelected = date == selectedDate;
                return GestureDetector(
                  onTap: () async {
                    setState(() {
                      selectedDate = date;
                    });
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return DeviceNotConnectedDialog();
                      },
                    );
                  },
                  child: Row(
                    children: [
                      if (isSelected)
                        Icon(
                          Icons.chevron_left,
                          color: Color(0xff6f8bef),
                        ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          date,
                          style: TextStyle(
                            fontSize: 14,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.chevron_right,
                          color: Color(0xff6f8bef),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                buildTimeSection('Morning 08:00 am', [
                  buildMedicineCard(
                    icon: Icons.local_drink,
                    iconColor: Colors.pink[100]!,
                    medicineName: 'Calpol 500mg Tablet',
                    timing: 'Before Breakfast',
                    day: 'Day 01',
                    statusIcon: Icons.notifications_none,
                    statusColor: Colors.green,
                    statusText: 'Taken',
                  ),
                  buildMedicineCard(
                    icon: Icons.tablet,
                    iconColor: Colors.blue[100]!,
                    medicineName: 'Calpol 500mg Tablet',
                    timing: 'Before Breakfast',
                    day: 'Day 27',
                    statusIcon: Icons.notifications_none_outlined,
                    statusColor: Colors.red,
                    statusText: 'Missed',
                  ),
                ]),
                buildTimeSection('Afternoon 02:00 pm', [
                  buildMedicineCard(
                    icon: Icons.water_drop,
                    iconColor: Colors.purple[100]!,
                    medicineName: 'Calpol 500mg Tablet',
                    timing: 'After Food',
                    day: 'Day 01',
                    statusIcon: Icons.notifications_paused,
                    statusColor: Colors.orange,
                    statusText: 'Snoozed',
                  ),
                ]),
                buildTimeSection('Night 09:00 pm', [
                  buildMedicineCard(
                    icon: Icons.bedtime,
                    iconColor: Colors.red[100]!,
                    medicineName: 'Calpol 500mg Tablet',
                    timing: 'Before Sleep',
                    day: 'Day 03',
                    statusIcon: Icons.notification_important_outlined,
                    statusColor: Colors.grey,
                    statusText: 'Left',
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
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
                        width: 7,
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
