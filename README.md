# Analytical Platform Status Page
This is the repository containing the Analytical Platform status
page.

The static website is generated using [Hugo](https://gohugo.io/)
a popular static website generator.

The Status Page use the [cState](https://github.com/cstate/cstate)
which also provide the "issue" archetype.


## Hugo installation
On a Mac you can hugo by running `brew install hugo`, alternatively you
can follow the [installation instructions on the Hugo website].

[installation instructions on the Hugo website]: https://gohugo.io/getting-started/installing/


## Creating a new incident

### Creating the incident page
> Incidents are simply Markdown files that are
> under content/issues/. They are formatted in such a way that cState
> can recognize the inputted data and generate your status page
> appropriately.

You can easily create a new issue by running the `./new-issue.sh` script:

```bash
$ ./new-issue.sh Upgrade Kubernetes cluster to v42

A new issue is been created at 'content/issues/2019-07-12-upgrade-kubernetes-cluster-to-v42.md'

****  IMPORTANT  ****
- edit this file to add the details about the issue
- be sure the list of affected systems is correct
- be sure the severity is correct
- use the '$ hugo server' command to preview the Status Page
- use the '$ hugo' command to re-build the Status Page files
- add, commit and push the files in '/docs' once you're happy with the output
```

Then edit this newly created file updating the following fields
as necessary:
- `title`, title of the issue, e.g. "DB Connection Issues"
- `date`, ISO-8601 formatted date when the incident was first discovered - including the seconds. (required)
- `resolved`, boolean, `true` when an issue is resolved
- `resolvedWhen`, date when the issue was resolved (required if `resolved` is `true`!)
- `severity`, can be `notice`, `disrupted` or `down` (from lower to higher severity)
- `affected`, list of systems affected, e.g. `Control Panel` or
  `Kubernetes Cluster`
- `section`, is always `issue` (don't change it)
- `published`, boolean which determine if the incident page is published

The details of the incident will go under `---` (there are some
example issues under [`content/issues/`](/content/issues/)).

Note the use of the `{{< track "2019-01-01 15:56:00" >}}` shortcode which
will be displayed nicely in the rendered page - just remember to include
the seconds.


Also see: [cState documentation on creating a new incident](https://github.com/cstate/cstate/wiki/Usage#creating-incidents-method-1).

### Testing Status Page locally
You can see how the Status Page will look like by running the Hugo
server locally.

From the [toplevel directory](/) run the following command:

```bash
$ hugo server
```

Then go to [http://localhost:1313/](http://localhost:1313/) in your
browser (or at whatever URL/port Hugo will run at).


### Publish the Status Page
The Status Page is hosted on GitHub Pages at https://ministryofjustice.github.io/analytics-platform-status-page/

The repository is configured to serve files from `/docs`.
That's why `/config.yml` contains the `publishDir: "docs"` option.

To update the Status Page
1. rebuild the static website by runnng `hugo`
2. commit the changes and push to the `master` branch
3. this could take a brief period of time to update the Status Page.


## The "issue" archetype
The "issue" archetype is just a custom page type with the following
attributes:


## Systems
Systems are high level (ish) components. Users may want to know if
these are operational or not.

At the moment we only have the following Systems:
- `Control Panel`
- `Kubernetes Cluster`

We may want to add more or tweak the description. This can be done
updating the `params.systems` configuration in the [`/config.yml`](/config.yml) file if necessary.

**NOTE**: When using these in the `affected` field of an issue be sure
that the case is the same.

## Custom Tabs
Custom Tabs are shown in the page and we use them to link to the status pages of the following services:
- Auth0
- AWS
- GitHub

Again, if necessary this list can be changed by changing the `customTabs`
configuration in the [`/config.yml`](/config.yml) file.


## cstate documentation
For additional information you can look at the cState wiki at https://github.com/cstate/cstate/wiki
