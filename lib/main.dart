import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color? _selectedColor;
  String _selectedSize = "Medium";

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }

  void _onButtonPressed(Color color, String size) {
    setState(() {
      _selectedColor = color;
      _selectedSize = size;
    });
    _showSnackbar("Selected Size: $_selectedSize");
  }

  Widget _buildButton(Color color, String size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(color, size),
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedColor == color ? color.withOpacity(1) : color,
        ),
        child: Text(size),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size Selector'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            _buildButton(Colors.grey, 'S'),
            _buildButton(Colors.grey, 'M'),
            _buildButton(Colors.grey, 'L'),
            _buildButton(Colors.grey, 'XL'),
            _buildButton(Colors.grey, 'XXL'),
            _buildButton(Colors.grey, 'XXXL'),
          ],
        ),
      ),
    );
  }
}
