Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26C874FA9AC
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Apr 2022 18:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242754AbiDIQpt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Apr 2022 12:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242736AbiDIQps (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Apr 2022 12:45:48 -0400
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D280F424AB;
        Sat,  9 Apr 2022 09:43:39 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id l26so22978479ejx.1;
        Sat, 09 Apr 2022 09:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tAZvsU5nlu0FKdd+G9qXCM7NYkg4H55ZT6LFNEgv3RI=;
        b=SxjvhvcXFeMJHVy1Qz8DApDZel4hrTMD7nJspdmbD4zBLaMK1K7NiZUt1d9odGBTyd
         VGsx/zXEjDLsVZWlAUfjTDzVGP78RO2vvuQCOThm+AG2AqHSuGzSNyvqdBJRxOGA5Bj2
         wCHbQL5akLeJYc+iaboEkRt9rS7OnWszpR1T2gVAMxnx9IAkhh10bIJO+9GMqkd/RpGD
         Zmi7DoiZJisT4FohnazvYN/qx30zvXNahh48xOW/FMh4U1leQ8MXqcSyRY4KzzEwjmNU
         KjhEpMYZ9K/sz0TYryylKHGwJBWoyuILNid3cv/qwdll4l7DaUm9xRaxFca1mpIxmnQY
         x2Kw==
X-Gm-Message-State: AOAM5330Dcpq8M96rkaQXMkDBdf7OSoOO/SYzOm0lAzqYiKsAck6y69j
        hyXr17uCCADXIw88AEezOHQ=
X-Google-Smtp-Source: ABdhPJwKRHXA6qAgKaGLSsVhLM5Gp+zrWPdyoW27bFbY+D9wpStbVWJl5x0brNlf44SvE6zwahQuNw==
X-Received: by 2002:a17:907:86a3:b0:6da:870c:af44 with SMTP id qa35-20020a17090786a300b006da870caf44mr22664327ejc.445.1649522618211;
        Sat, 09 Apr 2022 09:43:38 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.googlemail.com with ESMTPSA id hu8-20020a170907a08800b006dfd2056ab2sm9893735ejc.97.2022.04.09.09.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 09:43:37 -0700 (PDT)
From:   Lucas Tanure <tanure@linux.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lucas Tanure <tanure@linux.com>
Subject: [PATCH v2 2/2] i2c: meson: Use 50% duty cycle for I2C clock
Date:   Sat,  9 Apr 2022 17:43:34 +0100
Message-Id: <20220409164334.157664-3-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409164334.157664-1-tanure@linux.com>
References: <20220409164334.157664-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
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
 drivers/i2c/busses/i2c-meson.c | 70 +++++++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 4b4a5b2d77ab..50dab123380a 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -65,10 +65,6 @@ enum {
 	STATE_WRITE,
 };
 
-struct meson_i2c_data {
-	unsigned char div_factor;
-};
-
 /**
  * struct meson_i2c - Meson I2C device private data
  *
@@ -109,6 +105,10 @@ struct meson_i2c {
 	const struct meson_i2c_data *data;
 };
 
+struct meson_i2c_data {
+	void (*set_clk_div)(struct meson_i2c *i2c, unsigned int freq);
+};
+
 static void meson_i2c_set_mask(struct meson_i2c *i2c, int reg, u32 mask,
 			       u32 val)
 {
@@ -137,14 +137,62 @@ static void meson_i2c_add_token(struct meson_i2c *i2c, int token)
 	i2c->num_tokens++;
 }
 
-static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
+static void meson_gxbb_axg_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
+{
+	unsigned long clk_rate = clk_get_rate(i2c->clk);
+	unsigned int div_h, div_l;
+
+	/* According to I2C-BUS Spec 2.1, in FAST-MODE, the minimum LOW period is 1.3uS, and
+	 * minimum HIGH is least 0.6us.
+	 * For 400000 freq, the period is 2.5us. To keep within the specs, give 40% of period to
+	 * HIGH and 60% to LOW. This means HIGH at 1.0us and LOW 1.5us.
+	 * The same applies for Fast-mode plus, where LOW is 0.5us and HIGH is 0.26us.
+	 * Duty = H/(H + L) = 2/5
+	 */
+	if (freq <= I2C_MAX_STANDARD_MODE_FREQ) {
+		div_h = DIV_ROUND_UP(clk_rate, freq);
+		div_l = DIV_ROUND_UP(div_h, 4);
+		div_h = DIV_ROUND_UP(div_h, 2) - FILTER_DELAY;
+	} else {
+		div_h = DIV_ROUND_UP(clk_rate * 2, freq * 5) - FILTER_DELAY;
+		div_l = DIV_ROUND_UP(clk_rate * 3, freq * 5 * 2);
+	}
+
+	/* clock divider has 12 bits */
+	if (div_h > GENMASK(11, 0)) {
+		dev_err(i2c->dev, "requested bus frequency too low\n");
+		div_h = GENMASK(11, 0);
+	}
+	if (div_l > GENMASK(11, 0)) {
+		dev_err(i2c->dev, "requested bus frequency too low\n");
+		div_l = GENMASK(11, 0);
+	}
+
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
+			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div_h & GENMASK(9, 0)));
+
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
+			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div_h >> 10));
+
+	/* set SCL low delay */
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_MASK,
+			   FIELD_PREP(REG_SLV_SCL_LOW_MASK, div_l));
+
+	/* Enable HIGH/LOW mode */
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, REG_SLV_SCL_LOW_EN);
+
+	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, divh %u, divl %u\n", __func__,
+		clk_rate, freq, div_h, div_l);
+}
+
+static void meson6_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
 {
 	unsigned long clk_rate = clk_get_rate(i2c->clk);
 	unsigned int div;
 
 	div = DIV_ROUND_UP(clk_rate, freq);
 	div -= FILTER_DELAY;
-	div = DIV_ROUND_UP(div, i2c->data->div_factor);
+	div = DIV_ROUND_UP(div, 4);
 
 	/* clock divider has 12 bits */
 	if (div > GENMASK(11, 0)) {
@@ -472,7 +520,9 @@ static int meson_i2c_probe(struct platform_device *pdev)
 	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
 			   REG_SLV_SDA_FILTER_MASK | REG_SLV_SCL_FILTER_MASK, 0);
 
-	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
+	if (!i2c->data->set_clk_div)
+		return -EINVAL;
+	i2c->data->set_clk_div(i2c, timings.bus_freq_hz);
 
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0) {
@@ -494,15 +544,15 @@ static int meson_i2c_remove(struct platform_device *pdev)
 }
 
 static const struct meson_i2c_data i2c_meson6_data = {
-	.div_factor = 4,
+	.set_clk_div = meson6_i2c_set_clk_div,
 };
 
 static const struct meson_i2c_data i2c_gxbb_data = {
-	.div_factor = 4,
+	.set_clk_div = meson_gxbb_axg_i2c_set_clk_div,
 };
 
 static const struct meson_i2c_data i2c_axg_data = {
-	.div_factor = 3,
+	.set_clk_div = meson_gxbb_axg_i2c_set_clk_div,
 };
 
 static const struct of_device_id meson_i2c_match[] = {
-- 
2.35.1

