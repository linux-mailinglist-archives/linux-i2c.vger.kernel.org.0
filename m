Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8364E805C
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Mar 2022 11:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbiCZKYN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Mar 2022 06:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbiCZKYM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 26 Mar 2022 06:24:12 -0400
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4ED16BCF6;
        Sat, 26 Mar 2022 03:22:35 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id h23so13804651wrb.8;
        Sat, 26 Mar 2022 03:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YGuZo2Hq9ChT5cMnSJKU17y7ywEpdIIE557tEVvhgqI=;
        b=I6nvZAb65mMAWiGNzsbuuWCbKLCbhMYI7x4Y4PGuE7C5iEQR6dFSW7iftYMtj/GKlO
         I4YPDMW+6FEAMJbRRq2LF5MxFfLLtCXo0Ln11bo9RtB2mMDIoON0j0x8rcd/GYDRBZgS
         TIqbYCb9nb9TZF/0KBoUbI0Rx9sDkkTtmrP22YlVmaMn55DvdmbsOKFU8ONLxvfF7BRq
         xLnkNIf0CzDms4J3tU0k2Tigqv6X5sHwPUuQA6NBGldebFgSswasJyE96NbDw3PdvSYr
         Z0S6Ggf1d5gLp7AmsXcRQmYngywfahG549hjKffReL4nwIT+2uIZqFn1UyO6RgNh4/Lu
         kaCg==
X-Gm-Message-State: AOAM531pb88qGzuKpql2wHMT7FnsqwzA7zXrIjq0k585DTb2olIyBJ9X
        lFx9qskwSn7WMyDYf1lZZzeFopgBWcD5ZQ==
X-Google-Smtp-Source: ABdhPJwkdy9I3mVJNtJcYMmcPEdeTaDwkchZfl1LHWyFYJtZAthsxp5W5FuvoDTIjKY9m4amlMkv+A==
X-Received: by 2002:a05:6000:18c2:b0:203:fc53:c70e with SMTP id w2-20020a05600018c200b00203fc53c70emr13102994wrq.198.1648290154316;
        Sat, 26 Mar 2022 03:22:34 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.googlemail.com with ESMTPSA id l15-20020a05600c1d0f00b0038c8ff8e708sm6683057wms.13.2022.03.26.03.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 03:22:33 -0700 (PDT)
From:   Lucas Tanure <tanure@linux.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lucas Tanure <tanure@linux.com>
Subject: [PATCH 2/3] i2c: meson: Use 50% duty cycle for I2C clock
Date:   Sat, 26 Mar 2022 10:22:28 +0000
Message-Id: <20220326102229.421718-3-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326102229.421718-1-tanure@linux.com>
References: <20220326102229.421718-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The duty cycle of 33% is less than the required
by the I2C specs for the LOW period of the SCL
clock.

Move the duty cyle to 50% for 100Khz or lower
clocks, and (40% High SCL / 60% Low SCL) duty
cycle for clocks above 100Khz.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/i2c/busses/i2c-meson.c | 45 +++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 4b4a5b2d77ab..b913ba20f06e 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -140,29 +140,50 @@ static void meson_i2c_add_token(struct meson_i2c *i2c, int token)
 static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
 {
 	unsigned long clk_rate = clk_get_rate(i2c->clk);
-	unsigned int div;
+	unsigned int div_h, div_l;
 
-	div = DIV_ROUND_UP(clk_rate, freq);
-	div -= FILTER_DELAY;
-	div = DIV_ROUND_UP(div, i2c->data->div_factor);
+	if (freq <= 100000) {
+		div_h = DIV_ROUND_UP(clk_rate, freq);
+		div_l = DIV_ROUND_UP(div_h, 4);
+		div_h = DIV_ROUND_UP(div_h, 2) - FILTER_DELAY;
+	} else {
+	/* According to I2C-BUS Spec 2.1, in FAST-MODE, the minimum LOW period is 1.3uS, and
+	 * minimum HIGH is least 0.6us.
+	 * For 400000 freq, the period is 2.5us. To keep within the specs, give 40% of period to
+	 * HIGH and 60% to LOW. This means HIGH at 1.0us and LOW 1.5us.
+	 * The same applies for Fast-mode plus, where LOW is 0.5us and HIGH is 0.26us.
+	 * Duty = H/(H + L) = 2/5
+	 */
+		div_h = DIV_ROUND_UP(clk_rate * 2, freq * 5) - FILTER_DELAY;
+		div_l = DIV_ROUND_UP(clk_rate * 3, freq * 5 * 2);
+	}
 
 	/* clock divider has 12 bits */
-	if (div > GENMASK(11, 0)) {
+	if (div_h > GENMASK(11, 0)) {
 		dev_err(i2c->dev, "requested bus frequency too low\n");
-		div = GENMASK(11, 0);
+		div_h = GENMASK(11, 0);
+	}
+	if (div_l > GENMASK(11, 0)) {
+		dev_err(i2c->dev, "requested bus frequency too low\n");
+		div_l = GENMASK(11, 0);
 	}
 
 	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
-			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div & GENMASK(9, 0)));
+			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div_h & GENMASK(9, 0)));
 
 	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
-			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div >> 10));
+			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div_h >> 10));
+
+
+	/* set SCL low delay */
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_MASK,
+			   (div_l << REG_SLV_SCL_LOW_SHIFT) & REG_SLV_SCL_LOW_MASK);
 
-	/* Disable HIGH/LOW mode */
-	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
+	/* Enable HIGH/LOW mode */
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, REG_SLV_SCL_LOW_EN);
 
-	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, div %u\n", __func__,
-		clk_rate, freq, div);
+	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, divh %u, divl %u\n", __func__,
+		clk_rate, freq, div_h, div_l);
 }
 
 static void meson_i2c_get_data(struct meson_i2c *i2c, char *buf, int len)
-- 
2.35.1

