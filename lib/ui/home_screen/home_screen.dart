import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../provider/home_provider.dart';
import '../../widgets/text_widgets.dart';
import 'components/event_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String formatDate(String apiDate) {
    DateTime dateTime = DateTime.parse(apiDate);
    return DateFormat('EEE, MMM d yyyy\nhh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<HomeProvider>(context);
    final users = userProvider.users;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          controller: userProvider.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 65, 62, 230),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2),
                            Center(
                                child: headingTeax(
                                    text: 'Dating List', color: Colors.white)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: const TextStyle(color: Colors.grey),
                              prefixIcon:
                                  const Icon(Icons.search, color: Colors.black),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == users.length) {
                    return userProvider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox.shrink();
                  }
                  final user = users[index];
                  String date = formatDate(user.registered.date);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: eventCard(
                      eventName: 'Dinner',
                      image: user.picture.medium,
                      personName: "${user.name.first} ${user.name.last}",
                      distenc: '3 km from you',
                      date: date,
                      location: user.location.street.name,
                    ),
                  );
                },
                childCount: users.length + (userProvider.isLoading ? 1 : 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
