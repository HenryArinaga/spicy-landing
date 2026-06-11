export default defineEventHandler((event) => {
  const config = useRuntimeConfig(event)
  const appBase = config.app.baseURL || '/'
  const withBase = (path: string) => `${appBase.replace(/\/$/, '')}${path}`

  setHeader(event, 'content-type', 'application/manifest+json; charset=utf-8')

  return {
    name: 'Spicy',
    short_name: 'Spicy',
    description:
      'Build spice tolerance with personalized food recommendations, heat logging, AI coach insights, and restaurant discovery.',
    start_url: appBase,
    display: 'standalone',
    background_color: '#fcf5f0',
    theme_color: '#f2381c',
    icons: [
      {
        src: withBase('/images/spicy-app-icon.png'),
        sizes: '512x512',
        type: 'image/png',
        purpose: 'any'
      }
    ]
  }
})
