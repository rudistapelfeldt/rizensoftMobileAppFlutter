import 'package:flutter/material.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/app_constants.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/reminders_viewmodel.dart';
import 'package:rizensoft_mobile_app_flutter/logic/viewmodels/viewmodel_provider.dart';

class RemindersView extends StatefulWidget {
  final Map<String, WidgetBuilder>? appRoutes;
  RemindersView(this.appRoutes, {super.key});

  @override
  _RemindersViewState createState() => _RemindersViewState();
}

class _RemindersViewState extends State<RemindersView> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RemindersViewModel>(
      viewModelBuilder: () => RemindersViewModel(context),
      builder: (context, vm, child) {
        return Material(
            child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.orange],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox(height: 40, width: 300)),
                _contentControls(vm),
              ],
            ),
          ),
        ));
      },
    );
  }

  Widget _contentControls(RemindersViewModel viewModel) {
    
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: <Widget>[
        _reminders(viewModel),
        FlutterLogo(),
        FlutterLogo(),
        FlutterLogo(),
      ],
    );
  }

  Widget _reminders(RemindersViewModel viewmodel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Row(
          children: [
            IconButton(
                icon: Icon(Icons.calendar_month_rounded),
                iconSize: AppConstants.dimensions.iconSize,
                onPressed: null,
              ),
          ],
        )
      ],
    );
  }
}