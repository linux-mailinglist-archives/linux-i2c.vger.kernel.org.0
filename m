Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2CA260845
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbgIHCNp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728382AbgIHCMP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:15 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB6AC0617A4;
        Mon,  7 Sep 2020 19:12:02 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id n25so7106580ljj.4;
        Mon, 07 Sep 2020 19:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+XR0GKh2Rda8u3koZlqMitsrhjsxJys6IV1C/EFC2aI=;
        b=kvtlENgWUyOmS7mnjfGXld/dNgCfuHuAF9QW6pyeInC++NGhKl05jTPT8wxRtmaFsb
         tgowznDCxGb/alctR5zAvLwrTbELNpoy7CMbaSIiBJ74zSy7KWKCnhCTVNo9kHO17JQF
         58ZfQgD2BpF56fod7yHvU4SkdoRNFwc/WK0ohgpvdnLQ146WHly0mOOeZcrkTraYVffI
         NF/+XQY7K3jJxa8ZIMSAKbgGLjn+kEfy7Dg02nFZICKqjzj68awom/Fcxt4Hw2qzi+5Z
         lD7bn+TuVuxmAyEW5F0qdgEIB8N2UOD3+mmxXljP2fZgKKZB2ZE139jKeEpHezzAw/Ba
         u9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+XR0GKh2Rda8u3koZlqMitsrhjsxJys6IV1C/EFC2aI=;
        b=qw+q/k3BKyCsaSpQWEZgwV6ZAXerRROLVk2mQ5N50K+xdJhXSvZyVDRQVov8KVOfgi
         F60NrCRNOARcJfT51rFaEX758iUjda6sW1l+YDbsYOYId+kpoP1tbRtXPbotjZ58dLpx
         rjHRshWFnlYKauIJzLeiM5yp1wdvXZLBkYyBspR9pTie+OU8JSXRaTUfttuzkZtMeSVa
         /0eYicZCFlSbjbqSWcKn67V992AozNhbh4P9xPuBMafcpMVaGT+PotbhzgjZNH9IY+ov
         zDAOIjVfd4nhEoccQbt6EilqMLEqYG9Ge1pQJWEvCxc0oy1TH9PDXiSA7F/Vz9McGnG8
         BZiw==
X-Gm-Message-State: AOAM530hpRK88rVEKuX1vPAizJgB/DznTJDdEy/+oPvhQrz659wqwcRw
        d6r9S6BLhibJoQVfsN6C81U=
X-Google-Smtp-Source: ABdhPJyB8C20xBu1cW9qmhousT8Rre754g2t6bNUomxbqJx3ISaKMctjo6Lzx41AtHoJQ/2XQemjLA==
X-Received: by 2002:a2e:99c4:: with SMTP id l4mr12489968ljj.428.1599531120814;
        Mon, 07 Sep 2020 19:12:00 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:12:00 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 28/35] i2c: tegra: Factor out hardware initialization into separate function
Date:   Tue,  8 Sep 2020 05:10:14 +0300
Message-Id: <20200908021021.9123-29-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out hardware initialization into a separate function from the probe
function. The only place where runtime PM needs to be resumed during probe
is the place of hardware initialization, hence it makes sense to factor
out it in order to have a bit cleaner error handling in tegra_i2c_probe().

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2e7beadd381f..44a8c7ae8509 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1655,6 +1655,21 @@ static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
 	clk_bulk_unprepare(i2c_dev->nclocks, i2c_dev->clocks);
 }
 
+static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
+{
+	int ret;
+
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0)
+		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
+	else
+		ret = tegra_i2c_init(i2c_dev);
+
+	pm_runtime_put(i2c_dev->dev);
+
+	return ret;
+}
+
 static int tegra_i2c_probe(struct platform_device *pdev)
 {
 	struct tegra_i2c_dev *i2c_dev;
@@ -1724,16 +1739,9 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(i2c_dev->dev);
 
-	err = pm_runtime_get_sync(i2c_dev->dev);
-	if (err < 0) {
-		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", err);
-		goto put_rpm;
-	}
-
-	/* initialize hardware state */
-	err = tegra_i2c_init(i2c_dev);
+	err = tegra_i2c_init_hardware(i2c_dev);
 	if (err)
-		goto put_rpm;
+		goto release_rpm;
 
 	i2c_dev->adapter.dev.of_node = i2c_dev->dev->of_node;
 	i2c_dev->adapter.dev.parent = i2c_dev->dev;
@@ -1755,14 +1763,11 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	err = i2c_add_numbered_adapter(&i2c_dev->adapter);
 	if (err)
-		goto put_rpm;
-
-	pm_runtime_put(i2c_dev->dev);
+		goto release_rpm;
 
 	return 0;
 
-put_rpm:
-	pm_runtime_put(i2c_dev->dev);
+release_rpm:
 	pm_runtime_disable(i2c_dev->dev);
 
 	tegra_i2c_release_dma(i2c_dev);
-- 
2.27.0

