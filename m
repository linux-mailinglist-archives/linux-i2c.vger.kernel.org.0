Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6DB64AB542
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 07:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbiBGGy7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 01:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241814AbiBGGd6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 01:33:58 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5577C043184;
        Sun,  6 Feb 2022 22:33:57 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id i30so11299800pfk.8;
        Sun, 06 Feb 2022 22:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qlN75CsLXoZ8b2tnKBNp17X1wC9KO37usZLYNCoKx88=;
        b=gAMQM2ZZDEBpY9C97KfQaZ5RtMwvF8HhABYLHimmnFQ8YTY1/NX2bcxmcJuRlBiLoS
         bvl9ITfB4v5f+CJenqN8XIByNBVfgBEEv+v4kDdw3qm4EV9TsSAn8pQpPRuG/1i4Uz/9
         g8MibHIiM9DSN5Srr79pVTH9b53s2iXNQBWfjfwL3DZWmel9vg1rw39u843caqSY4nve
         uliOaCpQbDyXFIEWzjxAt/7Vc0fXVfSxkY2FysZX+lB2VoGzbItNscVigCEJW+9UQfhV
         4bmIsFQEorLN3l5gA7CmIFpCE2AF82WF1LqhV0FxjrRNI9w+wgI/zLFMCgzJCCk3SqV8
         Wl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qlN75CsLXoZ8b2tnKBNp17X1wC9KO37usZLYNCoKx88=;
        b=ahJQTp/BG8x5eN6jOpvJ9nTkdDMTyTCg5ggRxruWUmiw1GmppLtcMLhy7dladHU5qF
         tc3g4qmuXVEE+hLQvCBskKYUyZBTqDVsbavAtTCqgqiH/mAZhBStkcYnHQFjrSbweG00
         qzOTpZXPXjl74QLDlrWv4V7Lat6ghgfATYGOe/9f7CIMTRdkAGUErxxT36MLSvLynDWJ
         UJflXMchcyC+/eB+b8xPofI2R/prkYEJBbCgTIMhlqumebXAJQVt9hIpi7G4rkgewr+x
         pIC2q9yBkXU0toE929F+V53irNVi+MewWvW292vDSlvHpRnDTEg7cl2pVqocmGYQJmqP
         9eIg==
X-Gm-Message-State: AOAM533uRwe6P8OxFXu+YodwsFrmCW2dU8KLe5pQ38433ae/ouT05UAV
        NQQqtpy5vpzle7AQE4isHBy/i+LzYs0crno=
X-Google-Smtp-Source: ABdhPJwVu/dblxj+rjmT9D41ENsuEDMzdHSjCqqnU9RJZ1n2ONjWs+Q1nr5jf53P79BDwaYF5VlkAw==
X-Received: by 2002:aa7:8490:: with SMTP id u16mr14254701pfn.1.1644215637318;
        Sun, 06 Feb 2022 22:33:57 -0800 (PST)
Received: from localhost ([2401:e180:8894:9737:7848:1ec7:b697:7d50])
        by smtp.gmail.com with ESMTPSA id 204sm10654051pfu.91.2022.02.06.22.33.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Feb 2022 22:33:57 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/6] i2c: npcm: Handle spurious interrupts
Date:   Mon,  7 Feb 2022 14:33:36 +0800
Message-Id: <20220207063338.6570-5-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220207063338.6570-1-warp5tw@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tali Perry <tali.perry1@gmail.com>

In order to better handle spurious interrupts:
1. Disable incoming interrupts in master only mode.
2. Clear EOB after every interrupt.
3. Return correct status during interrupt.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 96 +++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 5c22e69afe34..1ddf309b91a3 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -360,14 +360,14 @@ static int npcm_i2c_get_SCL(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
@@ -564,6 +564,15 @@ static inline void npcm_i2c_nack(struct npcm_i2c *bus)
 	iowrite8(val, bus->reg + NPCM_I2CCTL1);
 }
 
