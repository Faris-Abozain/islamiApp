import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../core/models/page_view_model.dart';

class PageViewWidget extends StatelessWidget {
  final PageViewModel pageViewModel;

  PageViewWidget({super.key, required this.pageViewModel});

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> listPagesViewModel = [pageViewModel,pageViewModel,pageViewModel,pageViewModel,pageViewModel];

    return Scaffold(
      body: Column(
        children: [
          Expanded( //
            child: IntroductionScreen(
              pages: listPagesViewModel,
              showSkipButton: true,
              skip: const Icon(Icons.skip_next),
              next: const Text("Next"),
              done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
              onDone: () {
                // On Done button pressed
              },
              onSkip: () {
                // On Skip button pressed
              },
              dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Theme.of(context).colorScheme.secondary,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
