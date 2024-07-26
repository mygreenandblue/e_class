// ignore_for_file: library_private_types_in_public_api

import 'package:eclass/core/models/user_model.dart';
import 'package:eclass/feature/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullScreenSearch extends StatefulWidget {
  const FullScreenSearch({super.key});

  @override
  _FullScreenSearchState createState() => _FullScreenSearchState();
}

class _FullScreenSearchState extends State<FullScreenSearch> {
  final TextEditingController _searchController = TextEditingController();
  List<UserModel> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Tìm kiếm...',
            border: InputBorder.none,
          ),
          onChanged: (query) {
            // Perform search logic
            _searchUsers(query);
          },
        ),
      ),
      body: _searchResults.isEmpty
          ? const Center(child: Text('No results found.'))
          : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final user = _searchResults[index];
                return ListTile(
                  title: Text(user.id.toString()),
                  subtitle: Text(user.username),
                  onTap: () {
                    // Handle user tap
                  },
                );
              },
            ),
    );
  }

  void _searchUsers(String query) {
    final results = BlocProvider.of<HomeCubit>(context).searchUsers(query);
    setState(() {
      _searchResults = results;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
