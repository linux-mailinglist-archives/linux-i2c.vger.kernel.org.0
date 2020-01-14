Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53445139F19
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 02:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbgANBg6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 20:36:58 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34005 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729061AbgANBg6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jan 2020 20:36:58 -0500
Received: by mail-lj1-f196.google.com with SMTP id z22so12409144ljg.1;
        Mon, 13 Jan 2020 17:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1OzVTCuCrH223Q6o6Mny/CNmcyfK60qlLZIddv7A7e0=;
        b=DbQx6W54hhTZMUfciGI8Fow5LTBQdhkLFWMwm0oV+me9gGmHIZajj8B7X6vrrUo8Cr
         GYnazSXues/YIkaUXdMEws4qfAYO7UFhMR2ZK/yX6xYWPtpBR5vKRNeVCDnWdK9KEBvn
         E17f0AEdcQCQ8EVDNlr52yYG4RbAdZGbSWzvLIBWN1jcJDpnIiMF9Hqfih9foFLGZkC+
         LNdxU6Tc3ntAwalzd/vjdrxA3RIs2MqG9I14hzf8yWWupBBmIPn6slT57k/NxLwUFTUN
         y6TPv8hdILQPYttiSeNVe2fYVq2Cuz8WeafrlJfizReJnmFtS5fACBzxEs3He4AQqyir
         yEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1OzVTCuCrH223Q6o6Mny/CNmcyfK60qlLZIddv7A7e0=;
        b=lLa75qFeG01kfFtg/fR3uo5iunHnaUEMd8twIxB6jIRiGZggRIxPTTAPBuI1jE48tC
         R3BPTUy/3oiXkZ++7Lb27ydCof2kkD6CFT/8LPjwrnacNrxSE5Mo4/AfmcjqoUB3FTrs
         tlZhU+VVEz9D4lPm7nXns2+KxqmJMubG2deI+SryLuayn+TFNru6ftMYXrcpN48zOCZx
         1UJd+ySZujarlQejx73PEz46RIKkZMf5GAvgPr9m8vD7ffp0KVWvXFYMuYMioawhxXQA
         8d2a+0GavwWZyOTzQ6rjKlo6+wkFuYDJQehZue5gHJe5CUwAmaliq8SnmmJtwH/5tYNM
         usBg==
X-Gm-Message-State: APjAAAXbWHCgN4lxq5oOpmy7seAPrg7wfKep7+8Br0XYBolh1+Gw2JRa
        aNQWJtsa+SF/hV6rgCyweUc=
X-Google-Smtp-Source: APXvYqyA6pOWVd+84zF0/2Zm6v38X4Z6FEKR6ISmVHgI1wCie9Yns7deQEiJp6CReieFqsueWEGa8A==
X-Received: by 2002:a2e:818e:: with SMTP id e14mr1660522ljg.2.1578965815401;
        Mon, 13 Jan 2020 17:36:55 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id m189sm6427627lfd.92.2020.01.13.17.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 17:36:54 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/8] i2c: tegra: Properly disable runtime PM on driver's probe error
Date:   Tue, 14 Jan 2020 04:34:36 +0300
Message-Id: <20200114013442.28448-3-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200114013442.28448-1-digetx@gmail.com>
References: <20200114013442.28448-1-digetx@gmail.com>
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
Cc: <stable@vger.kernel.org> # v5.4+
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

