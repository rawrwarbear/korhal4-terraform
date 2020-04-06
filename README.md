####korhal-iv
This is the container for running Terraform pipelines for Jenkins. It uses JNLP as base image with `Terraform 0.12.23` installed through `tfenv` with precached providers as indicated below:

```bash
"template" { version = "~>2.1.2" }
"aws" { version = "~>2.54.0" }
"local" { version = "~>1.4.0" }
"null" { version = "~>2.1.2" }
"archive" { version = "~>1.3.0" }
```

#####Configure this in Jenkins using the screenshot below:
![docker](https://i.ibb.co/QpHqTvY/jenkins-gantris6-node.png)