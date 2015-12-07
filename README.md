# React Native Conekta [![npm version](https://badge.fury.io/js/react-native-conekta.svg)](http://badge.fury.io/js/react-native-conekta)

React Native Conekta SDK for iOS and Android

## Installation
`npm install react-native-conekta`

## iOS Installation
[Please see: Linking Libraries iOS](https://facebook.github.io/react-native/docs/linking-libraries-ios.html#content)

Library folder: `your-project/node_modules/react-native-conekta/RNConekta`

## Android Installation
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

Register module (in `MainActivity.java`)

```java
import com.dieam.reactnativeconekta.ReactNativeConektaPackage;  // <--- import

public class MainActivity extends Activity implements DefaultHardwareBackBtnHandler {
  ......

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    mReactRootView = new ReactRootView(this);

    mReactInstanceManager = ReactInstanceManager.builder()
      .setApplication(getApplication())
      .setBundleAssetName("index.android.bundle")
      .setJSMainModuleName("index.android")
      .addPackage(new MainReactPackage())
      .addPackage(new ReactNativeConektaPackage(this))// <------ add the package
      .setUseDeveloperSupport(BuildConfig.DEBUG)
      .setInitialLifecycleState(LifecycleState.RESUMED)
      .build();

    mReactRootView.startReactApplication(mReactInstanceManager, "ExampleApp", null);

    setContentView(mReactRootView);
  }

  ......

}
```

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
