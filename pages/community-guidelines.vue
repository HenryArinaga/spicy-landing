<template>
  <LegalPage
    title="Community Guidelines"
    updated="Last updated June 10, 2026"
    :sections="sections"
  />
</template>

<script setup lang="ts">
const sections = [
  {
    heading: 'Useful food intel',
    body:
      'Submit accurate restaurant items, clear photos, honest heat ratings, and practical notes that help other users decide what to try.'
  },
  {
    heading: 'Respectful reviews',
    body:
      'Keep reviews focused on food, heat, service context, and recovery. Do not harass, threaten, impersonate, or post hateful content.'
  },
  {
    heading: 'Moderation',
    body:
      'Submissions may be reviewed before appearing publicly. Spicy may remove content that is unsafe, misleading, abusive, unlawful, or unrelated to the service.'
  }
]
</script>
