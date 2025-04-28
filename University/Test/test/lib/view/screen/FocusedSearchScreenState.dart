import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focused Search Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FocusedSearchScreen(),
    );
  }
}

class FocusedSearchScreen extends StatefulWidget {
  @override
  _FocusedSearchScreenState createState() => _FocusedSearchScreenState();
}

class _FocusedSearchScreenState extends State<FocusedSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<String> _items = [
    'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry',
    'Fig', 'Grape', 'Honeydew', 'Kiwi', 'Lemon',
    'Mango', 'Nectarine', 'Orange', 'Peach', 'Quince',
    'Raspberry', 'Strawberry', 'Tangerine', 'Ugli fruit', 'Watermelon'
  ];
  List<String> _filteredItems = [];
  bool _showResults = false;

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.removeListener(_onFocusChange);
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _showResults = _searchFocusNode.hasFocus && _searchController.text.isNotEmpty;
    });
  }

  void _searchItems(String query) {
    setState(() {
      _filteredItems = _items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _showResults = _searchFocusNode.hasFocus && query.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Focused Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              onChanged: _searchItems,
              onTap: () {
                if (_searchController.text.isNotEmpty) {
                  setState(() {
                    _showResults = true;
                  });
                }
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search fruits...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _searchItems('');
                        },
                      )
                    : null,
              ),
            ),
          ),
          if (_showResults)
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      _searchController.text = item;
                      setState(() {
                        _showResults = false;
                      });
                      _searchFocusNode.unfocus();
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}