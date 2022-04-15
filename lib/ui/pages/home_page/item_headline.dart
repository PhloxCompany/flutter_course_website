import 'package:flutter/material.dart';
import 'package:flutter_course_phlox/controller/providers/global_setting_provider.dart';
import 'package:flutter_course_phlox/controller/providers/home_provider.dart';
import 'package:flutter_course_phlox/model/model_headline.dart';
import 'package:flutter_course_phlox/utils/colors.dart';
import 'package:provider/provider.dart';

class ItemHeadline extends StatelessWidget {
  final ModelHeadline modelHeadline;

  const ItemHeadline({Key? key, required this.modelHeadline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context, listen: true);
    double width = MediaQuery.of(context).size.width;
    bool _isWeb = width >= 1024;

    var settingProvider = context.read<GlobalSettingProvider>();
    return Container(
      width: _isWeb ? 1060 : double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: settingProvider.darkMode
              ? AppColors.blueBgDark
              : Colors.amber.shade50,
          boxShadow: [
            BoxShadow(
                color: settingProvider.darkMode
                    ? Colors.grey[900]!
                    : Colors.grey[400]!,
                blurRadius: 24,
                spreadRadius: 1)
          ]),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 300),
        children: [
          ExpansionPanel(
            backgroundColor:
                settingProvider.darkMode ? AppColors.blueBgDark : Colors.white,
            headerBuilder: (context, isExpanded) {
              return Container(
                  padding: EdgeInsets.only(
                      right: _isWeb ? 24 : 18, top: 24, bottom: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(modelHeadline.title)),
                          if (width > 400) _row1()
                        ],
                      ),
                      if (width <= 400) _row1()
                    ],
                  ));
            },
            body: const ListTile(
              title: Text('Description text'),
            ),
            isExpanded: modelHeadline.isExpanded,
            canTapOnHeader: true,
          ),
        ],
        elevation: 0,
        expandedHeaderPadding: const EdgeInsets.only(right: 12),
        expansionCallback: (panelIndex, isExpanded) =>
            homeProvider.toggleListTile(modelHeadline),
      ),
    );
  }

  Widget _row1() => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              modelHeadline.videoVisibility == VideoVisibility.global ||
                      modelHeadline.videoVisibility == VideoVisibility.public
                  ? "رایگان"
                  : "پرمیم",
              style: TextStyle(
                fontFamily: 'vazir',
                fontSize: 12,
                color: modelHeadline.videoVisibility ==
                            VideoVisibility.global ||
                        modelHeadline.videoVisibility == VideoVisibility.public
                    ? Colors.green
                    : Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            modelHeadline.time,
            style: const TextStyle(
              fontFamily: 'vazir',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
