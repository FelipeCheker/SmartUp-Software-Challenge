import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/logo.png', // Ruta de la imagen del logo de Twitter
          height: 40,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Acción al presionar el ícono de búsqueda
            },
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              // Acción al presionar el ícono de mensajes
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trending',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                // Aquí puedes mostrar los tweets tendencia
                TweetWidget(),
                TweetWidget(),
                TweetWidget(),
                // ... Agrega más widgets de tweets tendencia según sea necesario
              ],
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: Colors.grey,
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Latest Tweets',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                // Aquí puedes mostrar los últimos tweets
                TweetWidget(),
                TweetWidget(),
                TweetWidget(),
                // ... Agrega más widgets de últimos tweets según sea necesario
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al presionar el botón de nuevo tweet
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

// Widget de ejemplo para un tweet
class TweetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20,
                // Aquí puedes agregar la imagen del usuario
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Aquí puedes mostrar el nombre de usuario
                  Text(
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('@userhandle'),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          // Aquí puedes mostrar el contenido del tweet
          Text(
            'This is a tweet! #Flutter #TwitterClone',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          // Aquí puedes agregar opciones como retweet, like, etc.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.repeat),
                onPressed: () {
                  // Acción al presionar el ícono de retweet
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // Acción al presionar el ícono de like
                },
              ),
              IconButton(
                icon: Icon(Icons.share),
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
