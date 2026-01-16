// @ts-check
import { defineConfig } from 'astro/config';
import cloudflare from '@astrojs/cloudflare';
import starlight from '@astrojs/starlight';

import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://datadivas.org',
  adapter: cloudflare(),
  integrations: [starlight({
    title: 'Data Divas',
    description: 'The data community that ships. For Divas, Divos, and anyone serious about building.',
    social: [
      {
        icon: 'github',
        label: 'GitHub',
        href: 'https://github.com/DataDiva93',
      },
    ],
    editLink: {
      baseUrl: 'https://github.com/DataDiva93/datadivas-org/edit/main/',
    },
    sidebar: [
      {
        label: 'Docs',
        autogenerate: { directory: '.' },
      },
    ],
    customCss: [
      './src/styles/starlight-custom.css',
    ],
    expressiveCode: {
      themes: ['dracula'],
    },
    head: [
      {
        tag: 'link',
        attrs: {
          rel: 'preconnect',
          href: 'https://fonts.googleapis.com',
        },
      },
      {
        tag: 'link',
        attrs: {
          rel: 'preconnect',
          href: 'https://fonts.gstatic.com',
          crossorigin: 'anonymous',
        },
      },
      {
        tag: 'link',
        attrs: {
          href: 'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500;700&display=swap',
          rel: 'stylesheet',
        },
      },
    ],
  }),
  sitemap()],
});
