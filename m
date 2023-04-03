Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C826D3E69
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 09:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbjDCHuF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 03:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjDCHuE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 03:50:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7E9525B;
        Mon,  3 Apr 2023 00:49:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 36279B81097;
        Mon,  3 Apr 2023 07:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA77AC433EF;
        Mon,  3 Apr 2023 07:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680508185;
        bh=6mVhMmgCEexVQis9i8ZyD12x70TPYyHdwAxpUEaYpxE=;
        h=From:To:Cc:Subject:Date:From;
        b=OcRmbfJDmRGAULuMFh2hCZNNXlsWpbyKkVGQpqcvVxW5+T9isUX1vJ2ru4ORrCzXr
         UR9oxZRp/Z1PPcxn8b20CE8OMVJEX+1Uuwnq8lWnrYLRdZF04Kd0hv8VCi5ZO7iXEw
         o2zsq/g6kDc3W+S37H1ZxQqcJZj4Y7nnN56yPxFbjtNtD1/D4lI3nPftq6N2LskgID
         +GMLbreQJvA87H81QwxC6g8JcpsOq9AZgaudl5vMwIzef5i7Kl0fbm3VHSRpLTfxF9
         OUyrCiRlqzt2oSRjm9/OnjDbCvrXHWYEyAPHxNeHp9JCTzGvHgAESoHZkYX7RlUpYY
         84fqqV61cNtqg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Wolfram Sang <wsa@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: gxp: fix build failure without CONFIG_I2C_SLAVE
Date:   Mon,  3 Apr 2023 09:49:13 +0200
Message-Id: <20230403074939.3785593-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The gxp_i2c_slave_irq_handler() is hidden in an #ifdef, but the
caller uses an IS_ENABLED() check:

drivers/i2c/busses/i2c-gxp.c: In function 'gxp_i2c_irq_handler':
drivers/i2c/busses/i2c-gxp.c:467:29: error: implicit declaration of function 'gxp_i2c_slave_irq_handler'; did you mean 'gxp_i2c_irq_handler'? [-Werror=implicit-function-declaration]

It has to consistently use one method or the other to avoid warnings,
so move to IS_ENABLED() here for readability and build coverage, and
move the #ifdef in linux/i2c.h to allow building it as dead code.

Fixes: 4a55ed6f89f5 ("i2c: Add GXP SoC I2C Controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/i2c-gxp.c | 2 --
 include/linux/i2c.h          | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gxp.c b/drivers/i2c/busses/i2c-gxp.c
index d4b55d989a26..8ea3fb5e4c7f 100644
--- a/drivers/i2c/busses/i2c-gxp.c
+++ b/drivers/i2c/busses/i2c-gxp.c
@@ -353,7 +353,6 @@ static void gxp_i2c_chk_data_ack(struct gxp_i2c_drvdata *drvdata)
 	writew(value, drvdata->base + GXP_I2CMCMD);
 }
 
-#if IS_ENABLED(CONFIG_I2C_SLAVE)
 static bool gxp_i2c_slave_irq_handler(struct gxp_i2c_drvdata *drvdata)
 {
 	u8 value;
@@ -437,7 +436,6 @@ static bool gxp_i2c_slave_irq_handler(struct gxp_i2c_drvdata *drvdata)
 
 	return true;
 }
-#endif
 
 static irqreturn_t gxp_i2c_irq_handler(int irq, void *_drvdata)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 5ba89663ea86..13a1ce38cb0c 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -385,7 +385,6 @@ static inline void i2c_set_clientdata(struct i2c_client *client, void *data)
 
 /* I2C slave support */
 
-#if IS_ENABLED(CONFIG_I2C_SLAVE)
 enum i2c_slave_event {
 	I2C_SLAVE_READ_REQUESTED,
 	I2C_SLAVE_WRITE_REQUESTED,
@@ -396,9 +395,10 @@ enum i2c_slave_event {
 
 int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb);
 int i2c_slave_unregister(struct i2c_client *client);
-bool i2c_detect_slave_mode(struct device *dev);
 int i2c_slave_event(struct i2c_client *client,
 		    enum i2c_slave_event event, u8 *val);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+bool i2c_detect_slave_mode(struct device *dev);
 #else
 static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
 #endif
-- 
2.39.2

