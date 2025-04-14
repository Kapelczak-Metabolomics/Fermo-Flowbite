module.exports = {
  content: [
    './fermo_gui/fermo_gui/templates/**/*.html',
    './fermo_gui/fermo_gui/static/js/**/*.js'
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('flowbite/plugin')
  ],
}
