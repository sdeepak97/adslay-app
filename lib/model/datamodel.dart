import 'package:flutter/cupertino.dart';

class ThemeBanner {
  final int ThemeBannerId;
  final String Heading;
  final String BannerUrl;
  final String ActionToBeOpen;
  final String ActionValue;

  ThemeBanner(
      {required this.ActionToBeOpen,
      required this.ActionValue,
      required this.Heading,
      required this.ThemeBannerId,
      required this.BannerUrl});

  factory ThemeBanner.fromJson(Map<String, dynamic> json) {
    return ThemeBanner(
        ThemeBannerId: json["ThemeBannerId"] ?? "",
        Heading: json["Heading"] ?? "",
        BannerUrl: json["BannerUrl"] ?? "",
        ActionValue: json["ActionToBeOpen"] ?? "",
        ActionToBeOpen: json["ActionValue"] ?? "");
  }
}

class Categories {
  final int CategoryId;
  final String CategoryName;
  final String ImageUrl;

  Categories({
    required this.CategoryId,
    required this.CategoryName,
    required this.ImageUrl,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      CategoryId: json["CategoryId"] ?? "",
      CategoryName: json["CategoryName"] ?? "",
      ImageUrl: json["ImageUrl"] ?? "",
    );
  }
}

class Stores {
  final int StoreId;
  final String StoreName;
  final String City;
  final String State;
  final String Country;
  final String ImageUrl;

  Stores({
    required this.StoreId,
    required this.StoreName,
    required this.City,
    required this.State,
    required this.Country,
    required this.ImageUrl,
  });

  factory Stores.fromJson(Map<String, dynamic> json) {
    return Stores(
      StoreId: json["StoreId"] ?? "",
      StoreName: json["StoreName"] ?? "",
      City: json["City"] ?? "",
      State: json["State"] ?? "",
      Country: json["Country"] ?? "",
      ImageUrl: json["ImageUrl"] ?? "",
    );
  }
}

class StoreDetails {
  final String Type;
  final String ScreenSize;
  final String FileFormat;
  final String FootTraffic;
  final double ActualPrice;

  StoreDetails({
    required this.Type,
    required this.ScreenSize,
    required this.FileFormat,
    required this.FootTraffic,
    required this.ActualPrice,
  });

  factory StoreDetails.fromJson(Map<String, dynamic> json) {
    return StoreDetails(
      Type: json["Type"] ?? "",
      ScreenSize: json["ScreenSize"] ?? "",
      FileFormat: json["FileFormat"] ?? "",
      FootTraffic: json["FootTraffic"] ?? "",
      ActualPrice: json["ActualPrice"] ?? "",
    );
  }
}

class CountriesList {
  final int CountryId;
  final String CountryName;

  CountriesList({required this.CountryId, required this.CountryName});

  factory CountriesList.fromJson(Map<String, dynamic> json) {
    return CountriesList(
      CountryId: json["CountryId"] ?? "",
      CountryName: json["CountryName"] ?? "",
    );
  }
}

class FormCategories {
  final int CategoryId;
  final String CategoryName;

  FormCategories({required this.CategoryId, required this.CategoryName});

  factory FormCategories.fromJson(Map<String, dynamic> json) {
    return FormCategories(
      CategoryId: json["CategoryId"] ?? "",
      CategoryName: json["CategoryName"] ?? "",
    );
  }
}

class States {
  final int StateId;
  final String StateName;

  States({required this.StateId, required this.StateName});

  factory States.fromJson(Map<String, dynamic> json) {
    return States(
      StateId: json["StateId"] ?? "",
      StateName: json["StateName"] ?? "",
    );
  }
}
