// ignore_for_file: use_build_context_synchronously

import 'package:eclass/core/widgets/custom_search_field.dart';
import 'package:eclass/core/widgets/full_screen_search.dart';
import 'package:eclass/feature/home/cubit/home_cubit.dart';
import 'package:eclass/feature/home/widgets/grid_feature.dart';
import 'package:eclass/feature/home/widgets/main_feature_item.dart';
import 'package:eclass/routing/app_routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eclass/core/extensions/flutter_extentions.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

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
            SliverToBoxAdapter(
              child: const Text(
                'Dịch vụ nổi bật',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ).paddedLTRB(8, 16, 8, 0),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: GridItem(
                      label: 'Đăth lịch tư vấn từ xa',
                      onTap: () {
                        context.push(AppRouter.remoteConsult);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: GridItem(
                      label: 'Đăth lịch tư vấn từ xa',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: GridItem(
                      label: 'Đăth lịch tư vấn từ xa',
                      onTap: () {},
                    ),
                  ),
                ],
              ).paddedLTRB(8, 16, 8, 0),
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
        MainFeatureItem(
            color: const Color(0xFF0D72C0),
            iconColor: Colors.white,
            onTap: () {
              context.push(AppRouter.booking);
            },
            label: 'Đặt lịch',
            icons: Icons.apartment_outlined),
        const SizedBox(width: 8),
        MainFeatureItem(
            color: const Color(0xFF0D72C0),
            iconColor: Colors.white,
            onTap: () {
              context.push('/booking');
            },
            label: 'Đơn thuốc',
            icons: Icons.receipt_outlined),
      ],
    ).paddedLTRB(8, 4, 8, 4);
  }

  _buildGridMainFeature2(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MainFeatureItem(
            color: const Color(0xFF1B807C),
            iconColor: Colors.red,
            onTap: () async {
              await makePhoneCall('0386209000');
            },
            label: 'Gọi cấp cứu',
            icons: Icons.local_hospital_outlined),
        const SizedBox(width: 8),
        MainFeatureItem(
            color: const Color(0xFF1B807C),
            iconColor: Colors.white,
            onTap: () {},
            label: 'Thông tin khám',
            icons: Icons.medical_information_outlined),
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
            child: CustomSearchField(
          onTap: (p0) => _showFullScreenSearch(context),
          hintText: 'Tìm kiếm tính năng',
        ))
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
                    return const CircularProgressIndicator();
                  } else if (state is Loaded) {
                    return Text(
                      ' ${state.userModel.username}',
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

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    print(launchUri);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
