import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final name;
  final List? type;
  final image;
  final num;
  final colorfull;

  const DetailScreen({
    Key? key,
    this.name,
    this.image,
    this.num,
    this.type,
    this.colorfull,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.colorfull,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: width * 0.06,
                    )),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: width * 0.06,
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Text(
                widget.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    '#${widget.num}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                children: List.generate(
                  widget.type!.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: height * 0.007),
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(width * 0.04)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03, vertical: height * 0.007),
                      child: Text(
                        widget.type![index].toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.0350,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: height * 0.526,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(width * 0.08),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TabBar(
                        indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                          color: Color(0xffA23BEC),
                          width: 2,
                        )),
                        indicatorPadding:
                            EdgeInsets.symmetric(horizontal: width * 0.05),
                        labelPadding:
                            EdgeInsets.symmetric(vertical: height * 0.01),
                        labelColor: Colors.black,
                        controller: tabController,
                        tabs: [
                          Tab(
                            icon: null,
                            text: 'About',
                          ),
                          Tab(
                            icon: null,
                            text: 'Base stats',
                          ),
                          Tab(
                            icon: null,
                            text: 'Evolution',
                          ),
                          Tab(
                            icon: null,
                            text: 'Moves',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(controller: tabController, children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "Species",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: width * 0.04),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "Height",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: width * 0.04),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "Width",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: width * 0.04),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "Abilities",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: width * 0.04),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: width * 0.150,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "Seed",
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.bold,
                                              fontSize: width * 0.04),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "2'3.6*(0.70 cm)",
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.bold,
                                              fontSize: width * 0.04),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "15.2 Ibl(6.9 kg)",
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.bold,
                                              fontSize: width * 0.04),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "Overgrow,Chiorophyl",
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.bold,
                                              fontSize: width * 0.04),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                Text(
                                  "Breeding",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Gender",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: width * 0.04),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "Egg Groups",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: width * 0.04),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "Egg Cycle",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: width * 0.04),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: width * 0.150,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.male_rounded,
                                              color: Colors.green,
                                            ),
                                            Text(
                                              "87.5%",
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: width * 0.04),
                                            ),
                                            SizedBox(
                                              width: width * 0.070,
                                            ),
                                            Icon(
                                              Icons.female_rounded,
                                              color: Colors.redAccent,
                                            ),
                                            Text(
                                              "12.5%",
                                              style: TextStyle(
                                                  color: Colors.grey.shade800,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: width * 0.04),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "Monster",
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.bold,
                                              fontSize: width * 0.04),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Text(
                                          "Grass",
                                          style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.bold,
                                              fontSize: width * 0.04),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "HP",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "Attack",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "Defense",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "Sp.Atk",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "Sp.Def",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "Speed",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "Total",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: width * 0.04),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: width * 0.150,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "45",
                                            style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "60",
                                            style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "48",
                                            style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "65",
                                            style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "65",
                                            style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "45",
                                            style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.04),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Text(
                                            "317",
                                            style: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.04),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.05,
                                              right: width * 0.03),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: height * 0.02,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: width * 0.170),
                                                child: Divider(
                                                  color: Color(0xffFC6C6C),
                                                  thickness: 3,
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.025,
                                              ),
                                              Divider(
                                                color: Color(0xff49D0B0),
                                                thickness: 3,
                                              ),
                                              SizedBox(
                                                height: height * 0.02,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: width * 0.2),
                                                child: Divider(
                                                  color: Color(0xffFC6C6C),
                                                  thickness: 3,
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.02,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: width * 0.03),
                                                child: Divider(
                                                  color: Color(0xff49D0B0),
                                                  thickness: 3,
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.02,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: width * 0.05),
                                                child: Divider(
                                                  color: Color(0xff49D0B0),
                                                  thickness: 3,
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.02,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: width * 0.250),
                                                child: Divider(
                                                  color: Color(0xffFC6C6C),
                                                  thickness: 3,
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.025,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: width * 0.09),
                                                child: Divider(
                                                  color: Color(0xff49D0B0),
                                                  thickness: 3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.04,
                                  ),
                                  Text(
                                    "Type defenses",
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.04),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Text(
                                    "The effectiveness of each type on Charmander.",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: width * 0.04),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                              child: Text("NEWS",
                                  style: TextStyle(color: Colors.grey))),
                          Center(
                              child: Text("NEWS",
                                  style: TextStyle(color: Colors.grey))),
                        ]),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -190,
                  left: 40,
                  child: Image.network(
                    widget.image,
                    height: height * 0.380,
                    width: width * 0.8,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
