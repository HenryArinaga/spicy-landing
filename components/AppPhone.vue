<template>
  <article class="phone-frame">
    <div class="phone-status">
      <span>9:41</span>
      <span>●●●</span>
    </div>
    <div v-if="screen === 'home'" class="phone-screen">
      <p class="phone-kicker">🔥 TODAY'S RECOMMENDATION</p>
      <h3>Chili garlic noodles</h3>
      <div class="phone-food home-food"></div>
      <div class="lane-row">
        <span>Current Lane</span>
        <strong>4.8 / 10</strong>
      </div>
      <div class="meter"><span style="width: 48%"></span></div>
      <p class="phone-note">Close to your recent comfort zone with a small step up in heat.</p>
      <button>Log Recommended Food</button>
    </div>
    <div v-else-if="screen === 'log'" class="phone-screen">
      <p class="phone-kicker">📝 LOG FOOD</p>
      <h3>How hot did it feel?</h3>
      <div class="heat-number">6.5</div>
      <div class="slider-track"><span></span></div>
      <div class="chip-row">
        <span>😅 Sweaty</span>
        <span>🔥 Good burn</span>
      </div>
      <label>Recovery time</label>
      <div class="input-line">18 minutes</div>
      <button>Save Log</button>
    </div>
    <div v-else-if="screen === 'coach'" class="phone-screen">
      <p class="phone-kicker">🧠 AI COACH + METRICS</p>
      <h3>Sharp progress, steady pace.</h3>
      <div class="coach-card">
        <span>Trend</span>
        <strong>+0.7 lane</strong>
      </div>
      <div class="coach-card light">
        <span>Next target</span>
        <strong>Medium salsa verde</strong>
      </div>
      <p class="phone-note">Stay near lane 5 this week and avoid stacking high-heat meals.</p>
    </div>
    <div v-else class="phone-screen">
      <p class="phone-kicker">🍽️ NEARBY ITEMS</p>
      <h3>What to try here</h3>
      <div class="mini-restaurant">
        <div class="phone-food restaurant-food"></div>
        <div>
          <strong>Inferno tacos</strong>
          <span>8.1 heat · 12 reviews</span>
        </div>
      </div>
      <div class="mini-restaurant">
        <div
          class="phone-food sauce-food"
          :style="{ backgroundImage: `url(${assetPath('/images/roasted-habanero-sauce.png')})` }"
        ></div>
        <div>
          <strong>Roasted habanero sauce</strong>
          <span>7.3 heat · approved</span>
        </div>
      </div>
      <button>Suggest Item</button>
    </div>
  </article>
</template>

<script setup lang="ts">
defineProps<{
  screen: 'home' | 'log' | 'coach' | 'restaurants'
}>()

const config = useRuntimeConfig()
const appBase = config.app.baseURL || '/'
const assetPath = (path: string) => `${appBase.replace(/\/$/, '')}${path}`
</script>
