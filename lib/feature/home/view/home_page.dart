// ignore_for_file: use_build_context_synchronously

import 'package:eclass/core/widgets/full_screen_search.dart';
import 'package:eclass/feature/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eclass/core/extensions/flutter_extentions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF001719),
                            Color(0xFF1B807C),
                            Color(0xFF8DD3CB),
                            // Color(0xFF016D69),
                          ],
                        ),
                      ),
                      child: Column(children: [
                        _buildSearchBar(context),
                        _buildGreeting(context),
                      ]).padded(8),
                    ),
                    _buildGridMainFeature1(context),
                    _buildGridMainFeature2(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildGridMainFeature1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    ).paddedLTRB(8, 4, 8, 4);
  }

  _buildGridMainFeature2(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    ).paddedLTRB(8, 4, 8, 4);
  }

  _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: Image.asset('assets/logos/logo.png'),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextFormField(
            onTap: () => _showFullScreenSearch(context),
            decoration: InputDecoration(
                prefixIcon: SizedBox(
                  width: 40,
                  height: 30,
                  child: Center(
                    child: Icon(
                      Icons.search_outlined,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                hintText: 'Tìm kiếm tính năng',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.grey)),
                contentPadding: const EdgeInsets.all(4)),
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        )
      ],
    ).paddedLTRB(0, 8, 0, 8);
  }

  _buildGreeting(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          child: const Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getGreeting(),
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            BlocProvider(
              create: (context) => HomeCubit()..getUser(),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeInitial) {
                    return const Text('!');
                  } else if (state is HomeLoading) {
                    return const Text('!');
                  } else if (state is Loaded) {
                    return Text(
                      '${state.userModel.id} ${state.userModel.username}',
                      style: const TextStyle(color: Colors.white),
                    );
                  } else if (state is HomeError) {
                    return const Text('!');
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Chào buổi sáng!';
    } else if (hour < 18) {
      return 'Chào buổi chiều!';
    } else {
      return 'Buổi tối vui vẻ!';
    }
  }

  void _showFullScreenSearch(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const FullScreenSearch();
      },
    );
  }
}
