import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { SwiftChartsView } from 'swift-charts';

const chartData = [
  {
    category: 'Item 1',
    value: 12,
  },
  {
    category: 'Item 2',
    value: 25,
  },
  {
    category: 'Item 3',
    value: 6,
  },
];

export default function App() {
  return (
    <View style={styles.container}>
      <SwiftChartsView color="#e63946" data={chartData} style={styles.chart} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  chart: {
    width: '100%',
    height: '100%',
    marginVertical: 20,
  },
});
