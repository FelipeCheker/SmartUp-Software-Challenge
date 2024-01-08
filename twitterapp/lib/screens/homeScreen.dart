import 'package:flutter/material.dart';
import 'package:twitterapp/screens/tweetScreen.dart';
import 'package:twitterapp/auth/tweet.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<homeScreen> {
  List<Tweet> tweets = []; // Lista para almacenar los tweets

  @override
  void initState() {
    tweets = [
      Tweet(
        userName: 'Username',
        userHandle: '@userhandle',
        tweetContent: 'This is a trending tweet! #Flutter #TwitterClone',
      ),
      Tweet(
        userName: 'AnotherUser',
        userHandle: '@anotherhandle',
        tweetContent: 'Another trending tweet! 🚀',
      ),
      Tweet(
        userName: 'User3',
        userHandle: '@user3handle',
        tweetContent: 'Check out this cool tweet! 👍',
      ),
      Tweet(
        userName: 'User4',
        userHandle: '@user4handle',
        tweetContent: 'Just posted another tweet! #Flutter',
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SizedBox(
          height: 25,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.blue),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.star, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          _buildSectionTitle(''),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Cantidad de historias
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                  ),
                );
              },
            ),
          ),
          ...tweets.map((tweet) => _buildTweetWidget(tweet)).toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTweet = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const tweetScreen()),
          );
          if (newTweet != null && newTweet is Tweet) {
            setState(() {
              tweets.add(newTweet);
            });
          }
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: '',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTweetWidget(Tweet tweet) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20,
                // Aquí puedes agregar la imagen del usuario
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tweet.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    tweet.userHandle,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            tweet.tweetContent,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.repeat, color: Colors.grey),
                onPressed: () {
                  // Acción al presionar el ícono de retweet
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.grey),
                onPressed: () {
                  // Acción al presionar el ícono de like
                },
              ),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.grey),
                onPressed: () {
                  // Acción al presionar el ícono de compartir
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
