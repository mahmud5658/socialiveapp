import '../../../my_imports.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    required this.name,
    required this.imageUrl,
    required this.profileImageUrl,
    this.isYou = false,
    super.key,
  });

  final String name;
  final String imageUrl;
  final String profileImageUrl;
  final bool isYou;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImageStack(),
          const SizedBox(height: 8),
          _buildNameText(),
        ],
      ),
    );
  }

  Widget _buildImageStack() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: Image.network(
            imageUrl,
            width: double.infinity,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
        _buildProfileAvatar(),
        if (isYou) _buildAddIcon(),
      ],
    );
  }

  Widget _buildProfileAvatar() {
    return Positioned(
      top: 4,
      left: 4,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(profileImageUrl),
        ),
      ),
    );
  }

  Widget _buildAddIcon() {
    return const Positioned(
      top: 20,
      left: 20,
      child: CircleAvatar(
        radius: 8,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, size: 12, color: Colors.white),
      ),
    );
  }

  Widget _buildNameText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}