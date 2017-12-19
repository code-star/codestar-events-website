const path = require('path');
const CleanWebpackPlugin = require('clean-webpack-plugin');

// TODO is it dev?

module.exports = {
    entry: {
        app: [
            './app/src/index.js'
        ]
    },

    output: {
        path: path.resolve(__dirname + '/docs'),
        filename: '[name].js'
    },

    module: {
        rules: [
            {
                test: /\.less$/,
                use: [
                    'style-loader',
                    'css-loader',
                    'less-loader'
                ]
            },
            {
                test:    /\.html$/,
                exclude: /node_modules/,
                loader:  'file-loader?name=[name].[ext]',
            },
            {
                test:    /\.elm$/,
                exclude: [/elm-stuff/, /node_modules/],
                use: [
                    {
                        loader: 'elm-assets-loader',
                        options: {
                            module: 'Page.Assets',
                            tagger: 'AssetPath',
                            package: 'code-star/codestar-events-website'
                        }
                    },
                    {
                        loader: 'elm-webpack-loader',
                        options: {
                            verbose: true,
                            warn: true,
                            debug: true
                        }
                    }

                ]
            },
            {
                test: /\.(png|jpg|svg)$/,
                loader: 'file-loader'
            },
            {
                test: /\.(woff(2)?|otf)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
                loader: 'url-loader?limit=10000&mimetype=application/font-woff',
            },
            // {
            //     test: /\.(ttf|eot)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
            //     loader: 'file-loader',
            // },
        ],

        // See "Elm for frontend developers" blog
        // noParse: /\.elm$/,
    },

    plugins: [
        new CleanWebpackPlugin(['docs'])
    ],

    devServer: {
        inline: true,
        stats: { colors: true },
    },

};
