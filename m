Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACBED130B35
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 02:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgAFBEk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jan 2020 20:04:40 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40650 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbgAFBEj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Jan 2020 20:04:39 -0500
Received: by mail-lj1-f194.google.com with SMTP id u1so49239566ljk.7;
        Sun, 05 Jan 2020 17:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MxLj3sMjbJSVDQh/qIpP3HDKKCaIdKkelMGqwQ8Ieqs=;
        b=I6Ki5BoPWAcfM+TfD12ObY2TbIQfDLD8A7z61IlEYyCOZiYpYnEc1PrN+LHrg5BVcj
         oF5yiREAfEmBHvIvJIZydKSiFrugl8ggo70nezDXG02PtaUwRMtZfbT5IKrpslk7jlKs
         4YybKlIYP7TYNCIfGJo2hZFw8F20qupQqcvMrFbXvPQ3xZTldo7bvM5cPOPQlP3AGFsE
         +H4yt1W0YTxZkc+2qLRAT2LYkwaf1ytNapz0mCmm0/yUyPmY6BRIUsvz1M9fwhy4Bw23
         7CrB7wsJExk9/u/xS0EskRrOKHJM54b6B6Q7MVx/AptTDtVMbqEEiBYTjnwUdi8XdtLM
         qCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MxLj3sMjbJSVDQh/qIpP3HDKKCaIdKkelMGqwQ8Ieqs=;
        b=N3as4VyO36zoLmADEIVHX7bZ/1CQPy19E/AJb/XQImUayWE9egleO3as/OfyTTha6c
         VCxCW27JNWjrxhUjM48XFUDAF2KPVWwxeGfcPwPcsQiqhRaGReEcLnndSCAopGBvRO+M
         3LlUOnyy3buvUvKH7GLW9KmQzxIZJIncT4e72DXLo3B2GppVcD1n+N8tr/A3g2GFuKSm
         ffxqKjwjhKsE7vvt2os44Vgexob75y7+V95kormlfu4Nu8mbPJYTnSFXeb2yd3czDqdp
         aAEOmbp4j54bCJRjNbdXB+rBPq5OhjA4EKYF5AGetBIX2ZbsJKtuI0fGl1/VbtUMd2OV
         VlHw==
X-Gm-Message-State: APjAAAXB6F24ybNHvNFnv3qhaJ1fdlKL/JWh8OKI8RyKSQ8XO6PF/zIR
        dXX1Dqb6KaNeCW3bPqWNNZE=
X-Google-Smtp-Source: APXvYqyOkVuuHQs3q/GyV5ekJX3GMfanNZhCG7cyLMbrKglLRQINhKzdEoh5inYz73gjtMqjbHZVBg==
X-Received: by 2002:a2e:96c6:: with SMTP id d6mr28874929ljj.4.1578272677744;
        Sun, 05 Jan 2020 17:04:37 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id a19sm28245910ljb.103.2020.01.05.17.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:04:37 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] i2c: tegra: Properly disable runtime PM on driver's probe error
Date:   Mon,  6 Jan 2020 04:04:16 +0300
Message-Id: <20200106010423.5890-3-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200106010423.5890-1-digetx@gmail.com>
References: <20200106010423.5890-1-digetx@gmail.com>
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

