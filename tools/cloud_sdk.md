# Cloud SDK: Command Line Interface
      
## The gcloud command-line tool cheat sheet

<p>A roster of go-to <code translate="no" >gcloud</code> commands for the <code translate="no" >gcloud</code> tool,
Google Cloud’s primary command-line tool. See <a href="https://cloud.google.com/sdk/docs/cheatsheet">gcloud-cheatsheet</a></p>

<p>(Also included: 
<a href="#introductory_primer">introductory primer</a>,
<a href="#understanding_commands">understanding commands</a>, and a
<a href="https://cloud.google.com/sdk/docs/images/gcloud-cheat-sheet.pdf" data-category="Cloud SDK" data-label="cheatsheet" download="">printable PDF</a>.)</p>

<h2 id="cheat_sheet" data-text="Cheat sheet" role="presentation"><span class="devsite-heading" role="heading" aria-level="2">Cheat sheet</span></h2>

---

### gcloud cheat sheet poster

---

![gcloud cheat sheet pg.1 "gcloud cheat sheet pg.1"](../media/gcloud-cheat-sheet-1.png)

---

![gcloud cheat sheet pg.2 "gcloud cheat sheet pg.2"](../media/gcloud-cheat-sheet-2.png)

---

<h3 id="getting_started" data-text="Getting started" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Getting started</span></h3>

<p>Get going with the <code translate="no" dir="ltr">gcloud</code> command-line tool.</p>

<ul>
<li><a href="/sdk/gcloud/reference/init"><code translate="no" dir="ltr">gcloud init</code></a>: Initialize, authorize, and configure the <code translate="no" dir="ltr">gcloud</code> tool.</li>
<li><a href="/sdk/gcloud/reference/version"><code translate="no" dir="ltr">gcloud version</code></a>: Display version and installed components.</li>
<li><a href="/sdk/gcloud/reference/components/install"><code translate="no" dir="ltr">gcloud components install</code></a>: Install specific components.</li>
<li><a href="/sdk/gcloud/reference/components/update"><code translate="no" dir="ltr">gcloud components update</code></a>: Update your Cloud SDK to the latest version.</li>
<li><a href="/sdk/gcloud/reference/config/set"><code translate="no" dir="ltr">gcloud config set project</code></a>: Set a default Google Cloud project to work on.</li>
<li><a href="/sdk/gcloud/reference/info"><code translate="no" dir="ltr">gcloud info</code></a>: Display current <code translate="no" dir="ltr">gcloud</code> tool environment details.</li>
</ul>

<h3 id="help" data-text="Help" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Help</span></h3>

<p>Cloud SDK is happy to help.</p>

<ul>
<li><a href="/sdk/gcloud/reference/help"><code translate="no" dir="ltr">gcloud help</code></a>: Search the <code translate="no" dir="ltr">gcloud</code> tool reference documents for specific
terms.</li>
<li><a href="/sdk/gcloud/reference/feedback"><code translate="no" dir="ltr">gcloud feedback</code></a>: Provide feedback for the Cloud SDK team.</li>
<li><a href="/sdk/gcloud/reference/topic"><code translate="no" dir="ltr">gcloud topic</code></a>: Supplementary help material for non-command topics like
accessibility, filtering, and formatting.</li>
</ul>

<h3 id="personalization" data-text="Personalization" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Personalization</span></h3>

<p>Make the Cloud SDK your own; personalize your configuration with properties.</p>

