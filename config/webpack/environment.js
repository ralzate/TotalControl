const { environment } = require('@rails/webpacker')
const alias =  require('./alias/alias')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.config.merge(alias)
module.exports = environment
