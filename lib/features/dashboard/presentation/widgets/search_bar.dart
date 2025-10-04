import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trust_services_app/core/theme/colors.dart';
import 'package:trust_services_app/core/theme/sizes.dart';

class SearchBarWithIcon extends StatefulWidget {
  const SearchBarWithIcon({super.key});

  @override
  State<SearchBarWithIcon> createState() => _SearchBarWithIconState();
}

class _SearchBarWithIconState extends State<SearchBarWithIcon> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Sizes.base),
      decoration: BoxDecoration(
        color: AppPallete.grey100,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          SvgPicture.asset('./assets/img/search.svg'),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Service',
                fillColor: AppPallete.transparentColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppPallete.transparentColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppPallete.transparentColor),
                ),
              ),
              controller: _searchController,
            ),
          ),
          SvgPicture.asset('./assets/img/line.svg'),
          SizedBox(width: Sizes.xs),
          SvgPicture.asset('./assets/img/bar.svg'),
        ],
      ),
    );
  }
}
