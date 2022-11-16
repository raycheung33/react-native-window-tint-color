import { NativeModules } from 'react-native';

const { WindowTintColor } = NativeModules;
const { setTintColor } = WindowTintColor;

export default setTintColor;