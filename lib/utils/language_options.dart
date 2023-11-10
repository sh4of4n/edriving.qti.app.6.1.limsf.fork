import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'package:edriving_qti_app/common_library/services/model/provider_model.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application.dart';

class LanguageOptions extends StatelessWidget {
  final localStorage = LocalStorage();

  LanguageOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
            title: Text(AppLocalizations.of(context)!.translate('english_lbl')),
            onTap: () {
              localStorage.saveLocale('en');
              application.onLocaleChanged(const Locale('en'));
              Provider.of<LanguageModel>(context, listen: false)
                  .selectedLanguage(
                      AppLocalizations.of(context)!.translate('english_lbl'));
              context.router.pop();
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.translate('malay_lbl')),
            onTap: () {
              localStorage.saveLocale('ms');
              application.onLocaleChanged(const Locale('ms'));
              Provider.of<LanguageModel>(context, listen: false)
                  .selectedLanguage(
                      AppLocalizations.of(context)!.translate('malay_lbl'));
              context.router.pop();
            },
          ),
        ],
      ),
    );
  }
}
