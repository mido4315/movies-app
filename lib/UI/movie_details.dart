import 'package:flutter/material.dart';
import 'global_variables.dart';

var buttonColor = const Color(0xFF4bb7a9);

class MovieDetails extends StatefulWidget {
  String? title;
  String? releaseDate;
  String? overview;
  String? originalLanguage;
  String? poster;
  String? backdrop;
  int? voteCount;
  double? popularity;

  MovieDetails({
     this.title,
     this.releaseDate,
     this.overview,
     this.originalLanguage,
     this.poster,
     this.backdrop,
     this.voteCount,
     this.popularity,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  late bool _isAdded;


  bool get isAdded {
    if(GlobalVariables.titles.contains('${widget.title}')){
      _isAdded = true;
      return _isAdded;
    }
    else{
      _isAdded = false;
      return _isAdded;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            buildListView(context),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.18,
              left: MediaQuery.of(context).size.width * 0.13,
              width: 300,
              child: Text(
                '${widget.title}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.24,
              right: MediaQuery.of(context).size.width * 0.03,
              child: FloatingActionButton(
                onPressed: () {

                  setState(() {
                    if ( _isAdded == false) {
                      _isAdded = true;
                      GlobalVariables.posters.add('${widget.poster}');
                      GlobalVariables.titles.add('${widget.title}');
                    } else {
                      _isAdded = false;
                      GlobalVariables.posters.remove('${widget.poster}');
                      GlobalVariables.titles.remove('${widget.title}');
                    }
                  });
                },
                backgroundColor: buttonColor,
                child: isAdded
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          child: Image.network(
            '${widget.backdrop}',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "${widget.poster}",
                height: 222,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.title}',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          'some text about this movie xd',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          '${widget.releaseDate} (Released)',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                'Reviews',
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider(
          height: 0,
          thickness: 3,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFFc02e2f),
                  child: Container(
                    height: 53,
                    width: 53,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Center(
                      child: Text(
                        '${widget.voteCount}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text('Votes',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14)),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFFc02e2f),
                  child: Container(
                    height: 53,
                    width: 53,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Center(
                      child: Text(
                        '${widget.popularity}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text('Popularity',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14)),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFFc02e2f),
                  child: Container(
                    height: 53,
                    width: 53,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Center(
                      child: Text(
                        '${widget.originalLanguage}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text('Language',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14)),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          height: 0,
          thickness: 3,
        ),
        const SizedBox(
          height: 20,
        ),
        Text('${widget.overview}', style: Theme.of(context).textTheme.bodyText1)
      ],
    );
  }
}
