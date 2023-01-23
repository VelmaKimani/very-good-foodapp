library foodapp_utils;

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/authentication/cubit/firebase_sign_up_cubit.dart';
import 'package:foodapp/authentication/google%20sign%20in/google_sign_in_cubit.dart';
import 'package:foodapp/authentication/google%20sign%20in/google_sign_in_screen.dart';
import 'package:foodapp/authentication/sign%20up/sign_up_screen.dart';
import 'package:foodapp/authentication/sign%20up/signup_cubit.dart';
import 'package:foodapp/models/_index.dart';
import 'package:foodapp/screens/home/get_random_recipes_cubit.dart';
import 'package:foodapp/screens/home/home_screen.dart';
import 'package:foodapp/screens/information/get_info_recipes_cubit.dart';
import 'package:foodapp/screens/landing_screen.dart';
import 'package:foodapp/screens/search/get_search_recipe_cubit.dart';
import 'package:foodapp/screens/search/search_screen.dart';
import 'package:foodapp/screens/success_screen.dart';
import 'package:foodapp/services/_index.dart';
import 'package:logger/logger.dart';

part 'constants.dart';
part 'foodapp_router.dart';
part 'network.dart';
part 'singletons.dart';
part 'theme.dart';
