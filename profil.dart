import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      final bytes = await file.readAsBytes();
      setState(() => _imageBytes = bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDDE4F2),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(120),
                      bottomRight: Radius.circular(120),
                    ),
                  ),
                ),

                const Positioned(
                  top: 55,
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 10,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: _imageBytes != null
                          ? ClipOval(
                              child: Image.memory(
                                _imageBytes!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Icon(
                              Icons.person_outline,
                              size: 50,
                              color: Colors.blueAccent,
                            ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            buildProfileItem(Icons.person_outline, 'Muhammad Edhu Maulana'),
            buildProfileItem(Icons.phone_outlined, '1462300094'),
            buildProfileItem(Icons.email_outlined, 'pab2026@gmail.com'),
            buildProfileItem(Icons.location_on_outlined, 'Konstantinopel'),
            buildProfileItem(Icons.camera_alt_outlined, 'pab2026'),

            const SizedBox(height: 40),

            Container(
              height: 180,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFDDE4F2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(140),
                  topRight: Radius.circular(140),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileItem(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(
            icon,
            color: Colors.lightBlueAccent,
            size: 28,
          ),
          const SizedBox(width: 18),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
