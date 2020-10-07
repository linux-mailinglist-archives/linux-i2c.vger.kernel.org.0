Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD24B285A19
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Oct 2020 10:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbgJGIIR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Oct 2020 04:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbgJGIIM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Oct 2020 04:08:12 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CD7C0613D4
        for <linux-i2c@vger.kernel.org>; Wed,  7 Oct 2020 01:08:10 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id x1so1217428eds.1
        for <linux-i2c@vger.kernel.org>; Wed, 07 Oct 2020 01:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZhbU6JmaVfKgD1s4cybkcHTBk+tY6By/eFQji3AClKY=;
        b=j1ZHC/Plvx7SgnRFbucisI2F2GM2pxPOw0vRjiREHyMPuFtNMjkipgmBzOHJa/VcAi
         FJqJ7PJrOdaLjZnGcPG8L2qFMIp16S/A+06M+a5G+WQtwkIKheWGILG89/UVb7V298tf
         Nzj4aDM7+puXmcfD2kVkm90kdtH8z3HuE34USZLscGcU5WH+wzCfrnSiy5Z7CO9aTqgU
         NLca3DEDaNIqyGlboBbdI6tOT31AbHnwtuA1Ub+mYRtY3sLUMub7XvCfmvX0yXHeP4s0
         QmE6pVN0y2nDyVSAKQy8sLD6Q6giiQy9lu8IbqlrTRql76vwYnvcfQSJ1McPiTlEJnLX
         amPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZhbU6JmaVfKgD1s4cybkcHTBk+tY6By/eFQji3AClKY=;
        b=V1enCK6PN8t0+hvvbl7ZLWbkSlmJOoutOJQ8RYKLZ+qIE2DjDNKPr8D7fcZFdYT/pM
         +OSL/BHyFdRTLv9G7DHTcsGVn10iDynZmA6p3eWBlwHbX0q2PpgHNgXXogXBwJ0yssD1
         zVSPcmuKpiVhrNzlYVM410NufklDHrhS3eThcNk9WsyevpOIE+7GksnI9os97MZWuZG7
         RLTnEmgZfBtW9M+3Sjk6+AU58OFQQVLLR/Kem6b444a4IPm8AecXelRBas7W0bGITGv1
         /e1ZzaGaR2o26SO9SlNyxPwg6Twwt8McpMNt4XxvghmV2zhveWKBW8pajA4q7tXmwONS
         ehfQ==
X-Gm-Message-State: AOAM5338E+if2bkZlR/Xt79cF9gHvnoOhJzv7/up37YfmDtrDMRqrDsb
        TMG73jKw1a6aBu1B5nTtD82KNw==
X-Google-Smtp-Source: ABdhPJx0XWEkI4HBlS99pxTK0t4QJZzkpystYXF06tW6acHL9Sam6bWwntQ8rUxJW+MCVvIhEPpYlA==
X-Received: by 2002:a50:c309:: with SMTP id a9mr2285070edb.199.1602058089334;
        Wed, 07 Oct 2020 01:08:09 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id p11sm888645edu.93.2020.10.07.01.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 01:08:08 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Wolfram Sang <wsa@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Nicolas Belin <nbelin@baylibre.com>, linux-i2c@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] i2c: meson: fix clock setting overwrite
Date:   Wed,  7 Oct 2020 10:07:49 +0200
Message-Id: <20201007080751.1259442-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007080751.1259442-1-jbrunet@baylibre.com>
References: <20201007080751.1259442-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When the slave address is written in do_start(), SLAVE_ADDR is written
completely. This may overwrite some setting related to the clock rate
or signal filtering.

Fix this by writing only the bits related to slave address. To avoid
causing unexpected changed, explicitly disable filtering or high/low
clock mode which may have been left over by the bootloader.

Fixes: 30021e3707a7 ("i2c: add support for Amlogic Meson I2C controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/i2c/busses/i2c-meson.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index c5dec572fc48..dac0d2a00cec 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/i2c.h>
@@ -38,6 +39,12 @@
 #define REG_CTRL_CLKDIVEXT_SHIFT 28
 #define REG_CTRL_CLKDIVEXT_MASK	GENMASK(29, 28)
 
+#define REG_SLV_ADDR		GENMASK(7, 0)
+#define REG_SLV_SDA_FILTER	GENMASK(10, 8)
+#define REG_SLV_SCL_FILTER	GENMASK(13, 11)
+#define REG_SLV_SCL_LOW		GENMASK(27, 16)
+#define REG_SLV_SCL_LOW_EN	BIT(28)
+
 #define I2C_TIMEOUT_MS		500
 
 enum {
@@ -147,6 +154,9 @@ static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
 	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
 			   (div >> 10) << REG_CTRL_CLKDIVEXT_SHIFT);
 
+	/* Disable HIGH/LOW mode */
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
+
 	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, div %u\n", __func__,
 		clk_rate, freq, div);
 }
@@ -280,7 +290,10 @@ static void meson_i2c_do_start(struct meson_i2c *i2c, struct i2c_msg *msg)
 	token = (msg->flags & I2C_M_RD) ? TOKEN_SLAVE_ADDR_READ :
 		TOKEN_SLAVE_ADDR_WRITE;
 
-	writel(msg->addr << 1, i2c->regs + REG_SLAVE_ADDR);
+
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_ADDR,
+			   FIELD_PREP(REG_SLV_ADDR, msg->addr << 1));
+
 	meson_i2c_add_token(i2c, TOKEN_START);
 	meson_i2c_add_token(i2c, token);
 }
@@ -461,6 +474,10 @@ static int meson_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Disable filtering */
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
+			   REG_SLV_SDA_FILTER | REG_SLV_SCL_FILTER, 0);
+
 	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
 
 	return 0;
-- 
2.25.4

