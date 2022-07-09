<script>
  import { onMount } from "svelte";

  let time = new Date();
  $: hours = time.getHours();
  $: minutes = time.getMinutes();
  $: seconds = time.getSeconds();

  onMount(() => {
    const interval = setInterval(() => {
      time = new Date();
    }, 1000);

    return () => {
      clearInterval(interval);
    };
  });
</script>

<div>
  {hours}:{minutes > 9 ? minutes : "0" + minutes}:{seconds > 9
    ? seconds
    : "0" + seconds}
</div>

<style>
  div {
    font-size: 2em;
  }
</style>