<ul>
<li><a href="/sdk/gcloud/reference/config/set"><code translate="no" dir="ltr">gcloud config set</code></a>: Define a property (like compute/zone) for the current
configuration.</li>
<li><a href="/sdk/gcloud/reference/config/get-value"><code translate="no" dir="ltr">gcloud config get-value</code></a>: Fetch value of a Cloud SDK property.</li>
<li><a href="/sdk/gcloud/reference/config/list"><code translate="no" dir="ltr">gcloud config list</code></a>: Display all the properties for the current
configuration.</li>
<li><a href="/sdk/gcloud/reference/config/configurations/create"><code translate="no" dir="ltr">gcloud config configurations create</code></a>: Create a new named configuration.</li>
<li><a href="/sdk/gcloud/reference/config/configurations/list"><code translate="no" dir="ltr">gcloud config configurations list</code></a>: Display a list of all available
configurations.</li>
<li><a href="/sdk/gcloud/reference/config/configurations/activate"><code translate="no" dir="ltr">gcloud config configurations activate</code></a>: Switch to an existing named
configuration.</li>
</ul>

<h3 id="credentials" data-text="Credentials" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Credentials</span></h3>

<p>Grant and revoke authorization to Cloud SDK</p>

<ul>
<li><a href="/sdk/gcloud/reference/auth/login"><code translate="no" dir="ltr">gcloud auth login</code></a>: Authorize Google
Cloud access for the <code translate="no" dir="ltr">gcloud</code> tool with Google user credentials and set
current account as active.</li>
<li><a href="/sdk/gcloud/reference/auth/activate-service-account"><code translate="no" dir="ltr">gcloud auth activate-service-account</code></a>:
Like <code translate="no" dir="ltr">gcloud auth login</code> but with service account credentials.</li>
<li><a href="/sdk/gcloud/reference/auth/list"><code translate="no" dir="ltr">gcloud auth list</code></a>: List all credentialed accounts.</li>
<li><a href="https://cloud.google.com/sdk/gcloud/reference/auth/print-access-token"><code translate="no" dir="ltr">gcloud auth print-access-token</code></a>:
Display the current account's access token.</li>
<li><a href="/sdk/gcloud/reference/auth/revoke"><code translate="no" dir="ltr">gcloud auth revoke</code></a>: Remove access
credentials for an account.</li>
</ul>

<h3 id="projects" data-text="Projects" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Projects</span></h3>

<p>Manage project access policies</p>

<ul>
<li><a href="/sdk/gcloud/reference/projects/describe"><code translate="no" dir="ltr">gcloud projects describe</code></a>:
Display metadata for a project (including its ID).</li>
<li><a href="/sdk/gcloud/reference/projects/add-iam-policy-binding"><code translate="no" dir="ltr">gcloud projects add-iam-policy-binding</code></a>:
Add an IAM policy binding to a specified project.</li>
</ul>

<h3 id="identity_access_management" data-text="Identity &amp; Access Management" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Identity &amp; Access Management</span></h3>

<p>Configuring Cloud Identity &amp; Access Management (IAM) preferences and service
accounts</p>

<ul>
<li><a href="/sdk/gcloud/reference/iam/list-grantable-roles"><code translate="no" dir="ltr">gcloud iam list-grantable-roles</code></a>:
List IAM grantable roles for a resource.</li>
<li><a href="/sdk/gcloud/reference/iam/roles/create"><code translate="no" dir="ltr">gcloud iam roles create</code></a>:
Create a custom role for a project or org.</li>
<li><a href="/sdk/gcloud/reference/iam/service-accounts/create"><code translate="no" dir="ltr">gcloud iam service-accounts create</code></a>:
Create a service account for a project.</li>
<li><a href="/sdk/gcloud/reference/iam/service-accounts/add-iam-policy-binding"><code translate="no" dir="ltr">gcloud iam service-accounts add-iam-policy-binding</code></a>:
Add an IAM policy binding to a service account.</li>
<li><a href="/sdk/gcloud/reference/iam/service-accounts/set-iam-policy"><code translate="no" dir="ltr">gcloud iam service-accounts set-iam-policy-binding</code></a>:
Replace existing IAM policy binding.</li>
<li><a href="/sdk/gcloud/reference/iam/service-accounts/keys/list"><code translate="no" dir="ltr">gcloud iam service-accounts keys list</code></a>:
List a service account's keys.</li>
</ul>

