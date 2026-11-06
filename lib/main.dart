import 'package:flutter/material.dart';

void main() {
  runApp(const SwahiliTokApp());
}

class SwahiliTokApp extends StatelessWidget {
  const SwahiliTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwahiliTok',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  int likes = 1250;

  final List<Map<String, String>> videos = [
    {
      'user': '@sabii',
      'caption': 'Karibu SwahiliTok! 🔥 Jifunze Kiswahili kwa raha',
      'word': 'Jambo = Hello',
    },
    {
      'user': '@swahili_queen',
      'caption': 'Neno la leo: Asante sana!',
      'word': 'Asante = Thank you',
    },
    {
      'user': '@mwalimu',
      'caption': 'Sema na mimi: Habari yako?',
      'word': 'Habari = How are you?',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final video = videos[_index % videos.length];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.purple.shade900,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.play_circle_fill, size: 100, color: Colors.white),
                  const SizedBox(height: 20),
                  Text(video['word']!, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 10),
                  Text(video['caption']!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, color: Colors.white70)),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      setState(() { _index++; });
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                    child: const Text('Video Inayofuata ➡️', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('SwahiliTok', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(video['user']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 8),
                Text(video['caption']!, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            right: 16,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red, size: 35),
                  onPressed: () { setState(() { likes++; }); },
                ),
                Text('$likes'),
                const SizedBox(height: 15),
                const Icon(Icons.comment, size: 35),
                const Text('45'),
                const SizedBox(height: 15),
                const Icon(Icons.share, size: 35),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Upload'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
