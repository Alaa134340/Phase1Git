import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentIndex = 1;
  TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/mylibrary');
    }
  }

  void _onSubmit() {
    String query = _searchController.text;

    print("Search query: $query");
  }

  @override
  Widget build(BuildContext context) {
    var maincolor = const Color.fromRGBO(162, 185, 162, 10);
    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.menu_book_rounded,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ],
        ),
        backgroundColor: maincolor,
        toolbarHeight: 55,
        title: const Text(
          "Search For Books",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: "Tropikal"),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CupertinoSearchTextField(
                    borderRadius: BorderRadius.circular(8.0),
                    controller: _searchController,
                  ),
                ),
                Container(
                  height: 36,
                  width: 40,
                  child: CupertinoButton(
                    onPressed: _onSubmit,
                    child: IconButton(
                      iconSize: 8,
                      onPressed: onPressed,
                      icon: Icon(Icons.search_off_rounded),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color.fromARGB(255, 67, 94, 78),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Browse Genres",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  width: 50,
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: categories[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 67, 94, 78),
        backgroundColor: maincolor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'My Library',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  void onPressed() {}
}

class CategoryCard extends StatelessWidget {
  final String category;

  const CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 231, 226, 226).withOpacity(0.5),
            child: Center(
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 67, 94, 78),
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const List<String> categories = [
  "Fiction",
  "Non-fiction",
  "Children",
  "Young Adults",
  "Romance",
  "Mystery & Thriller",
  "History",
  "Historical Fiction",
  "Fantasy",
  "Memoir",
  "Biography",
  "Graphic Novels",
  "Science Fiction",
];
