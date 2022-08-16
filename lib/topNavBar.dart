import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 9, 141, 5),
      actions: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'analog');
                  },
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.lock_clock,
                        size: 35,
                        color: Colors.black,
                      ),
                      Text(
                        'Analog\nClock',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '');
                  },
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.home,
                        size: 35,
                        color: Colors.black,
                      ),
                      Text(
                        'Home\nPage',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'digital');
                  },
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.punch_clock,
                        size: 35,
                        color: Colors.black,
                      ),
                      Text(
                        'Digital\nClock',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
