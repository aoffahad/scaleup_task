import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff11161f),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Rafsan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Let's watch today",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'), // Replace with profile image URL
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// Search and Settings
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          // fillColor: Colors.grey[800],
                          fillColor: Colors.black,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.5),
                          ),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// Categories
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See More',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryChip('All'),
                      _buildCategoryChip('Action'),
                      _buildCategoryChip('Anime'),
                      _buildCategoryChip('Sci-fi'),
                      _buildCategoryChip('Thriller'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// Featured Movie (Category)
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://e0.pxfuel.com/wallpapers/358/317/desktop-wallpaper-netflix-project-power-movies-and-background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Trending Movies
                ///
                _buildSection('Trending Movies', [
                  _buildMovieCard('Yes I Do',
                      'https://i0.wp.com/www.socialnews.xyz/wp-content/uploads/2020/07/26/project-power-movie-HD-Posters-.jpg?quality=80&zoom=1&ssl=1'),
                  _buildMovieCard('Inside Out 2',
                      'https://i0.wp.com/www.socialnews.xyz/wp-content/uploads/2020/07/26/project-power-movie-HD-Posters-.jpg?quality=80&zoom=1&ssl=1'),
                  _buildMovieCard('Fast X',
                      'https://i0.wp.com/www.socialnews.xyz/wp-content/uploads/2020/07/26/project-power-movie-HD-Posters-.jpg?quality=80&zoom=1&ssl=1'),
                  _buildMovieCard('Babylon',
                      'https://i0.wp.com/www.socialnews.xyz/wp-content/uploads/2020/07/26/project-power-movie-HD-Posters-.jpg?quality=80&zoom=1&ssl=1'),
                ]),

                const SizedBox(height: 20),

                /// Continue Watching
                _buildSection('Continue Watching', [
                  _buildMovieCard('Wednesday || Season-2',
                      'https://c4.wallpaperflare.com/wallpaper/986/324/15/robin-hood-movie-poster-2018-wallpaper-preview.jpg'),
                  _buildMovieCard('Emily in Paris',
                      'https://i.pinimg.com/736x/43/71/23/4371232be997d86a793ea52a7b187db8.jpg'),
                  _buildMovieCard('Wednesday || Season-2',
                      'https://c4.wallpaperflare.com/wallpaper/986/324/15/robin-hood-movie-poster-2018-wallpaper-preview.jpg'),
                  _buildMovieCard('Emily in Paris',
                      'https://i.pinimg.com/736x/43/71/23/4371232be997d86a793ea52a7b187db8.jpg'),
                ]),

                const SizedBox(height: 20),

                /// Recommended For You
                _buildSection('Recommended For You', [
                  _buildMovieCard('Double Love',
                      'https://i.pinimg.com/736x/00/f6/a2/00f6a2ab49577bd42547d6c02b963702.jpg'),
                  _buildMovieCard('Curse Of The River',
                      'https://cdn.cinematerial.com/p/297x/rde3sb4r/mojave-movie-poster-md.jpg?v=1456753389'),
                  _buildMovieCard('Sunita',
                      'https://i.pinimg.com/736x/00/f6/a2/00f6a2ab49577bd42547d6c02b963702.jpg'),
                ]),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black,
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.white70,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.tv),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.download),
      //       label: '',
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildCategoryChip(String label) {
    bool isSelected = label == selectedCategory;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Chip(
          backgroundColor: isSelected ? Colors.red : Colors.grey[800],
          label: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMovieCard(String title, String imageUrl) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'See More',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: items,
          ),
        ),
      ],
    );
  }
}
