import 'package:flutter/material.dart';
import 'package:movie_catalogue/detail_screen.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_catalogue/model/movie.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text('Movie Catalogue'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 15.0, top: 20.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'What movie are you looking',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15.0, top: 8.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'forward to seeing?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15.0, top: 25.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Container(
                      width: 300,
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              contentPadding: const EdgeInsets.all(16.0),
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              filled: true,
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              fillColor: Colors.grey[200],
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: RaisedButton(
                            color: Colors.orange,
                            child: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: DefaultTabController(
                  length: 3,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            child: TabBar(
                              tabs: [
                                Tab(
                                  text: "All",
                                ),
                                Tab(
                                  text: "Action",
                                ),
                                Tab(
                                  text: "Play",
                                ),
                              ],
                              labelColor: Colors.white,
                              indicator: MaterialIndicator(
                                  height: 5,
                                  topLeftRadius: 8,
                                  topRightRadius: 8,
                                  horizontalPadding: 50,
                                  tabPosition: TabPosition.bottom,
                                  color: Colors.orange),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 20, right: 12, bottom: 50),
                child: Column(
                  children: movieList.map((movie) {
                    return FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return DetailScreen(
                              movie: movie,
                            );
                          }),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Image.asset(movie.imageAsset),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      movie.name,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      movie.description,
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: RatingBar(
                                        initialRating: 4,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 24,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

var movieList = [
  Movie(
      name: 'Mulan',
      description:
          'When the Emperor of China issues a decree that one man per family must serve in the Imperial Chinese Army to defend the country from.',
      imageAsset: 'images/1.png',
      imageDetail: 'images/detail1.png'),
  Movie(
      name: 'Ava',
      description:
          'A black ops assassin is forced to fight for her own survival after a job goes dangerously wrong.',
      imageAsset: 'images/2.png',
      imageDetail: 'images/detail1.png'),
  Movie(
      name: 'Rogue',
      description:
          'Battle-hardened O’Hara leads a lively mercenary team of soldiers on a daring mission: rescue hostages from their captors in remote Africa.',
      imageAsset: 'images/3.png',
      imageDetail: 'images/detail1.png'),
];
