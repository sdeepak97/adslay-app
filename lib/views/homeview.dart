import 'package:adslay/core/api_services.dart';
import 'package:adslay/model/datamodel.dart';
import 'package:adslay/views/storepage.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  List<Categories> _categories = [];
  List<ThemeBanner> _banners = [];
  List<Stores> _stores = [];
  late Future<String> _str;

  @override
  void initState() {
    super.initState();
    _str = getdata();
  }

  Future<String> getdata() async {
    await FetchData();
    _categories = getCategoriesList();
    _banners = getThemeBannerList();
    _stores = getStoresList();
    return "heew";
  }

  int activeindex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 40, right: 10),
            child: Row(
              children: [
                const Icon(Icons.menu),
                const Text(
                  "ADSLAY",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 180,
                ),
                Stack(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: const Offset(0, 2))
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                    ),
                    const Positioned(
                        top: 3,
                        left: 3,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.blue,
                        ))
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Stack(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: const Offset(0, 2))
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                    ),
                    const Positioned(
                        top: 3,
                        left: 3,
                        child: Icon(
                          Icons.search,
                          color: Colors.red,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 150,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 10),
                  child: Column(
                    children: [
                      FutureBuilder<String>(
                          future: _str,
                          builder: ((context, snapshot) {
                            return CarouselSlider.builder(
                              itemCount: _banners.length,
                              itemBuilder: (context, index, realIndex) {
                                final urlImage = _banners[index].BannerUrl;
                                return buildImage(urlImage, index);
                              },
                              options: CarouselOptions(
                                  height: 200,
                                  // autoPlay: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeindex = index;
                                    });
                                  },
                                  pageSnapping: false,
                                  enableInfiniteScroll: false,
                                  viewportFraction: 1),
                            );
                          })),

                      const SizedBox(
                        height: 20,
                      ),
                      // buildIndicator(),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 0),
                  child: Text(
                    "Ad Space Categories",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    child: FutureBuilder(
                      future: _str,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 220,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: _categories.length,
                            itemBuilder: ((context, index) {
                              final urlimage = _categories[index].ImageUrl;
                              return Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child:
                                        Center(child: Image.network(urlimage)),
                                  ),
                                  Positioned(
                                      right: 20,
                                      bottom: 20,
                                      child: Container(
                                        height: 10,
                                        width: 10,
                                        child: const Icon(
                                          Icons.arrow_circle_right_outlined,
                                          color: Colors.white,
                                        ),
                                      )),
                                  Positioned(
                                      left: 8,
                                      bottom: 5,
                                      child: Container(
                                        alignment: Alignment.bottomLeft,
                                        height: 40,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Colors.black.withOpacity(0.4),
                                                  Colors.grey.withOpacity(0.6),
                                                ],
                                                stops: const [
                                                  0.2,
                                                  0.4,
                                                ])),
                                        child: Text(
                                          _categories[index].CategoryName,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                ],
                              );
                            }));
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Featured Ad Spaces",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: FutureBuilder(
                    future: _str,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Container(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: _stores.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    // height: 120,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    StorePageView(
                                                      storeid:_stores[index].StoreId,
                                                      storenamme: _stores[index]
                                                          .StoreName,
                                                      city: _stores[index].City,
                                                      state:
                                                          _stores[index].State,
                                                      country: _stores[index]
                                                          .Country,
                                                      imageurl: _stores[index]
                                                          .ImageUrl,
                                                    )));
                                      },
                                      child: Material(
                                        elevation: 4,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          height: 120,
                                          width: 200,
                                          child: Image.network(
                                              _stores[index].ImageUrl),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              _stores[index].StoreName,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Text(
                                              " - ",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              _stores[index].City,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              _stores[index].State,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Text(
                                              " - ",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              _stores[index].Country,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImage(String imageurl, int index) => Container(
        width: 350,
        // margin: EdgeInsets.symmetric(horizontal: 20),
        // color: Colors.grey,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
        child: Image.network(
          imageurl,
          fit: BoxFit.fill,
        ),
      );
}