+static inline void npcm_i2c_clear_master_status(struct npcm_i2c *bus)
+{
+	u8 val;
+
+	/* Clear NEGACK, STASTR and BER bits */
+	val = NPCM_I2CST_BER | NPCM_I2CST_NEGACK | NPCM_I2CST_STASTR;
+	iowrite8(val, bus->reg + NPCM_I2CST);
+}
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 static void npcm_i2c_slave_int_enable(struct npcm_i2c *bus, bool enable)
 {
@@ -643,8 +652,8 @@ static void npcm_i2c_reset(struct npcm_i2c *bus)
 	iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 	iowrite8(0xFF, bus->reg + NPCM_I2CST);
 
-	/* Clear EOB bit */
-	iowrite8(NPCM_I2CCST3_EO_BUSY, bus->reg + NPCM_I2CCST3);
+	/* Clear and disable EOB */
+	npcm_i2c_eob_int(bus, false);
 
 	/* Clear all fifo bits: */
 	iowrite8(NPCM_I2CFIF_CTS_CLR_FIFO, bus->reg + NPCM_I2CFIF_CTS);
@@ -656,6 +665,9 @@ static void npcm_i2c_reset(struct npcm_i2c *bus)
 	}
 #endif
 
+	/* clear status bits for spurious interrupts */
+	npcm_i2c_clear_master_status(bus);
+
 	bus->state = I2C_IDLE;
 }
 
@@ -818,15 +830,6 @@ static void npcm_i2c_read_fifo(struct npcm_i2c *bus, u8 bytes_in_fifo)
 	}
 }
 
-static inline void npcm_i2c_clear_master_status(struct npcm_i2c *bus)
-{
-	u8 val;
-
-	/* Clear NEGACK, STASTR and BER bits */
-	val = NPCM_I2CST_BER | NPCM_I2CST_NEGACK | NPCM_I2CST_STASTR;
-	iowrite8(val, bus->reg + NPCM_I2CST);
-}
-
 static void npcm_i2c_master_abort(struct npcm_i2c *bus)
 {
 	/* Only current master is allowed to issue a stop condition */
@@ -1234,7 +1237,16 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
 		ret = IRQ_HANDLED;
 	} /* SDAST */
 
-	return ret;
+	/*
+	 * if irq is not one of the above, make sure EOB is disabled and all
+	 * status bits are cleared.
+	 */
+	if (ret == IRQ_NONE) {
+		npcm_i2c_eob_int(bus, false);
+		npcm_i2c_clear_master_status(bus);
+	}
+
+	return IRQ_HANDLED;
 }
 
 static int npcm_i2c_reg_slave(struct i2c_client *client)
@@ -1470,6 +1482,9 @@ static void npcm_i2c_irq_handle_nack(struct npcm_i2c *bus)
 		npcm_i2c_eob_int(bus, false);
 		npcm_i2c_master_stop(bus);
 
+		/* Clear SDA Status bit (by reading dummy byte) */
+		npcm_i2c_rd_byte(bus);
+
 		/*
 		 * The bus is released from stall only after the SW clears
 		 * NEGACK bit. Then a Stop condition is sent.
@@ -1477,6 +1492,8 @@ static void npcm_i2c_irq_handle_nack(struct npcm_i2c *bus)
 		npcm_i2c_clear_master_status(bus);
 		readx_poll_timeout_atomic(ioread8, bus->reg + NPCM_I2CCST, val,
 					  !(val & NPCM_I2CCST_BUSY), 10, 200);
+		/* verify no status bits are still set after bus is released */
+		npcm_i2c_clear_master_status(bus);
 	}
 	bus->state = I2C_IDLE;
 
@@ -1675,10 +1692,10 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 	int              iter = 27;
 
 	if ((npcm_i2c_get_SDA(_adap) == 1) && (npcm_i2c_get_SCL(_adap) == 1)) {
-		dev_dbg(bus->dev, "bus%d recovery skipped, bus not stuck",
-			bus->num);
+		dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not stuck",
+			bus->num, bus->dest_addr);
 		npcm_i2c_reset(bus);
-		return status;
+		return 0;
 	}
 
 	npcm_i2c_int_enable(bus, false);
