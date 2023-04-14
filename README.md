# Docker base image for [playwright-go](https://github.com/playwright-community/playwright-go)

# Instruction

To use this base image, please specify `DriverDirectory` to `/root/.cache`.
Also, we are recommend to specify `SkipInstallBrowsers` to `true`.

```go
pw, err := playwright.Run(&playwright.RunOptions{
	DriverDirectory:     "/root/.cache",
	SkipInstallBrowsers: true,
})
if err != nil {
	return nil, fmt.Errorf("failed to start playwright: %w", err)
}
```
