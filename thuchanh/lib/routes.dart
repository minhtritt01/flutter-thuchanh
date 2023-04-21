
import 'package:demo/cart/cartpage.dart';
import 'package:demo/detail/productpage.dart';
import 'package:demo/search/searchpage.dart';
import 'package:demo/signin/signinpage.dart';
import 'package:demo/signin_form/splashpage.dart';
import 'package:demo/signup/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'homepage.dart';


final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  SigninPage.routeName: (context) => SigninPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  HomePage.routeName: (context) => HomePage(),
  ProductPage.routeName: (context) => ProductPage(),
  CartPage.routeName: (context) => CartPage(),
  SearchPage.routeName:(context)=> SearchPage(),
};
