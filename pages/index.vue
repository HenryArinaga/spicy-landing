<template>
  <main data-motion-layer>
    <header class="site-nav">
      <NuxtLink class="brand" to="/">
        <span class="brand-mark">S</span>
        <span>Spicy</span>
      </NuxtLink>
      <nav aria-label="Primary navigation">
        <a href="#features">Features</a>
        <a href="#howitworks">How it works</a>
        <a href="#screens">Screens</a>
        <a href="#pricing">Pricing</a>
        <a href="#safety">Safety</a>
        <a href="#faq">FAQ</a>
      </nav>
      <a class="nav-cta" :href="discordUrl" target="_blank" rel="noopener noreferrer">Join Discord</a>
    </header>

    <section class="hero section-shell">
      <div v-motion="revealMotion(0, 18)" class="hero-copy">
        <p class="eyebrow">Spice tolerance dashboard</p>
        <h1>Track heat, log meals, build tolerance with clear data.</h1>
        <p class="hero-text">
          Spicy turns spicy food into a simple progress dashboard: current heat lane, recent logs,
          recovery trends, and the next meal that fits your tolerance.
        </p>
        <div class="hero-actions">
          <a class="button primary" :href="discordUrl" target="_blank" rel="noopener noreferrer">Join Discord</a>
          <a class="button secondary" href="#howitworks">See how it works</a>
        </div>
        <p class="hero-note">Join Discord for TestFlight access and launch updates.</p>
        <dl class="hero-stats">
          <div v-motion="revealMotion(0.1, 12)" :hovered="liftHover">
            <dt>4.8</dt>
            <dd>current heat lane</dd>
          </div>
          <div v-motion="revealMotion(0.16, 12)" :hovered="liftHover">
            <dt>12</dt>
            <dd>logged meals this month</dd>
          </div>
          <div v-motion="revealMotion(0.22, 12)" :hovered="liftHover">
            <dt>18m</dt>
            <dd>median recovery time</dd>
          </div>
        </dl>
      </div>

      <div v-motion="revealMotion(0.08, 18)" class="hero-visual dashboard-visual" aria-label="Spicy app dashboard previews">
        <HeatLaneLottie class="heat-lane-motion" />
        <div v-motion="revealMotion(0.22, 16)" :hovered="liftHover" class="dashboard-card tolerance-card">
          <div>
            <span>Weekly tolerance</span>
            <strong>+0.6</strong>
          </div>
          <div class="mini-bars" aria-hidden="true">
            <i style="height: 38%"></i>
            <i style="height: 45%"></i>
            <i style="height: 48%"></i>
            <i style="height: 58%"></i>
            <i style="height: 62%"></i>
          </div>
        </div>
        <div v-motion="revealMotion(0.3, 16)" :hovered="liftHover" class="dashboard-card macro-card">
          <div class="progress-ring" style="--progress: 68">
            <span>68%</span>
          </div>
          <div>
            <span>Comfort match</span>
            <strong>Chili garlic noodles</strong>
          </div>
        </div>
        <AppPhone class="phone-main" screen="home" />
        <AppPhone class="phone-side" screen="log" />
      </div>
    </section>

    <section id="features" class="section-shell feature-band">
      <div v-motion="revealMotion()" class="section-heading">
        <p class="eyebrow">Data-forward tolerance training</p>
        <h2>A calmer dashboard for what you ate, how it felt, and what to try next.</h2>
      </div>
      <div class="feature-bento">
        <article v-motion="revealMotion(0.04)" :hovered="liftHover" class="bento-card bento-large">
          <p class="bento-label">Progress dashboard</p>
          <h3>See your current heat lane, trend, and recovery in one view.</h3>
          <p>
            Spicy learns from your perceived heat, reaction, recovery time, and notes so your
            recommendations stay close to what your body can actually handle.
          </p>
          <div class="metric-strip">
            <div>
              <span>Current lane</span>
              <strong>4.8</strong>
            </div>
            <div>
              <span>7 day trend</span>
              <strong>+0.3</strong>
            </div>
            <div>
              <span>Recovery</span>
              <strong>18m</strong>
            </div>
          </div>
          <div class="lane-preview">
            <div>
              <span>Lane progress</span>
              <strong>48%</strong>
            </div>
            <div class="meter"><span style="width: 48%"></span></div>
          </div>
        </article>
        <article v-motion="revealMotion(0.1)" :hovered="liftHover" class="bento-card bento-tall">
          <p class="bento-label">Next best meal</p>
          <h3>One clear recommendation with context.</h3>
          <p>
            Get a dish that sits near your current lane instead of guessing from vague menu labels
            like mild, medium, or hot.
          </p>
          <div class="recommendation-mini">
            <div class="match-score">92</div>
            <div>
              <strong>Spicy miso ramen</strong>
              <span>Good match, lane 5.1, +0.3 step</span>
            </div>
          </div>
        </article>
        <article
          v-for="(feature, index) in features"
          :key="feature.title"
          v-motion="revealMotion(0.16 + index * 0.05)"
          :hovered="liftHover"
          class="bento-card"
        >
          <p class="bento-label">{{ feature.icon }}</p>
          <h3>{{ feature.title }}</h3>
          <p>{{ feature.body }}</p>
        </article>
      </div>
    </section>

    <section id="howitworks" class="section-shell steps-section">
      <div v-motion="revealMotion()" class="section-heading narrow">
        <p class="eyebrow">How it works</p>
        <h2>A simple logging loop that makes the next recommendation smarter.</h2>
        <p>
          Spicy keeps the process practical: understand your baseline, try something nearby, then
          log what happened so the next recommendation gets smarter.
        </p>
      </div>
      <div class="timeline">
        <article v-for="(step, index) in steps" :key="step.title" v-motion="revealMotion(index * 0.08)" class="step-card">
          <div class="step-content">
            <span>0{{ index + 1 }}</span>
            <h3>{{ step.title }}</h3>
            <p>{{ step.body }}</p>
          </div>
          <div class="step-art" :class="step.art">
            <div v-if="step.art === 'quiz'" class="quiz-art">
              <span>Baseline lane 3.9</span>
              <span>Preferred cuisines</span>
              <span>Safety limits</span>
            </div>
            <div v-else-if="step.art === 'food'" class="food-art">
              <div class="mini-photo tacos"></div>
              <div>
                <strong>Next try</strong>
                <span>Chile verde tacos</span>
              </div>
            </div>
            <div v-else class="bar-art">
              <span style="height: 28%"></span>
              <span style="height: 46%"></span>
              <span style="height: 62%"></span>
              <span style="height: 78%"></span>
            </div>
          </div>
        </article>
      </div>
      <div v-motion="revealMotion()" :hovered="subtleHover" class="curve-card">
        <div>
          <p class="eyebrow">Tolerance curve</p>
          <h3>Progress should look steady, not spiky.</h3>
          <p>
            The goal is not to chase the hottest possible meal. Spicy helps you notice when your
            comfort zone is moving and when to hold steady.
          </p>
        </div>
        <div class="curve-chart" aria-label="Illustration of gradual heat tolerance progress">
          <span class="axis-label top">Higher heat</span>
          <span class="axis-label bottom">Baseline</span>
          <div class="target-line">Comfort zone</div>
          <div class="curve-fill"></div>
          <i style="left: 8%; bottom: 18%"></i>
          <i style="left: 42%; bottom: 42%"></i>
          <i style="left: 76%; bottom: 66%"></i>
        </div>
      </div>
    </section>

    <section id="screens" class="section-shell screens-section">
      <div v-motion="revealMotion()" class="section-heading">
        <p class="eyebrow">Representative app previews</p>
        <h2>Dashboard screens for recommendations, coaching, and restaurant decisions.</h2>
      </div>
      <div class="screen-grid">
        <AppPhone v-motion="revealMotion(0.04)" screen="home" />
        <AppPhone v-motion="revealMotion(0.12)" screen="coach" />
        <AppPhone v-motion="revealMotion(0.2)" screen="restaurants" />
      </div>
    </section>

    <section class="section-shell food-section">
      <div v-motion="revealMotion()">
        <p class="eyebrow">Restaurant discovery</p>
        <h2>Compare heat data before you order.</h2>
        <p>
          Browse community-rated spicy items, compare average heat, recovery notes, and match score,
          then log the meal without starting from a blank form.
        </p>
      </div>
      <div v-motion="revealMotion(0.1)" :hovered="subtleHover" class="restaurant-card">
        <img
          :src="assetPath('/images/chile-crisp-noodles.png')"
          alt="Chile crisp noodles with scallions and sesame seeds"
        >
        <div>
          <p class="eyebrow">Community pick</p>
          <h3>Chili crisp noodles</h3>
          <p>Average heat 7.4 / 10, 86% match, estimated 42,000 SHU</p>
        </div>
      </div>
    </section>

    <section id="pricing" class="section-shell pricing-section">
      <div v-motion="revealMotion()" class="section-heading narrow">
        <p class="eyebrow">Pricing</p>
        <h2>Start free. Upgrade when you want deeper guidance.</h2>
      </div>
      <div class="pricing-grid">
        <article v-motion="revealMotion(0.04)" :hovered="liftHover" class="price-card">
          <h3>Free</h3>
          <p class="price">$0 <span>/ month</span></p>
          <p>Essential tools for finding your baseline and logging your first foods.</p>
          <ul>
            <li>Baseline assessment</li>
            <li>Core food logging</li>
            <li>Community heat ratings</li>
            <li>Limited recommendations</li>
            <li>Safety minded guidance</li>
          </ul>
          <a class="button secondary" :href="discordUrl" target="_blank" rel="noopener noreferrer">Join the waitlist</a>
        </article>
        <article v-motion="revealMotion(0.12)" :hovered="liftHover" class="price-card featured-price">
          <p class="eyebrow">Most useful</p>
          <h3>Spicy Plus</h3>
          <p class="price">$4.99 <span>/ month</span></p>
          <p>More personalized coaching for people using Spicy regularly.</p>
          <ul>
            <li>Personalized AI coach</li>
            <li>Unlimited logs</li>
            <li>Advanced progress insights</li>
            <li>Restaurant discovery</li>
            <li>Photo food identification</li>
          </ul>
          <a class="button primary" :href="discordUrl" target="_blank" rel="noopener noreferrer">Join Discord</a>
        </article>
      </div>
      <div v-motion="revealMotion()" class="comparison-card">
        <h3>Feature breakdown</h3>
        <div class="comparison-table">
          <div class="comparison-row heading">
            <span>Feature</span>
            <span>Free</span>
            <span>Plus</span>
          </div>
          <div v-for="row in comparisonRows" :key="row.feature" class="comparison-row">
            <span>{{ row.feature }}</span>
            <span>{{ row.free }}</span>
            <span>{{ row.plus }}</span>
          </div>
        </div>
      </div>
      <p class="pricing-note">Pricing subject to change. App Store availability and subscription terms may vary.</p>
    </section>

    <section id="safety" v-motion="revealMotion()" class="section-shell safety-section">
      <div>
        <p class="eyebrow">Safety first</p>
        <h2>Spicy is guidance, not medical advice.</h2>
      </div>
      <p>
        Spicy is for informational and educational purposes only. It does not provide medical
        advice, diagnosis, or treatment. Avoid foods that conflict with allergies, medical
        conditions, personal health guidance, or your own comfort.
      </p>
    </section>

    <section id="faq" class="section-shell faq-section">
      <div v-motion="revealMotion()" class="section-heading narrow">
        <p class="eyebrow">FAQ</p>
        <h2>Good questions before the first bite.</h2>
      </div>
      <div class="faq-categories">
        <article
          v-for="(category, index) in faqCategories"
          :key="category.title"
          v-motion="revealMotion(index * 0.05)"
          :hovered="liftHover"
        >
          <span>{{ category.icon }}</span>
          <h3>{{ category.title }}</h3>
          <p>{{ category.body }}</p>
        </article>
      </div>
      <div class="faq-list">
        <details v-for="(item, index) in faqs" :key="item.question" v-motion="revealMotion(index * 0.04)">
          <summary>{{ item.question }}</summary>
          <p>{{ item.answer }}</p>
        </details>
      </div>
      <div v-motion="revealMotion()" :hovered="subtleHover" class="support-card">
        <div>
          <h3>Still have questions?</h3>
          <p>Reach out if something about your account, privacy, or subscription is unclear.</p>
        </div>
        <a class="button primary" :href="discordUrl" target="_blank" rel="noopener noreferrer">Join Discord</a>
      </div>
    </section>

    <footer class="site-footer">
      <div>
        <NuxtLink class="brand" to="/">
          <span class="brand-mark">S</span>
          <span>Spicy</span>
        </NuxtLink>
        <p>Train your taste buds with practical recommendations and calm progress tracking.</p>
      </div>
      <nav aria-label="Legal navigation">
        <NuxtLink to="/privacy-policy">Privacy Policy</NuxtLink>
        <NuxtLink to="/terms-of-service">Terms of Service</NuxtLink>
        <NuxtLink to="/health-ai-disclaimer">Health AI Disclaimer</NuxtLink>
        <NuxtLink to="/community-guidelines">Community Guidelines</NuxtLink>
        <a :href="discordUrl" target="_blank" rel="noopener noreferrer">Join Discord</a>
        <a :href="xUrl" target="_blank" rel="noopener noreferrer">Follow Spicy on X</a>
      </nav>
      <p class="copyright">© 2026 Spicy</p>
    </footer>
  </main>
