import 'package:flutter/material.dart';
import 'package:memory_cloud/config/resources/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmeGridWidget extends StatelessWidget {
  const ShimmeGridWidget({
    super.key,
    this.itemCount,
  });
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.9,
      ),
      itemCount: itemCount ?? 12,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: AppColors.kWhiteColor.withValues(alpha: 0.1),
          highlightColor: AppColors.kWhiteColor.withValues(alpha: 0.3),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
    );
  }
}
