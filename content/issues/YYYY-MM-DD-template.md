---
# DO NOT REMOVE: Template file used by new-issue.sh
title: $ISSUE_TITLE
date: $ISSUE_DATETIME
resolved: false
# resolvedWhen: $ISSUE_DATETIME
# Possible severity levels: down, disrupted, notice
severity: notice
affected:
  - Control Panel
  - Kubernetes Cluster
section: issue
published: false
---
<!--
*Resolved* -
We believe the issues with [...] are now resolved. {{< track "$ISSUE_DATETIME" >}}

*Monitoring* - We believe the issues are being caused by [...]. {{< track "$ISSUE_DATETIME" >}} -->

*Investigating* - We're aware of reports that users are experiencing issues.
We're currently investigating these issues, and apologize for any inconvenience it may be causing you. {{< track "$ISSUE_DATETIME" >}}
