Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBAA138738
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2020 18:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733153AbgALRRp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Jan 2020 12:17:45 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39812 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728734AbgALRRn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Jan 2020 12:17:43 -0500
Received: by mail-lf1-f67.google.com with SMTP id y1so5134161lfb.6;
        Sun, 12 Jan 2020 09:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=boftLlCVTiCXcZl17ggg/i9GnkxPrBq2/azgLeosNdc=;
        b=Ss1uB9IqTcBQuWmvl8XgQHGygt9/V59mKPWQMYzSzAdsmG5PYHBhb3Lv/BWvPg6LDh
         MKgtCzJgOayubGM4Z8PsghsmMLLj+rEiSSLtCOcftzD1XoJBeP0wzQOirab4EFYFbyGb
         Fm8GEt1kxJ/TPiMbSEuIN/qfgkg+B2l+gLipIQ21L81OxIUYpqi9fRJIhiPl8QfACqOu
         E1z/dh/wNU800lELQt7Fl9ntLr/5BRyoI/yClrQd6dIk4CJ2EvWXwpXQCmCAG3TdBEbJ
         WxvzObFsOhbhkzMpVZStswd2m5Qb7X6UJZIHBh2fiJGlIlHH4bKM8BIw1yBb0xsm713k
         SJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=boftLlCVTiCXcZl17ggg/i9GnkxPrBq2/azgLeosNdc=;
        b=Claen69xzbFxnvhrVa6JSPcuoM2OxM0DBHTrEUae14TgH+gM+u3XlZM+pmOKJe3/2T
         RGTIEPd96vAkoAtntNHTm0ftTyW8jnpA6etvbeoAWYJ6D/GPQLFDS1rht6lAsyYJf21c
         7LMvRJMsYQ+aoYTCB1je/FtBcT2CaLs9Q545APuJS1/IjwjfYWtQStABKye81IXjj2sc
         Idw/6jwrt/0QbkMEAc2pmi53KgSNLp+TaLI6GCtAmlL5kVb8LqumvX98EA1rUH3N7nPW
         XloTV5ZhT/o4K7C3lANBiKt9/byOebvc6GDibxdVTTAnRdgEcFL0Oy9d7On5N/5sBqeJ
         I9gg==
X-Gm-Message-State: APjAAAVJUxGbknZBONqcnFxFkMyQDyfE1pyS0PRAHr1MImQnX5R+LTiW
        Ckkm/Veq5PAqpown6C+9mnNg+1W9
X-Google-Smtp-Source: APXvYqw13KxUpRZe++3Awv6Z4yxVSUrVrzJen5tGSQKoKEGmNfPc38wZDRcFNFvQkYH3gDdEKBRhug==
X-Received: by 2002:a19:2d0d:: with SMTP id k13mr7455372lfj.12.1578849461233;
        Sun, 12 Jan 2020 09:17:41 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id i13sm4506628ljg.89.2020.01.12.09.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 09:17:40 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/8] i2c: tegra: Properly disable runtime PM on driver's probe error
Date:   Sun, 12 Jan 2020 20:14:24 +0300
Message-Id: <20200112171430.27219-3-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200112171430.27219-1-digetx@gmail.com>
References: <20200112171430.27219-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

One of the recent Tegra I2C commits made a change that resumes runtime PM
during driver's probe, but it missed to put the RPM in a case of error.
Note that it's not correct to use pm_runtime_status_suspended because it
breaks RPM refcounting.

Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 79d19f6ce94e..61339c665ebd 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1608,14 +1608,18 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev))
+	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = tegra_i2c_runtime_resume(&pdev->dev);
-	else
+		if (ret < 0) {
+			dev_err(&pdev->dev, "runtime resume failed\n");
+			goto unprepare_div_clk;
+		}
+	} else {
 		ret = pm_runtime_get_sync(i2c_dev->dev);
-
-	if (ret < 0) {
-		dev_err(&pdev->dev, "runtime resume failed\n");
-		goto unprepare_div_clk;
+		if (ret < 0) {
+			dev_err(&pdev->dev, "runtime resume failed\n");
+			goto disable_rpm;
+		}
 	}
 
 	if (i2c_dev->is_multimaster_mode) {
@@ -1623,7 +1627,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		if (ret < 0) {
 			dev_err(i2c_dev->dev, "div_clk enable failed %d\n",
 				ret);
-			goto disable_rpm;
+			goto put_rpm;
 		}
 	}
 
@@ -1671,11 +1675,16 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (i2c_dev->is_multimaster_mode)
 		clk_disable(i2c_dev->div_clk);
 
-disable_rpm:
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
+put_rpm:
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_put_sync(&pdev->dev);
+	else
 		tegra_i2c_runtime_suspend(&pdev->dev);
 
+disable_rpm:
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
+
 unprepare_div_clk:
 	clk_unprepare(i2c_dev->div_clk);
 
-- 
2.24.0

