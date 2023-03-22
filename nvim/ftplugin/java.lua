local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/Users/quintondean/Projects/' .. project_name

local config = {
    cmd = {
      '/Users/quintondean/.sdkman/candidates/java/17.0.5-amzn/bin/java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.level=ALL',
      '-Xmx1G',
      '--add-modules=ALL-SYSTEM',
      --'--add-opens java.base/java.util=ALL-UNNAMED',
      --'--add-opens java.base/java.lang=ALL-UNNAMED',
      '-jar', '/Users/quintondean/jdt-language-server-latest/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
      '-configuration', '/Users/quintondean/jdt-language-server-latest/config_mac',
      '-data', workspace_dir,
    },
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),

    settings = {
      java= {
        configuration = {
          runtimes = {
            {
              name = "JavaSE-1.8",
              path = "/Users/quintondean/.sdkman/candidates/java/8.0.342-amzn/",
            },
            {
              name = "JavaSE-17",
              path = "/Users/quintondean/.sdkman/candidates/java/17.0.5-amzn/",
            }
          }
        }
      }
    },
}
require('jdtls').start_or_attach(config)
