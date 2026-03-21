const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        primary: '#0D233E',
        accent: '#A2D235',
        secondary: '#E5E7EB',
        base: {
          border: '#E5E7EB', // 枠線用（標準的なグレー）
          text: '#4B5563',   // サブテキスト用（少し薄めの黒）
          bg: '#F9FAFB',     // 薄い背景用
        },
        success: {
          light: '#F0FDF4', // ほんのり緑（背景用）
          DEFAULT: '#10B981', // メインの緑（文字・アイコン用）
        },
        danger: {
          light: '#FFF1F2', // ほんのり赤（背景用）
          DEFAULT: '#F43F5E', // メインの赤（文字・アイコン用）
        },
        warning: {
          bg: '#FFFDE7',     // 警告ボックスの薄い黄色背景
          border: '#FFF9C4', // 警告ボックスの境界線
          icon: '#FBC02D',   // 警告アイコンの黄色
          text: '#334155',   // 警告ボックス内の文字色（読みやすい濃いグレー）
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}