<h3 id="docker_google_kubernetes_engine_gke" data-text="Docker &amp; Google Kubernetes Engine (GKE)" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Docker &amp; Google Kubernetes Engine (GKE)</span></h3>

<p>Manage containerized applications on Kubernetes</p>

<ul>
<li><a href="/sdk/gcloud/reference/auth/configure-docker"><code translate="no" dir="ltr">gcloud auth configure-docker</code></a>:
Register the <code translate="no" dir="ltr">gcloud</code> tool as a Docker credential helper.</li>
<li><a href="/sdk/gcloud/reference/container/clusters/create"><code translate="no" dir="ltr">gcloud container clusters create</code></a>:
Create a cluster to run GKE containers.</li>
<li><a href="/sdk/gcloud/reference/container/clusters/list"><code translate="no" dir="ltr">gcloud container clusters list</code></a>:
List clusters for running GKE containers.</li>
<li><a href="/sdk/gcloud/reference/container/clusters/get-credentials"><code translate="no" dir="ltr">gcloud container clusters get-credentials</code></a>:
Update <code translate="no" dir="ltr">kubeconfig</code> to get <code translate="no" dir="ltr">kubectl</code> to use a GKE cluster.</li>
<li><a href="/sdk/gcloud/reference/container/images/list-tags"><code translate="no" dir="ltr">gcloud container images list-tags</code></a>:
List tag and digest metadata for a container image.</li>
</ul>

<h3 id="virtual_machines_compute_engine" data-text="Virtual Machines &amp; Compute Engine" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Virtual Machines &amp; Compute Engine</span></h3>

<p>Create, run, and manage VMs on Google infrastructure</p>

<ul>
<li><a href="/sdk/gcloud/reference/compute/zones/list"><code translate="no" dir="ltr">gcloud compute zones list</code></a>:
List Compute Engine zones.</li>
<li><a href="/sdk/gcloud/reference/compute/instances/describe"><code translate="no" dir="ltr">gcloud compute instances describe</code></a>:
Display a VM instance's details.</li>
<li><a href="/sdk/gcloud/reference/compute/instances/list"><code translate="no" dir="ltr">gcloud compute instances list</code></a>:
List all VM instances in a project.</li>
<li><a href="/sdk/gcloud/reference/compute/disks/snapshot"><code translate="no" dir="ltr">gcloud compute disks snapshot</code></a>:
Create snapshot of persistent disks.</li>
<li><a href="/sdk/gcloud/reference/compute/snapshots/describe"><code translate="no" dir="ltr">gcloud compute snapshots describe</code></a>:
Display a snapshot's details.</li>
<li><a href="/sdk/gcloud/reference/compute/snapshots/delete"><code translate="no" dir="ltr">gcloud compute snapshots delete</code></a>:
Delete a snapshot.</li>
<li><a href="/sdk/gcloud/reference/compute/ssh"><code translate="no" dir="ltr">gcloud compute ssh</code></a>: Connect to a
VM instance by using SSH.</li>
</ul>

<h3 id="serverless_app_engine" data-text="Serverless &amp; App Engine" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Serverless &amp; App Engine</span></h3>

<p>Build highly scalable applications on a fully managed serverless platform</p>

<ul>
<li><a href="/sdk/gcloud/reference/app/deploy"><code translate="no" dir="ltr">gcloud app deploy</code></a>: Deploy your
app's code and configuration to the App Engine server.</li>
<li><a href="/sdk/gcloud/reference/app/versions/list"><code translate="no" dir="ltr">gcloud app versions list</code></a>: List
all versions of all services deployed to the App Engine server.</li>
<li><a href="/sdk/gcloud/reference/app/browse"><code translate="no" dir="ltr">gcloud app browse</code></a>: Open the current
app in a web browser.</li>
<li><a href="/sdk/gcloud/reference/app/create"><code translate="no" dir="ltr">gcloud app create</code></a>: Create an App
Engine app within your current project.</li>
<li><a href="/sdk/gcloud/reference/app/logs/read"><code translate="no" dir="ltr">gcloud app logs read</code></a>: Display
the latest App Engine app logs.</li>
</ul>

