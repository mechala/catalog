import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:get_it/get_it.dart';

import '../models/prd_base_model.dart';

class PRDBaseScreen<T extends PRDBaseModel> extends StatelessWidget {
  final ScopedModelDescendantBuilder<T> _content;
  PRDBaseScreen({required ScopedModelDescendantBuilder<T> content})
      : _content = content;

  @override
  Widget build(BuildContext mainContext) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    );
    return ScopedModel<T>(
      model: GetIt.I<T>(),
      child: ScopedModelDescendant<T>(
          builder: (BuildContext context, Widget? child, T model) {
        return _content(mainContext, child, model);
      }),
    );
  }
}
