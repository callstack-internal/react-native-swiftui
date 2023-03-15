import {
  requireNativeComponent,
  UIManager,
  Platform,
  ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package 'swift-charts' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type ChartData = {
  category: string;
  value: number;
};

type SwiftChartsProps = {
  style: ViewStyle;
  data: ChartData[];
  color: string;
};

const ComponentName = 'SwiftChartsView';

export const SwiftChartsView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<SwiftChartsProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
