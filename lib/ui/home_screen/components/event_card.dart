import 'package:flutter/material.dart';

import '../../../widgets/text_widgets.dart';

Widget eventCard({eventName, image, personName, distenc, date, location}) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 230, 230, 230),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Row(
          spacing: 10,
          children: [
            Icon(
              Icons.calendar_today,
              color: const Color.fromARGB(255, 108, 34, 228),
            ),
            headingTeax(text: eventName, color: Colors.black),
            Spacer(),
            Icon(Icons.more_horiz),
          ],
        ),
        SizedBox(height: 08),
        Divider(
            thickness: 0.5,
            color: const Color.fromARGB(255, 219, 217, 217),
            indent: 05,
            endIndent: 05),
        SizedBox(height: 10),
        Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Color.fromARGB(255, 61, 30, 238),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(image),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                          255, 61, 30, 238), // Online status color
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white, width: 2), // White border
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingTeax(text: personName, color: Colors.black),
                  SizedBox(height: 4),
                  smallText(
                      text: distenc,
                      color: const Color.fromARGB(255, 141, 141, 141))
                ],
              ),
            ),

            // Call & Chat Icons
            Row(
              children: [
                IconButton(
                  icon:
                      Icon(Icons.chat, color: Color.fromARGB(255, 61, 30, 238)),
                  onPressed: () {},
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.call,
                      color: const Color.fromARGB(255, 61, 30, 238)),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 30),
        //row one
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 18),
                      SizedBox(width: 8),
                      smallText(text: "Date"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    date,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: VerticalDivider(
                thickness: 0.5,
                color: const Color.fromARGB(255, 219, 217, 217),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 18),
                      SizedBox(width: 8),
                      smallText(text: 'Location'),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    location,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
