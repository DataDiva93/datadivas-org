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
        label: 'Getting Started',
        items: [
          { label: 'Home', link: '/' },
          { label: 'Start Here', link: '/start-here' },
          { label: 'Standards', link: '/standards' },
          { label: 'Ship Week', link: '/ship-week' },
          { label: 'Tracks', link: '/tracks' },
        ],
      },
      {
        label: 'Resources',
        collapsed: false,
        items: [
          { label: 'Overview', link: '/resources/' },
          { label: 'Breaking Into Data', link: '/resources/breaking-into-data' },
          { label: 'Data Career Paths', link: '/resources/data-careers' },
          { label: 'Data Resources', link: '/resources/data-resources' },
          { label: 'Excel Resources', link: '/resources/excel-resources' },
          { label: 'Azure Resources', link: '/resources/azure-resources' },
          { label: 'SQL Resources', link: '/resources/sql-resources' },
          { label: 'Data Engineering Study Guide', link: '/resources/data-engineering-study-guide' },
        ],
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
