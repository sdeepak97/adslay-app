import 'dart:convert';
import 'dart:developer';

import 'package:adslay/model/datamodel.dart';
import 'package:http/http.dart' as http;

late StoreDetails storeDetails;

List<Categories> CategoriesList = [];
List<ThemeBanner> ThemeBannersList = [];
List<Stores> StoresList = [];
List<CountriesList> countriesList = [];
List<FormCategories> formCategories = [];
List<States> states = [];

Future<void> FetchData() async {
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  final body = {"MobileNo": 9999999999}.toString();

  try {
    final response = await http.post(
        Uri.parse("http://adslay.arjunweb.in/API/HomeAPI/HomeScreenAPI"),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      item["CategoriesList"].forEach((item) {
        CategoriesList.add(Categories.fromJson(item));
      });
      item["ThemeBannersList"].forEach((item) {
        ThemeBannersList.add(ThemeBanner.fromJson(item));
      });
      item["StoresList"].forEach((item) {
        StoresList.add(Stores.fromJson(item));
      });
    } else {
      log("error");
    }
  } catch (e) {
    log(e.toString());
  }
}

Future<void> fetchStoreDetails({required int storeId}) async {
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  final body = {"Mobile": 9999999999, "StoreId": storeId}.toString();

  try {
    final response = await http.post(
        Uri.parse("http://adslay.arjunweb.in/API/StoresAPI/StoreDetails"),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      storeDetails = StoreDetails.fromJson(item);
    } else {
      log("error");
    }
  } catch (e) {
    log(e.toString());
  }
}

Future<void> fetchCountriesList() async {
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  try {
    final response = await http.get(
        Uri.parse("http://adslay.arjunweb.in/API/HomeAPI/CountriesList"),
        headers: headers);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      item["CountriesList"].forEach((item) {
        countriesList.add(CountriesList.fromJson(item));
      });
    } else {
      log("error");
    }
  } catch (e) {
    log(e.toString());
  }
}

Future<void> fetchFormCategories() async {
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  try {
    final response = await http.get(
        Uri.parse("http://adslay.arjunweb.in/API/HomeAPI/CategoriesList"),
        headers: headers);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      item["CategoriesList"].forEach((item) {
        formCategories.add(FormCategories.fromJson(item));
      });
    } else {
      log("error");
    }
  } catch (e) {
    log(e.toString());
  }
}

Future<void> fetchStates() async {
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  final body = {"CountryId": 1}.toString();

  try {
    final response = await http.post(
        Uri.parse("http://adslay.arjunweb.in/API/HomeAPI/StatesList"),
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      item["StatesList"].forEach((item) {
        states.add(States.fromJson(item));
      });
    } else {
      log("error");
    }
  } catch (e) {
    log(e.toString());
  }
}

List<Categories> getCategoriesList() {
  return CategoriesList;
}

List<ThemeBanner> getThemeBannerList() {
  return ThemeBannersList;
}

List<Stores> getStoresList() {
  return StoresList;
}

List<CountriesList> getCountriesList() {
  return countriesList;
}

List<FormCategories> getFormCategories() {
  return formCategories;
}

List<States> getStates() {
  return states;
}

StoreDetails getStoreDetails() {
  return storeDetails;
}
