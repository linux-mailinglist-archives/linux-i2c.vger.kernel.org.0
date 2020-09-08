Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B252622FD
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730393AbgIHWnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730073AbgIHWky (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:40:54 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5995AC061796;
        Tue,  8 Sep 2020 15:40:53 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id n25so991600ljj.4;
        Tue, 08 Sep 2020 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cXVjQ8tBGvi88Q3dqadI+S4l2h32UDxPkNgdMyWN/ps=;
        b=rnVd4cTbVh+Phcmm/EYwb9cJVGctt7NC8DOpLYHkyc1borSEi69laZ1mriUqX8djX7
         Sc0PYukYR6x+s+ja5IjDNwcXL+tnRdYzEnX/kBXSnfMRteZt/En0WnXL0LtSg+bd+7yn
         Q6p6APAe5wQlNg1q1xaqewY+xmfVTZRAZr7b4mOfY7xWKjYfovBbcB5gvnybj0BY7N4W
         ZVlphs36JksqqVhWMv7euMetE6U2bqCz0x5m9d/GYJ1izka0rjz7vI/s2Dsdi9vmbnXz
         p9uY2g0GGiYeHJrxW8pHQdtEL2wAy+tfc9AcdCCfQJqps5/Fz+wW5AM6nToMYGIou+rT
         GYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cXVjQ8tBGvi88Q3dqadI+S4l2h32UDxPkNgdMyWN/ps=;
        b=Txl6qqnBw5GLWgKunmQKXzFeNwYwGsGEE6X6HytpJZFw//sZYivLC/Y13C+TPIrAO7
         JiXu0rCVaOS2d7xj85chDNUAU8sNSS2v9/S2FZRyL7h053d/fibGRe1/BRq5JKLaQbHP
         HQ2UILD0xEq/3AKVoeeaxTwBHNc3Y99pOM1ekUGspnSfpGgnL0iHUp9RkkqAA+Ue9ANr
         BpxbLFRuXOJ+dclscagBn47xrcYG4R/6tH5A3ZxhF3BFNmUbBJcKCLbefpcRUqY/JGiT
         jFfIfIkSB85c7AG7277/PSe4XT4bCBK3Lq92DxYYXYb5cNLoP3CqadfcLzUh8XK77N8j
         7CPA==
X-Gm-Message-State: AOAM530zSgr/tNC4zdG/M2Ey76MGAjNiTgYRi8Ekx9/hjCUmVlaIWyay
        aUVnWv4RM2H8mvCUM5DtyFA=
X-Google-Smtp-Source: ABdhPJy3yGatK4uH7DrsKjp72dQFgAXBSdPTKTAcfPVTfHIiN54fn/KrFv5JgZthCrJsELBBKQUxlg==
X-Received: by 2002:a2e:b5d9:: with SMTP id g25mr319707ljn.335.1599604851862;
        Tue, 08 Sep 2020 15:40:51 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 21/34] i2c: tegra: Don't fall back to PIO mode if DMA configuration fails
Date:   Wed,  9 Sep 2020 01:39:53 +0300
Message-Id: <20200908224006.25636-22-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The DMA code path has been tested well enough and the DMA configuration
performed by tegra_i2c_config_fifo_trig() shouldn't ever fail in practice.
Hence let's remove the obscure transfer-mode switching in order to have a
cleaner and simpler code. Now I2C transfer will be failed if DMA
configuration fails.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 76d3a05b10fc..574b59a8b2a2 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -940,8 +940,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
-				       size_t len)
+static int tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev, size_t len)
 {
 	u32 val, reg;
 	u8 dma_burst;
@@ -992,12 +991,10 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		if (ret < 0) {
 			dev_err(i2c_dev->dev, "DMA slave config failed: %d\n",
 				ret);
-			dev_err(i2c_dev->dev, "falling back to PIO\n");
-			tegra_i2c_release_dma(i2c_dev);
-			i2c_dev->is_curr_dma_xfer = false;
-		} else {
-			goto out;
+			return ret;
 		}
+
+		goto out;
 	}
 
 	if (i2c_dev->hw->has_mst_fifo)
@@ -1008,6 +1005,8 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 		      I2C_FIFO_CONTROL_RX_TRIG(1);
 out:
 	i2c_writel(i2c_dev, val, reg);
+
+	return 0;
 }
 
 static unsigned long
@@ -1141,7 +1140,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	i2c_dev->is_curr_dma_xfer = (xfer_size > I2C_PIO_MODE_PREFERRED_LEN) &&
 				    i2c_dev->dma_buf &&
 				    !i2c_dev->is_curr_atomic_xfer;
-	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
+
+	err = tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
+	if (err)
+		return err;
 
 	/*
 	 * Transfer time in mSec = Total bits / transfer rate
-- 
2.27.0

