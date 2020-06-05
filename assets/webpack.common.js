/*
==========================================================================================
  Dependencies
==========================================================================================
*/

const path = require("path");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

/*
==========================================================================================
  Configuration
==========================================================================================
*/

module.exports = {
  entry: {
    app: path.resolve(__dirname, "./ts/app.ts"),
  },
  module: {
    rules: [
      {
        test: /\.(j|t)s$/,
        exclude: /node_modules/,
        use: [{
          loader: "babel-loader",
        }, {
          loader: "ts-loader",
        }],
      },
      {
        test: /\.css$/,
        exclude: /node_modules/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: "css-loader",
            options: {
              importLoaders: 1,
            },
          },
          {
            loader: "postcss-loader",
            options: {
              ident: "postcss",
              plugins: () => [
                require("autoprefixer"),
                require("postcss-nested"),
              ],
            },
          },
        ],
      },
    ],
  },
  resolve: {
    extensions: [".ts", ".js"],
  },
};
