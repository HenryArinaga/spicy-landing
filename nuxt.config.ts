const baseURL = process.env.NUXT_APP_BASE_URL || '/'
const withBase = (path: string) => `${baseURL.replace(/\/$/, '')}${path}`

export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ['@vueuse/motion/nuxt'],
  css: ['~/assets/css/main.css'],
  runtimeConfig: {
    public: {
      siteUrl: process.env.NUXT_PUBLIC_SITE_URL || 'https://spicyapp.com'
    }
  },
  app: {
    baseURL,
    head: {
      htmlAttrs: {
        lang: 'en'
      },
      title: 'Spicy | Train your spice tolerance, one bite at a time',
      titleTemplate: '%s',
      meta: [
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'application-name', content: 'Spicy' },
        { name: 'apple-mobile-web-app-title', content: 'Spicy' },
        { name: 'format-detection', content: 'telephone=no' },
        { name: 'robots', content: 'index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1' },
        {
          name: 'description',
          content:
            'Spicy helps you build spice tolerance with personalized food recommendations, heat logging, AI coach insights, and restaurant discovery.'
        },
        { name: 'theme-color', content: '#f2381c' },
        { property: 'og:site_name', content: 'Spicy' },
        { property: 'og:type', content: 'website' },
        { property: 'og:locale', content: 'en_US' },
        { name: 'twitter:card', content: 'summary_large_image' }
      ],
      link: [
        { rel: 'preconnect', href: 'https://images.unsplash.com' },
        { rel: 'manifest', href: withBase('/site.webmanifest') },
        { rel: 'icon', href: withBase('/images/spicy-app-icon.png'), type: 'image/png' },
        { rel: 'shortcut icon', href: withBase('/images/spicy-app-icon.png'), type: 'image/png' },
        { rel: 'apple-touch-icon', href: withBase('/images/spicy-app-icon.png') }
      ]
    }
  },
  nitro: {
    prerender: {
      routes: [
        '/',
        '/privacy-policy',
        '/terms-of-service',
        '/health-ai-disclaimer',
        '/community-guidelines',
        '/robots.txt',
        '/sitemap.xml',
        '/site.webmanifest'
      ]
    }
  }
})
