Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A1B25826C
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730006AbgHaUXh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730003AbgHaUXg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:36 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C145BC061573;
        Mon, 31 Aug 2020 13:23:34 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id i10so8265247ljn.2;
        Mon, 31 Aug 2020 13:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NLHjuAzOuZSHd7eSjO+fVmyPsvQw6RuPt2s9HQlH5zc=;
        b=cYVaZxhbYOsEZ7KLVudLAlT5m70uAnVXUFjg6Aj3Sjzp6KQwyErJ2aRa8FTaGPnGpw
         EjZYAZVz/rRWYjevDjEDCR64elZSxJt3QySO7Rqx25z6UdSo47+1caJYkD83ck73hBlz
         6BLFlOYxKSIJuk5o3nTlv1tbHZmfS9vgN+nTS2hsBlO+gxHMJxgz+6Snd7zt4/xXCJe0
         CfJZGECHifRqe8FDsJiHKtdWTNgLQiRdoEI/bBNkF5yP7BfihyeBEVbyDJ6PhZbNwWqG
         km2ojhNqvydrUViaZwR7v5uuHeYhGYSr3iJJBvFCnVnHsIrfUnpuWCIQtdJKpDhlLqvT
         Zk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NLHjuAzOuZSHd7eSjO+fVmyPsvQw6RuPt2s9HQlH5zc=;
        b=oVWEYZvyWjl2lJ/dP9ckF0GE9n1uVi++l80ex/D0Sk2H378yXEkEZP0RgXAh+1IkDf
         3B81dCHVm5i/rQz0DLWLM5ucbUrks9T+eGkcSEiYrt3NwtzQaZ4hobSsYecKsELBuDvv
         4IKp+p/XNyFMBAliAj3a3xBCc9KqZRMb3Cds2apGyWbvkFLV34XfXkcdxkrqrvtwPZqd
         ct7qEFotqcRTRQF9aeHw7VSNIK2ezGHdxXehJfddgKpRvJ46R/dyuizYmfCjWU6vVcu3
         eA/B41p4GwgNH/3biB4w2Ef0bIrF+nQ6/gNboy64mlHLP5RGA53DTHhxRxCOBDAo29JA
         M0Wg==
X-Gm-Message-State: AOAM5338doNbJdUnNPY59l44PtKAiwI0Nj0rytbtJ6iBQCWtdMqqozM5
        t6FCXsn2C5i0MF/zXlOiIQo=
X-Google-Smtp-Source: ABdhPJwLtpISZ3sz4+Yc7b9gpScF/LB0sk9/4oMzj3TxzE9hsK4Edko4jVQQWqLhH7LJbbz5ZYvs7Q==
X-Received: by 2002:a05:651c:102c:: with SMTP id w12mr1499516ljm.464.1598905413238;
        Mon, 31 Aug 2020 13:23:33 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:32 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/12] i2c: tegra: Runtime PM always available on Tegra
Date:   Mon, 31 Aug 2020 23:22:59 +0300
Message-Id: <20200831202303.15391-9-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
References: <20200831202303.15391-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The runtime PM is guaranteed to be always available on Tegra after commit
40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remove
all the RPM-availability checking and handling from the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 525a757bdc66..ca8c16b1c049 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1767,18 +1767,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev->is_vi)
 		pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = tegra_i2c_runtime_resume(&pdev->dev);
-		if (ret < 0) {
-			dev_err(dev, "runtime resume failed\n");
-			goto unprepare_div_clk;
-		}
-	} else {
-		ret = pm_runtime_get_sync(i2c_dev->dev);
-		if (ret < 0) {
-			dev_err(dev, "runtime resume failed\n");
-			goto disable_rpm;
-		}
+	ret = pm_runtime_get_sync(i2c_dev->dev);
+	if (ret < 0) {
+		dev_err(dev, "runtime resume failed\n");
+		goto disable_rpm;
 	}
 
 	if (i2c_dev->is_multimaster_mode) {
@@ -1836,16 +1828,10 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		clk_disable(i2c_dev->div_clk);
 
 put_rpm:
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_put_sync(&pdev->dev);
-	else
-		tegra_i2c_runtime_suspend(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 disable_rpm:
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_disable(&pdev->dev);
-
-unprepare_div_clk:
+	pm_runtime_disable(&pdev->dev);
 	clk_unprepare(i2c_dev->div_clk);
 
 unprepare_slow_clk:
@@ -1867,8 +1853,6 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 		clk_disable(i2c_dev->div_clk);
 
 	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_i2c_runtime_suspend(&pdev->dev);
 
 	clk_unprepare(i2c_dev->div_clk);
 	clk_unprepare(i2c_dev->slow_clk);
-- 
2.27.0

