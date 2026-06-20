<template>
  <div class="heat-lane-lottie" aria-hidden="true">
    <div v-if="reducedMotion" class="heat-lane-fallback">
      <span style="--level: 26%"></span>
      <span style="--level: 42%"></span>
      <span style="--level: 58%"></span>
      <span style="--level: 72%"></span>
    </div>
    <div v-else ref="container" class="heat-lane-canvas"></div>
  </div>
</template>

<script setup lang="ts">
import type { AnimationItem } from 'lottie-web'

const container = ref<HTMLElement | null>(null)
const reducedMotion = ref(false)
const config = useRuntimeConfig()
const appBase = config.app.baseURL || '/'
const animationPath = `${appBase.replace(/\/$/, '')}/animations/heat-lane-progress.json`

let animation: AnimationItem | null = null
let mediaQuery: MediaQueryList | null = null

const destroyAnimation = () => {
  animation?.destroy()
  animation = null
}

const loadAnimation = async () => {
  if (!container.value || reducedMotion.value || animation) return

  const lottie = await import('lottie-web/build/player/lottie_light')
  animation = lottie.default.loadAnimation({
    container: container.value,
    renderer: 'svg',
    loop: true,
    autoplay: true,
    path: animationPath,
    rendererSettings: {
      preserveAspectRatio: 'xMidYMid meet',
      progressiveLoad: true
    }
  })
}

const syncMotionPreference = () => {
  reducedMotion.value = mediaQuery?.matches ?? false

  if (reducedMotion.value) {
    destroyAnimation()
    return
  }

  void nextTick(loadAnimation)
}

onMounted(() => {
  mediaQuery = window.matchMedia('(prefers-reduced-motion: reduce)')
  syncMotionPreference()
  mediaQuery.addEventListener('change', syncMotionPreference)
})

onBeforeUnmount(() => {
  mediaQuery?.removeEventListener('change', syncMotionPreference)
  destroyAnimation()
})
</script>
