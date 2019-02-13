#!/usr/bin/env dart
// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Displays the log for a failing test on a given runner and build
    
import 'dart:async';
import 'dart:io';

import 'package:log/src/get_log.dart';
import 'package:args/args.dart';

void main(List<String> args) {
  final parser = new ArgParser();
  parser.addOption("builder",
      abbr: "b",
      help: "Fetch log from this builder");
  parser.addOption("build-number",
      abbr: "n",
      defaultsTo: "latest",
      help: "Fetch log from this build on the chosen builder");
  parser.addOption("test",
      abbr: "t",
      help: "Fetch log for this test on the chosen builder");
  parser.addFlag("help", help: "Show the program usage.", negatable: false);

  final options = parser.parse(args);
  final builder = options["builder"];
  final test = options["test"];
  final build = options["build-number"];

  getLog(builder, build, test).then((log) => print(log));
}
