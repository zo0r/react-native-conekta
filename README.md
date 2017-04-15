# React Native Conekta [![npm version](https://badge.fury.io/js/react-native-conekta.svg)](http://badge.fury.io/js/react-native-conekta)

***React Native Conekta SDK for iOS and Android***

## Supported React Native Versions
| Component Version     | RN Versions    | README     |
|-----------------------|---------------|------------|
| **1.0.4**          | **<= 0.16**   | [Open](https://github.com/zo0r/react-native-conekta/blob/0dae778f409123836df4ec0f6de484598658b11e/README.md)   |
| **>= 2.0.0**          | **>= 0.30**   | [Open](https://github.com/zo0r/react-native-conekta/blob/master/README.md)   |

## Installation
`npm install --save react-native-conekta`

`react-native link`

## Usage
```javascript
var conektaApi = new Conekta();

conektaApi.setPublicKey( 'YOUR_PUBLIC_KEY' );

conektaApi.createToken({
  cardNumber: '4242424242424242',
  name: 'Manolo Virolo',
  cvc: '111',
  expMonth: '11',
  expYear: '21',
}, function(data){
  console.log( 'DATA:', data ); // data.id to get the Token ID
}, function(){
  console.log( 'Error!' );
});
```

## iOS Manual Installation (if you did not use `react-native link`)
[Please see: Linking Libraries iOS](https://facebook.github.io/react-native/docs/linking-libraries-ios.html#content)

Library folder: `your-project/node_modules/react-native-conekta/RNConekta`

## Android Manual Installation (if you did not use `react-native link`)
In `android/settings.gradle`

```gradle
...

include ':react-native-conekta'
project(':react-native-conekta').projectDir = file('../node_modules/react-native-conekta/RNConektaAndroid')
```

In `android/app/build.gradle`

```gradle
...

dependencies {
    ...

    compile project(':react-native-conekta')
}
```

Manually register module in `MainApplication.java`:

```java
import com.dieam.reactnativeconekta.ReactNativeConektaPackage;  // <--- import

public class MainApplication extends Application implements ReactApplication {

  ......
  private final ReactNativeHost mReactNativeHost = new ReactNativeHost(this) {
      @Override
      protected boolean getUseDeveloperSupport() {
        return BuildConfig.DEBUG;
      }

      @Override
      protected List<ReactPackage> getPackages() {

      return Arrays.<ReactPackage>asList(
          new MainReactPackage(),
          new ReactNativeConektaPackage() // <---- Add the Package
      );
    }
  };

  ....
}

```

