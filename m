Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBB961863
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2019 01:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfGGXNp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Jul 2019 19:13:45 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43866 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfGGXNp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Jul 2019 19:13:45 -0400
Received: by mail-qt1-f195.google.com with SMTP id w17so13163891qto.10;
        Sun, 07 Jul 2019 16:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jX8co8wrgwZjn2Un2b2HqEtzTkCfWW53T8N10nbRoLs=;
        b=p1T29PG0y8Qhzef1GATJAzJnw4Xs1yhwGY6g2t7uzw6kiqKY+7gD/DnlFY6CRUHwSB
         cJ1zwhsZK/BtnM518cBUmOGj/m+4o1HfFRGQmDS6EaEtFhZmHO+xS4OREftl+WsjSOmo
         ricp6I1bABHTRmPsk63w0zutRjffdAsTsyu1GnIndxWAQY18O17WQJlPPngMZSd6jMzM
         dkoMwMQS0CN5S950bj5N4MwBCz34XHoC42u1sKM5fM/o8tP5El8pUk6rzNNHtnCt9lLm
         4VlXmo1079ZmjlTENJKovkZr1Iu0yZW83TJX9p8Xt8VvzJoLj1UMDsK0BEFq9BVB1W8H
         0pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jX8co8wrgwZjn2Un2b2HqEtzTkCfWW53T8N10nbRoLs=;
        b=GbFFSWvyiLCo5NS/st7qluUJktqrplZvEq3Z7KsS/R26k63P3ZNhnbQP4RHeGu+qf7
         aTC/BWug5pbr8JAmBEd/8314F1zmEE7LuK513sK0oV7ZyymVXi+shBa+Mkl5/LnpqXqc
         KG6KtUc/QggUSemydn2rriLz9naR35FOROB9zwwOACZkC6YI1Xac0UPbaDpYVfRtKtp9
         5iPgy67sdrR3HuIVuIgC4SZoxssLnq6GEHGUh6rOBKdMzAC6DF0SbytrSFGACYaO4KHI
         oKRkKhB3wMQaTVD/hTTEMtDG45n2pBtpuuSeqC462VUBqKqBZOGevXyIJp4Yb8BquBy1
         Fn+g==
X-Gm-Message-State: APjAAAUCpPAsHAGRuhSpEiNJ5OIkm8zdT/LzdDoIAyRaVbu3CmLEaudN
        7G5ZzK4+uceOX9fzoXzH288=
X-Google-Smtp-Source: APXvYqwakS20w3/01v0ZpqXyhS7C7JLX9QTO/uqiAcg08mKusrOBdJNQAuPrRVZbUND+SyLYARPgSw==
X-Received: by 2002:aed:38c2:: with SMTP id k60mr11121436qte.83.1562541224341;
        Sun, 07 Jul 2019 16:13:44 -0700 (PDT)
Received: from localhost.localdomain (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.gmail.com with ESMTPSA id x8sm957115qkl.27.2019.07.07.16.13.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Jul 2019 16:13:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: tegra: Compile PM functions unconditionally
Date:   Mon,  8 Jul 2019 02:12:34 +0300
Message-Id: <20190707231234.11679-1-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C driver fails to probe if CONFIG_PM_SLEEP=n because runtime PM
doesn't depend on the PM sleep and in this case the runtime PM ops are
not included in the driver, resulting in I2C clock not being enabled.
It's much cleaner to simply allow compiler to remove the dead code
instead of messing with the #ifdefs.

This patch fixes such errors when CONFIG_PM_SLEEP=n:

  tegra-i2c 7000c400.i2c: timeout waiting for fifo flush
  tegra-i2c 7000c400.i2c: Failed to initialize i2c controller

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 9fcb13beeb8f..18f0ceed9f1b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -636,7 +636,7 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
 	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
 }
 
-static int tegra_i2c_runtime_resume(struct device *dev)
+static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 	int ret;
@@ -665,7 +665,7 @@ static int tegra_i2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int tegra_i2c_runtime_suspend(struct device *dev)
+static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 
@@ -1711,8 +1711,7 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra_i2c_suspend(struct device *dev)
+static int __maybe_unused tegra_i2c_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 
@@ -1721,7 +1720,7 @@ static int tegra_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_i2c_resume(struct device *dev)
+static int __maybe_unused tegra_i2c_resume(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 	int err;
@@ -1741,18 +1740,13 @@ static const struct dev_pm_ops tegra_i2c_pm = {
 			   NULL)
 };
 
-#define TEGRA_I2C_PM	(&tegra_i2c_pm)
-#else
-#define TEGRA_I2C_PM	NULL
-#endif
-
 static struct platform_driver tegra_i2c_driver = {
 	.probe   = tegra_i2c_probe,
 	.remove  = tegra_i2c_remove,
 	.driver  = {
 		.name  = "tegra-i2c",
 		.of_match_table = tegra_i2c_of_match,
-		.pm    = TEGRA_I2C_PM,
+		.pm    = &tegra_i2c_pm,
 	},
 };
 
-- 
2.22.0

