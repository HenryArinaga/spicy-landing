<template>
  <LegalPage
    title="Health AI Disclaimer"
    updated="Last updated June 10, 2026"
    :sections="sections"
  />
</template>

<script setup lang="ts">
const sections = [
  {
    heading: 'Not medical advice',
    body:
      'Spicy is for informational and educational purposes only. It does not provide medical advice, diagnosis, treatment, emergency support, or nutrition therapy.'
  },
  {
    heading: 'AI limitations',
    body:
      'AI generated coaching and food identification can be inaccurate, incomplete, or inappropriate for your situation. You are responsible for deciding whether and how to use the information.'
  },
  {
    heading: 'Food risk',
    body:
      'Consuming spicy foods can involve discomfort, digestive distress, allergic reactions, or worsening of existing conditions. Stop and seek appropriate care if you experience concerning symptoms.'
  }
]
</script>
