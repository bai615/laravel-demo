<template>
    <section class="section">
        <div class="columns">
            <div class="column is-6 is-offset-3">
                <h1 class="title">最新文章</h1>

                <h3 v-for="post in allPosts"
                        :key="post.id"
                        class="title is-5">
                    <router-link :to="`/posts/${post.id}`">
                        {{ post.title }}
                    </router-link>
                </h3>
            </div>
        </div>
    </section>
</template>

<script>
import { ALL_POSTS_QUERY } from '@/graphql'

export default {
  name: 'Home',
  data () {
    return {
      allPosts: []
    }
  },
  apollo: {
    // fetch all posts
    allPosts: {
      query: ALL_POSTS_QUERY
    }
  }
}
</script>
