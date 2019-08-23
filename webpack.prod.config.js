const path = require('path');
const webpack = require('webpack');
const merge = require('webpack-merge');
const CleanWebpackPlugin = require('clean-webpack-plugin');
const common = require('./webpack.common.config.js');
const glob = require('glob');
const PurgecssPlugin = require('purgecss-webpack-plugin');

module.exports = merge(common, {
	mode: 'production',
	devtool: 'none',

	output: {
		publicPath: '/'
	},

	plugins: [
		new webpack.EnvironmentPlugin([
     'SOCKET_ENDPOINT',
     'CONFIG_ENDPOINT',
     'AUTH_ENDPOINT',
     'GA_TRACKING_ID'
    ]),
		new CleanWebpackPlugin(['dist']),
		new PurgecssPlugin({
			paths: glob.sync(path.join(__dirname, 'src') + '/**/*', { nodir: true })
		})
	]
});
