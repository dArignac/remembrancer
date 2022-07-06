<script lang="ts">
  import Countdown from "./lib/Countdown.svelte";
  import { isPermissionGranted } from "@tauri-apps/api/notification";
  import NotificationButton from "./lib/NotificationButton.svelte";

  let notifPromise = isPermissionGranted();
</script>

<main>
  <h1>Remembrancer</h1>
  <Countdown />
  <hr />
  Notification Permissions:
  {#await notifPromise}
    loading...
  {:then notifPromise}
    {notifPromise}
  {:catch error}
    failed: {error.message}
  {/await}
  <br /><br />
  <NotificationButton />
</main>

<style>
  :root {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
      Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
  }

  main {
    text-align: center;
    padding: 0em;
    margin: 0 auto;
  }

  h1 {
    color: #ff3e00;
    text-transform: uppercase;
    font-size: 2rem;
    font-weight: 100;
    line-height: 1.1;
    margin: 1rem auto;
    max-width: 14rem;
  }
</style>
