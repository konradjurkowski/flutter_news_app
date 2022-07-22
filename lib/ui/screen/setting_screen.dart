import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/model/country.dart';
import 'package:flutter_news_app/providers/settings_screen_provider.dart';
import 'package:flutter_news_app/ui/widget/DropDownMenu.dart';
import 'package:flutter_news_app/ui/widget/TextInputField.dart';
import 'package:flutter_news_app/util/colors.dart';
import 'package:flutter_news_app/util/resource/dimens.dart';
import 'package:flutter_news_app/util/resource/string_resource.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "/settings";

  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _usernameController = TextEditingController();

  Country? _country;

  @override
  void initState() {
    super.initState();
    Provider.of<SettingsScreenProvider>(context, listen: false).initUserData();
    setState(() {
      _country = Provider.of<SettingsScreenProvider>(context, listen: false)
          .getFirstCountry();
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsScreenProvider>(context);
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(Dimens.regularPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    HapticFeedback.vibrate();
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back, size: 30)),
              const SizedBox(height: Dimens.mediumPadding),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(StringResource.appName,
                          style: TextStyle(
                              fontSize: 35,
                              color: buttonColor,
                              fontWeight: FontWeight.w900)),
                      const Text(StringResource.userInfo,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700)),
                      const SizedBox(height: Dimens.mediumPadding),
                      Row(
                        children: [
                          const Text(
                            "Username: ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            settingsProvider.username,
                            style: TextStyle(fontSize: 18, color: buttonColor),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Country: ",
                            style: TextStyle(fontSize: 18),
                          ),
                          settingsProvider.country == null
                              ? Container()
                              : SvgPicture.network(
                                  settingsProvider.country!.imageUrl,
                                  width: 30,
                                  height: 30,
                                ),
                          const SizedBox(width: Dimens.smallPadding),
                          Text(
                            settingsProvider.country?.name ?? '',
                            style: TextStyle(fontSize: 18, color: buttonColor),
                          )
                        ],
                      ),
                      const SizedBox(height: Dimens.mediumPadding),
                      SizedBox(
                        width: double.infinity,
                        child: TextInputField(
                            controller: _usernameController,
                            labelText: 'Username',
                            icon: Icons.person),
                      ),
                      const SizedBox(height: Dimens.mediumPadding),
                      DropDownMenu(
                          itemsList: Provider.of<SettingsScreenProvider>(
                                  context,
                                  listen: false)
                              .getSupportedCountries()
                              .map((country) => country.name)
                              .toList(),
                          labelText: 'Country Code',
                          currentValue: _country!.name,
                          onItemChanged: (String? newValue) {
                            if (newValue != null) {
                              HapticFeedback.vibrate();
                              setState(() {
                                _country = Provider.of<SettingsScreenProvider>(
                                        context,
                                        listen: false)
                                    .getCountryByName(newValue);
                              });
                            }
                          }),
                      const SizedBox(height: Dimens.mediumPadding),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            HapticFeedback.vibrate();
                            Provider.of<SettingsScreenProvider>(context,
                                    listen: false)
                                .saveData(_usernameController.text,
                                    _country!.countryCode, context);
                            _usernameController.clear();
                            setState(() {
                              _country = Provider.of<SettingsScreenProvider>(
                                      context,
                                      listen: false)
                                  .getFirstCountry();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: buttonColor,
                              padding: const EdgeInsets.all(20)),
                          child: const Text(StringResource.saveLabel,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