<h3 id="miscellaneous" data-text="Miscellaneous" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Miscellaneous</span></h3>

<p>Commands that might come in handy</p>

<ul>
<li><a href="/sdk/gcloud/reference/kms/decrypt"><code translate="no" dir="ltr">gcloud kms decrypt</code></a>: Decrypt
ciphertext (to a plaintext file) using a Cloud Key Management Service
(Cloud KMS) key.</li>
<li><a href="/sdk/gcloud/reference/logging/logs/list"><code translate="no" dir="ltr">gcloud logging logs list</code></a>: List
your project's logs.</li>
<li><a href="/sdk/gcloud/reference/sql/backups/describe"><code translate="no" dir="ltr">gcloud sql backups describe</code></a>:
Display info about a Cloud SQL instance backup.</li>
<li><a href="/sdk/gcloud/reference/sql/export/sql"><code translate="no" dir="ltr">gcloud sql export sql</code></a>: Export
data from a Cloud SQL instance to a SQL file.</li>
</ul>

<h2 id="introductory_primer" data-text="Introductory primer" role="presentation"><span class="devsite-heading" role="heading" aria-level="2">Introductory primer</span></h2>

<p>A quick primer for getting started with the gcloud command-line tool.</p>

<h3 id="installing_the_cloud_sdk" data-text="Installing the Cloud SDK" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Installing the Cloud SDK</span></h3>

<p>Install the Cloud SDK with these <a href="https://cloud.google.com/sdk/docs/">installation instructions</a>.</p>

<h3 id="flags_arguments_and_other_wondrous_additions" data-text="Flags, arguments, and other wondrous additions" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Flags, arguments, and other wondrous additions</span</h3>

<p>Arguments can be Positional args or Flags</p>

<ul>
<li><strong>Positional args:</strong> Set after command name; must respect order of positional args.</li>
<li><p><strong>Flags:</strong> Set after positional args; order of flags doesn’t matter.</p>

<p>A flag can be either a:</p>

<ul>
<li><em>Name-value pair</em> (<code translate="no" dir="ltr">--foo=bar</code>), or</li>
<li><em>Boolean</em> (<code translate="no" dir="ltr">--force/no-force</code>).</li>
</ul>

<p>Additionally, flags can either be:</p>

<ul>
<li><em>Required</em></li>
<li><em>Optional:</em> in which case, the default value is used, if the flag is not defined</li>
</ul></li>
</ul>

<h3 id="global_flags" data-text="Global flags" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Global flags</span></h3>

<p>Some flags are available throughout the gcloud command-line tool experience,
like:</p>

<ul>
<li><a href="https://cloud.google.com/sdk/gcloud/reference#--help"><code translate="no" dir="ltr">--help</code></a>: For when in
doubt; display detailed help for a command.</li>
<li><a href="https://cloud.google.com/sdk/gcloud/reference#--project"><code translate="no" dir="ltr">--project</code></a>: If
using a project other than the current one.</li>
<li><a href="https://cloud.google.com/sdk/gcloud/reference#--quiet"><code translate="no" dir="ltr">--quiet</code></a>: Disabling
interactive prompting (and applying default values for inputs).</li>
<li><a href="https://cloud.google.com/sdk/gcloud/reference#--verbosity"><code translate="no" dir="ltr">--verbosity</code></a>:
Can set verbosity levels at <code translate="no" dir="ltr">debug</code>, <code translate="no" dir="ltr">info</code>, <code translate="no" dir="ltr">warning</code>, <code translate="no" dir="ltr">error</code>, <code translate="no" dir="ltr">critical</code>,
and <code translate="no" dir="ltr">none</code>.</li>
<li><a href="https://cloud.google.com/sdk/gcloud/reference#--version"><code translate="no" dir="ltr">--version</code></a>:
Display <code translate="no" dir="ltr">gcloud</code> version information.</li>
<li><a href="https://cloud.google.com/sdk/gcloud/reference#--format"><code translate="no" dir="ltr">--format</code></a>: Set
output format as <code translate="no" dir="ltr">config</code>, <code translate="no" dir="ltr">csv</code>, <code translate="no" dir="ltr">default</code>, <code translate="no" dir="ltr">diff</code>, <code translate="no" dir="ltr">disable</code>, <code translate="no" dir="ltr">flattened</code>,
<code translate="no" dir="ltr">get</code>, <code translate="no" dir="ltr">json</code>, <code translate="no" dir="ltr">list</code>, <code translate="no" dir="ltr">multi</code>, <code translate="no" dir="ltr">none</code>, <code translate="no" dir="ltr">object</code>, <code translate="no" dir="ltr">table</code>, <code translate="no" dir="ltr">text</code>, <code translate="no" dir="ltr">value</code>,
or <code translate="no" dir="ltr">yaml</code>.</li>
</ul>

