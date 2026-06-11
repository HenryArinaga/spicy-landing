# Spicy Landing

Consumer-facing Nuxt landing page for the Spicy mobile app.

This should stay separate from `spicy-website`, which is the internal moderation/admin scaffold.

## Structure

- `/` is a continuous scrolling marketing site with anchor-linked sections.
- `/privacy-policy`, `/terms-of-service`, `/health-ai-disclaimer`, and `/community-guidelines` are separate legal pages.

## Commands

```bash
npm install
npm run dev
```

## GitHub Pages

For a project page, generate with the repository name as the base path:

```bash
NUXT_APP_BASE_URL=/spicy-landing/ \
NUXT_PUBLIC_SITE_URL=https://YOUR_USERNAME.github.io/spicy-landing \
npm run generate
```

Deploy the generated `.output/public` folder.

The included GitHub Actions workflow deploys on pushes to `main`. If your repository name is not `spicy-landing`, set `NUXT_APP_BASE_URL` and `NUXT_PUBLIC_SITE_URL` as repository variables.
