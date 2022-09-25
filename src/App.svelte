<script lang="ts">
  import { isPermissionGranted } from "@tauri-apps/api/notification";
  import { relaunch } from "@tauri-apps/api/process";
  import { checkUpdate, installUpdate } from "@tauri-apps/api/updater";
  import { onMount } from "svelte";
  import Base64 from "./lib/Base64.svelte";
  import Clock from "./lib/Clock.svelte";
  import Countdown from "./lib/Countdown.svelte";
  import NotificationButton from "./lib/NotificationButton.svelte";
  import Version from "./lib/Version.svelte";

  async function tryUpdate() {
    try {
      const { shouldUpdate, manifest } = await checkUpdate();
      if (shouldUpdate) {
        // display dialog
        alert("Installing update");
        await installUpdate();
        // install complete, restart app
        alert("Update done, restarting");
        await relaunch();
      }
    } catch (error) {
      alert("Error occurred " + error);
    }
  }

  onMount(() => {
    tryUpdate();
  });

  let notifPromise = isPermissionGranted();
</script>

<main>
  <h2>Remembrancer</h2>
  <Clock />
  <Countdown />
  <hr />
  <Version />
  Notification Permissions:
  {#await notifPromise}
    loading...
  {:then notifPromise}
    {notifPromise}
  {:catch error}
    failed: {error.message}
  {/await}
  <br />
  <NotificationButton />
  <hr />
  <Base64 />
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

  h2 {
    color: #ff3e00;
    text-transform: uppercase;
    font-size: 2rem;
    font-weight: 100;
    line-height: 1.1;
    margin: 1rem auto 0 auto;
    max-width: 14rem;
  }
</style>
