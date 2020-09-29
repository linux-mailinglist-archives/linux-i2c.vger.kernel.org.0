Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246B927DB9C
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbgI2WUq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728943AbgI2WUq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:46 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14321C061755;
        Tue, 29 Sep 2020 15:20:44 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a22so5329514ljp.13;
        Tue, 29 Sep 2020 15:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bsoH3Msy/hDvvF1v77butbeAsaDTssFywYgmXRvzsAg=;
        b=kHlvbrfdtWPCiVYDCHD6zxswwmetfc3D8XKwBNi2kwGwVQSJj3N1c3glvgpBlgBtu3
         BxEx6R2Iz/brt0uo3H26psJA7f9Ua9oY3RRUTBH+HHRQSFw9l0bkiGJmk25hok7jrkO7
         SnEgmkdWH7z02L8nso6jDqVGDQGB+kPsq5DwOkmrdjzZHNUto02SZJGBNV+IMEvgxRFe
         AxU5Rf7P86jRzkxYGD7aCQRybAmiP6ojDtmDAC7FilE80auli5SdddDzRWj8u6w891VX
         lVtlmoAECpKzu/oobrx6XjrFypP+e0vz0acoiomjpbp3oyNZPcTEtbwq8EbmvRMwI/xv
         mAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bsoH3Msy/hDvvF1v77butbeAsaDTssFywYgmXRvzsAg=;
        b=okEIGmnyITt4qg+2j41GcOrI5mmuAB78kyaLHNWbcWuF/m84IiV3rUr3uj/Y6ekykF
         PyIS+/8jfIL5w77plggAUvUU2Xxz0PI+I1QxKLD8XMSoMV4ou6Oe/omhxGMLieu0yACb
         Z69ArdKCZakx2mZBz0hhsnCl5MyH5JShNkSQhUgGpKEGGim5bTDNs6fDpUc4Jqsf7cRv
         0rW87vVsvB5pV3P8f/WoeVVmddnrZ+rGu0ctuoCWdvW2cIJ5Ox38W6qKo80hy9ipFQ6L
         M0X7j2oZsdw72x/dCwoFwb2hQPzDlDTxV0PSQ3E9hSPKSHnvlx1SGbJspRRntAglvh7Q
         wj4w==
X-Gm-Message-State: AOAM533FUDpbJ2Pi8kaKQm4uXJj5TSH9USoUvorGwBqA4KGhgiuR60KB
        7AohpHUaw7EAcIvmxQeq4xQ=
X-Google-Smtp-Source: ABdhPJxEhDOk0dpAuGFO1XlhIZq27W4BcVy+ISKmuvQ4YvPZQv+A5NZm3F4G001refHvZgWgZYj2Bw==
X-Received: by 2002:a2e:907:: with SMTP id 7mr1984262ljj.470.1601418042522;
        Tue, 29 Sep 2020 15:20:42 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:41 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 07/32] i2c: tegra: Runtime PM always available on Tegra
Date:   Wed, 30 Sep 2020 01:18:50 +0300
Message-Id: <20200929221915.10979-8-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The runtime PM is guaranteed to be always available on Tegra after commit
40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remove
all the RPM-availability checking and handling from the code.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 85ed0e02d48c..a52c72135390 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1775,18 +1775,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev->is_vi)
 		pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = tegra_i2c_runtime_resume(&pdev->dev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "runtime resume failed\n");
-			goto unprepare_div_clk;
-		}
-	} else {
-		ret = pm_runtime_get_sync(i2c_dev->dev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "runtime resume failed\n");
-			goto put_rpm;
-		}
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0) {
+		dev_err(dev, "runtime resume failed\n");
+		goto put_rpm;
 	}
 
 	if (i2c_dev->is_multimaster_mode) {
@@ -1845,15 +1837,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		clk_disable(i2c_dev->div_clk);
 
 put_rpm:
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_put_sync(&pdev->dev);
-	else
-		tegra_i2c_runtime_suspend(&pdev->dev);
-
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_disable(&pdev->dev);
-
-unprepare_div_clk:
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	clk_unprepare(i2c_dev->div_clk);
 
 unprepare_slow_clk:
@@ -1875,8 +1860,6 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 		clk_disable(i2c_dev->div_clk);
 
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_i2c_runtime_suspend(&pdev->dev);
 
 	clk_unprepare(i2c_dev->div_clk);
 	clk_unprepare(i2c_dev->slow_clk);
-- 
2.27.0

