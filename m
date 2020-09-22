Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D127A274C7E
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 00:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgIVWwd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 18:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgIVWwc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 18:52:32 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FDFFC061755;
        Tue, 22 Sep 2020 15:52:32 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z19so19879783lfr.4;
        Tue, 22 Sep 2020 15:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dvJ4RWnAY2r4Rf8AIKIiOPHlP++aDeFbzrhSiNZRwoE=;
        b=SPs7bG76AzFOABKWgDRxjS2yDBo9CfIoHvsq9BY5cWCVWSd1aQjMoI57F86prEDNZk
         uhifkSqowWeyXEhqTeyantaj4cYmz8ZYok4rVtfXL4ZRtQAy8qf6Ioj1hXNX3a2FkWpg
         7X9Cd1Scf0QUuua3QGr70MgYH4HGIfSoAfKoSUrtVMeUtcsYbTyQoiDVZZQBFHHRj75u
         mTNkb6T71jOZNqwdxQ6+ECte/t3v1P37iblQ//Pu0Avh4bO0QjjdFlxMfNWG+s/DGXaj
         UJ3HRQS2SXo1RoTOMNVOGDMmC4nbR1ADJBA7/XH3K9NtTFTYYvNZfWPItjRA4j8OnGBx
         GmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dvJ4RWnAY2r4Rf8AIKIiOPHlP++aDeFbzrhSiNZRwoE=;
        b=al00/gjdYo7SOSezcUMKyULA/4n5XS6z7AvSOF4X8WJUpYtzp+X8l0pFHYIbbyK/bn
         EBHqos6m/KPjDEKsyviUk1ZBCwL27tIJjd4/xK0p/6X6KNX+G6mBT8Cb2TgeRXe304za
         JWQ/xmZ0a/8NBqj5GtLdv3zrvSYLau+bdYkU9+ztuk9vuouDNlspXOAZB34uIAxnv1uH
         qEknmQelJSrIfWm8TzTaVU2s7qWoNDAxdXgp2Tt9WrDdu37l6fO2M84On4rom1QxJsVq
         eRLij7ldWYfpzZNACXvpRDkQm2SQGn059Z6kBxfiBAsL/L0aqLTotvR8fQD2AKD11++a
         5/Vw==
X-Gm-Message-State: AOAM530U/2IaFP+gkdV2IG8UjD1Esbv9qdgMRwCNo9/MO4YUNdjwGNrg
        vcO3DVkwKBKY0qBRNHixl50vz5v3L8g=
X-Google-Smtp-Source: ABdhPJzAVXG5d+WCtFgg4EjX9WrHvq0qk/D3zUXXN08z7bIObs6UHpfwRJkr9uwngwYV7xFf+JbVMw==
X-Received: by 2002:a19:4bd6:: with SMTP id y205mr2491460lfa.182.1600815150836;
        Tue, 22 Sep 2020 15:52:30 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l15sm3977588lfk.71.2020.09.22.15.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:52:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 01/32] i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
Date:   Wed, 23 Sep 2020 01:51:24 +0300
Message-Id: <20200922225155.10798-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200922225155.10798-1-digetx@gmail.com>
References: <20200922225155.10798-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
are not updating if interrupts are disabled. Let's switch to use iopoll
API helpers for register-polling. The iopoll API provides helpers for both
atomic and non-atomic cases.

Note that this patch doesn't fix any known problem because normally FIFO
is flushed at the time of starting a new transfer.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 00d3e4d7a01e..ab88cdd70376 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -470,9 +470,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
-	unsigned long timeout = jiffies + HZ;
-	unsigned int offset;
-	u32 mask, val;
+	u32 mask, val, offset, reg_offset;
+	void __iomem *addr;
+	int err;
 
 	if (i2c_dev->hw->has_mst_fifo) {
 		mask = I2C_MST_FIFO_CONTROL_TX_FLUSH |
@@ -488,12 +488,19 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 	val |= mask;
 	i2c_writel(i2c_dev, val, offset);
 
-	while (i2c_readl(i2c_dev, offset) & mask) {
-		if (time_after(jiffies, timeout)) {
-			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
-			return -ETIMEDOUT;
-		}
-		usleep_range(1000, 2000);
+	reg_offset = tegra_i2c_reg_addr(i2c_dev, offset);
+	addr = i2c_dev->base + reg_offset;
+
+	if (i2c_dev->is_curr_atomic_xfer)
+		err = readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
+							1000, 1000000);
+	else
+		err = readl_relaxed_poll_timeout(addr, val, !(val & mask),
+						 1000, 1000000);
+
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
+		return err;
 	}
 	return 0;
 }
-- 
2.27.0

