import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  const CustomAppBar({super.key, required this.title, this.onPressedIcon, this.onPressedSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: title,
                prefixIcon: IconButton(icon: const Icon(Icons.search), onPressed: onPressedSearch,),
                hintStyle: const TextStyle(
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: onPressedIcon,
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          )
        ],
      ),
    );
  }
}
