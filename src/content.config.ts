import { defineCollection, z } from 'astro:content';
import { docsSchema } from '@astrojs/starlight/schema';

const labs = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    level: z.enum(['beginner', 'intermediate', 'advanced']),
    time_estimate: z.string(),
    stack: z.array(z.string()),
    artifacts: z.array(z.string()),
    ship_requires: z.array(z.string()),
  }),
});

const docs = defineCollection({
  schema: docsSchema(),
});

export const collections = { labs, docs };
