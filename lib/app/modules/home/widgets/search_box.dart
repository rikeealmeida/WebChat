import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/config.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final controller = TextEditingController();
  bool isEmpty = true;
  @override
  void initState() {
    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        setState(() {
          isEmpty = false;
        });
      } else {
        setState(() {
          isEmpty = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(top: 3, bottom: 7),
          width: _folded ? 50 : 250,
          height: 40,
          decoration: BoxDecoration(
              color: _folded ? Colors.transparent : Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(18))),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 9),
                  padding: const EdgeInsets.only(left: 16),
                  child: !_folded
                      ? TextField(
                          textInputAction: TextInputAction.search,
                          controller: controller,
                          style: TextStyle(
                              color: Colors.black.withAlpha(450), fontSize: 15),
                          textAlign: TextAlign.start,
                          cursorColor: Colors.grey[300],
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: 23),
                            hintText: "Pesquise aqui",
                            floatingLabelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                            border: InputBorder.none,
                          ),
                        )
                      : null,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_folded ? 32 : 0),
                        topRight: const Radius.circular(32),
                        bottomLeft: Radius.circular(_folded ? 32 : 0),
                        bottomRight: const Radius.circular(32),
                      ),
                      child: Padding(
                        padding: _folded
                            ? const EdgeInsets.only(top: 5.0, right: 5)
                            : EdgeInsets.zero,
                        child: Icon(
                            _folded
                                ? Icons.search
                                : !isEmpty
                                    ? Icons.clear
                                    : Icons.filter_list,
                            color: Config.colors.textColorMenu),
                      ),
                      onTap: _folded == true
                          ? () {
                              setState(() {
                                _folded = !_folded;
                              });
                            }
                          : !isEmpty
                              ? () {
                                  setState(() {
                                    _folded = true;
                                    controller.clear();
                                  });
                                }
                              : () {}),
                ),
              ),
            ],
          )),
    );
  }

  // _responsiveSearchBox() {
  //   double searchBox;

  //   MediaQuery.of(context).size.width <= 500
  //       ? searchBox = MediaQuery.of(context).size.width * .87
  //       : (MediaQuery.of(context).size.width >= 760 &&
  //               MediaQuery.of(context).size.width <= 799)
  //           ? searchBox = MediaQuery.of(context).size.width * .83
  //           : (MediaQuery.of(context).size.width >= 800 &&
  //                   MediaQuery.of(context).size.width <= 899)
  //               ? searchBox = MediaQuery.of(context).size.width * .83
  //               : (MediaQuery.of(context).size.width >= 900 &&
  //                       MediaQuery.of(context).size.width <= 1279)
  //                   ? searchBox = MediaQuery.of(context).size.width * .93
  //                   : MediaQuery.of(context).size.width >= 1280
  //                       ? searchBox = MediaQuery.of(context).size.width * .96
  //                       : searchBox = MediaQuery.of(context).size.width * .95;

  //   return searchBox;
  // }
}
