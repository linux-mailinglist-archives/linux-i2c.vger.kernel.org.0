Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7D54FA9AA
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Apr 2022 18:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242726AbiDIQpr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Apr 2022 12:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235674AbiDIQpq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Apr 2022 12:45:46 -0400
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B533EBB0;
        Sat,  9 Apr 2022 09:43:38 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id l26so22978428ejx.1;
        Sat, 09 Apr 2022 09:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d+exwJ0T4eZrE1LWR6DE1MTkGjxyaQIeoK3XOhyJ12M=;
        b=OqSIh93G9DNJOQbPh1xrCDYcpG/fkyYc2ItfnIAk+n5S9X/cbuzRfC3wz0ATRPQzYj
         n5LwL6OkRvm2PCpkW7JHV+GhX5q/46ScxHzTLqb2AajEDU06twQxEcOogusspb3xgCqq
         VJ0yyTuue/4xWU7GDPWT5u/PXpOpsOBshaxqjeaPncpkox+/7DfY68AR6104cZ67doqu
         dsCeYQA9AHtq/S7lOjfBPSd6yZ5L1+L9Ii4FP6khkgLvEBFZ0F9VOi5rclXd243amS5d
         izcS0n9aD7w/yUBIo770kVjA3NUKWrAhRXoj6+cvE3Qd29FuJMmwYxbp1NCglIXQWTmL
         ztmQ==
X-Gm-Message-State: AOAM530ND+ZrcM5T2t2MzlqCLrmMo6AfjsMZGaC4MR28ZSYgl+gfODnn
        DjE3eOHoSopzEc47KUf6JuU=
X-Google-Smtp-Source: ABdhPJyiRAweB9lGGmp676jc9QHrR6tyx2oWTVWbbwwff6bmFc/Wf12ctbDUUNLbEXFZjid6hvpGGA==
X-Received: by 2002:a17:907:6ea1:b0:6d6:f910:5141 with SMTP id sh33-20020a1709076ea100b006d6f9105141mr23393903ejc.123.1649522617393;
        Sat, 09 Apr 2022 09:43:37 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.googlemail.com with ESMTPSA id hu8-20020a170907a08800b006dfd2056ab2sm9893735ejc.97.2022.04.09.09.43.36
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
Subject: [PATCH v2 1/2] i2c: meson: Use _SHIFT and _MASK for register definitions
Date:   Sat,  9 Apr 2022 17:43:33 +0100
Message-Id: <20220409164334.157664-2-tanure@linux.com>
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

