// flutter packages
import 'package:flutter/material.dart';

import '../../models/expansion_panel_section.dart';
import '../../widgets/page_blueprint.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      title: 'About',
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: const EdgeInsets.all(9),
            dividerColor: const Color(0xFF8F6146),
            expansionCallback: (panelIndex, isExpanded) => setState(() {
              expansionPanelSections[panelIndex].isExpanded = !isExpanded;
            }),
            children: [
              for (final expansionPanelSection in expansionPanelSections)
                ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: expansionPanelSection.isExpanded!,
                  headerBuilder: (context, isExpanded) =>
                      ListTile(title: expansionPanelSection.title),
                  body: Padding(
                    padding: const EdgeInsets.fromLTRB(21, 12, 21, 12),
                    child: expansionPanelSection.body,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
