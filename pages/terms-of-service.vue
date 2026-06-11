<template>
  <LegalPage
    title="Terms of Service"
    updated="Last updated June 10, 2026"
    :sections="sections"
  />
</template>

<script setup lang="ts">
const sections = [
  {
    heading: 'Eligibility',
    body:
      'Spicy is intended only for adults age 18 and older located in the United States. By using Spicy, you confirm you can enter into these terms.'
  },
  {
    heading: 'About the service',
    body:
      'Spicy provides informational tools for spicy food tolerance, training, logging, personalized app experiences, AI generated insights, and food photo identification.'
  },
  {
    heading: 'Health and safety',
    body:
      'Spicy is not a medical service, emergency service, nutrition treatment service, or healthcare provider. Do not rely on Spicy to decide whether a food is safe for you.'
  },
  {
    heading: 'User content',
    body:
      'You may submit logs, notes, photos, profile information, and other content. You retain rights in your content and grant Spicy the rights needed to operate and improve the service.'
  }
]
</script>