</template>

<script setup lang="ts">
const config = useRuntimeConfig()
const appBase = config.app.baseURL || '/'
const assetPath = (path: string) => `${appBase.replace(/\/$/, '')}${path}`
const siteUrl = config.public.siteUrl.replace(/\/$/, '')
const discordUrl = 'https://discord.gg/2n4uSk3Tqj'
const xUrl = 'https://x.com/Spicylabs_'
const pageTitle = 'Spicy | Train your spice tolerance, one bite at a time'
const pageDescription =
  'Spicy is a mobile app for building spice tolerance with personalized food recommendations, heat logging, AI coach insights, restaurant discovery, and safety minded progress.'
const pageUrl = `${siteUrl}/`
const ogImage = `${siteUrl}/images/chile-crisp-noodles.png`
const logoImage = `${siteUrl}/images/spicy-app-icon.png`

const motionEase = [0.2, 0.8, 0.2, 1]
const revealMotion = (delay = 0, y = 22, scale = 0.99) => ({
  initial: {
    opacity: 0,
    y,
    scale
  },
  visibleOnce: {
    opacity: 1,
    y: 0,
    scale: 1,
    transition: {
      duration: 650,
      delay,
      ease: motionEase
    }
  }
})
const liftHover = {
  y: -4,
  scale: 1.01,
  transition: {
    duration: 180,
    ease: motionEase
  }
}
const subtleHover = {
  y: -3,
  transition: {
    duration: 180,
    ease: motionEase
  }
}

