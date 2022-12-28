import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api_services/pokemon_api_services.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/view/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> colors = [
    Color(0xff49D0B0),
    Color(0xffFC6C6C),
    Color(0xff77BEFD),
    Color(0xffFED76E)
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: Colors.deepPurpleAccent.shade100,
        child: Icon(
          Icons.tune,
          color: Colors.white,
          size: width * 0.08,
        ),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: width * 0.06,
                  )),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.view_list,
                    color: Colors.black,
                    size: width * 0.06,
                  ))
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              "Pokedex",
              style: TextStyle(
                color: Colors.black,
                fontSize: width * 0.07,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          FutureBuilder(
            future: PokemonApiServices.getpokemondata(),
            builder:
                (BuildContext context, AsyncSnapshot<PokemonModel?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Expanded(
                  child: Scrollbar(
                    thickness: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: GridView.builder(
                        itemCount: snapshot.data!.pokemon!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 3.5 / 3),
                        itemBuilder: (BuildContext context, int index) {
                          final pokemon = snapshot.data!.pokemon![index];

                          int colorindex = (index / 3).toInt();
                          while (colorindex > 3) {
                            colorindex -= 3;
                          }

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      image: pokemon.img.toString(),
                                      type: pokemon.type!,
                                      name: pokemon.name,
                                      num: pokemon.num,
                                      colorfull: colors[colorindex],
                                    ),
                                  ));
                            },
                            child: Container(
                              // height: height * 0.150,
                              // width: height * 0.150,
                              decoration: BoxDecoration(
                                color: colors[colorindex],
                                borderRadius:
                                    BorderRadius.circular(width * 0.05),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.04, top: height * 0.03),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pokemon.name.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.0400,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      top: 25,
                                      child: Column(
                                        children: List.generate(
                                          pokemon.type!.length,
                                          (index) => Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: height * 0.007),
                                            decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width * 0.04)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width * 0.03,
                                                  vertical: height * 0.007),
                                              child: Text(
                                                pokemon.type![index].toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: width * 0.0350,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: -5,
                                      child: Image.network(
                                        pokemon.img.toString(),
                                        height: height * 0.140,
                                        width: width * 0.220,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return Center(child: CupertinoActivityIndicator());
              }
            },
          )
        ]),
      ),
    );
  }
}
