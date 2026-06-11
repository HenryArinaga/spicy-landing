<template>
  <main class="legal-page">
    <header class="site-nav legal-nav">
      <NuxtLink class="brand" to="/">
        <span class="brand-mark">S</span>
        <span>Spicy</span>
      </NuxtLink>
      <NuxtLink class="nav-cta" to="/">Back to site</NuxtLink>
    </header>
    <article class="legal-card">
      <p class="eyebrow">Legal</p>
      <h1>{{ title }}</h1>
      <p class="legal-updated">{{ updated }}</p>
      <section v-for="section in sections" :key="section.heading">
        <h2>{{ section.heading }}</h2>
        <p>{{ section.body }}</p>
      </section>
    </article>
  </main>
</template>

<script setup lang="ts">
const props = defineProps<{
  title: string
  updated: string
  sections: Array<{ heading: string; body: string }>
}>()

const config = useRuntimeConfig()
const route = useRoute()
const siteUrl = config.public.siteUrl.replace(/\/$/, '')
const pageUrl = `${siteUrl}${route.path}`
const description = `${props.title} for Spicy, the mobile app for spice tolerance training, food logging, AI coach insights, and restaurant discovery.`
const title = `${props.title} | Spicy`

useSeoMeta({
  title,
  description,
  ogTitle: title,
  ogDescription: description,
  ogUrl: pageUrl,
  ogImage: `${siteUrl}/images/chile-crisp-noodles.png`,
  twitterTitle: title,
  twitterDescription: description,
  twitterImage: `${siteUrl}/images/chile-crisp-noodles.png`
})

useHead({
  link: [{ rel: 'canonical', href: pageUrl }]
})
</script>
