import 'package:flutter/material.dart';
import 'room.dart';
import 'profil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainWrapper(),
    );
  }
}

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  static const Map<String, dynamic> _firstRoom = {
    'title': 'Suite Room',
    'price': 100,
    'image': 'https://i0.wp.com/www.emporioarchitect.com/upload/portofolio/thumb/desain-villa-modern-2-lantai-81061025-54991686020426113444.webp',
    'description': 'Suite dengan 1 Kamar Tidur (Duplex) - Valley View',
  };

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const RoomPage(room: _firstRoom),
        ),
      );
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0 ? const HomePage() : const WelcomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFF1C2331),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bed),
            label: 'Room',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Map<String, dynamic>> get rooms => [
        {
          'title': 'Suite Room',
          'price': 100,
          'image': 'https://i0.wp.com/www.emporioarchitect.com/upload/portofolio/thumb/desain-villa-modern-2-lantai-81061025-54991686020426113444.webp',
          'description': 'Suite dengan 1 Kamar Tidur (Duplex) - Valley View',
        },
        {
          'title': 'Villa Room',
          'price': 150,
          'image': 'https://i0.wp.com/www.emporioarchitect.com/upload/portofolio/thumb/desain-villa-santorini-modern-2-lantai-78050526-6377139050526101843-6.webp',
          'description': 'Private Villa dengan Private Pool',
        },
        {
          'title': 'Deluxe Room',
          'price': 80,
          'image': 'https://i0.wp.com/www.emporioarchitect.com/upload/portofolio/thumb/desain-villa-modern-2-lantai-57300525-4266975171225025657-1.webp',
          'description': 'Deluxe dengan 1 Kamar Tidur - City View',
        },
        {
          'title': 'Family Room',
          'price': 120,
          'image': 'https://i0.wp.com/www.emporioarchitect.com/upload/portofolio/thumb/desain-villa-modern-1-lantai-58050525-7176234101225114621.webp',
          'description': 'Family Room dengan 2 Kamar Tidur - Garden View',
        },
        {
          'title': 'Presidential Suite',
          'price': 200,
          'image': 'https://i0.wp.com/www.emporioarchitect.com/upload/portofolio/thumb/desain-villa-modern-3-lantai-59040425-26383121040425083510-1.webp',
          'description': 'Presidential Suite dengan 3 Kamar Tidur - Ocean View',
        },
        {
          'title': 'Honeymoon Suite',
          'price': 180,
          'image': 'https://i0.wp.com/www.emporioarchitect.com/upload/portofolio/thumb/desain-villa-modern-3-lantai-1140325-44679152140325085838-2.webp',
          'description': 'Honeymoon Suite dengan Private Jacuzzi - Beach View',
        },
        {
          'title': 'Standard Room',
          'price': 60,
          'image': 'https://i0.wp.com/www.emporioarchitect.com/upload/portofolio/thumb/desain-villa-modern-3-lantai-59040425-486373575040425083403-8.webp',
          'description': 'Standard Room dengan 1 Kamar Tidur - City View',
        },
        {
          'title': 'Executive Suite',
          'price': 130,
          'image': 'https://i0.wp.com/www.emporioarchitect.com/upload/portofolio/thumb/desain-villa-style-villa-bali-modern-2-lantai-51220225-4262479220225083458-6.webp',
          'description': 'Executive Suite dengan 2 Kamar Tidur - Garden View',
        },
        {
          'title': 'Royal Suite',
          'price': 250,
          'image': 'https://i0.wp.com/www.emporioarchitect.com/upload/portofolio/thumb/desain-rumah-modern-3-lantai-28261024-356142877110125093649-5.webp',
          'description': 'Royal Suite dengan 4 Kamar Tidur - Ocean View',
        },
        {
          'title': 'Minimalist Room',
          'price': 70,
          'image': 'https://i0.wp.com/www.emporioarchitect.com/upload/portofolio/thumb/desain-rumah-modern-3-lantai-28261024-993712441110125093602-7.webp',
          'description': 'Garden Room dengan 1 Kamar Tidur - Garden View',
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TravelGo', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Kamar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemCount: rooms.length,
                itemBuilder: (context, index) {
                  final room = rooms[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RoomPage(room: room),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              room['image'],
                              height: 110,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 110,
                                  color: Colors.grey[300],
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  room['title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '\$${room['price']}/night',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}