useSeoMeta({
  title: pageTitle,
  description: pageDescription,
  ogTitle: pageTitle,
  ogDescription: pageDescription,
  ogUrl: pageUrl,
  ogImage,
  ogImageAlt: 'Chile crisp noodles shown as a spicy food recommendation in Spicy',
  twitterTitle: pageTitle,
  twitterDescription: pageDescription,
  twitterImage: ogImage
})

const features = [
  {
    icon: 'AI coach',
    title: 'Coach insights',
    body: 'Turn recent logs into practical next targets, trends, and safety minded reminders.'
  },
  {
    icon: 'Photo scan',
    title: 'Photo identification',
    body: 'Scan or upload a food photo to speed up logging with an AI assisted guess.'
  },
  {
    icon: 'Restaurants',
    title: 'Restaurant discovery',
    body: 'Find approved spicy items near you with community heat ratings and item details.'
  },
  {
    icon: 'Quick log',
    title: 'Fast meal logging',
    body: 'Capture heat, reaction, recovery time, notes, and source without turning dinner into homework.'
  }
]

const steps = [
  {
    title: 'Find your baseline',
    body: 'Answer a short assessment so Spicy can estimate where your training should start.',
    art: 'quiz'
  },
  {
    title: 'Try the right next food',
    body: 'Get one clear recommendation near your current lane instead of a noisy feed.',
    art: 'food'
  },
  {
    title: 'Log how it felt',
    body: 'Record perceived heat, reaction, and recovery so your lane adjusts over time.',
    art: 'chart'
  }
]

