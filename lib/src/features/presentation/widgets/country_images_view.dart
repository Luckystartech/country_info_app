import 'package:country_list_app/src/common_widgets.dart/image_widget.dart';
import 'package:country_list_app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageViewControllerProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class CountryImagesView extends ConsumerWidget {
  const CountryImagesView({super.key, required this.images});

  final List<String?> images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final currentIndex = ref.watch(pageViewControllerProvider);
    final pageViewController = ref.read(pageViewControllerProvider.notifier);
    final PageController pageController = PageController(initialPage: 0);
    return Stack(
      children: [
        SizedBox(
            height: Sizes.custom(250),
            child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  pageViewController.state = value;
                },
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return images[index] != null ? ImageWidget(
                    imageUrl: images[index]!,
                    width: size.width,
                    height: size.height * 0.1,
                    fit: BoxFit.cover,
                  ): const SizedBox.shrink();
                })),
        Positioned(
          bottom: 20, // Adjust the spacing from the bottom
          left: 0,
          right: 0,
          child: SizedBox(
            height: Sizes.p12,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length, // Same as itemCount in PageView
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: Sizes.custom(2)),
                  width: currentIndex == index ? Sizes.p12 : Sizes.p8,
                  height: currentIndex == index ? Sizes.p12 : Sizes.p8,
                  decoration: BoxDecoration(
                    color: currentIndex == index ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(Sizes.p12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
