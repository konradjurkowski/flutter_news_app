import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/di/app_module.dart';
import 'package:flutter_news_app/util/resource/string_resource.dart';
import 'package:flutter_news_app/util/snackbar_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewLauncher {

  final snackManager = getIt<SnackBarManager>();

  void launchWebView(String? url, BuildContext context) {
    if (url != null) {
      try {
        _launchUrl(url);
      } catch (error) {
        snackManager.showMessage(
            context: context,
            title: StringResource.snackbarTitle,
            message: "Cannot open url.",
            contentType: ContentType.failure
        );
      }
    } else {
      snackManager.showMessage(
          context: context,
          title: StringResource.snackbarTitle,
          message: "Url cannot be null.",
          contentType: ContentType.failure
      );
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}