{"payload":{"allShortcutsEnabled":false,"fileTree":{"images/docker-stacks-foundation":{"items":[{"name":".dockerignore","path":"images/docker-stacks-foundation/.dockerignore","contentType":"file"},{"name":"10activate-conda-env.sh","path":"images/docker-stacks-foundation/10activate-conda-env.sh","contentType":"file"},{"name":"Dockerfile","path":"images/docker-stacks-foundation/Dockerfile","contentType":"file"},{"name":"README.md","path":"images/docker-stacks-foundation/README.md","contentType":"file"},{"name":"fix-permissions","path":"images/docker-stacks-foundation/fix-permissions","contentType":"file"},{"name":"initial-condarc","path":"images/docker-stacks-foundation/initial-condarc","contentType":"file"},{"name":"run-hooks.sh","path":"images/docker-stacks-foundation/run-hooks.sh","contentType":"file"},{"name":"start.sh","path":"images/docker-stacks-foundation/start.sh","contentType":"file"}],"totalCount":8},"images":{"items":[{"name":"all-spark-notebook","path":"images/all-spark-notebook","contentType":"directory"},{"name":"base-notebook","path":"images/base-notebook","contentType":"directory"},{"name":"datascience-notebook","path":"images/datascience-notebook","contentType":"directory"},{"name":"docker-stacks-foundation","path":"images/docker-stacks-foundation","contentType":"directory"},{"name":"julia-notebook","path":"images/julia-notebook","contentType":"directory"},{"name":"minimal-notebook","path":"images/minimal-notebook","contentType":"directory"},{"name":"pyspark-notebook","path":"images/pyspark-notebook","contentType":"directory"},{"name":"pytorch-notebook","path":"images/pytorch-notebook","contentType":"directory"},{"name":"r-notebook","path":"images/r-notebook","contentType":"directory"},{"name":"scipy-notebook","path":"images/scipy-notebook","contentType":"directory"},{"name":"tensorflow-notebook","path":"images/tensorflow-notebook","contentType":"directory"}],"totalCount":11},"":{"items":[{"name":".github","path":".github","contentType":"directory"},{"name":"aarch64-runner","path":"aarch64-runner","contentType":"directory"},{"name":"binder","path":"binder","contentType":"directory"},{"name":"docs","path":"docs","contentType":"directory"},{"name":"examples","path":"examples","contentType":"directory"},{"name":"images","path":"images","contentType":"directory"},{"name":"tagging","path":"tagging","contentType":"directory"},{"name":"tests","path":"tests","contentType":"directory"},{"name":".flake8","path":".flake8","contentType":"file"},{"name":".gitattributes","path":".gitattributes","contentType":"file"},{"name":".gitignore","path":".gitignore","contentType":"file"},{"name":".hadolint.yaml","path":".hadolint.yaml","contentType":"file"},{"name":".markdownlint.yaml","path":".markdownlint.yaml","contentType":"file"},{"name":".pre-commit-config.yaml","path":".pre-commit-config.yaml","contentType":"file"},{"name":".readthedocs.yaml","path":".readthedocs.yaml","contentType":"file"},{"name":"CODE_OF_CONDUCT.md","path":"CODE_OF_CONDUCT.md","contentType":"file"},{"name":"CONTRIBUTING.md","path":"CONTRIBUTING.md","contentType":"file"},{"name":"LICENSE.md","path":"LICENSE.md","contentType":"file"},{"name":"Makefile","path":"Makefile","contentType":"file"},{"name":"README.md","path":"README.md","contentType":"file"},{"name":"mypy.ini","path":"mypy.ini","contentType":"file"},{"name":"requirements-dev.txt","path":"requirements-dev.txt","contentType":"file"}],"totalCount":22}},"fileTreeProcessingTime":8.346887,"foldersToFetch":[],"repo":{"id":39144867,"defaultBranch":"main","name":"docker-stacks","ownerLogin":"jupyter","currentUserCanPush":false,"isFork":false,"isEmpty":false,"createdAt":"2015-07-15T15:30:00.000Z","ownerAvatar":"https://avatars.githubusercontent.com/u/7388996?v=4","public":true,"private":false,"isOrgOwned":true},"symbolsExpanded":false,"treeExpanded":true,"refInfo":{"name":"main","listCacheKey":"v0:1703523814.0","canEdit":false,"refType":"branch","currentOid":"d44add21d53f4e4730c1abee9f0d3c361ba54155"},"path":"images/docker-stacks-foundation/10activate-conda-env.sh","currentUser":null,"blob":{"rawLines":["#!/bin/bash","# Copyright (c) Jupyter Development Team.","# Distributed under the terms of the Modified BSD License.","","# This registers the initialization code for the conda shell code","# It also activates default environment in the end, so we don't need to activate it manually","# Documentation: https://docs.conda.io/projects/conda/en/latest/dev-guide/deep-dives/activation.html","eval \"$(conda shell.bash hook)\""],"stylingDirectives":[[{"start":0,"end":11,"cssClass":"pl-c"},{"start":0,"end":2,"cssClass":"pl-c"}],[{"start":0,"end":41,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":58,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[],[{"start":0,"end":65,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":92,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":100,"cssClass":"pl-c"},{"start":0,"end":1,"cssClass":"pl-c"}],[{"start":0,"end":4,"cssClass":"pl-c1"},{"start":5,"end":31,"cssClass":"pl-s"},{"start":5,"end":6,"cssClass":"pl-pds"},{"start":6,"end":30,"cssClass":"pl-s"},{"start":6,"end":8,"cssClass":"pl-pds"},{"start":29,"end":30,"cssClass":"pl-pds"},{"start":30,"end":31,"cssClass":"pl-pds"}]],"csv":null,"csvError":null,"dependabotInfo":{"showConfigurationBanner":false,"configFilePath":null,"networkDependabotPath":"/jupyter/docker-stacks/network/updates","dismissConfigurationNoticePath":"/settings/dismiss-notice/dependabot_configuration_notice","configurationNoticeDismissed":null},"displayName":"10activate-conda-env.sh","displayUrl":"https://github.com/jupyter/docker-stacks/blob/main/images/docker-stacks-foundation/10activate-conda-env.sh?raw=true","headerInfo":{"blobSize":"406 Bytes","deleteTooltip":"You must be signed in to make or propose changes","editTooltip":"You must be signed in to make or propose changes","deleteInfo":{"deleteTooltip":"You must be signed in to make or propose changes"},"editInfo":{"editTooltip":"You must be signed in to make or propose changes"},"ghDesktopPath":"https://desktop.github.com","isGitLfs":false,"gitLfsPath":null,"onBranch":true,"shortPath":"ed7347f","siteNavLoginPath":"/login?return_to=https%3A%2F%2Fgithub.com%2Fjupyter%2Fdocker-stacks%2Fblob%2Fmain%2Fimages%2Fdocker-stacks-foundation%2F10activate-conda-env.sh","isCSV":false,"isRichtext":false,"toc":null,"lineInfo":{"truncatedLoc":"8","truncatedSloc":"7"},"mode":"executable file"},"image":false,"isCodeownersFile":null,"isPlain":false,"isValidLegacyIssueTemplate":false,"issueTemplateHelpUrl":"https://docs.github.com/articles/about-issue-and-pull-request-templates","issueTemplate":null,"discussionTemplate":null,"language":"Shell","languageID":346,"large":false,"loggedIn":false,"planSupportInfo":{"repoIsFork":null,"repoOwnedByCurrentUser":null,"requestFullPath":"/jupyter/docker-stacks/blob/main/images/docker-stacks-foundation/10activate-conda-env.sh","showFreeOrgGatedFeatureMessage":null,"showPlanSupportBanner":null,"upgradeDataAttributes":null,"upgradePath":null},"publishBannersInfo":{"dismissActionNoticePath":"/settings/dismiss-notice/publish_action_from_dockerfile","releasePath":"/jupyter/docker-stacks/releases/new?marketplace=true","showPublishActionBanner":false},"rawBlobUrl":"https://github.com/jupyter/docker-stacks/raw/main/images/docker-stacks-foundation/10activate-conda-env.sh","renderImageOrRaw":false,"richText":null,"renderedFileInfo":null,"shortPath":null,"symbolsEnabled":true,"tabSize":8,"topBannersInfo":{"overridingGlobalFundingFile":false,"globalPreferredFundingPath":null,"repoOwner":"jupyter","repoName":"docker-stacks","showInvalidCitationWarning":false,"citationHelpUrl":"https://docs.github.com/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-citation-files","actionsOnboardingTip":null},"truncated":false,"viewable":true,"workflowRedirectUrl":null,"symbols":{"timed_out":false,"not_analyzed":false,"symbols":[]}},"copilotInfo":null,"copilotAccessAllowed":false,"csrf_tokens":{"/jupyter/docker-stacks/branches":{"post":"ZeIRJNoMtPkfvD3Qwt5d3DcEmYjEIkkD5weJ0yT05FjQtgSQDXhSvpJVvPgLoqSE1xT2k4oVK5eL1d_fQeDE7A"},"/repos/preferences":{"post":"o_W6W1v7jL7-W2mo3S0rQF2A-OBCSlQuX-FTYGeALiRJCcb-bEwt1uE2gvW9QxjKFAIjafIWf6QT8MsxhLSAiA"}}},"title":"docker-stacks/images/docker-stacks-foundation/10activate-conda-env.sh at main · jupyter/docker-stacks"}