import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef PlaceholderWidgetBuilder = Widget Function(
  BuildContext context,
  String url,
);

typedef ProgressIndicatorBuilder = Widget Function(
  BuildContext context,
  String url,
  DownloadProgress progress,
);

class RCachedNetworkImage extends StatelessWidget {
  const RCachedNetworkImage({
    required this.imageUrl,
    this.hash,
    this.height,
    this.width,
    this.placeholder,
    this.errorWidget,
    this.color,
    this.loaderColor,
    this.alignment = Alignment.center,
    this.fit,
    super.key,
  });

  final String imageUrl;
  final String? hash;

  final double? height;
  final double? width;

  final PlaceholderWidgetBuilder? placeholder;

  final LoadingErrorWidgetBuilder? errorWidget;

  final Color? color;
  final Color? loaderColor;

  final Alignment alignment;

  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      color: color,
      alignment: alignment,
      fit: fit,
      placeholder: hash == null || hash == ""
          ? placeholder ??
              (context, url) => Center(
                      child: CupertinoActivityIndicator(
                    color: loaderColor,
                  ))
          : (context, url) => SizedBox.shrink(),
      errorWidget:
          errorWidget ?? (context, url, error) => const Icon(Icons.error),
    );
  }
}
