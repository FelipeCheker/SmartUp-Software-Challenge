import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitterapp/auth/tweet.dart';

class tweetScreen extends StatefulWidget {
  const tweetScreen({Key? key}) : super(key: key);

  @override
  _TweetScreenState createState() => _TweetScreenState();
}

class _TweetScreenState extends State<tweetScreen> {
  final TextEditingController _tweetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tweet'),
        actions: [
          TextButton(
            onPressed: () {
              _postTweet();
            },
            child: Text(
              'Tweet',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _tweetController,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: 'What\'s happening?',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  void _postTweet() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userNameFb = user.displayName ?? 'DefaultUsername';
      String userHandleFb =
          '@' + user.email!.split('@').first ?? 'DefaultHandle';

      final String tweetContent = _tweetController.text.trim();
      if (tweetContent.isNotEmpty) {
        Tweet newTweet = Tweet(
          userName: userNameFb,
          userHandle: userHandleFb,
          tweetContent: tweetContent,
        );
        Navigator.pop(context, newTweet);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please write something before tweeting.'),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _tweetController.dispose();
    super.dispose();
  }
}
