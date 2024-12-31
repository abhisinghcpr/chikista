import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMedicinesScreen extends StatefulWidget {
  AddMedicinesScreen({Key? key}) : super(key: key);

  @override
  State<AddMedicinesScreen> createState() => _AddMedicinesScreenState();
}

class _AddMedicinesScreenState extends State<AddMedicinesScreen> {
  int _selectedCompartment = 0;
  int _selectedFoodOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Medicines",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.left_chevron,
              size: 25,
            )),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Medicine Name",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic, size: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Compartment",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCompartment = index;
                    });
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedCompartment == index
                            ? Colors.blue
                            : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: _selectedCompartment == index
                          ? Colors.blue.shade50
                          : Colors.transparent,
                    ),
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _selectedCompartment == index
                            ? Colors.blue
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Colour", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Color(0xfff9cfef),
                Color(0xffc1b6ff),
                Color(0xfffe9796),
                Color(0xffcefabf),
                Color(0xfff8c390),
                Color(0xffbbe6fe)
              ].map((color) {
                return CircleAvatar(backgroundColor: color, radius: 24);
              }).toList(),
            ),
            const SizedBox(height: 10),
            const Text("Type", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset("assets/images/tablateee.jpg",
                        height: 40, width: 50),
                    const SizedBox(height: 8),
                    const Text("Tablet"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/images/tablateee.jpg",
                        height: 40, width: 50),
                    const SizedBox(height: 8),
                    const Text("Tablet"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/images/tablateee.jpg",
                        height: 40, width: 50),
                    const SizedBox(height: 8),
                    const Text("Tablet"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/images/tablateee.jpg",
                        height: 40, width: 50),
                    const SizedBox(height: 8),
                    const Text("Tablet"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Quantity",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Take 1/2 Pill",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff6f8bef)),
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(Icons.remove, color: Color(0xff6f8bef)),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff6f8bef)),
                    color: Color(0xff6f8bef),
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Total Count",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text("01", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Expanded(
                  child: Slider(
                    value: 1,
                    onChanged: (value) {},
                    min: 1,
                    max: 100,
                  ),
                ),
                const Text("100",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Set Date",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Today"),
                          Icon(Icons.arrow_forward_ios, size: 15)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("End Day"),
                          const Icon(Icons.arrow_forward_ios, size: 15)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Frequency of Days",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 50,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                value: "Everyday",
                items: ["Everyday", "Alternate Days", "Weekly"]
                    .map((value) =>
                        DropdownMenuItem(child: Text(value), value: value))
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 10),
            const Text("How many times a Day",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 50,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                value: "Three Time",
                items: ["Once", "Twice", "Three Time"]
                    .map((value) =>
                        DropdownMenuItem(child: Text(value), value: value))
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.grey),
                  title: const Text("Dose 1",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 12),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.grey),
                  title: const Text("Dose 2",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 12),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.grey),
                  title: const Text("Dose 3",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 12),
                ),
                const Divider(),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Food Timing",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _customButton(0, "Before Food"),
                  const SizedBox(width: 8),
                  _customButton(1, "After Food"),
                  const SizedBox(width: 8),
                  _customButton(2, "With Food"),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff6f8bef),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text("Add",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget _customButton(int index, String label) {
    bool isSelected = _selectedFoodOption == index;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? const Color(0xffb3c3fe) : const Color(0xfff1f1ff),
      ),
      onPressed: () {
        setState(() {
          _selectedFoodOption = index;
        });
      },
      child: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.black : Colors.black),
      ),
    );
  }
}
