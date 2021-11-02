module.exports = {
    mode: 'jit',
    purge: [
        './app/views/**/*.html.erb',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js'
    ],
    theme: {
        extend: {
            colors: {
                maroon: {
                    DEFAULT: '#500000',
                    dark: '#300000',
                },
            },
        },
    },
}
