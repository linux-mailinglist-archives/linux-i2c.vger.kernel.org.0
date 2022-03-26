Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3FC4E805B
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Mar 2022 11:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbiCZKYM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Mar 2022 06:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiCZKYL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 26 Mar 2022 06:24:11 -0400
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55EC16BCE1;
        Sat, 26 Mar 2022 03:22:34 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id r7so12703268wrc.0;
        Sat, 26 Mar 2022 03:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d+exwJ0T4eZrE1LWR6DE1MTkGjxyaQIeoK3XOhyJ12M=;
        b=ysJMkRe6vxrffzviIPz7xoe6m/Ym1c7TVEE3+SQrONxnP9SfUMUrHT7ptOqJhCsNMp
         qjvAyU+23NbqMsOOqy2P0rmgRKKKF5oBB0xa7o5/Mo6T0QLWgvhoEBkyx3WACqbLctHp
         xlCZfTKY0RToe18jrYpQoSP/Ydsd/+noNRR529AXXKjZ3LvFg4G40SGOFmnlLLnDPmom
         WU4TPBla4mciMhf/2gwUWHGBl5nEDTfKsc/zqsrcr+FE+a0akLAPiIvE/6if3TwoUzWb
         yFyXUBCtAzShp/qB0hgmTCm5DUtzsFJ9n5QNkcDLtjvcrTeBbS0oHlAzCjMtcu22PMT/
         GdoQ==
X-Gm-Message-State: AOAM533/j29+RXrYDKpEIM3cr4rM829LHH3odNsL+rglcw+Y9Kjbo1lc
        IL689yrJzmKnvUrxYVHxSN8=
X-Google-Smtp-Source: ABdhPJxjN3JLIoXXR3q/9N1jVkloOzSFrQ58HCAROOXM2sTHmSipHOsc3L1UIedgnQdK9jCOApCV6A==
X-Received: by 2002:adf:bc0b:0:b0:203:e55c:c793 with SMTP id s11-20020adfbc0b000000b00203e55cc793mr12560145wrg.693.1648290153514;
        Sat, 26 Mar 2022 03:22:33 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.googlemail.com with ESMTPSA id l15-20020a05600c1d0f00b0038c8ff8e708sm6683057wms.13.2022.03.26.03.22.32
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
Subject: [PATCH 1/3] i2c: meson: Use _SHIFT and _MASK for register definitions
Date:   Sat, 26 Mar 2022 10:22:27 +0000
Message-Id: <20220326102229.421718-2-tanure@linux.com>
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

Differentiate between masks and shifts

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/i2c/busses/i2c-meson.c | 41 ++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 07eb819072c4..4b4a5b2d77ab 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -30,18 +30,21 @@
 #define REG_TOK_RDATA1		0x1c
 
 /* Control register fields */
-#define REG_CTRL_START		BIT(0)
-#define REG_CTRL_ACK_IGNORE	BIT(1)
-#define REG_CTRL_STATUS		BIT(2)
-#define REG_CTRL_ERROR		BIT(3)
-#define REG_CTRL_CLKDIV		GENMASK(21, 12)
-#define REG_CTRL_CLKDIVEXT	GENMASK(29, 28)
-
-#define REG_SLV_ADDR		GENMASK(7, 0)
-#define REG_SLV_SDA_FILTER	GENMASK(10, 8)
-#define REG_SLV_SCL_FILTER	GENMASK(13, 11)
-#define REG_SLV_SCL_LOW		GENMASK(27, 16)
-#define REG_SLV_SCL_LOW_EN	BIT(28)
+#define REG_CTRL_START			BIT(0)
+#define REG_CTRL_ACK_IGNORE		BIT(1)
+#define REG_CTRL_STATUS			BIT(2)
+#define REG_CTRL_ERROR			BIT(3)
+#define REG_CTRL_CLKDIV_SHIFT		12
+#define REG_CTRL_CLKDIV_MASK		GENMASK(21, REG_CTRL_CLKDIV_SHIFT)
+#define REG_CTRL_CLKDIVEXT_SHIFT	28
+#define REG_CTRL_CLKDIVEXT_MASK		GENMASK(29, REG_CTRL_CLKDIVEXT_SHIFT)
+
+#define REG_SLV_ADDR_MASK		GENMASK(7, 0)
+#define REG_SLV_SDA_FILTER_MASK		GENMASK(10, 8)
+#define REG_SLV_SCL_FILTER_MASK		GENMASK(13, 11)
+#define REG_SLV_SCL_LOW_SHIFT		16
+#define REG_SLV_SCL_LOW_MASK		GENMASK(27, REG_SLV_SCL_LOW_SHIFT)
+#define REG_SLV_SCL_LOW_EN		BIT(28)
 
 #define I2C_TIMEOUT_MS		500
 #define FILTER_DELAY		15
@@ -149,11 +152,11 @@ static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
 		div = GENMASK(11, 0);
 	}
 
-	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV,
-			   FIELD_PREP(REG_CTRL_CLKDIV, div & GENMASK(9, 0)));
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
+			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div & GENMASK(9, 0)));
 
-	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT,
-			   FIELD_PREP(REG_CTRL_CLKDIVEXT, div >> 10));
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
+			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div >> 10));
 
 	/* Disable HIGH/LOW mode */
 	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
@@ -292,8 +295,8 @@ static void meson_i2c_do_start(struct meson_i2c *i2c, struct i2c_msg *msg)
 		TOKEN_SLAVE_ADDR_WRITE;
 
 
-	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_ADDR,
-			   FIELD_PREP(REG_SLV_ADDR, msg->addr << 1));
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_ADDR_MASK,
+			   FIELD_PREP(REG_SLV_ADDR_MASK, msg->addr << 1));
 
 	meson_i2c_add_token(i2c, TOKEN_START);
 	meson_i2c_add_token(i2c, token);
@@ -467,7 +470,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
 
 	/* Disable filtering */
 	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
-			   REG_SLV_SDA_FILTER | REG_SLV_SCL_FILTER, 0);
+			   REG_SLV_SDA_FILTER_MASK | REG_SLV_SCL_FILTER_MASK, 0);
 
 	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
 
-- 
2.35.1

