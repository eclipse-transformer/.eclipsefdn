local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.transformer', 'eclipse-transformer') {
  settings+: {

    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('transformer') {
      allow_merge_commit: true,
      allow_rebase_merge: false,
      allow_squash_merge: false,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Transformer provides tools and runtime components that transform Java binaries, such as individual class files and complete JARs and WARs, mapping changes to Java packages, type names, and related resource names.",
      gh_pages_build_type: "workflow",
      homepage: "https://projects.eclipse.org/projects/technology.transformer",
      topics+: [
        "eclipse-transformer",
        "jakarta",
        "java",
        "renaming-rules"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('GPG_FINGERPRINT') {
          value: "********",
        },
        orgs.newRepoSecret('GPG_PASSPHRASE') {
          value: "********",
        },
        orgs.newRepoSecret('GPG_PRIVATE_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('OSSRH_PASSWORD') {
          value: "pass:bots/technology.transformer/central.sonatype.org/password",
        },
        orgs.newRepoSecret('OSSRH_USERNAME') {
          value: "pass:bots/technology.transformer/central.sonatype.org/username",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}
