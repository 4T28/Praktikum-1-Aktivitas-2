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
  final String nim = '1462300000';
  final String nama = 'Mafuyu Aikawa';
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome to', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Text('PRAKTIKUM PAB 2026', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('$nama ($nim)', style: const TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 180,
                  height: 280,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: _imageBytes != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.memory(_imageBytes!, fit: BoxFit.cover),
                        )
                      : const Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
                ),
              ),
              if (_imageBytes != null)
                TextButton(
                  onPressed: () => setState(() => _imageBytes = null),
                  child: const Text('Hapus Foto', style: TextStyle(color: Colors.red)),
                ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 45),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
