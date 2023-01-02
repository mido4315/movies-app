import 'package:flutter/material.dart';
import 'global_variables.dart';
import 'home_page.dart';
import 'movie_details.dart';

class Favorite extends StatefulWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: GridView.builder(
          itemCount: GlobalVariables.posters.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,childAspectRatio: 0.57),
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 1)]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network('${GlobalVariables.posters[i]}',),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 5),
                      child: Text(
                        '${GlobalVariables.titles[i]}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
