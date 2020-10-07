Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0D7285A1B
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Oct 2020 10:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgJGIIU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Oct 2020 04:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727287AbgJGIIO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Oct 2020 04:08:14 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8376BC0613D5
        for <linux-i2c@vger.kernel.org>; Wed,  7 Oct 2020 01:08:13 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id cq12so1212401edb.2
        for <linux-i2c@vger.kernel.org>; Wed, 07 Oct 2020 01:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N9BB7E4iGMc/0xci5wMPtXbQzs5kI/9VbBMLqTlLSE8=;
        b=QE5wCYvx8kvJMvIBqPW3Xjj5S68geqga477qq7uif1HkyevhmAtFMOt/buaJVFfpEH
         jiijKBMvzIka7KNi7BK8/tuFS6+UEIjCz9fz7+Ypbka0repb8XQcAI5hXq6nDoDXhU2z
         tx0IDqrog0nbwdZ2tKtSI05lEYppygDek+j8xKBsG1lX7hEhXlVAb8G6A7QzqDayzsj+
         G+LFf+r8Qsiy1PGjAifRuvdNj8l2eVQW5lgd+i+bfJAc5aq8whixyfoXHtzRKvz8gy3T
         o8eefN8FkN6922LvF5PWy+Xu+VDfrvq0YyNM9t210jFSd2lH0yciRdcWJAmjuGH/q3hm
         QdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N9BB7E4iGMc/0xci5wMPtXbQzs5kI/9VbBMLqTlLSE8=;
        b=eJ151H/hX4TarMNe56qDRoBXYo+vBTeVDDQNpKcW3AviPPt3mUvHPOjU+CNcv3M1NW
         EDhmXKzAGTeUlFPT5qG6jKmEuoKmPxcRjDIAS7WxnX2HyndtYdwy4oeK+MoFVoLfrYI3
         U7npmSG6G3lKlHLpDQkJrTjYbNYzsJWaSp+UK71cAOas7SOD8yDZ/54Y70IKilzA1EcH
         73ioXWvUANhCMyPR+t0wwDBDQ/cIm1xkJBEbNkawEYHn2Y1lrfEt4/5mE+f6Lf8n6qJU
         L1h3vvumWfxHsCmhnxadJiduOAUtUlCYIdMtHLzBUevr+wX82rOoXTILShZpYhwcBhJQ
         i34Q==
X-Gm-Message-State: AOAM530f1tNG0SvCephVeZSLSV2zdKFUMLJjt1YKYGO48T47BPoJeDgQ
        Q/+xCBBeXGEgSw2LZDx3tnoC/g==
X-Google-Smtp-Source: ABdhPJypq5afOnV5h1ZSBHO4fnEsWDyM831RAyRh/f+UBTgfm4W7zKgvvkr6dtv2ORMIalObWbBJLQ==
X-Received: by 2002:a05:6402:1612:: with SMTP id f18mr2253541edv.166.1602058092223;
        Wed, 07 Oct 2020 01:08:12 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id p11sm888645edu.93.2020.10.07.01.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 01:08:11 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Wolfram Sang <wsa@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc:     Nicolas Belin <nbelin@baylibre.com>, linux-i2c@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/3] i2c: meson: fixup rate calculation with filter delay
Date:   Wed,  7 Oct 2020 10:07:51 +0200
Message-Id: <20201007080751.1259442-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007080751.1259442-1-jbrunet@baylibre.com>
References: <20201007080751.1259442-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Nicolas Belin <nbelin@baylibre.com>

Apparently, 15 cycles of the peripheral clock are used by the controller
for sampling and filtering. Because this was not known before, the rate
calculation is slightly off.

Clean up and fix the calculation taking this filtering delay into account.

Fixes: 30021e3707a7 ("i2c: add support for Amlogic Meson I2C controller")
Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/i2c/busses/i2c-meson.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index e7ec2ab2a220..ef73a42577cc 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -34,10 +34,8 @@
 #define REG_CTRL_ACK_IGNORE	BIT(1)
 #define REG_CTRL_STATUS		BIT(2)
 #define REG_CTRL_ERROR		BIT(3)
-#define REG_CTRL_CLKDIV_SHIFT	12
-#define REG_CTRL_CLKDIV_MASK	GENMASK(21, 12)
-#define REG_CTRL_CLKDIVEXT_SHIFT 28
-#define REG_CTRL_CLKDIVEXT_MASK	GENMASK(29, 28)
+#define REG_CTRL_CLKDIV		GENMASK(21, 12)
+#define REG_CTRL_CLKDIVEXT	GENMASK(29, 28)
 
 #define REG_SLV_ADDR		GENMASK(7, 0)
 #define REG_SLV_SDA_FILTER	GENMASK(10, 8)
@@ -46,6 +44,7 @@
 #define REG_SLV_SCL_LOW_EN	BIT(28)
 
 #define I2C_TIMEOUT_MS		500
+#define FILTER_DELAY		15
 
 enum {
 	TOKEN_END = 0,
@@ -140,19 +139,21 @@ static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
 	unsigned long clk_rate = clk_get_rate(i2c->clk);
 	unsigned int div;
 
-	div = DIV_ROUND_UP(clk_rate, freq * i2c->data->div_factor);
+	div = DIV_ROUND_UP(clk_rate, freq);
+	div -= FILTER_DELAY;
+	div = DIV_ROUND_UP(div, i2c->data->div_factor);
 
 	/* clock divider has 12 bits */
-	if (div >= (1 << 12)) {
+	if (div > GENMASK(11, 0)) {
 		dev_err(i2c->dev, "requested bus frequency too low\n");
-		div = (1 << 12) - 1;
+		div = GENMASK(11, 0);
 	}
 
-	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
-			   (div & GENMASK(9, 0)) << REG_CTRL_CLKDIV_SHIFT);
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV,
+			   FIELD_PREP(REG_CTRL_CLKDIV, div & GENMASK(9, 0)));
 
-	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
-			   (div >> 10) << REG_CTRL_CLKDIVEXT_SHIFT);
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT,
+			   FIELD_PREP(REG_CTRL_CLKDIVEXT, div >> 10));
 
 	/* Disable HIGH/LOW mode */
 	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
-- 
2.25.4

