Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53F19529F15
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 12:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344002AbiEQKOC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 06:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343920AbiEQKMy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 06:12:54 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194E21E3F1;
        Tue, 17 May 2022 03:12:14 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id l11so16505476pgt.13;
        Tue, 17 May 2022 03:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aMBOI9YkUSIsWIlQdfz41gQk4nmmHQa5UOI2C/hBUEU=;
        b=JtkF5r+oqYFZIyXuBu6cPFpvbyE/I3CGuS9xPWbrbxa9FneoN4paYaudwt+RBnSDrO
         5X/79Ll2Fd2qonqa1Ubkk8KYhES4DpT+4h84wXNtok9qDHh8bQu8GZSbIOvL4yA4wuf4
         OoJ8gGM4111xYPvCHRJnRsNHrbuYOHYiiktovHa3QNmVOx0c56bReuTjaCFxSWJkLFaD
         G1Gkdi3E26J5Zl/wYf34rDekFek+EXo83nUupgPXvRzI1k6OjJ9wD1T9y+3nQqjiGUAb
         4uNnjrVFNDHvhMoI50zu0hbHX+DAg2UNqiSbHC01MZi7lHk23i1hcVyFZN5sAgCCA5AH
         qk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aMBOI9YkUSIsWIlQdfz41gQk4nmmHQa5UOI2C/hBUEU=;
        b=EAVuv3wzqX7l8G0VremnzYv+q0Lg1a+TG2ujBRC9jjD7hzZPiYW6F1mwKQQT0OEKQr
         vEp2qsA6UhdA+6b6TKeFutuDx2td94Wx5HdI8vU54hqH06WPQ3Jk0vyr0SwpyovDYNBX
         uK+Shx2MvCBh95fKiq03Pt/BqDmmWFWwcynN7vFkMNtVZ6FMBKjnknEyyrD0N+3EKhx3
         Q30bRsz9PchwEhGng/XsLIXVZ6fLFxs63EPNmZwMncyAcjH30yqJ6saygrbhMltV7ELT
         2AW+oQHQGBN42N3OV7fiCt2u9Izfvaoutz1po6iDrD4C/DcbR0kqQdRv5xLBuhh1VKLf
         c5JQ==
X-Gm-Message-State: AOAM532DRtStbsEF95uY7bxMJaDobiYAww1cawUYsXyaj8fMVUBWpLZ4
        3z15DPWGg324gYW+9125qw==
X-Google-Smtp-Source: ABdhPJzTg9eea+BcxaCZFzMBUKvm4hvmH7A1NnWXwh2q1t9VyhA+uHTXLd3jc55tn++kghtu5gGqVQ==
X-Received: by 2002:a05:6a00:2408:b0:4f7:a8cb:9b63 with SMTP id z8-20020a056a00240800b004f7a8cb9b63mr21900585pfh.33.1652782333486;
        Tue, 17 May 2022 03:12:13 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net. [220.133.130.217])
        by smtp.gmail.com with ESMTPSA id z4-20020a62d104000000b0050dc7628184sm8751369pfg.94.2022.05.17.03.12.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 May 2022 03:12:13 -0700 (PDT)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        rafal@milecki.pl, sven@svenpeter.dev, jsd@semihalf.com,
        jie.deng@intel.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, warp5tw@gmail.com, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/10] i2c: npcm: Capitalize the one-line comment
Date:   Tue, 17 May 2022 18:11:42 +0800
Message-Id: <20220517101142.28421-11-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
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
index a032b407f104..a60e392dda50 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -683,7 +683,7 @@ static void npcm_i2c_reset(struct npcm_i2c *bus)
 	}
 #endif
 
-	/* clear status bits for spurious interrupts */
+	/* Clear status bits for spurious interrupts */
 	npcm_i2c_clear_master_status(bus);
 
 	bus->state = I2C_IDLE;
@@ -1255,7 +1255,7 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
 	} /* SDAST */
 
 	/*
-	 * if irq is not one of the above, make sure EOB is disabled and all
+	 * If irq is not one of the above, make sure EOB is disabled and all
 	 * status bits are cleared.
 	 */
 	if (ret == IRQ_NONE) {
@@ -1509,7 +1509,7 @@ static void npcm_i2c_irq_handle_nack(struct npcm_i2c *bus)
 		npcm_i2c_clear_master_status(bus);
 		readx_poll_timeout_atomic(ioread8, bus->reg + NPCM_I2CCST, val,
 					  !(val & NPCM_I2CCST_BUSY), 10, 200);
-		/* verify no status bits are still set after bus is released */
+		/* Verify no status bits are still set after bus is released */
 		npcm_i2c_clear_master_status(bus);
 	}
 	bus->state = I2C_IDLE;
@@ -1977,7 +1977,7 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	npcm_i2c_reset(bus);
 
-	/* check HW is OK: SDA and SCL should be high at this point. */
+	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
 		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
 		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
@@ -2037,7 +2037,7 @@ static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
 			return IRQ_HANDLED;
 	}
 #endif
-	/* clear status bits for spurious interrupts */
+	/* Clear status bits for spurious interrupts */
 	npcm_i2c_clear_master_status(bus);
 
 	return IRQ_HANDLED;
@@ -2219,7 +2219,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		 (bus->data->rxf_ctl_last_pec & ioread8(bus->reg + NPCM_I2CRXF_CTL)))
 		npcm_i2c_reset(bus);
 
-	/* after any xfer, successful or not, stall and EOB must be disabled */
+	/* After any xfer, successful or not, stall and EOB must be disabled */
 	npcm_i2c_stall_after_start(bus, false);
 	npcm_i2c_eob_int(bus, false);
 
-- 
2.17.1

