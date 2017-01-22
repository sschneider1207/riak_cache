use Mix.Config

config :riak_core,
  web_port: 8098,
  handoff_port: 8099,
  handoff_ip: '127.0.0.1',
  ring_state_dir: 'ring_data_dir',
  platform_data_dir: 'data',
  platform_log_dir: './log',
  sasl_error_log: './log/sasl-error.log',
  sasl_log_dir: './log/sasl',
  schema_dirs: ['priv']

config :lager,
  error_logger_hwm: 5000,
  handlers: [
    lager_console_backend: :debug,
  ]
