package main

import (
	"fmt"

	playwright "github.com/playwright-community/playwright-go"
)

const url = "https://playwright.dev/"

func main() {
	pw, err := playwright.Run()
	if err != nil {
		panic(err)
	}

	browser, err := pw.Chromium.Launch(playwright.BrowserTypeLaunchOptions{
		Args: []string{
			"--disable-dev-shm-usage",
			"--single-process",
			"--no-sandbox",
		},
	})
	if err != nil {
		panic(err)
	}

	bCtx, err := browser.NewContext()
	if err != nil {
		panic(err)
	}

	page, err := bCtx.NewPage()
	if err != nil {
		panic(err)
	}

	if _, err := page.Goto(url); err != nil {
		panic(err)
	}

	elm, err := page.Locator("header > div > h1 > span")
	if err != nil {
		panic(err)
	}

	txt, err := elm.InnerText()
	if err != nil {
		panic(err)
	}

	fmt.Println(txt)
}
