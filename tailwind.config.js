/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      aspectRatio: {
        'w-3': '3',
        'h-4': '4',
        'w-16': '16',
        'h-9': '9'
      }
    },
  },
  plugins: [],
}