<h3 id="cleaning_up_results" data-text="Cleaning up results" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Cleaning up results</span></h3>

<p>Extricate the most from your output with the filter, format, limit, and
sort-by flags.</p>

<p>For Compute Engine instances with prefix <code translate="no" dir="ltr">us</code> and not machine type <code translate="no" dir="ltr">f1-micro</code>:</p>
<pre class="" translate="no" dir="ltr" is-upgraded=""><code dir="ltr"><span class="pln">gcloud compute instances list </span><span class="pun">--</span><span class="pln">filter</span><span class="pun">=</span><span class="str">"zone ~ ^us AND -machineType:f1-micro"</span><span class="pln"><br></span></code></pre>
<p>For a list of projects created on or after 15 January 2018, sorted from oldest
to newest, presented as a table with project number, project id and creation
time columns with dates and times in local timezone:</p>
</div><pre class="" translate="no" dir="ltr" is-upgraded=""><code dir="ltr"><span class="pln">gcloud projects list </span><span class="pun">--</span><span class="pln">format</span><span class="pun">=</span><span class="str">"table(projectNumber,projectId,createTime.date(tz=LOCAL))"</span><span class="pln"><br></span><span class="pun">--</span><span class="pln">filter</span><span class="pun">=</span><span class="str">"createTime&gt;=2018-01-15T12:00:00"</span><span class="pln"> </span><span class="pun">--</span><span class="pln">sort</span><span class="pun">-</span><span class="kwd">by</span><span class="pun">=</span><span class="pln">createTime<br></span></code></pre>
<p>For a list of ten Compute Engine instances with a label <code translate="no" dir="ltr">my-label</code> (of any value):</p>

<pre class="" translate="no" dir="ltr" is-upgraded=""><code dir="ltr"><span class="pln">gcloud compute instances list </span><span class="pun">--</span><span class="pln">filter</span><span class="pun">=</span><span class="str">"labels.my-label:*"</span><span class="pln"> </span><span class="pun">--</span><span class="pln">limit</span><span class="pun">=</span><span class="lit">10</span><span class="pln"><br></span></code></pre></devsite-code>
<h2 id="understanding_commands" data-text="Understanding commands" role="presentation"><span class="devsite-heading" role="heading" aria-level="2">Understanding commands</span></h2>

<p>The underlying patterns for <code translate="no" dir="ltr">gcloud</code> commands; to aid self-discovery of
commands.</p>

<h3 id="finding_gcloud_commands" data-text="Finding gcloud commands" role="presentation"><span class="devsite-heading" role="heading" aria-level="3">Finding gcloud commands</span></h3>

<p>The gcloud command-line tool is a tree; non-leaf nodes are command groups
and leaf nodes are commands.
(Also, tab completion works for commands and resources!)</p>

<p>Most gcloud commands follow the following format:</p>

