plugin =
  html: require('html-webpack-plugin')

path =
  src:  require('path').join __dirname, 'src'
  dist: require('path').join __dirname, 'dist'

module.exports =
  watch: true
  mode: 'development'
  resolve:
    modules: ['node_modules', 'src']
    extensions: ['.js', '.coffee']
  entry:
    index: path.src + '/index.coffee'
  output:
    path:  path.dist
    filename: '[name].js'
  plugins: [
    new plugin.html
      template: path.src + '/index.pug'
      path: path.dist
      filename: 'index.html'
  ,
    new plugin.dashboard()
  ]
  devServer:
    contentBase: path.src
    inline: true
    compress: true
    host: '0.0.0.0'
      # sh = 'hostname -i'
      # return require('child_process').execSync(sh).toString()
    # port: 80
    port: 443
    https: true
    public: 'develop.yokoiwahiroki.name'
      # sh = 'curl -H "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip'
      # return require('child_process').execSync(sh).toString()
    hot: true
    watchContentBase: true
  module:
    rules: [
      test: /\.pug$/
      use: [
        loader: 'pug-loader'
      ]
    ,
      test: /\.coffee$/
      use: [
        loader: 'coffee-loader'
      ]
    ]
