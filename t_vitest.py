from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    b = p.chromium.launch()
    print("CHROMIUM_OK", b.version)
    b.close()
    try:
        c = p.chromium.launch(channel="chrome")
        print("CHROME_CHANNEL_OK", c.version)
        c.close()
    except Exception as e:
        print("CHROME_CHANNEL_KO", type(e).__name__, str(e)[:160])
print("FIN")
