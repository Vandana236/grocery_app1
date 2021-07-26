import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_onlineapp/generators/search_screen_items_generator.dart';
import 'package:grocery_onlineapp/screens/search_results_screen.dart';
import 'package:grocery_onlineapp/utils/navigation_utils.dart';
import 'package:grocery_onlineapp/widgets/chip_imenu.dart';
import 'package:grocery_onlineapp/widgets/my_text_box.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 32,
                  ),
                  child: SearchScreenHeader(textTheme: textTheme),
                ),
                Text(
                  "Trending",
                  style: textTheme.headline6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ChipMenu(
                    listItems: TRENDING_ITEMS_LIST,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Recent Searches",
                    style: textTheme.headline6,
                  ),
                ),
                ListView.builder(
                  itemCount: RECENT_SEARCH_LIST.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    leading: Icon(
                      Icons.history_outlined,
                    ),
                    title: Text(
                      RECENT_SEARCH_LIST[index],
                      style: textTheme.bodyText1,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchScreenHeader extends StatelessWidget {
  const SearchScreenHeader({
    Key key,
    @required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyTextBox(
          autofocus: true,
          suffixIcon: Icon(
            Icons.cancel,
            color: Theme.of(context).primaryColor,
          ),
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Colors.grey[800],
          ),
          hintText: "Search products...",
          textCapitalization: TextCapitalization.words,
          onChanged: (value) {},
          onEditingComplete: () => Navigator.of(context).push(
              NavigationUtils.createAnimatedRoute(1.0, SearchResultsScreen())),
        ),
        SizedBox(width: 16),
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "Cancel",
            style: textTheme.bodyText1.copyWith(
              color: Colors.grey[800],
            ),
          ),
        )
      ],
    );
  }
}
