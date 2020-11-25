# Web Site Monitoring Robot
Robocorp automation stack robot for simple web server monitoring

Configure monitored URLs by adding them as environment variables with names starting with "MON_".

    MON_ROBOCORP=https://robocorp.com
    MON_PYTHON=https://python.org

When robot completes Work Item variables ```site_report```contains a list of results:

    site_report = [
      "https://robocorp.com 200",
      "https://python.org 200"
    ]

If you want to send the results to slack, you can configure ```robot-slack-notifier``` as the next step in Robocorp cloud process.
You can use e.g. ```MESSAGE="\n".join(site_report)```
