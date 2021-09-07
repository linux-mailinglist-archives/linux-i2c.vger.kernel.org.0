Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2DB402FCA
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Sep 2021 22:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243733AbhIGUe5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Sep 2021 16:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346812AbhIGUeZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Sep 2021 16:34:25 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C9EC061575;
        Tue,  7 Sep 2021 13:33:18 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id u15-20020a05600c19cf00b002f6445b8f55so281764wmq.0;
        Tue, 07 Sep 2021 13:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=W4XkuWV5yjG1px3FAuRaLISaGMSiVa9NKZv3uZD2saA=;
        b=RWhKX9/wSotzg1YTQsbOEifwUzUlKBZQnn+KUvfcLotgTF3eXjZwmCARxgnFbf1JlI
         mk6gBgXZjPX8MNZ8lqeR2jRslfI4qnCnI5zIuhRgzi75duqCjDLhNJtY03j1l6R+d71o
         nFUUMIgaoLM0OX6b9a7o4D26/I48fuZOfwK/0kxSyq5KFj4da4WH6JWjoOldtGFr9oiP
         oWTtYnvEnn11CbZXx4vRCDlHb/CsfCzLIlKpfuISOtR+yjvd0O7YpaYUdzVwM69O/cLH
         4VEvUu8v2OqlMbBGMzHQFudqnrihxBXMc/Y+LesKqCfbEwNAdgRwxWvWEf2xCYa3NWyO
         5Puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=W4XkuWV5yjG1px3FAuRaLISaGMSiVa9NKZv3uZD2saA=;
        b=nDpGCBY1liCrYbp8nC/8LTur5AjnovR+UiE1k8iusDznmML7uEgc6sRmd5hTE+oi9r
         oxgm7Pzg3PDHUW4mzu9v8f4HBduMO9S1psrzAIT+URi8h7OCMkGWPY0B7L0wwLPuXLAc
         qPHZhkv9qgMEEXsvty4BSJVg8C2ec9dIowTRP8bIKuyf2cgMRyJbaVVaEOFTU2+DorvP
         /QfYLLsS67+GrosQnAQOphWWp+eDh/2o3cBsskiY4O7Q5s/6WRks+vQks2K7rZ6msCTD
         pk+l/Ss0BWrNZF0uYu8Q+f0n4OqM5HGJJY9WxDZOhOHga8ezgAsz8ucqDfisOhQ9LAyG
         id7g==
X-Gm-Message-State: AOAM530t98HQJpAX0uGYl2YK2BMSuGwbAysvX86+9PGQNm87+63gFxG0
        81Np59Cs2uBQ1uHrYdspLRhWmkjr9o0=
X-Google-Smtp-Source: ABdhPJy4XxF6DzG6c2Wlg617Hm3xoXEWzjZ7NelQPwKCi/yZlAfFv5jnLCdYy0811dfw2gmkKzSsbQ==
X-Received: by 2002:a05:600c:4f52:: with SMTP id m18mr152949wmq.34.1631046797077;
        Tue, 07 Sep 2021 13:33:17 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f08:4500:e01f:158d:8ab5:13ce? (p200300ea8f084500e01f158d8ab513ce.dip0.t-ipconnect.de. [2003:ea:8f08:4500:e01f:158d:8ab5:13ce])
        by smtp.googlemail.com with ESMTPSA id l2sm149069wmi.1.2021.09.07.13.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 13:33:16 -0700 (PDT)
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RESEND] i2c: i801: Stop using
 pm_runtime_set_autosuspend_delay(-1)
To:     Jean Delvare <jdelvare@suse.com>
Cc:     linux-acpi@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Message-ID: <515c9685-bad2-86e0-1be6-f9f63578b864@gmail.com>
Date:   Tue, 7 Sep 2021 22:33:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The original change works as intended, but Andy pointed in [0] that now
userspace could re-enable RPM via sysfs, even though we explicitly want
to disable it. So effectively revert the original patch, just with small
improvements:
- Calls to pm_runtime_allow()/pm_runtime_forbid() don't have to be
  balanced, so we can remove the call to pm_runtime_forbid() in
  i801_remove().
- priv->acpi_reserved is accessed after i801_acpi_remove(), and according
  to Robert [1] the custom handler can't run any longer. Therefore we
  don't have to take priv->acpi_lock.

[0] https://www.spinics.net/lists/linux-i2c/msg52730.html
[1] https://lore.kernel.org/linux-acpi/BYAPR11MB32561D19A0FD9AB93E2B1E5287D39@BYAPR11MB3256.namprd11.prod.outlook.com/T/#t

Fixes: 4e60d5dd10cd ("i2c: i801: Improve disabling runtime pm")
Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
- Resend because I missed to cc linux-i2c list
---
 drivers/i2c/busses/i2c-i801.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 1f929e6c3..f3c79942c 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1623,7 +1623,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 		 * BIOS is accessing the host controller so prevent it from
 		 * suspending automatically from now on.
 		 */
-		pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
+		pm_runtime_get_sync(&pdev->dev);
 	}
 
 	if ((function & ACPI_IO_MASK) == ACPI_READ)
@@ -1890,9 +1890,6 @@ static void i801_remove(struct pci_dev *dev)
 {
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
-	pm_runtime_forbid(&dev->dev);
-	pm_runtime_get_noresume(&dev->dev);
-
 	i801_disable_host_notify(priv);
 	i801_del_mux(priv);
 	i2c_del_adapter(&priv->adapter);
@@ -1901,6 +1898,10 @@ static void i801_remove(struct pci_dev *dev)
 
 	platform_device_unregister(priv->tco_pdev);
 
+	/* if acpi_reserved is set then usage_count is incremented already */
+	if (!priv->acpi_reserved)
+		pm_runtime_get_noresume(&dev->dev);
+
 	/*
 	 * do not call pci_disable_device(dev) since it can cause hard hangs on
 	 * some systems during power-off (eg. Fujitsu-Siemens Lifebook E8010)
-- 
2.33.0

