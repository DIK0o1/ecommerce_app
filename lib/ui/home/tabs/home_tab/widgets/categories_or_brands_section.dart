import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../domain/enities/category_response_entity.dart';
import 'category_item.dart';

class CategoriesOrBrandsSection extends StatelessWidget {
  //todo: List<Category & brand>
  List<CategoryEntity>  categoryList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryOrBrandItem(categoryEntity: categoryList[index],);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          )),
    );
  }

  CategoriesOrBrandsSection({required this.categoryList});
}
