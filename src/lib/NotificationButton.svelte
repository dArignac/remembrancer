<script lang="ts">
  import { sendNotification } from "@tauri-apps/api/notification";

  function onClick() {
    sendNotification({
      title: "REMEMBRANCER!!!",
      //   icon: "icons/icon.png", unclear which value is needed
      body: "Remembrancer is awesome!",
    });
  }
</script>

<button on:click={onClick}>Trigger Notification</button>
