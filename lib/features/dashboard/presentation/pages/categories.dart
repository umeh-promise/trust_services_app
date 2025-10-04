import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/sizes.dart';
import 'package:trust_services_app/core/widgets/heading.dart';
import 'package:trust_services_app/core/widgets/scaffold_title.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/categories.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/category_card.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/search_bar.dart';

class CategoriesScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (ctx) => CategoriesScreen());
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ScaffoldTitle('Categories')),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.base),
        child: Column(
          spacing: Sizes.base,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWithIcon(),
            Heading('All Categories'),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryCard(
                    name: category['name'] as String,
                    available: category['available'] as int,
                    icon: category['icon'] as String,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
