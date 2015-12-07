/**
 * @providesModule Conekta
 */

'use strict';

// RNConekta
const RNConekta = require('react-native').NativeModules.RNConekta;
const Platform = require('react-native').Platform;

var Conekta = function() {
	this.publicKey = false;
};

/**
 * Params:
 * publicKey: String (Your testing or production Public Key)
 */
Conekta.prototype.setPublicKey = function(publicKey: String) {
	this.publicKey = publicKey;
};

/**
 * Params:
 *  info = {
 *		cardNumber: String
 *		name: String
 *		cvc: String
 *		expMonth: String
 *		expYear: String
 *	}
*/
Conekta.prototype.createToken = function(info: Object, success: Function, error:Function) {
	info.publicKey = this.publicKey;

	RNConekta.createToken(info, function(response){
		if ( Platform.OS === 'android' ) {
			success( JSON.parse( response ) );
		} else {
			success( response );
		}
	}, error);
};

module.exports = Conekta;
