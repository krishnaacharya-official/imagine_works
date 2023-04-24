import 'package:flutter/material.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DesktopLayout> {
  int selectedIndex = 0;
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    List<Widget> itemList = items
        .map((item) => Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(20),
              color: selectedIndex == items.indexOf(item)
                  ? Colors.blueAccent
                  : Colors.blueGrey,
              child: Text(
                item,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ))
        .toList();

    PageController controller =
        PageController(initialPage: selectedIndex, viewportFraction: 0.4);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = (selectedIndex - 1) % items.length;
                        controller.animateToPage(selectedIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      });
                    },
                    icon: const Icon(Icons.arrow_left),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = (selectedIndex + 1) % items.length;
                        controller.animateToPage(selectedIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      });
                    },
                    icon: const Icon(Icons.arrow_right),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      controller.animateToPage(selectedIndex,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.blueAccent
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        items[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                height: 150,
                child: PageView(
                  controller: controller,
                  children: itemList,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
