// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/bootstrap.dart';
import 'package:foodapp/device_setup.dart';
import 'package:foodapp/firebase_options.dart';
import 'package:foodapp/utils/_index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FoodAppConfig(
    values: FoodAppValues(
      baseDomain: 'https://api.spoonacular.com/recipes',
    ),
  );

  await bootstrap(
    () => MultiBlocProvider(
      providers: Singletons.registerCubits(),
      child: const DeviceSetUp(),
    ),
  );
}
