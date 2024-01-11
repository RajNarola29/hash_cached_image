library hash_cached_image;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:hash_cached_image/global_parameter.dart';
import 'package:octo_image/octo_image.dart';

/// A typedef for a function that builds a placeholder widget.
///
/// The function takes a [BuildContext] as a parameter and returns a [Widget].
typedef PlaceholderWidgetBuilder = Widget Function(BuildContext context);

/// A typedef for a function that builds an image widget.
///
/// The function takes a [BuildContext] and a [Widget] as parameters and returns a [Widget].
typedef ImageBuilder = Widget Function(BuildContext context, Widget widget);

/// A typedef for a function that builds an error widget.
///
/// The function takes a [BuildContext], an [Object] representing the error,
/// and a [StackTrace?] for the stack trace, and returns a [Widget].
typedef LoadingErrorWidgetBuilder = Widget Function(
    BuildContext context, Object object, StackTrace? stackTrace);

/// A widget that displays a cached image with optional blur hash placeholder and error handling.
///
/// The [HashCachedImage] widget uses the [CachedNetworkImageProvider] to load images from the network
/// and supports displaying a blur hash placeholder while the image loads. It also allows customization
/// of the image appearance and error handling.
///
/// This widget leverages the [OctoImage] widget to provide various functionalities including:
/// - A blur hash placeholder image.
/// - Customizable placeholder, error, and image widgets.
/// - Animations for fading in and out.
class HashCachedImage extends StatelessWidget {
  /// Creates a [HashCachedImage] widget.
  ///
  /// The [imageUrl] parameter must not be null and specifies the URL of the image to be loaded.
  const HashCachedImage({
    required this.imageUrl,
    this.hash,
    this.fadeInCurve,
    this.repeat,
    this.height,
    this.width,
    this.placeholder,
    this.errorWidget,
    this.color,
    this.alignment = Alignment.center,
    this.fit,
    super.key,
    this.fadeOutCurve,
    this.fadeInDuration,
    this.fadeOutDuration,
    this.placeholderFadeInDuration,
    this.filterQuality,
    this.colorBlendMode,
    this.imageBuilder,
  });

  /// The URL of the image to display.
  ///
  /// This parameter is required and cannot be null.
  final String imageUrl;

  /// The blur hash string for the placeholder.
  ///
  /// If provided, this will be used to display a blurred version of the image while it is loading.
  final String? hash;

  /// The curve for the fade-in animation.
  ///
  /// This defines the animation curve for the fade-in transition when the image is loaded.
  final Curve? fadeInCurve;

  /// The curve for the fade-out animation.
  ///
  /// This defines the animation curve for the fade-out transition when the image is being replaced.
  final Curve? fadeOutCurve;

  /// The duration of the fade-in animation.
  ///
  /// Specifies how long the fade-in transition should take when the image is loaded.
  final Duration? fadeInDuration;

  /// The duration of the fade-out animation.
  ///
  /// Specifies how long the fade-out transition should take when the image is being replaced.
  final Duration? fadeOutDuration;

  /// The duration of the placeholder fade-in animation.
  ///
  /// Specifies how long the transition should take when displaying the placeholder.
  final Duration? placeholderFadeInDuration;

  /// The quality of image filtering.
  ///
  /// This defines the quality level of image filtering. Higher quality may improve the visual appearance
  /// but may also increase loading times.
  final FilterQuality? filterQuality;

  /// The blend mode for the image color.
  ///
  /// This defines how the image color should be blended with the given color.
  final BlendMode? colorBlendMode;

  /// How the image should be repeated if it does not fill its bounds.
  ///
  /// This specifies whether and how the image should be repeated to fill the bounds of the widget.
  final ImageRepeat? repeat;

  /// The height of the image.
  ///
  /// This defines the height of the image widget. If null, the image will size itself to fit its constraints.
  final double? height;

  /// The width of the image.
  ///
  /// This defines the width of the image widget. If null, the image will size itself to fit its constraints.
  final double? width;

  /// The builder for the placeholder widget.
  ///
  /// This builder is used to display a custom placeholder widget while the image is loading.
  final PlaceholderWidgetBuilder? placeholder;

  /// The builder for the error widget.
  ///
  /// This builder is used to display a custom error widget if an error occurs while loading the image.
  final LoadingErrorWidgetBuilder? errorWidget;

  /// The builder for customizing the image widget.
  ///
  /// This builder allows customization of the image widget once it is loaded.
  final ImageBuilder? imageBuilder;

  /// The color to blend with the image.
  ///
  /// This defines a color that should be blended with the image.
  final Color? color;

  /// How to align the image within its bounds.
  ///
  /// This defines the alignment of the image within its container.
  final Alignment alignment;

  /// How the image should be inscribed into the given box.
  ///
  /// This defines how the image should be fitted within its container.
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OctoImage(
        image: CachedNetworkImageProvider(imageUrl),
        height: height,
        width: width,
        color: color,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        fadeInCurve: fadeInCurve,
        fadeOutCurve: fadeOutCurve,
        fadeInDuration: fadeInDuration,
        fadeOutDuration: fadeOutDuration,
        placeholderFadeInDuration: placeholderFadeInDuration,
        filterQuality: filterQuality,
        colorBlendMode: colorBlendMode,
        placeholderBuilder: hash != null && hash != ""
            ? blurHashPlaceholderBuilder(hash!, fit: fit)
            : placeholder ??
                HashCachedImageGlobalParameter().globalPlaceholder ??
                (context) => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
        errorBuilder: hash != null && hash != ""
            ? blurHashErrorBuilder(hash!,
                icon: Icons.error_outlined, iconColor: Colors.black)
            : errorWidget ??
                HashCachedImageGlobalParameter().globalError ??
                (context, object, stackTrace) => const Icon(
                      Icons.error_outlined,
                      color: Colors.black,
                    ),
        imageBuilder: imageBuilder,
      ),
    );
  }
}

/// A builder function for creating a blur hash placeholder widget.
///
/// This function returns a [OctoPlaceholderBuilder] that displays a blurred version of the image
/// based on the provided blur hash string.
OctoPlaceholderBuilder blurHashPlaceholderBuilder(String hash, {BoxFit? fit}) {
  return (context) => SizedBox.expand(
        child: Image(
          image: BlurHashImage(hash),
          fit: fit ?? BoxFit.cover,
        ),
      );
}

/// A builder function for creating a blur hash error widget.
///
/// This function returns a [OctoErrorBuilder] that displays a blurred version of the image
/// based on the provided blur hash string, along with an optional error icon and message.
OctoErrorBuilder blurHashErrorBuilder(
  String hash, {
  BoxFit? fit,
  Text? message,
  IconData? icon,
  Color? iconColor,
  double? iconSize,
}) {
  return OctoError.placeholderWithErrorIcon(
    blurHashPlaceholderBuilder(hash, fit: fit),
    message: message,
    icon: icon,
    iconColor: iconColor,
    iconSize: iconSize,
  );
}
