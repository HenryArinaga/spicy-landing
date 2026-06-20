<template>
  <article class="phone-frame">
    <div class="phone-status">
      <span>9:41</span>
      <span>LTE</span>
    </div>
    <div v-if="screen === 'home'" class="phone-screen">
      <p class="phone-kicker">TODAY'S DASHBOARD</p>
      <h3>Heat lane 4.8</h3>
      <div class="phone-summary-grid">
        <div>
          <span>Trend</span>
          <strong>+0.3</strong>
        </div>
        <div>
          <span>Logs</span>
          <strong>12</strong>
        </div>
      </div>
      <div class="phone-ring-row">
        <div class="progress-ring" style="--progress: 68">
          <span>68%</span>
        </div>
        <div>
          <span>Comfort match</span>
          <strong>Chili garlic noodles</strong>
          <small>Lane 5.1, small step up</small>
        </div>
      </div>
      <div class="lane-row">
        <span>Lane progress</span>
        <strong>4.8 / 10</strong>
      </div>
      <div class="meter"><span style="width: 48%"></span></div>
      <button>Log Recommended Food</button>
    </div>
    <div v-else-if="screen === 'log'" class="phone-screen">
      <p class="phone-kicker">LOG FOOD</p>
      <h3>Chili garlic noodles</h3>
      <div class="log-card">
        <span>Perceived heat</span>
        <strong>6.5</strong>
        <div class="slider-track"><span></span></div>
      </div>
      <div class="phone-summary-grid">
        <div>
          <span>Reaction</span>
          <strong>Good</strong>
        </div>
        <div>
          <span>Recovery</span>
          <strong>18m</strong>
        </div>
      </div>
      <label>Notes</label>
      <div class="input-line">Sweaty, manageable burn</div>
      <button>Save Log</button>
    </div>
    <div v-else-if="screen === 'coach'" class="phone-screen">
      <p class="phone-kicker">COACH METRICS</p>
      <h3>Steady pace this week.</h3>
      <div class="coach-card">
        <span>Heat lane trend</span>
        <strong>+0.7 lane</strong>
        <div class="mini-bars compact" aria-hidden="true">
          <i style="height: 32%"></i>
          <i style="height: 45%"></i>
          <i style="height: 52%"></i>
          <i style="height: 64%"></i>
        </div>
      </div>
      <div class="coach-card light">
        <span>Next target</span>
        <strong>Medium salsa verde</strong>
      </div>
      <p class="phone-note">Stay near lane 5 this week and avoid stacking high-heat meals.</p>
    </div>
    <div v-else class="phone-screen">
      <p class="phone-kicker">RESTAURANT DATA</p>
      <h3>What fits here</h3>
      <div class="restaurant-metric">
        <span>Best match</span>
        <strong>86%</strong>
      </div>
      <div class="mini-restaurant">
        <div class="phone-food restaurant-food"></div>
        <div>
          <strong>Chile crisp noodles</strong>
          <span>7.4 heat, 86% match</span>
        </div>
      </div>
      <div class="mini-restaurant">
        <div
          class="phone-food sauce-food"
          :style="{ backgroundImage: `url(${assetPath('/images/roasted-habanero-sauce.png')})` }"
        ></div>
        <div>
          <strong>Roasted habanero sauce</strong>
          <span>7.3 heat, 74% match</span>
        </div>
      </div>
      <button>Log Restaurant Food</button>
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
