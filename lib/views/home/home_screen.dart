import 'package:flutter/material.dart';
import 'components/custom_appBar.dart';
import 'components/social_post_card.dart';
import 'components/story_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 10),
                  StoryItem(),
                  const SizedBox(height: 16),
                  ...List.generate(10, (index) => const SocialPostCard()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
