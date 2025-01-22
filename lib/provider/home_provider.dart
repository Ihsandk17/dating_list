import 'package:flutter/material.dart';
import '../../api_services/dating_list_api.dart';
import '../../models/user_model.dart';

class HomeProvider extends ChangeNotifier {
  List<User> users = [];
  int page = 1;
  final int resultsPerPage = 10;
  bool isLoading = false;
  bool hasMore = true;

  final ScrollController scrollController = ScrollController();

  HomeProvider() {
    fetchUsers();
    scrollController.addListener(_scrollListener);
  }

  Future<void> fetchUsers() async {
    if (isLoading || !hasMore) return;

    isLoading = true;
    notifyListeners();

    List<User> newUsers = await fetchDatingListInIsolate(page, resultsPerPage);
    if (newUsers.isNotEmpty) {
      users.addAll(newUsers);
      page++;
    } else {
      hasMore = false;
    }

    isLoading = false;
    notifyListeners();
  }

  void _scrollListener() {
    if (scrollController.hasClients &&
        scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 100 &&
        !isLoading) {
      fetchUsers();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
