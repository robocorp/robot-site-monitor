# Web Site Monitoring Robot

Robocorp automation stack robot for simple web server monitoring.

Configure the monitored URLs by adding them as environment variables with names starting with "MON\_".

    MON_ROBOCORP=https://robocorp.com
    MON_PYTHON=https://python.org

When the robot completes, the work item variable `site_report` contains a list of results:

    site_report = [
      "https://robocorp.com 200",
      "https://python.org 200"
    ]

If you want to send the results to Slack, you can configure the `robot-slack-notifier` as the next step in the Control Room process.

You can use e.g. `MESSAGE="\n".join(site_report)`
