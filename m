Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C79A27DBF4
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbgI2WUm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgI2WUg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:36 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A12C061755;
        Tue, 29 Sep 2020 15:20:35 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u21so5347391ljl.6;
        Tue, 29 Sep 2020 15:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7vtDhfCuGn18+IawJN1967bq4/LUHEmeeRfUPM35BT4=;
        b=OBek6bqL2oPPtck2bQjVhG04HmQUmwViQzte11xp752M1xZFEBcvWFN+W6EDMND+JD
         6vnRuIiuM40xurP69U/F+n44zHscZ9HOnFLwJQghN6izfzf+xxAxlfZrz2HgUhm+zWkZ
         o6EX2HsAxhHQuZhi9zi2ZQx5yEEQ/j7xrXukJPqdeGzi3TAmVMCg3BjHoGEwc4+D4Qo7
         iaPiADomOFl4Mn9hl3Z23INq+onP6J4KMz0jdb2NDh5qcJt4FHZ8OERw0tGePUe7mBvo
         /wNGaZpoJKZ4rrunsijKE0Xoqotis3s671G2ugQTgRtAEqyEwGfI1fqmY0P+tx62Miky
         S73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7vtDhfCuGn18+IawJN1967bq4/LUHEmeeRfUPM35BT4=;
        b=AnEgJKmpAM3vJ5gVIAtMWxEl1BJpJujxqJL4kKO+BjEqSn+2A/NI2h0YPjRb15Uatf
         dx6Qz6jWamof4UD2GXT/XkssH/B4ohhyPWel2OaWAG1CaA9xdscbUWxPGM1sg0NOYxT4
         WUuwUWPnGVppEsHP7itS0JbPn4X/OvJ12BheiHM2acWWUMx/6FjTTfUt0cR8uNGRXfSQ
         Gm7yfQGwZgxkeAyFpcatGKc9KXow1xkCoCmG8CGlTF0iiqb38j2RYRby5D9AatxQXjwj
         q+ocIy8Scdk0OjMO/FhKrqujlwLqDL7Ajdf00l654jOS5ICXwxwByX4JtczC390P0Vjr
         +vOA==
X-Gm-Message-State: AOAM530TdnaVyPXVKSgwcmkt/FCmCAbsaYexj3uXxYjREuVmx6Rd7l5H
        cr6cdm3phCrxZiOTKNiLGGY=
X-Google-Smtp-Source: ABdhPJzp70FCwAHKPNN3QXjSnLu7y4FUm2XrCVeUyxdDU3uzYwvIhBBIpcIvA6KC88eQwhmz/vuBWA==
X-Received: by 2002:a05:651c:543:: with SMTP id q3mr1721438ljp.6.1601418034244;
        Tue, 29 Sep 2020 15:20:34 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 02/32] i2c: tegra: Add missing pm_runtime_put()
Date:   Wed, 30 Sep 2020 01:18:45 +0300
Message-Id: <20200929221915.10979-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pm_runtime_get_sync() always bumps refcount regardless of whether it
succeeds or fails. Hence driver is responsible for restoring of the RPM
refcounting. This patch adds missing RPM puts which restore refcounting
in a case of pm_runtime_get_sync() error.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ab88cdd70376..4e7d0eec0dd3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1375,6 +1375,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0) {
 		dev_err(i2c_dev->dev, "runtime resume failed %d\n", ret);
+		pm_runtime_put_noidle(i2c_dev->dev);
 		return ret;
 	}
 
@@ -1786,7 +1787,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		ret = pm_runtime_get_sync(i2c_dev->dev);
 		if (ret < 0) {
 			dev_err(&pdev->dev, "runtime resume failed\n");
-			goto disable_rpm;
+			goto put_rpm;
 		}
 	}
 
@@ -1851,7 +1852,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	else
 		tegra_i2c_runtime_suspend(&pdev->dev);
 
-disable_rpm:
 	if (pm_runtime_enabled(&pdev->dev))
 		pm_runtime_disable(&pdev->dev);
 
-- 
2.27.0

