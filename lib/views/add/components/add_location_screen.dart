import 'package:flutter/material.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  final List<Map<String, String>> locations = const [
    {
      'title': 'Jamuna Future Park',
      'subtitle': '0.4mi • ka-244, Progati Sarani, Kuril, Baridhara',
    },
    {
      'title': 'Gulshan Lake Park',
      'subtitle': '1.2mi • Gulshan Ave, Dhaka',
    },
    {
      'title': 'Hatirjheel',
      'subtitle': '2.0mi • Dhaka City',
    },
    {
      'title': 'Banani Supermarket',
      'subtitle': '0.8mi • Road 12, Banani, Dhaka',
    },
    {
      'title': 'Shyamoli Square',
      'subtitle': '3.0mi • Ring Road, Shyamoli, Dhaka',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Location',
        ),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Input Text',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
              ),
            ),
          ),
          // List of Locations
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];
                return ListTile(
                  onTap: () => Navigator.pop(context, location),
                  title: Text(
                    location['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    location['subtitle']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
