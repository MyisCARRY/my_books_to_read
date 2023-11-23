import 'package:enum_to_string/enum_to_string.dart';
import 'package:fimber/fimber.dart';

enum Configs {
  local,
  development,
  bugtesting,
  staging,
  production,
}

abstract class AppConfig {
  const AppConfig._();

  String get apiHostName;

  String get api => '$apiHostName/';

  Configs get config;

  bool get isProduction => config == Configs.production;

  static AppConfig get init => _getForFlavor;

  static AppConfig get _getForFlavor {
    final flavor = EnumToString.fromString(
      Configs.values,
      const String.fromEnvironment('flavor', defaultValue: 'production'),
    );

    plantTree();

    switch (flavor) {
      case Configs.local:
        Fimber.d('local mode');
        return const LocalConfig();
      case Configs.development:
        Fimber.d('development mode');
        return const DevConfig();
      case Configs.bugtesting:
        Fimber.d('bug testing mode');
        return const BugTestingConfig();
      case Configs.staging:
        Fimber.d('staging mode');
        return const StagingConfig();
      case Configs.production:
        Fimber.d('production mode');
        return const ProdConfig();
      default:
        throw UnimplementedError();
    }
  }

  static void plantTree() {
    Fimber.plantTree(
      CustomFormatTree(
        useColors: true,
        logFormat: "${CustomFormatTree.timeStampToken}: ${CustomFormatTree.messageToken}",
      ),
    );
  }
}

class DevConfig extends AppConfig {
  const DevConfig() : super._();

  @override
  String get apiHostName => ''; // TODO(Mason): add development API address with https

  @override
  Configs get config => Configs.development;
}

class BugTestingConfig extends AppConfig {
  const BugTestingConfig() : super._();

  @override
  String get apiHostName => ''; // TODO(Mason): add testing API address with https

  @override
  Configs get config => Configs.bugtesting;
}

class StagingConfig extends AppConfig {
  const StagingConfig() : super._();

  @override
  String get apiHostName => ''; // TODO(Mason): add staging API address with https

  @override
  Configs get config => Configs.staging;
}

class ProdConfig extends AppConfig {
  const ProdConfig() : super._();

  @override
  String get apiHostName => 'https://openlibrary.org';

  @override
  Configs get config => Configs.production;
}

class LocalConfig extends AppConfig {
  const LocalConfig() : super._();

  @override
  String get apiHostName => ''; // TODO(Mason): add local API address with https

  @override
  Configs get config => Configs.local;
}
