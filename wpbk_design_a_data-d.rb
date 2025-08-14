# Data-driven DevOps pipeline dashboard configuration

require 'erb'
require 'json'

# Dashboard configuration
dashboard_title = 'DevOps Pipeline Dashboard'
dashboard_description = 'Real-time monitoring and insights into our DevOps pipeline'

# Data sources
data_sources = [
  {
    name: 'CI/CD Pipeline',
    type: 'jenkins',
    url: 'https://jenkins.example.com',
    auth: {
      username: 'username',
      password: 'password'
    }
  },
  {
    name: 'Application Logs',
    type: 'elasticsearch',
    url: 'https://elasticsearch.example.com',
    index: 'app-logs'
  },
  {
    name: 'Infrastructure Metrics',
    type: 'prometheus',
    url: 'https://prometheus.example.com',
    query: 'avg(cpu_usage{instance=~".+"})'
  }
]

# Widgets
widgets = [
  {
    type: 'pipeline_status',
    title: 'CI/CD Pipeline Status',
    data_source: 'CI/CD Pipeline',
    height: 2
  },
  {
    type: 'log_stream',
    title: 'Application Logs',
    data_source: 'Application Logs',
    height: 3
  },
  {
    type: 'metric_chart',
    title: 'CPU Usage',
    data_source: 'Infrastructure Metrics',
    height: 4
  }
]

# Layout
layout = [
  {
    row: 1,
    columns: [
      {
        width: 4,
        widgets: [widgets[0]]
      },
      {
        width: 4,
        widgets: [widgets[1]]
      },
      {
        width: 4,
        widgets: [widgets[2]]
      }
    ]
  }
]

# Render dashboard
template = ERB.new(File.read('dashboard_template.html.erb'))
puts template.result(binding)