<script lang="ts">
  import { onMount } from "svelte";

  $: minutes = 0;
  $: seconds = 0;
  let interval;

  function startTimer(duration) {
    let timer = duration;
    interval = setInterval(() => {
      minutes = parseInt("" + timer / 60, 10);
      seconds = parseInt("" + (timer % 60), 10);

      if (--timer < 0) {
        timer = duration;
      }
    }, 1000);
  }

  onMount(() => {
    startTimer(60 * 60);
    () => {
      clearInterval(interval);
    };
  });
</script>

<div>
  {minutes > 9 ? minutes : "0" + minutes}:{seconds > 9
    ? seconds
    : "0" + seconds}
</div>

<style>
  div {
    font-size: 1em;
  }
</style>
