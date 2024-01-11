import 'package:flutter/material.dart';

/// A typedef for a function that builds a placeholder widget.
///
/// The function takes a [BuildContext] as a parameter and returns a [Widget].
typedef PlaceholderWidgetBuilder = Widget Function(BuildContext context);

/// A typedef for a function that builds an error widget.
///
/// The function takes a [BuildContext], an [Object] representing the error,
/// and a [StackTrace?] for the stack trace, and returns a [Widget].
typedef LoadingErrorWidgetBuilder = Widget Function(
    BuildContext context, Object object, StackTrace? stackTrace);

/// A singleton class for managing global parameters for cached images.
///
/// The [HashCachedImageGlobalParameter] class is used to set global placeholder
/// and error widgets for image loading within the application.
class HashCachedImageGlobalParameter {
  // Private constructor for singleton pattern
  HashCachedImageGlobalParameter._internal();

  // Static instance of the singleton
  static final HashCachedImageGlobalParameter _singleton =
      HashCachedImageGlobalParameter._internal();

  /// Factory constructor to return the same instance of the singleton
  factory HashCachedImageGlobalParameter() {
    return _singleton;
  }

  /// The global placeholder widget builder.
  ///
  /// This widget is displayed while an image is loading.
  PlaceholderWidgetBuilder? globalPlaceholder;

  /// The global error widget builder.
  ///
  /// This widget is displayed if an error occurs while loading an image.
  LoadingErrorWidgetBuilder? globalError;

  /// Sets the global parameters for placeholder and error widgets.
  ///
  /// [globalPlaceholderWidget] is the widget displayed while an image is loading.
  /// [globalErrorWidget] is the widget displayed if an error occurs while loading an image.
  void setGlobalParameter({
    PlaceholderWidgetBuilder? globalPlaceholderWidget,
    LoadingErrorWidgetBuilder? globalErrorWidget,
  }) {
    globalPlaceholder = globalPlaceholderWidget;
    globalError = globalErrorWidget;
  }
}
