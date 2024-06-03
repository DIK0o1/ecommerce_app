import 'package:e_commerce/domain/dependency_injection.dart';
import 'package:e_commerce/ui/home/tabs/home_tab/cubit/home_tap_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';
import 'widgets/annountcements_section.dart';
import 'widgets/categories_or_brands_section.dart';
import 'widgets/custom_search_with_shopping_cart.dart';
import 'widgets/row_section_widgets.dart';

class HomeTab extends StatelessWidget {
  HomeTapViewModelCubit viewModel =
      HomeTapViewModelCubit(categoriesUseCase: injectGetAllCategoriesUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTapViewModelCubit, HomeTapViewModelState>(
      bloc: viewModel..getAllCategories(),
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    MyAssets.logo,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomSearchWithShoppingCart(),
                  SizedBox(
                    height: 16.h,
                  ),
                  AnnouncementsSection(),
                  SizedBox(
                    height: 16.h,
                  ),
                  RowSectionWidget(name: 'Categories'),
                  SizedBox(
                    height: 24.h,
                  ),
                  viewModel.categoriesList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : CategoriesOrBrandsSection(categoryList: viewModel.categoriesList,),
                  SizedBox(
                    height: 24.h,
                  ),
                  RowSectionWidget(name: 'Brands'),
                  SizedBox(
                    height: 24.h,
                  ),
                  // CategoriesOrBrandsSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
