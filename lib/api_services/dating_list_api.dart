import 'dart:convert';
import 'dart:isolate';
import 'package:http/http.dart' as http;
import 'package:dating_list/models/user_model.dart';

Future<List<User>> fetchDatingListInIsolate(int page, int results) async {
  final receivePort = ReceivePort();

  await Isolate.spawn(_fetchDatingListInIsolate, receivePort.sendPort);

  final sendPort = await receivePort.first as SendPort;
  final responsePort = ReceivePort();

  sendPort.send([page, results, responsePort.sendPort]);

  // Wait for the response and cast to the appropriate type
  final response = await responsePort.first;

  // Ensure the response is a List<User> before returning it
  if (response is List<User>) {
    return response;
  } else {
    // Log error or handle type mismatch
    return [];
  }
}

Future<void> _fetchDatingListInIsolate(SendPort sendPort) async {
  final port = ReceivePort();
  sendPort.send(port.sendPort);

  await for (final message in port) {
    final int page = message[0];
    final int results = message[1];
    final SendPort replyPort = message[2];

    try {
      final url = "https://randomuser.me/api/?page=$page&results=$results";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> usersJson = data["results"];

        // Log the raw data for debugging
        print("Raw data: $usersJson");

        // Map the data to User models
        List<User> users = usersJson
            .map((json) {
              if (json is Map<String, dynamic>) {
                return User.fromMap(
                    json); // Correctly map each item to a User model
              } else {
                // Handle invalid data here if needed
                return null;
              }
            })
            .whereType<User>() // Filter out nulls
            .toList();

        replyPort.send(users); // Send the List<User> back to the main isolate
      } else {
        replyPort.send([]); // If the request fails, return an empty list
      }
    } catch (e) {
      replyPort.send([]); // Return an empty list on error
    }
  }
}
