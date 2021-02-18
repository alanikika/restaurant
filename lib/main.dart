import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_alan/common/routes.dart';
import 'file:///C:/Users/Pratyaksa/Documents/CROWDE/restaurant_alan/lib/feature/home/home.dart';
import 'package:restaurant_alan/feature/login_register/login_provider.dart';
import 'package:restaurant_alan/feature/login_register/login_screen.dart';
import 'package:restaurant_alan/feature/login_register/register_provider.dart';
import 'package:restaurant_alan/feature/login_register/register_screen.dart';
import 'package:restaurant_alan/feature/menu_navigation.dart';
import 'package:restaurant_alan/model/home_arguments.dart';

import 'common/custom_colors.dart';
import 'common/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          title: Strings.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: CustomColors.primaryColor,
            primaryColorDark: CustomColors.primaryColor,
            primaryColorLight: CustomColors.primaryColor,
            accentColor: CustomColors.primaryColor,
          ),
          home: SafeArea(
            top: false,
            bottom: false,
            child: LoginScreen(),
          ),
          routes: {
            Routes.register: (context) => RegisterScreen(),
            Routes.login: (context) => LoginScreen(),
            Routes.home: (context) => HomeScreen(),
            Routes.navMenu: (context) {
              HomeArguments _homeArguments =
                  ModalRoute.of(context).settings.arguments;
              return MenuNavigation(
                navigationIndex: _homeArguments?.bottomNavigationIndex,
                tabBarIndex: _homeArguments?.tabBarIndex,
              );
            },
          },
        ),
      ),
    );
  }
}
