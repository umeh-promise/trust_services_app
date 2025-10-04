import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/sizes.dart';
import 'package:trust_services_app/core/utils/route_manager.dart';
import 'package:trust_services_app/features/dashboard/presentation/pages/categories.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/category_card.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/home_heading.dart';

final categories = [
  {'name': 'Events', 'available': 2, 'icon': 'assets/img/calender.svg'},
  {'name': 'Saloon', 'available': 22, 'icon': 'assets/img/comb.svg'},
  {'name': 'Cleaning', 'available': 15, 'icon': 'assets/img/calender.svg'},
  {'name': 'Plumbing', 'available': 8, 'icon': 'assets/img/comb.svg'},
  {'name': 'Electrical', 'available': 12, 'icon': 'assets/img/calender.svg'},
];

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeading(
            onPressed: () => Routes.push(CategoriesScreen.route()),
            title: 'Categories',
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(
                  name: category['name'] as String,
                  available: category['available'] as int,
                  icon: category['icon'] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
