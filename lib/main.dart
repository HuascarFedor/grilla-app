import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galeria de imagenes',
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  static final List<String> images = [
    'https://cdn.pixabay.com/photo/2024/03/09/06/52/flowers-8622033_1280.jpg',
    'https://cdn.pixabay.com/photo/2024/03/01/16/25/costa-rica-8606850_960_720.jpg',
    'https://cdn.pixabay.com/photo/2024/03/20/06/18/ai-generated-8644732_960_720.jpg',
  ];

  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeria de imagenes"),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => const SecondScreen()),
                );
              },
              child: Image.network(
                images[index],
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda Pantalla')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Regresar a la Pantalla Principal'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
