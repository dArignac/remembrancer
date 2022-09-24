import { context, getOctokit } from "@actions/github";

async function getPreviousTag(token) {
  const options = { owner: context.repo.owner, repo: context.repo.repo };
  const github = getOctokit(token);

  const { data: tags } = await github.rest.repos.listTags({
    ...options,
    per_page: 2,
    page: 1,
  });

  // prepare for setting to environment
  console.log(`PREVIOUS_TAG=${tags[1].name}`);
}

await getPreviousTag(process.argv.slice(2)[0]);
