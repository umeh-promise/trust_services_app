import 'package:flutter/material.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';

class CategoriesScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (ctx) => CategoriesScreen());
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: ScaffoldTitle('Categories')));
  }
}
