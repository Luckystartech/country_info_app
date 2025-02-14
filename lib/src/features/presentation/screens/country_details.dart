import 'package:country_info_app/src/common_widgets.dart/rich_text_widget.dart';
import 'package:country_info_app/src/constants/app_sizes.dart';
import 'package:country_info_app/src/features/domain/country.dart';
import 'package:country_info_app/src/features/presentation/widgets/country_images_view.dart';
import 'package:country_info_app/src/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  const CountryDetails({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    final List<String?> images = [
      country.flag.pngUrl,
      country.coatOfArms?.pngUrl
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          country.name,
          style: context.textTheme.headlineSmall!.copyWith(
              color: context.colorScheme.primary, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p20, vertical: Sizes.p32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountryImagesView(
                images: images,
              ),
              gapH16,
              RichTextWidget(
                  title: 'Population', value: '${country.population}'),
              RichTextWidget(title: 'Region:', value: country.region),
              RichTextWidget(title: 'Capital:', value: country.capital),
              const RichTextWidget(
                  title: 'Motto: ', value: 'Virtus unita fortior'),
              gapH16,
              RichTextWidget(
                  title: 'Official language',
                  value: convertListOfLanguagesToString(country.languages)),
              const RichTextWidget(
                  title: 'Ethic group', value: 'Andorran Spanish, Portuguese'),
              const RichTextWidget(title: 'Religion', value: 'Christainity'),
              const RichTextWidget(
                  title: 'Governmene', value: 'Parliamentary democracy'),
              gapH16,
              const RichTextWidget(
                  title: 'Independence', value: '8th September, 1278'),
              RichTextWidget(title: 'Area', value: country.area.toString()),
              RichTextWidget(
                  title: 'Currency', value: country.currency.toString()),
              const RichTextWidget(title: 'GDP', value: 'US\$3,400 billion'),
              gapH16,
              RichTextWidget(title: 'Time zone', value: country.timezone),
              const RichTextWidget(title: 'Date Format', value: 'dd/mm/yy'),
              RichTextWidget(
                  title: 'Dailing code', value: country.dialingCode.toString()),
              RichTextWidget(title: 'Driving side', value: country.drivingSide),
              gapH16,
            ],
          ),
        ),
      ),
    );
  }
}

String convertListOfLanguagesToString(List<Language> languages) {
  String sentence = '';
  for (var language in languages) {
    sentence =
        sentence.isNotEmpty ? '$sentence, ${language.name}' : language.name;
  }
  return sentence;
}
