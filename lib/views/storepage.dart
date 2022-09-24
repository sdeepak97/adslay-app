import 'package:adslay/core/api_services.dart';
import 'package:adslay/model/datamodel.dart';
import 'package:adslay/views/formpage.dart';
import 'package:flutter/material.dart';

class StorePageView extends StatefulWidget {
  final int storeid;
  final String imageurl;
  final String storenamme;
  final String city;
  final String state;
  final String country;

  const StorePageView({
    super.key,
    required this.storenamme,
    required this.city,
    required this.state,
    required this.country,
    required this.imageurl,
    required this.storeid,
  });

  @override
  State<StorePageView> createState() => _StorePageViewState();
}

class _StorePageViewState extends State<StorePageView> {
  late StoreDetails _storeDetails;

  Future<String> getData() async {
    print(widget.storeid);
    await fetchStoreDetails(storeId: widget.storeid);
    _storeDetails = getStoreDetails();
    print(_storeDetails.ActualPrice);
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  // width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 40, right: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_circle_left_outlined,
                            size: 30,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "ADSLAY",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 140,
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
                  child: Material(
                    elevation: 10,
                    child: Container(
                      height: 300,
                      child: Center(child: Image.network(widget.imageurl)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 10, top: 10),
                  child: Row(
                    children: [
                      Text(
                        widget.storenamme,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        ",",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.city,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        ",",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.state,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        ",",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.country,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
                  child: Material(
                    elevation: 10,
                    child: Container(
                      height: 190,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              "ADDITIONAL INFO",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 120, top: 5),
                            child: Divider(
                                color: Colors.black,
                                height: 2,
                                thickness: 1,
                                endIndent: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Row(
                              children: [
                                const Text(
                                  "Type                : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                ),
                                Container(
                                  width: 220,
                                  child: Text(
                                    _storeDetails.Type,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Row(
                              children: [
                                const Text(
                                  "Ad Screen      : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  _storeDetails.ScreenSize,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Row(
                              children: [
                                const Text(
                                  "File Formate  : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  _storeDetails.FileFormat,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Row(
                              children: [
                                const Text(
                                  "Foot Traffic    : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  _storeDetails.FootTraffic,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: Row(
                              children: [
                                const Text(
                                  "Cost                : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  _storeDetails.ActualPrice.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 60,
                    width: 180,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormPageView()));
                        },
                        child: const Text(
                          "Book Now",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
