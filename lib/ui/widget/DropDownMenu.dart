import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/settings_screen_provider.dart';
import 'package:flutter_news_app/util/colors.dart';
import 'package:flutter_news_app/util/resource/dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DropDownMenu extends StatelessWidget {
  final List<String> itemsList;
  final String currentValue;
  final String labelText;
  final Function(String?) onItemChanged;

  DropDownMenu(
      {required this.itemsList,
      required this.currentValue,
      required this.labelText,
      required this.onItemChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsScreenProvider>(context, listen: false);
    return DropdownButtonFormField(
      items: itemsList.map((String item) {
        return DropdownMenuItem(
            value: item,
            child: Row(
              children: [
                SvgPicture.network(
                  provider.getCountryByName(item).imageUrl,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: Dimens.smallPadding),
                Text(item,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              ],
            ));
      }).toList(),
      value: currentValue,
      onChanged: onItemChanged,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const Icon(Icons.flag),
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: borderColor)),
      ),
    );
  }
}
