Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 776C312BF72
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2019 23:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfL1WRX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Dec 2019 17:17:23 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42231 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfL1WRX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Dec 2019 17:17:23 -0500
Received: by mail-lj1-f194.google.com with SMTP id y4so15634624ljj.9;
        Sat, 28 Dec 2019 14:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MxLj3sMjbJSVDQh/qIpP3HDKKCaIdKkelMGqwQ8Ieqs=;
        b=j8SItEMSnkuexrk3ygept1Ikflg2UCy4z3shNl1sOyCbLaQXEKyoVKCTUbNrbVDu4b
         u9soOKcWDTMVl1fXrmtcbbc0Pd7Bf1MnQzvxY/EvqMPnEFan2FcT6fjtW0+ehzBi9qBn
         w3vuoycPYVJ6qRoF3L1blkTsXpEFjMaNFLOWcDTToqTmX9gfyOEjPTPmLUQlv8tqrr1d
         YI9L/LN1UZW6Urv53bbKL8B/6jQc1+EXvEE40f7kD5y1EwpOpVOFsxnhiCsWgV8W2jDO
         kETmbyaCkwAo0sYCR+ITk9zo7uKARJSLeubzLQ+jl+0gXST0tgdlrsVxMDmkeK5pK8+G
         8SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MxLj3sMjbJSVDQh/qIpP3HDKKCaIdKkelMGqwQ8Ieqs=;
        b=a6hJIQINeBsfJgMBM6WgcHy+2vxbJtLkOCX5EGptC77rr5UhcAxN6BsfddyIIjtXZN
         /VPqZEOiCWsdclOFEV2YVF82dVKV4cpl1vKkr1TrAyQSl6LjFxqoA1FWS0BNYii8+Yzb
         5BIEEv3aJFIqCHzjHng8GaDIXcxkMiJ21ag0FdyjFMz3K7daye9QSZy222mqxdR3Ie91
         A3UvCTDEx9WtJUCsBri0HSka69adbrWopL0OnDdmmoHXAAUHgXoZQPQza9MfCwtMfv1S
         PPvbgRD2hME7V2KxC/PZlA3orU3V6ADUdlLxLqJ0RiXdyShpsK+wQR/oyMZRcJtc2awj
         nNFw==
X-Gm-Message-State: APjAAAWFbpUoxrYC2TR/y4qTV5wIRMcwQLK6eAboWfHkAoTJsurqDGaI
        DWV29/uEFBsi+V7nLIRWnvw=
X-Google-Smtp-Source: APXvYqz2UYufujkccZrYCSW4CQDkHD7h1MJivFIobvUU0taFhuMlKquz1RYI6G3KhPSCnICcREImSw==
X-Received: by 2002:a2e:b054:: with SMTP id d20mr18985619ljl.190.1577571440874;
        Sat, 28 Dec 2019 14:17:20 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id y10sm15209584ljm.93.2019.12.28.14.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 14:17:20 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] i2c: tegra: Properly disable runtime PM on driver's probe error
Date:   Sun, 29 Dec 2019 01:16:50 +0300
Message-Id: <20191228221654.28842-3-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191228221654.28842-1-digetx@gmail.com>
References: <20191228221654.28842-1-digetx@gmail.com>
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

