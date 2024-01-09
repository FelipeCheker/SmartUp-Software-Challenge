import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:twitterapp/auth/tweet.dart';

abstract class TweetsRepository {
  Future<Tweet?> addTweet({required Tweet tweet});
  Future<bool> deleteTweet({required Tweet tweet});
  Future<bool> updateTweet({required Tweet tweet});
  Future<List<Tweet>?> getAllTweets();
}

class TweetRepository implements TweetsRepository {
  final FirebaseFirestore firestore;
  final FirebaseStorage firestorage;

  TweetRepository({required this.firestore, required this.firestorage});

  @override
  Future<Tweet?> addTweet({required Tweet tweet}) async {
    try {
      final documentReference = firestore.collection('tweets').doc();
      final Map<String, dynamic> json = tweet.toJson();
      json['id'] = documentReference.id;
      await documentReference.set(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteTweet({required Tweet tweet}) async {
    try {
      await firestorage.ref('tweetImages/${tweet.id}').listAll().then((value) {
        value.items.forEach((element) {
          firestorage.ref(element.fullPath).delete();
        });
      });
    } catch (e) {}
    try {
      await firestore
          .collection('tweets')
          .doc(tweet.id)
          .delete()
          .onError((error, stackTrace) => false);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateTweet({required Tweet tweet}) async {
    try {
      await firestore
          .collection('tweets')
          .doc(tweet.id)
          .update(tweet.toJson())
          .onError((error, stackTrace) => false);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Tweet>?> getAllTweets() async {
    try {
      final tweetSnapshot = await firestore.collection('tweets').get();
      if (tweetSnapshot.docs.isNotEmpty) {
        return tweetSnapshot.docs
            .map((doc) => Tweet.fromJson(doc.data()))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
