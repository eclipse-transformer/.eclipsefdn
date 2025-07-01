local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.transformer', 'eclipse-transformer') {
  settings+: {

    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  secrets+: [
    orgs.newOrgSecret('GPG_KEY_ID') {
      value: 'pass:bots/technology.transformer/gpg/key_id',
    },
    orgs.newOrgSecret('GPG_PASSPHRASE') {
      value: "pass:bots/technology.transformer/gpg/passphrase",
    },
    orgs.newOrgSecret('GPG_PRIVATE_KEY') {
      value: 'pass:bots/technology.transformer/gpg/secret-subkeys.asc',
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_PASSWORD') {
      value: "pass:bots/technology.transformer/central.sonatype.org/token-password",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_USERNAME') {
      value: "pass:bots/technology.transformer/central.sonatype.org/token-username",
    },
  ],
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
