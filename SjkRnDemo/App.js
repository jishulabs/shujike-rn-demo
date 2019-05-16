/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */
 //TODO <数极客SDK> 导入NativeModules
import { NativeModules } from 'react-native';
import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View} from 'react-native';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});


//var ttt = NativeModules.SjkModule.TEST1;
var t = "test 数极客 rn SDK !";
 //TODO <数极客SDK> 统计事件方法事例
NativeModules.SjkModule.setAttribute('{"TestMobileAttr":"测试Mobile属性","TestMobileAttr2":"1"}');
NativeModules.SjkModule.bindUserInfo('{"userId":"RN123456","userRegisterChannel":"shujike","userSex":"男","userAge":"25","userType":"管理","userLevel":"5级","userProvince":"天津","userCity":"东丽区"}');
NativeModules.SjkModule.postEvent("TestMobile",'{"d_name":"测试Mobile事件name","m_id":"1","ea_jihua":"事件属性测试RN"}');


type Props = {};
export default class App extends Component<Props> {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome} onPress={() => {alert(t)}}>数极客</Text>
        <Text style={styles.instructions}>Welcome to React Native!</Text>
        <Text style={styles.instructions}>To get started, edit App.js</Text>
        <Text style={styles.instructions}>{instructions}</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    backgroundColor: '#FF00FF',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
