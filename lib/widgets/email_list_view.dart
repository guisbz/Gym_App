import 'package:flutter/material.dart' ;

import '../models/data.dart' as data;
import '../models/models.dart';
import 'card_widget.dart';

class EmailListView extends StatelessWidget {
  const EmailListView({
    super.key,
    this.selectedIndex,
    this.onSelected,
    required this.currentUser,
  });

  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          const SizedBox(height: 8),
          // SearchBar2(currentUser: currentUser ),
          const SizedBox(height: 8),
          ...List.generate(
            data.emails.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CardWidget(
                  email: data.emails[index],
                  onSelected: onSelected != null
                      ? () {
                          onSelected!(index);
                        }
                      : null,
                  isSelected: selectedIndex == index,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}