const comparisonRows = [
  {
    feature: 'Food logs',
    free: 'Core logging',
    plus: 'Unlimited history'
  },
  {
    feature: 'Recommendations',
    free: 'Limited',
    plus: 'Personalized'
  },
  {
    feature: 'AI coach',
    free: 'Not included',
    plus: 'Included'
  },
  {
    feature: 'Photo identification',
    free: 'Not included',
    plus: 'Included'
  },
  {
    feature: 'Restaurant discovery',
    free: 'Community ratings',
    plus: 'Full discovery'
  }
]

const faqCategories = [
  {
    icon: 'Start',
    title: 'Getting started',
    body: 'Assessment, onboarding, and your first recommendation.'
  },
  {
    icon: 'Lane',
    title: 'Heat lane',
    body: 'How Spicy estimates tolerance and tracks progress.'
  },
  {
    icon: 'Data',
    title: 'Privacy',
    body: 'How food logs, photos, and account details are handled.'
  },
  {
    icon: 'Plus',
    title: 'Spicy Plus',
    body: 'Subscription features, billing, and cancellation.'
  }
]

const faqs = [
  {
    question: 'Is Spicy for beginners?',
    answer: 'Yes. Spicy starts with your baseline and keeps recommendations close to your current comfort zone.'
  },
  {
    question: 'How does Spicy estimate my spice level?',
    answer: 'It uses your baseline assessment, logs, perceived heat ratings, reactions, and recovery time.'
  },
  {
    question: 'Can I log restaurant foods?',
    answer: 'Yes. You can log what you tried, review approved spicy items, and submit new finds for moderation.'
  },
  {
    question: 'Does Spicy give medical advice?',
    answer: 'No. Spicy provides informational guidance only and should not be used for medical or safety critical decisions.'
  },
  {
    question: 'Can I cancel anytime?',
    answer: 'Subscription availability and cancellation are handled through the App Store once subscriptions are live.'
  },
  {
    question: 'How does Spicy handle my data?',
    answer: 'Spicy uses your account details, logs, photos, and app activity to operate the service and personalize recommendations. See the Privacy Policy for more detail.'
  }
]

