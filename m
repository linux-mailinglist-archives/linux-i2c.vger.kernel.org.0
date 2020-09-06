Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BC625EFF7
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgIFS5S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729108AbgIFSvp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:51:45 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1820BC061575;
        Sun,  6 Sep 2020 11:51:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u4so12679759ljd.10;
        Sun, 06 Sep 2020 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gfmOtG2LX9A+Kel844rjarke+NfElZZeKMZp8MuQx6I=;
        b=TbM5eM07HfQ5we6G7ZDUR58QRvrjxav/qqGQK4trk4t7GIwnYtzJ+utTk7wFyan95A
         IhlY05zokNZ48fXdhg13q61BmQMEPxguMgGG06T49q3YHha2eWjEb5P20s9t5UPbLqX7
         INz5l7RVZXezESNeqdh8BP9mobCXPDjCIAERLu4Zafolmeek3hK/+2nGpuLGuPtN6soD
         R23ZC9dBXoeF1yziqE8QvwOc0iXVRpl2ISw8RAP4nboqeJs8QwK0x38isFAmHq3CZxo6
         +2UVj2kg9r/hl6mBtGxORAyGFkMR6fsZKn6Rvzvazy79/FXHUdYH6VZ3WJTqoAn9kHeD
         50Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfmOtG2LX9A+Kel844rjarke+NfElZZeKMZp8MuQx6I=;
        b=jSLh31CVCkirkhQyYC/x2xqEwZAyNSnQcNnpE6Iy0KgmvjQtmPlRRVr60ZqKO5KDUB
         RFgXaVbKe6i18Cb+T2wWPWZaPIIcVHKDm+/6HaMIxUJRtjoZ77I1gD7Zan6GsGLhWfc+
         WNOiwRMvphWfL9WDHN/TsRECyg4ZtFmOG85nB8VrSGD3REhCwhmPcM+GhXdMLfvjMb6/
         QNc8v4x4RiNPT7K05QKkmahZmucKpU94Es8sQkZbinWPHFfFw8QrWPux1Ne3lk3u6Khm
         tfSUT3+Zq/edwvYpWKT8pfso+u3SXtC3DUR91/lp7+pjNXAW2dTG+v+sVze/BPwyiVA1
         +QLg==
X-Gm-Message-State: AOAM532gYa2Y4+cr+HW39g55aTtCd4Bc0GJ6CCrDtzkcd8yZ+YTrQFn+
        8SQcYRRuKfEldkmmDGY/rhSBVR5h3XI=
X-Google-Smtp-Source: ABdhPJzzxMEXTG5ma515FF4QDc3l3e5vLyB6xy8W2IkcDGxu2+2xnSVZsEzQp963x1rdFF51QOAHew==
X-Received: by 2002:a2e:9116:: with SMTP id m22mr5647420ljg.387.1599418300279;
        Sun, 06 Sep 2020 11:51:40 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/36] i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
Date:   Sun,  6 Sep 2020 21:50:04 +0300
Message-Id: <20200906185039.22700-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
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

