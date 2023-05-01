# Docker base image for [playwright-go](https://github.com/playwright-community/playwright-go)

# Instruction

To use this base image, please specify followng arguments of `RunOptions` and `BrowserTypeLaunchOptions`.

```go
pw, err := playwright.Run(&playwright.RunOptions{
	DriverDirectory:     "/root/.cache",
	SkipInstallBrowsers: true,
})

browser, _ := pw.Chromium.Launch(playwright.BrowserTypeLaunchOptions{
	Args: []string{
		"--disable-dev-shm-usage",
		"--single-process",
		"--no-sandbox",
	},
})
```