<pre class="" translate="no" dir="ltr" is-upgraded=""><code dir="ltr"><span class="pln">gcloud </span><span class="pun">+</span><span class="pln"> release level </span><span class="pun">(</span><span class="pln">optional</span><span class="pun">)</span><span class="pln"> </span><span class="pun">+</span><span class="pln"> component </span><span class="pun">+</span><span class="pln"> entity </span><span class="pun">+</span><span class="pln"> operation </span><span class="pun">+</span><span class="pln"> positional args </span><span class="pun">+</span><span class="pln"> flags<br></span></code></pre>

<p>For example:
<code translate="no" dir="ltr">gcloud + compute + instances + create + example-instance-1 + --zone=us-central1-a</code></p>

<h4 id="release_level" data-text="Release level" role="presentation"><span class="devsite-heading" role="heading" aria-level="4">Release level</span></h4>

<p><em>Release Level</em> refers to the command’s release status.</p>

<p><em>Example:</em> <code translate="no" dir="ltr">alpha</code> for alpha commands, <code translate="no" dir="ltr">beta</code> for beta commands, no release level needed for GA commands.</p>

<h4 id="component" data-text="Component" role="presentation"><span class="devsite-heading" role="heading" aria-level="4">Component</span></h4>

<p><em>Component</em> refers to the different Google Cloud services.</p>

<p><em>Example:</em> <code translate="no" dir="ltr">compute</code> for Compute Engine, <code translate="no" dir="ltr">app</code> for App Engine, etc.</p>

<h4 id="entity" data-text="Entity" role="presentation"><span class="devsite-heading" role="heading" aria-level="4">Entity</span></h4>

<p><em>Entity</em> refers to the plural form of an element or collection of elements under a component.</p>

<p><em>Example:</em> <code translate="no" dir="ltr">disks</code>, <code translate="no" dir="ltr">firewalls</code>, <code translate="no" dir="ltr">images</code>, <code translate="no" dir="ltr">instances</code>, <code translate="no" dir="ltr">regions</code>, <code translate="no" dir="ltr">zones</code> for compute</p>

<h4 id="operation" data-text="Operation" role="presentation"><span class="devsite-heading" role="heading" aria-level="4">Operation</span></h4>

<p><em>Operation</em> refers to the imperative verb form of the operation to be performed on the entity.</p>

<p><em>Example:</em> Common operations are <code translate="no" dir="ltr">describe</code>, <code translate="no" dir="ltr">list</code>, <code translate="no" dir="ltr">create/update</code>,
<code translate="no" dir="ltr">delete/clear</code>, <code translate="no" dir="ltr">import</code>, <code translate="no" dir="ltr">export</code>, <code translate="no" dir="ltr">copy</code>, <code translate="no" dir="ltr">remove</code>, <code translate="no" dir="ltr">add</code>, <code translate="no" dir="ltr">reset</code>, <code translate="no" dir="ltr">restart</code>,
<code translate="no" dir="ltr">restore</code>, <code translate="no" dir="ltr">run</code>, and <code translate="no" dir="ltr">deploy</code>.</p>

<h4 id="positional_args" data-text="Positional args" role="presentation"><span class="devsite-heading" role="heading" aria-level="4">Positional args</span></h4>

<p><em>Positional args</em> refer to the required, order-specific arguments needed to
execute the command.</p>

<p><em>Example:</em> <code translate="no" dir="ltr">&lt;INSTANCE_NAMES&gt;</code> is the required positional argument for
<code translate="no" dir="ltr">gcloud compute instances create</code>.</p>

<h4 id="flags" data-text="Flags" role="presentation"><span class="devsite-heading" role="heading" aria-level="4">Flags</span></h4>

<p><em>Flags</em> refer to the additional arguments, <code translate="no" dir="ltr">--flag-name(=value)</code>, passed in to
the command after positional args.</p>

<p><em>Example:</em> <code translate="no" dir="ltr">--machine-type=&lt;MACHINE_TYPE&gt;</code> and <code translate="no" dir="ltr">--preemptible</code> are optional
flags for <code translate="no" dir="ltr">gcloud compute instances create</code>.</p>
