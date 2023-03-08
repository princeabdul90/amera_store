/*
* Developer: Abubakar Abdullahi
* Date: 03/02/2023
*/

import 'package:category/category.dart';
import 'package:category/src/categories/categories.dart';
import 'package:component_library/component_library.dart';
import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';



class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key, required this.onTapSearch, required this.onTapCategoryItem}) : super(key: key);

  final VoidCallback onTapSearch;
  final VoidCallback onTapCategoryItem;

  @override
  Widget build(BuildContext context) {
    return CategoryView(onTapSearch: onTapSearch, onTapCategoryItem: onTapCategoryItem,);
  }
}

@visibleForTesting
class CategoryView extends StatefulWidget {
  const CategoryView({Key? key, required this.onTapSearch, required this.onTapCategoryItem}) : super(key: key);

  final VoidCallback onTapSearch;
  final VoidCallback onTapCategoryItem;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final PageController _pageController = PageController();
   int selectedCategory = -1;


  @override
  void initState() {
    var index = 0;
    selectedCategory = index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = CategoryScreenLocalizations.of(context);
    final size = Spacing.getSize(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: CustomSearchBar(
          searchTitle: l10n.searchFieldTextLabel,
          buttonLabel: l10n.searchButtonLabel,
          onTap: widget.onTapSearch,
        ),
      ),
      body: Stack(
        children: [
           Positioned(
            left: 0,
            bottom: 0,
            child: sideNavigation(size,),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: mainContent(size),
          ),
        ],
      ),
    );
  }

  /// Side Category
  Widget sideNavigation(Size size) {
    return SizedBox(
      height: size.height * 0.88,
      width: size.width * 0.2,
      child: ListView.builder(
        itemCount: Category.values.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedCategory = index;
                //_pageController.jumpToPage(index);
                _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceInOut
                );
              });
            },
            child: Container(
              color: selectedCategory == index
                  ? AppColorStyles.grayLightColor
                  : AppColorStyles.accentOrangeColor,

              height: Spacing.getHeight(70),
              child: Center(
                  child: Text(
                    Category.values[index].toLocalizedString(context),
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  )
              ),
            ),
          );
        },
      ),
    );
  }
  /// Main Category Content
  Widget mainContent(Size size) {
    return Container(
      height: size.height * 0.88,
      width: size.width * 0.8,
      color: AppColorStyles.whiteColor,
      child: PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        onPageChanged: (value){
          setState(() {
            if(selectedCategory != value){
              selectedCategory = value;
            }
          });
        },
        children:  [
          Men(onTapCategoryItem: widget.onTapCategoryItem,),
          Women(onTapCategoryItem: widget.onTapCategoryItem,),
          Shoes(onTapCategoryItem: widget.onTapCategoryItem,),
          Bags(onTapCategoryItem: widget.onTapCategoryItem,),
          Electronics(onTapCategoryItem: widget.onTapCategoryItem,),
          Accessories(onTapCategoryItem: widget.onTapCategoryItem,),
          HomeAndGarden(onTapCategoryItem: widget.onTapCategoryItem,),
          Beauty(onTapCategoryItem: widget.onTapCategoryItem,),
          Kids(onTapCategoryItem: widget.onTapCategoryItem,),
        ],
      ),
    );
  }
}



extension on Category {
  String toLocalizedString(BuildContext context) {
    final l10n = CategoryScreenLocalizations.of(context);
    switch (this) {
      case Category.men:
        return l10n.menCategoryLabel;
      case Category.women:
        return l10n.womenCategoryLabel;
      case Category.shoes:
        return l10n.shoesCategoryLabel;
      case Category.bags:
        return l10n.bagsCategoryLabel;
      case Category.electronics:
        return l10n.electronicsCategoryLabel;
      case Category.accessories:
        return l10n.accessoriesCategoryLabel;
      case Category.homeAndGarden:
        return l10n.homeAndGardenCategoryLabel;
      case Category.beauty:
        return l10n.beautyCategoryLabel;
      case Category.kids:
        return l10n.kidsCategoryLabel;
    }
  }
}