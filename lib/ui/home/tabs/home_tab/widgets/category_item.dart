import 'package:e_commerce/domain/enities/category_response_entity.dart';
import 'package:flutter/material.dart';
import '../../../../utils/my_assets.dart';
import '../../../../utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryOrBrandItem extends StatelessWidget {
  //todo: categoryOrBrand model
  CategoryEntity categoryEntity;


  CategoryOrBrandItem({required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: NetworkImage(categoryEntity.image ?? ''),
            radius: 50.r,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(
            categoryEntity.name ?? '',
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.darkPrimaryColor,
                  fontWeight: FontWeight.normal,
                ),
          ),
        )
      ],
    );
  }
}
