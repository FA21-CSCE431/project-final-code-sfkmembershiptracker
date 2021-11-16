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
                    light: '#700000',
                    dark: '#300000',
                },
            },
            animation: {
                fade: 'fadeOut 1s ease-out 5s 1 forwards',
            },
            keyframes: {
                fadeOut: {
                  '0%': { opacity: '1' },
                  '100%': { opacity: '0', visibility: 'hidden' },
                },
            },
        },
    },
}
