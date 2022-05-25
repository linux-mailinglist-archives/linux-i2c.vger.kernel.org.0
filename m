Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 324E85335BB
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 05:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243527AbiEYDYm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 May 2022 23:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242864AbiEYDYh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 May 2022 23:24:37 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A87471DA8;
        Tue, 24 May 2022 20:24:26 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y1so2081462pfr.6;
        Tue, 24 May 2022 20:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NK0b08wKodTidGQbJ6ZwixKVSwwf1GDBnVR4pQHKSOM=;
        b=ZNb5OBFWkdlzavtDQbaXzKhfGhiojpEdFaXBJ6LVM1bMxooZmZvyTqSPrYrb0Qh+TH
         IDAH0t7FUlbcHYve9GhLhOTHqQaXlgJhgQwrk2zjoxrzC4IHqrXfVio77Vrpuj9wvJPL
         UNk3RMKhCfpfzQaTmsD469ozLhT4hYQznyVuHTk/CsZxSm1magE2nOKBf8uIlDbkBvoD
         KeWNsW4PRHIhd4RRMfyF4LeCEmgtM4QBex6amk/Ax41Z9+Fpsqz2Fq2DIgwxzXKW44Mk
         GU8YrvCexQ0z2tvGC/gAkku8MJTDlHzHeoq+0SGLQQLDRHUac5eK0SfDmetwBmrdQc62
         muQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NK0b08wKodTidGQbJ6ZwixKVSwwf1GDBnVR4pQHKSOM=;
        b=nXYNJM9/28cioPiI+OT4yeubHkHtWlrqaxqCql0LZmaoTpHOpNY5c50mHNueoF5BxR
         VGH2D/Qlk563QxUvMtYh5m83oI4WC7PzTpLbebHIvf2D95x4uLFvz7HVlnSlbNK2wSNd
         nFaw2wkX+oiuK12I+E5jBCvvELNa8O5VNhmRo5scpL29XxaQhzmy2pcIS4mF7QtkGedO
         RDt77bwnP8v+KZWm2sOYqSLpMlFzr6w7OF9EOUVhLXiSVO7ZlBTevYkWd8K9dMnFfPNX
         /UjOBNkpx13inuXuFvd7lCVaBpdldRbSqDiLzkxZE2qVZKDA7kqMFhPTfiCQgNipG66s
         Q3Qw==
X-Gm-Message-State: AOAM531wT6rkhqSGOXjbasUSG4wQX/WEOwdd58GJugjk87EVH/q64Ofo
        yM/grI4qXCYJ5clKI2Iicw==
X-Google-Smtp-Source: ABdhPJxV22rPnTpeEJI47XYFMMdxEpkOc4Zu6BY3qj12o/0OYPLWPEsrUzcR9a7YgCbueyIKAHz/Lg==
X-Received: by 2002:aa7:9819:0:b0:518:4654:cf68 with SMTP id e25-20020aa79819000000b005184654cf68mr28288713pfl.28.1653449065644;
        Tue, 24 May 2022 20:24:25 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net. [220.133.130.217])
        by smtp.gmail.com with ESMTPSA id c2-20020a170902848200b00161996b9a66sm7969391plo.233.2022.05.24.20.24.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 May 2022 20:24:25 -0700 (PDT)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        jie.deng@intel.com, jsd@semihalf.com, sven@svenpeter.dev,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/5] i2c: npcm: Capitalize the one-line comment
Date:   Wed, 25 May 2022 11:23:41 +0800
Message-Id: <20220525032341.3182-6-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220525032341.3182-1-warp5tw@gmail.com>
References: <20220525032341.3182-1-warp5tw@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tyrone Ting <kfting@nuvoton.com>

Make the one-line comments capital in the driver to get the comment style
consistent.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 86fd942ea648..7d863edc14e4 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -680,7 +680,7 @@ static void npcm_i2c_reset(struct npcm_i2c *bus)
 	}
 #endif
 
-	/* clear status bits for spurious interrupts */
+	/* Clear status bits for spurious interrupts */
 	npcm_i2c_clear_master_status(bus);
 
 	bus->state = I2C_IDLE;
@@ -1252,7 +1252,7 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
 	} /* SDAST */
 
 	/*
-	 * if irq is not one of the above, make sure EOB is disabled and all
+	 * If irq is not one of the above, make sure EOB is disabled and all
 	 * status bits are cleared.
 	 */
 	if (ret == IRQ_NONE) {
@@ -1506,7 +1506,7 @@ static void npcm_i2c_irq_handle_nack(struct npcm_i2c *bus)
 		npcm_i2c_clear_master_status(bus);
 		readx_poll_timeout_atomic(ioread8, bus->reg + NPCM_I2CCST, val,
 					  !(val & NPCM_I2CCST_BUSY), 10, 200);
-		/* verify no status bits are still set after bus is released */
+		/* Verify no status bits are still set after bus is released */
 		npcm_i2c_clear_master_status(bus);
 	}
 	bus->state = I2C_IDLE;
@@ -1974,7 +1974,7 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	npcm_i2c_reset(bus);
 
-	/* check HW is OK: SDA and SCL should be high at this point. */
+	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
 		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
 		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
@@ -2034,7 +2034,7 @@ static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
 			return IRQ_HANDLED;
 	}
 #endif
-	/* clear status bits for spurious interrupts */
+	/* Clear status bits for spurious interrupts */
 	npcm_i2c_clear_master_status(bus);
 
 	return IRQ_HANDLED;
@@ -2216,7 +2216,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		 (bus->data->rxf_ctl_last_pec & ioread8(bus->reg + NPCM_I2CRXF_CTL)))
 		npcm_i2c_reset(bus);
 
-	/* after any xfer, successful or not, stall and EOB must be disabled */
+	/* After any xfer, successful or not, stall and EOB must be disabled */
 	npcm_i2c_stall_after_start(bus, false);
 	npcm_i2c_eob_int(bus, false);
 
-- 
2.17.1

