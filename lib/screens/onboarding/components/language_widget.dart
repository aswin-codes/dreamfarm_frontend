import 'package:dreamfarm/utilities/languages/language.dart';
import 'package:dreamfarm/utilities/languages/language_constants.dart';
import 'package:dreamfarm/main.dart';
import 'package:flutter/material.dart';
import 'package:dreamfarm/resources/resources.dart' as resources;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<Language>(
        underline: const SizedBox(),
        icon: const Icon(
          Icons.language,
          color: resources.background,
        ),
        onChanged: (Language? language) async {
          // TODO: to call change language method
          if (language != null) {
            Locale locale = await setLocale(language.languageCode);
            MyApp.setLocale(context, locale);
          }
        },
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>(
              (e) => DropdownMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      e.name,
                      style: TextStyle(
                          color: resources.dark,
                          fontFamily: 'Sora',
                          fontSize: 14.sp),
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
