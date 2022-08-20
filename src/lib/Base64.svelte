<script lang="ts">
  import { writeText, readText } from "@tauri-apps/api/clipboard";

  let input = "";
  let output = "";
  async function encode(readFromClipboard = false) {
    if (readFromClipboard) {
      input = await readText();
    }
    output = btoa(input);
    await writeText(output);
  }
  async function decode(readFromClipboard = false) {
    if (readFromClipboard) {
      input = await readText();
    }
    output = atob(input);
    await writeText(output);
  }
</script>

<div class="container">
  <textarea bind:value={input} />
  <div class="colspan">
    <button on:click={() => encode()}>Encode</button>
    <br />
    <button on:click={() => encode(true)}>Encode from clipboard</button>
    <br />
    <button on:click={() => decode()}>Decode</button>
    <br />
    <button on:click={() => decode(true)}>Decode from Clipboard</button>
  </div>
  <textarea bind:value={output} />
</div>

<style>
  button {
    margin-bottom: 10px;
  }
  textarea {
    height: 100px;
    width: 100%;
  }
  .container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-rows: 1fr;
    gap: 5px 5px;
    justify-content: start;
    justify-items: center;
    align-items: start;
  }
  .colspan {
    grid-row: span 2;
    text-align: left;
  }
</style>
