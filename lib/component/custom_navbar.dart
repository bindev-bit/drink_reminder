import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                type: MaterialType.transparency,
                child: Opacity(
                  opacity: 0.0,
                  child: InkWell(
                    onTap: null,
                    borderRadius: BorderRadius.circular(100),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/more.png',
                        scale: 35,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Water Reminder",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: Tooltip(
                  message: 'Pengaturan',
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/more.png',
                        scale: 35,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
