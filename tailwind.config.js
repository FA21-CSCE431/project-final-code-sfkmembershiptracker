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
            animation: {
                fade: 'fadeOut 2s ease-in-out 5s 1 forwards',
            },
            keyframes: {
                fadeOut: {
                  '0%': { opacity: '75%' },
                  '100%': { opacity: '0', visibility: 'hidden' },
                },
            },
        },
    },
}
