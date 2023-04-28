# Docker base image for [playwright-go](https://github.com/playwright-community/playwright-go)

# Instruction

To use this base image, please specify followng arguments of `BrowserTypeLaunchOptions`.

```go
pw, _ := playwright.Run()

browser, _ := pw.Chromium.Launch(playwright.BrowserTypeLaunchOptions{
	Args: []string{
		"--disable-dev-shm-usage",
		"--single-process",
		"--no-sandbox",
	},
})
```
