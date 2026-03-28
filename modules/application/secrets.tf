resource "kubectl_manifest" "external_secret" {
  yaml_body = yamlencode({
    apiVersion = "external-secrets.io/v1"
    kind       = "ExternalSecret"
    metadata = {
      name      = "rideshare-secrets"
      namespace = var.namespace
    }
    spec = {
      refreshInterval = "1m"
      secretStoreRef = {
        name = "aws-secrets"
        kind = "ClusterSecretStore"
      }
      target = {
        name           = "rideshare-secrets"
        creationPolicy = "Owner"
      }
      data = [
        # RDS secrets - pulled directly from RDS secret in Secrets Manager
        { secretKey = "DATABASE_HOST",     remoteRef = { key = var.db_secret_name,    property = "host" } },
        { secretKey = "DATABASE_PORT",     remoteRef = { key = var.db_secret_name,    property = "port" } },
        { secretKey = "DATABASE_URL",      remoteRef = { key = var.db_secret_name,    property = "url" } },
        { secretKey = "DATABASE_NAME",     remoteRef = { key = var.db_secret_name,    property = "db" } },
        { secretKey = "DATABASE_USER",     remoteRef = { key = var.db_secret_name,    property = "username" } },
        { secretKey = "DATABASE_PASSWORD", remoteRef = { key = var.db_secret_name,    property = "password" } },

        # Redis secrets - pulled directly from Redis secret in Secrets Manager
        { secretKey = "REDIS_HOST",        remoteRef = { key = var.redis_secret_name, property = "host" } },
        { secretKey = "REDIS_PORT",        remoteRef = { key = var.redis_secret_name, property = "port" } },
        { secretKey = "REDIS_URL",         remoteRef = { key = var.redis_secret_name, property = "url" } },

        # App secrets
        { secretKey = "JWT_SECRET",                    remoteRef = { key = var.app_secret_name, property = "jwt_secret" } },
        { secretKey = "AZURE_EMAIL_CONNECTION_STRING", remoteRef = { key = var.app_secret_name, property = "azure_email_connection_string" } },
        { secretKey = "SENDER_EMAIL",                  remoteRef = { key = var.app_secret_name, property = "sender_email" } },
      ]
    }
  })

  depends_on = [kubernetes_namespace.this]
}