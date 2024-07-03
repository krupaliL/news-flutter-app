import 'package:flutter/material.dart';

import 'loading_controller.dart';

class TrandingCardLoading extends StatelessWidget {
  const TrandingCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(5),
      // height: 300,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          LoadingContainer(
            width: MediaQuery.of(context).size.width,
            height: 200,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoadingContainer(
                width: MediaQuery.of(context).size.width / 4,
                height: 10,
              ),
              LoadingContainer(
                width: MediaQuery.of(context).size.width / 5,
                height: 10,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LoadingContainer(
                width: MediaQuery.of(context).size.width / 1.6,
                height: 20,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LoadingContainer(
                width: MediaQuery.of(context).size.width / 1.8,
                height: 20,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              LoadingContainer(
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              LoadingContainer(
                width: MediaQuery.of(context).size.width / 2,
                height: 20,
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}