useHead({
  link: [{ rel: 'canonical', href: pageUrl }],
  script: [
    {
      type: 'application/ld+json',
      children: JSON.stringify([
        {
          '@context': 'https://schema.org',
          '@type': 'Organization',
          name: 'Spicy',
          url: siteUrl,
          logo: logoImage,
          email: 'spicylabsdev@gmail.com'
        },
        {
          '@context': 'https://schema.org',
          '@type': 'WebSite',
          name: 'Spicy',
          url: siteUrl,
          description: pageDescription,
          inLanguage: 'en-US'
        },
        {
          '@context': 'https://schema.org',
          '@type': 'SoftwareApplication',
          name: 'Spicy',
          applicationCategory: 'LifestyleApplication',
          operatingSystem: 'iOS',
          description: pageDescription,
          image: ogImage,
          offers: [
            {
              '@type': 'Offer',
              name: 'Spicy Free',
              price: '0',
              priceCurrency: 'USD'
            },
            {
              '@type': 'Offer',
              name: 'Spicy Plus',
              price: '4.99',
              priceCurrency: 'USD',
              priceSpecification: {
                '@type': 'UnitPriceSpecification',
                price: '4.99',
                priceCurrency: 'USD',
                billingDuration: 'P1M'
              }
            }
          ],
          featureList: [
            'Spice tolerance assessment',
            'Personal heat lane tracking',
            'Food and reaction logging',
            'AI coach insights',
            'Restaurant item discovery',
            'Photo based food identification'
          ]
        },
        {
          '@context': 'https://schema.org',
          '@type': 'FAQPage',
          mainEntity: faqs.map((item) => ({
            '@type': 'Question',
            name: item.question,
            acceptedAnswer: {
              '@type': 'Answer',
              text: item.answer
            }
          }))
        }
      ])
    }
  ]
})
</script>
