import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_text_form_field.dart';

import '../browse_screen/movies_list.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  SearchTabState createState() => SearchTabState();
}

class SearchTabState extends State<SearchTab> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
                  SizedBox(
          height: height * .05,
        ),
          CustomTextFormField(
              prefixIcon: Image.asset(ImageAssets.searchIcon),
              hintText: AppLocalizations.of(context)!.search),

          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Movieslist();
                  })),
        ],
      ),
    );
  }




}
