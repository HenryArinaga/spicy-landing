const routes = [
  '/',
  '/privacy-policy',
  '/terms-of-service',
  '/health-ai-disclaimer',
  '/community-guidelines'
]

export default defineEventHandler((event) => {
  const config = useRuntimeConfig(event)
  const siteUrl = config.public.siteUrl.replace(/\/$/, '')
  const today = new Date().toISOString().slice(0, 10)

  setHeader(event, 'content-type', 'application/xml; charset=utf-8')

  const urls = routes
    .map((route) => {
      const priority = route === '/' ? '1.0' : '0.6'
      const changefreq = route === '/' ? 'weekly' : 'monthly'

      return [
        '  <url>',
        `    <loc>${siteUrl}${route}</loc>`,
        `    <lastmod>${today}</lastmod>`,
        `    <changefreq>${changefreq}</changefreq>`,
        `    <priority>${priority}</priority>`,
        '  </url>'
      ].join('\n')
    })
    .join('\n')

  return [
    '<?xml version="1.0" encoding="UTF-8"?>',
    '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">',
    urls,
    '</urlset>'
  ].join('\n')
})
