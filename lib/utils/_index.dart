library foodapp_utils;

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/models/_index.dart';
import 'package:foodapp/screens/home/get_random_recipes_cubit.dart';
import 'package:foodapp/screens/home/home_screen.dart';
import 'package:foodapp/screens/information/get_info_recipes_cubit.dart';
import 'package:foodapp/services/_index.dart';
import 'package:logger/logger.dart';

part 'constants.dart';
part 'foodapp_router.dart';
part 'network.dart';
part 'singletons.dart';
part 'theme.dart';
