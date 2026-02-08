import 'package:flutter/material.dart';

extension GetSize on double {
  // Height based
  double h(BuildContext context) {
    return MediaQuery.of(context).size.height * this;
  }

  // Width based
  double w(BuildContext context) {
    return MediaQuery.of(context).size.width * this;
  }

  // Font size
  double toresponsive(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return (size.width + size.height) / 2 * this;
  }
}