@@ -1912,6 +1929,7 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 	    bus_freq_hz < I2C_FREQ_MIN_HZ || bus_freq_hz > I2C_FREQ_MAX_HZ)
 		return -EINVAL;
 
+	npcm_i2c_int_enable(bus, false);
 	npcm_i2c_disable(bus);
 
 	/* Configure FIFO mode : */
@@ -1940,10 +1958,18 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 	val = (val | NPCM_I2CCTL1_NMINTE) & ~NPCM_I2CCTL1_RWS;
 	iowrite8(val, bus->reg + NPCM_I2CCTL1);
 
-	npcm_i2c_int_enable(bus, true);
-
 	npcm_i2c_reset(bus);
 
+	/* check HW is OK: SDA and SCL should be high at this point. */
+	if ((npcm_i2c_get_SDA(&bus->adap) == 0) ||
+	    (npcm_i2c_get_SCL(&bus->adap) == 0)) {
+		dev_err(bus->dev, "I2C%d init fail: lines are low", bus->num);
+		dev_err(bus->dev, "SDA=%d SCL=%d", npcm_i2c_get_SDA(&bus->adap),
+			npcm_i2c_get_SCL(&bus->adap));
+		return -ENXIO;
+	}
+
+	npcm_i2c_int_enable(bus, true);
 	return 0;
 }
 
@@ -1991,10 +2017,14 @@ static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	if (bus->slave) {
 		bus->master_or_slave = I2C_SLAVE;
-		return npcm_i2c_int_slave_handler(bus);
+		if (npcm_i2c_int_slave_handler(bus))
+			return IRQ_HANDLED;
 	}
 #endif
-	return IRQ_NONE;
+	/* clear status bits for spurious interrupts */
+	npcm_i2c_clear_master_status(bus);
+
+	return IRQ_HANDLED;
 }
 
 static bool npcm_i2c_master_start_xmit(struct npcm_i2c *bus,
@@ -2051,7 +2081,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	u8 *write_data, *read_data;
 	u8 slave_addr;
 	unsigned long timeout;
-	int ret = 0;
 	bool read_block = false;
 	bool read_PEC = false;
 	u8 bus_busy;
@@ -2141,12 +2170,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	bus->read_block_use = read_block;
 
 	reinit_completion(&bus->cmd_complete);
-	if (!npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
-					write_data, read_data, read_PEC,
-					read_block))
-		ret = -EBUSY;
 
-	if (ret != -EBUSY) {
+	npcm_i2c_int_enable(bus, true);
+
+	if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
+				       write_data, read_data, read_PEC,
+				       read_block)) {
 		time_left = wait_for_completion_timeout(&bus->cmd_complete,
 							timeout);
 
@@ -2160,26 +2189,31 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			}
 		}
 	}
-	ret = bus->cmd_err;
 
 	/* if there was BER, check if need to recover the bus: */
 	if (bus->cmd_err == -EAGAIN)
-		ret = i2c_recover_bus(adap);
+		bus->cmd_err = i2c_recover_bus(adap);
 
 	/*
 	 * After any type of error, check if LAST bit is still set,
 	 * due to a HW issue.
 	 * It cannot be cleared without resetting the module.
 	 */
-	if (bus->cmd_err &&
-	    (NPCM_I2CRXF_CTL_LAST_PEC & ioread8(bus->reg + NPCM_I2CRXF_CTL)))
+	else if (bus->cmd_err &&
+		 (NPCM_I2CRXF_CTL_LAST_PEC & ioread8(bus->reg + NPCM_I2CRXF_CTL)))
 		npcm_i2c_reset(bus);
 
+	/* after any xfer, successful or not, stall and EOB must be disabled */
+	npcm_i2c_stall_after_start(bus, false);
+	npcm_i2c_eob_int(bus, false);
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	/* reenable slave if it was enabled */
 	if (bus->slave)
 		iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
 			 bus->reg + NPCM_I2CADDR1);
+#else
+	npcm_i2c_int_enable(bus, false);
 #endif
 	return bus->cmd_err;
 }
-- 
2.17.1

