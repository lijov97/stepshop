# Variables for access control helm releases
application_access_control_charts = [
  # users
  {
    create_helm_release = true

    namespace        = "stepshop"
    create_namespace = false
    repository       = "oci://211535858832.dkr.ecr.us-east-1.amazonaws.com/production/helm/stepora"
    release_name     = "stepshop-users"
    chart            = "users"
    version          = "1.0.0"
    wait             = true
    atomic           = true
    timeout          = 600
    values_file_name = "values-users.yaml"
  },
]
# Variables for K8s secret provider class
application_secret_provider_class_charts = [
  # stepshop-envs
  {
    create_helm_release = true

    namespace        = "stepshop"
    create_namespace = false
    repository       = "oci://211535858832.dkr.ecr.us-east-1.amazonaws.com/production/helm/stepora"
    release_name     = "stepshop-spc"
    chart            = "secret-provider-class"
    version          = "1.0.2"
    wait             = true
    atomic           = true
    timeout          = 600
    values_file_name = "values-secret-provider-class.yaml"
  },
]

# variables for migration helm releases
application_migration_charts = [
  # migration
  {
    create_helm_release = true

    namespace        = "stepshop"
    create_namespace = false
    repository       = "oci://211535858832.dkr.ecr.us-east-1.amazonaws.com/production/helm/stepora"
    release_name     = "stepshop-migration"
    chart            = "migration"
    version          = "1.0.3"
    timeout          = 600
    wait             = true
    wait_for_jobs    = true
    replace          = true
    values_file_name = "values-migration.yaml"
  },
  # collectstatic
  {
    create_helm_release = true

    namespace        = "stepshop"
    create_namespace = false
    repository       = "oci://211535858832.dkr.ecr.us-east-1.amazonaws.com/production/helm/stepora"
    release_name     = "stepshop-collectstatic"
    chart            = "collectstatic"
    version          = "1.0.3"
    timeout          = 900
    wait             = true
    wait_for_jobs    = true
    replace          = true
    values_file_name = "values-collectstatic.yaml"
  },

]

# variable for application helm releases
application_charts = [
  # app
  {
    create_helm_release = true

    namespace        = "stepshop"
    create_namespace = false
    repository       = "oci://211535858832.dkr.ecr.us-east-1.amazonaws.com/production/helm/stepora"
    release_name     = "stepshop-app"
    chart            = "app"
    version          = "1.0.3"
    timeout          = 600
    atomic           = true
    cleanup_on_fail  = true
    values_file_name = "values-app.yaml"
  },
  # cron
  {
    create_helm_release = true

    namespace        = "stepshop"
    create_namespace = false
    repository       = "oci://211535858832.dkr.ecr.us-east-1.amazonaws.com/production/helm/stepora"
    release_name     = "stepshop-cron"
    chart            = "cron"
    version          = "1.0.2"
    timeout          = 600
    atomic           = true
    cleanup_on_fail  = true
    values_file_name = "values-cron.yaml"
  },
  # ingress
  {
    create_helm_release = true

    namespace        = "stepshop"
    create_namespace = false
    repository       = "oci://211535858832.dkr.ecr.us-east-1.amazonaws.com/production/helm/stepora"
    release_name     = "stepshop-ingress"
    chart            = "ingress"
    version          = "1.0.0"
    timeout          = 600
    atomic           = true
    cleanup_on_fail  = true
    values_file_name = "values-ingress.yaml"
  },
  # nginx
  {
    create_helm_release = true

    namespace        = "stepshop"
    create_namespace = false
    repository       = "oci://211535858832.dkr.ecr.us-east-1.amazonaws.com/production/helm/stepora"
    release_name     = "stepshop-nginx"
    chart            = "nginx"
    version          = "1.0.4"
    timeout          = 600
    atomic           = true
    cleanup_on_fail  = true
    values_file_name = "values-nginx.yaml"
  },
  # worker
  {
    create_helm_release = true

    namespace        = "stepshop"
    create_namespace = false
    repository       = "oci://211535858832.dkr.ecr.us-east-1.amazonaws.com/production/helm/stepora"
    release_name     = "stepshop-worker"
    chart            = "worker"
    version          = "1.0.3"
    timeout          = 600
    atomic           = true
    cleanup_on_fail  = true
    values_file_name = "values-worker.yaml"
  },
  # worker-medium
  {
    create_helm_release = true

    namespace        = "stepshop"
    create_namespace = false
    repository       = "oci://211535858832.dkr.ecr.us-east-1.amazonaws.com/production/helm/stepora"
    release_name     = "stepshop-worker-medium"
    chart            = "worker"
    version          = "1.0.3"
    timeout          = 600
    atomic           = true
    cleanup_on_fail  = true
    values_file_name = "values-worker-medium.yaml"
  },
  # worker-high
  {
    create_helm_release = true

    namespace        = "stepshop"
    create_namespace = false
    repository       = "oci://211535858832.dkr.ecr.us-east-1.amazonaws.com/production/helm/stepora"
    release_name     = "stepshop-worker-high"
    chart            = "worker"
    version          = "1.0.3"
    timeout          = 600
    atomic           = true
    cleanup_on_fail  = true
    values_file_name = "values-worker-high.yaml"
  },
]
