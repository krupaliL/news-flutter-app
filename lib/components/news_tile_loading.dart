import 'package:flutter/material.dart';

import 'loading_controller.dart';

class NewsTileLoading extends StatelessWidget {
  const NewsTileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          LoadingContainer(width: 120, height: 120),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    LoadingContainer(
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    LoadingContainer(
                      width: MediaQuery.of(context).size.width / 2.1,
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                LoadingContainer(
                  width: MediaQuery.of(context).size.width / 1.7,
                  height: 15,
                ),
                const SizedBox(height: 10),
                LoadingContainer(
                  width: MediaQuery.of(context).size.width / 1.9,
                  height: 15,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoadingContainer(
                      width: MediaQuery.of(context).size.width / 5,
                      height: 15,
                    ),
                    LoadingContainer(
                      width: MediaQuery.of(context).size.width / 5,
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
