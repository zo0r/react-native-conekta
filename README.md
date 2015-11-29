## React Native Conekta

React Native Conekta SDK for iOS and Android (soon).

### Installation
`npm install react-native-conekta`

### Usage
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

### iOS Installation
Soon, sorry I have no time (anyone can send a PR)

### Android Installation
Soon, sorry I have no time (anyone can send a PR)

