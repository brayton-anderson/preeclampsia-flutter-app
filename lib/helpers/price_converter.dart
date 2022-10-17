import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class PriceConverter {
  static String? convertPrice(BuildContext context, double price,
      {double? discount, String? discountType}) {
    if (discount != null) {
      if (discountType == 'amount') {
        price = price - discount;
      } else if (discountType == 'percent') {
        price = price - ((discount / 100) * price);
      }
    }
    bool? isLeft;
    //= Provider.of<SplashProvider>(context, listen: false).configModel.currencySymbolPosition == 'left';
    return isLeft.toString();
    // ? '${Provider.of<SplashProvider>(context, listen: false).configModel.currencySymbol} '
    //     '${(price).toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'
    //     : '${(price).toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'
    //     ' ${Provider.of<SplashProvider>(context, listen: false).configModel.currencySymbol}';
  }

  static double convertWithDiscount(BuildContext context, double price,
      double discount, String discountType) {
    if (discountType == 'amount') {
      price = price - discount;
    } else if (discountType == 'percent') {
      price = price - ((discount / 100) * price);
    }
    return price;
  }

  static double calculation(
      double amount, double discount, String type, int quantity) {
    double calculatedAmount = 0;
    if (type == 'amount') {
      calculatedAmount = discount * quantity;
    } else if (type == 'percent') {
      calculatedAmount = (discount / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String percentageCalculation(BuildContext context, String price,
      double discount, String discountType) {
    return
        // $discount${discountType ==
        'percent';
    // ? '%' : '${Provider.of<SplashProvider>(context, listen: false).configModel.currencySymbol}'} OFF';
  }
}

class UserIdentifier {
  static String userIdentity(String? value) {
    String? values;
    var substr1 = value.toString().substring(33, 225); 
    var substr2 = substr1.toString().substring(0, 160);
    if (substr2 == dotenv.env['UZR_M'].toString()) {
      values = "user";
    } else if (substr2 == dotenv.env['MEX_P'].toString()) {
      values = "mentor";
    } else {
      if (kDebugMode) {
        print("object---wrong");
      }
      values = "wrong";
    }
    return values;
  }
}
