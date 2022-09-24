import 'package:adslay/core/api_services.dart';
import 'package:adslay/model/datamodel.dart';
import 'package:flutter/material.dart';

class FormPageView extends StatefulWidget {
  const FormPageView({super.key});

  @override
  State<FormPageView> createState() => _FormPageViewState();
}

class _FormPageViewState extends State<FormPageView> {
  String dropdownValueCategory = 'Select Category';
  String dropdownValueCountry = 'Select Country';
  String dropdownValueState = 'Select State';

  List<CountriesList> _countriesList = [];
  List<FormCategories> _formCategories = [];
  List<States> _states = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    fetchCountriesList();
    fetchFormCategories();
    fetchStates();
    _countriesList = getCountriesList();
    _formCategories = getFormCategories();
    _states = getStates();
    // As list should have the default value with-in to render
    _countriesList
        .add(CountriesList(CountryId: 0, CountryName: dropdownValueCountry));
    _formCategories.add(
        FormCategories(CategoryId: 1, CategoryName: dropdownValueCategory));
    _states.add(States(StateId: 0, StateName: dropdownValueState));
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
          // FutureBuilder(
          //   future: getData(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.hasData) {
          //       return
          Column(
        children: [
          Container(
            // width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 40, right: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _countriesList.clear();
                      _formCategories.clear();
                      _states.clear();
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
                ],
              ),
            ),
          ),
          SingleChildScrollView(
              // controller: controller,
              child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Container(
                    // margin: const EdgeInsets.only(top: 20),
                    // height: 700,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 20),
                          child: Text(
                            " VENDOR REGISTRATION",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 5),
                          child: Divider(
                              thickness: 1, endIndent: 250, color: Colors.blue),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 20, right: 20),
                            child: TextFormField(

                                // controller: searchcontroller,
                                decoration: const InputDecoration(
                                    hintText: "Enter your  name",
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 18.00, bottom: 18.00)),
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500))),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 20, right: 20),
                            child: TextFormField(

                                // controller: searchcontroller,
                                decoration: const InputDecoration(
                                    hintText: "Enter your Store Name",
                                    // hintStyle: ,

                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 18.00, bottom: 18.00)),
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500))),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 20, right: 20),
                            child: TextFormField(

                                // controller: searchcontroller,
                                decoration: const InputDecoration(
                                    hintText: "Enter your Email",
                                    // hintStyle: ,

                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 18.00, bottom: 18.00)),
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500))),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 20, right: 20),
                            child: TextFormField(
                                // controller: searchcontroller,
                                decoration: const InputDecoration(
                                    hintText: "+1   Enter your Mobile No.",
                                    // hintStyle: ,

                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 18.00, bottom: 18.00)),
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500))),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 20, right: 20),
                            child: TextFormField(

                                // controller: searchcontroller,
                                decoration: const InputDecoration(
                                    hintText: "Enter your Address",
                                    // hintStyle: ,

                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 18.00, bottom: 18.00)),
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500))),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: DropdownButton<String>(
                        // underline: const SizedBox(),
                        autofocus: true,
                        isExpanded: true,
                        // hint: Text('$dropdownValue',style: TextStyle(fontSize: 10),),
                        // Step 3.
                        value: dropdownValueCategory.isNotEmpty
                            ? dropdownValueCategory
                            : null,
                        // Step 4.
                        items: _formCategories
                            .map((e) => e.CategoryName)
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueCategory = newValue!;
                          });
                        },
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Container(
                        width: 150,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: DropdownButton<String>(
                            // underline: const SizedBox(),
                            autofocus: true,
                            isExpanded: true,
                            // hint: Text('$dropdownValue',style: TextStyle(fontSize: 10),),
                            // Step 3.
                            value: dropdownValueCountry.isNotEmpty
                                ? dropdownValueCountry
                                : null,
                            // Step 4.
                            items: _countriesList
                                .map((e) => e.CountryName)
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }).toList(),
                            // Step 5.
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValueCountry = newValue!;
                              });
                            },
                          ),
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Container(
                        width: 150,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: DropdownButton<String>(
                            // underline: const SizedBox(),
                            autofocus: true,
                            isExpanded: true,
                            // hint: Text('$dropdownValue',style: TextStyle(fontSize: 10),),
                            // Step 3.
                            value: dropdownValueState.isNotEmpty
                                ? dropdownValueState
                                : null,
                            // Step 4.
                            items: _states
                                .map((e) => e.StateName)
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }).toList(),
                            // Step 5.
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValueState = newValue!;
                              });
                            },
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5, top: 20),
                    child: Container(
                      width: 180,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 20, right: 20),
                          child: TextFormField(

                              // controller: searchcontroller,
                              decoration: const InputDecoration(
                                  hintText: "Enter your  name",
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 10, top: 18.00, bottom: 18.00)),
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 20),
                    child: Container(
                      width: 190,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 20, right: 10),
                          child: TextFormField(

                              // controller: searchcontroller,
                              decoration: const InputDecoration(
                                  hintText: "Enter your  name",
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 10, top: 18.00, bottom: 18.00)),
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FormPageView()));
                      },
                      child: const Text(
                        "Registration",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ),
              )
            ],
          )),
        ],
      ),
      //     } else {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}
