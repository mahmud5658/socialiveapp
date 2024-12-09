import 'package:flutter_svg/svg.dart';
import '../../../my_imports.dart';
import '../../../utils/assets_paths.dart';

class SocialPostCard extends StatelessWidget {
  const SocialPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) => _buildPostCard(context),
    );
  }

  Widget _buildPostCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPostHeader(),
            _buildPostImage(),
            _buildPostActions(context),
            _buildPostCommentInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildPostHeader() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/104672914?s=400&u=453aec5b1ec6e9a1c3c975436ee5ee55b1233ed9&v=4'),
            radius: 20,
          ),
          const SizedBox(width: 8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Abdullah Al Mahmud',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                '@mahmud5658',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AssetsIcon.notification),
          ),
        ],
      ),
    );
  }

  Widget _buildPostImage() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://avatars.githubusercontent.com/u/104672914?s=400&u=453aec5b1ec6e9a1c3c975436ee5ee55b1233ed9&v=4',
          width: double.infinity,
          fit: BoxFit.cover,
          height: 400,
        ),
      ),
    );
  }

  Widget _buildPostActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        children: [
          SvgPicture.asset(AssetsIcon.redHearts),
          const SizedBox(width: 12),
          SvgPicture.asset(AssetsIcon.comments),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => showCommentsBottomSheet(context),
            child: const Text(
              '20 comments',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const Spacer(),
          SvgPicture.asset(AssetsIcon.saved),
        ],
      ),
    );
  }

  Widget _buildPostCommentInput() {
    return const Padding(
      padding: EdgeInsets.only(left: 12.0, bottom: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/OIF.FNBsHxbSvZYH1NQmMl7k3w?w=238&h=180&c=7&r=0&o=5&pid=1.7'),
            radius: 16,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Add comments',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),

          ),
        ],
      ),
    );
  }

  void showCommentsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => _buildCommentsBottomSheet(context),
    );
  }

  Widget _buildCommentsBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDragHandle(),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              "Comments",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => _buildCommentItem(),
            ),
          ),
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildDragHandle() {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildCommentItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/OIF.FNBsHxbSvZYH1NQmMl7k3w?w=238&h=180&c=7&r=0&o=5&pid=1.7'),
            radius: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 6,
                  children: [
                    const Text(
                      'mferdous12',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '2 hours ago',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Nice picture you have captured 🔥',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 4),
                Text(
                  'Reply',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          SvgPicture.asset(AssetsIcon.whiteHearts),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://th.bing.com/th/id/OIF.FNBsHxbSvZYH1NQmMl7k3w?w=238&h=180&c=7&r=0&o=5&pid=1.7'),
          radius: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Add comments',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,

              ),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.send, color: Colors.blue),
      ],
    );
  }
}
