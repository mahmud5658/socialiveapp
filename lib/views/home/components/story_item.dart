import 'package:socialive/views/home/components/story_card.dart';

import '../../../my_imports.dart';

class StoryItem extends StatelessWidget {
  StoryItem({super.key});

  final List<Map<String, String>> stories = [
    {
      "name": "You",
      "imageUrl":
      "https://avatars.githubusercontent.com/u/104672914?s=400&u=453aec5b1ec6e9a1c3c975436ee5ee55b1233ed9&v=4",
      "profileImageUrl":
      "https://avatars.githubusercontent.com/u/104672914?s=400&u=453aec5b1ec6e9a1c3c975436ee5ee55b1233ed9&v=4",
      "isYou": "true"
    },
    {
      "name": "Nafiur",
      "imageUrl":
      "https://avatars.githubusercontent.com/u/93787418?v=4",
      "profileImageUrl":
      "https://avatars.githubusercontent.com/u/93787418?v=4",
    },
    {
      "name": "Bappy",
      "imageUrl":
      "https://avatars.githubusercontent.com/u/123102557?v=4",
      "profileImageUrl":
      "https://avatars.githubusercontent.com/u/123102557?v=4",
    },
    {
      "name": "Rony",
      "imageUrl":
      "https://avatars.githubusercontent.com/u/123628371?v=4",
      "profileImageUrl":
      "https://avatars.githubusercontent.com/u/123628371?v=4",
    }, {
      "name": "Akash",
      "imageUrl":
      "https://avatars.githubusercontent.com/u/123166352?v=4",
      "profileImageUrl":
      "https://avatars.githubusercontent.com/u/123166352?v=4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final story = stories[index];
          return StoryCard(
            name: story["name"]!,
            imageUrl: story["imageUrl"]!,
            profileImageUrl: story["profileImageUrl"]!,
            isYou: story["isYou"] == "true",
          );
        },
      ),
    );
  }
}


