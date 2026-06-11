<template>
  <LegalPage
    title="Privacy Policy"
    updated="Last updated June 10, 2026"
    :sections="sections"
  />
</template>

<script setup lang="ts">
const sections = [
  {
    heading: 'Information we collect',
    body:
      'Spicy may collect account details, app activity, food logs, tasting notes, reactions, uploaded food photos, device information, approximate or precise location when enabled, and support messages.'
  },
  {
    heading: 'How we use information',
    body:
      'We use information to operate accounts, personalize spicy food training, generate recommendations, store logs, support AI features, improve safety and reliability, provide support, and comply with legal obligations.'
  },
  {
    heading: 'AI processing',
    body:
      'AI powered features may process food logs, photos, notes, and related usage context through third party AI providers. AI outputs may be inaccurate and are not medical advice.'
  },
  {
    heading: 'Contact',
    body: 'For privacy questions, contact spicylabsdev@gmail.com.'
  }
]
</script>
