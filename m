Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB37732DD2
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 12:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344359AbjFPK16 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 06:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235162AbjFPK12 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 06:27:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131172D79;
        Fri, 16 Jun 2023 03:26:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B541635F7;
        Fri, 16 Jun 2023 10:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5EDC433C0;
        Fri, 16 Jun 2023 10:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686911163;
        bh=+Mljsuej5wv46TxjC+eGYKwSemJD87R+3PYWElssA4c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q1O7PQs30DXRo1m3U48SOQF/Fq4Sbr5pYpgfOTpJB0lCQXI2JmukUo6coe3trgWPm
         4sT4Phurt8TAORhpZjV49+LyiDw6UIuwi/AkQK5R/stWyP9LbU/llSmBYrVewaOiVj
         ITDmso/GzYX+2uSaZeM8iE5zyqAPHPhzN3+KQoQgOI4sKLBkxnC6tPrw8RlECS4phy
         U/jk57Gr41JlmwqG2SAgFYBmzfRLV5yGViSn6PayvB6vNfhWCt3isP6w9trN9PXzrw
         I7nwvLPHM3pWjLSL2FizMFaHtVZKWmOilTp8b8qixd7f94VsbLEkIjc3fTg0l2RhNO
         38fwoqbLeh4KQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     David Zheng <david.zheng@intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Sasha Levin <sashal@kernel.org>,
        andi.shyti@kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 20/30] i2c: designware: fix idx_write_cnt in read loop
Date:   Fri, 16 Jun 2023 06:25:08 -0400
Message-Id: <20230616102521.673087-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102521.673087-1-sashal@kernel.org>
References: <20230616102521.673087-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: David Zheng <david.zheng@intel.com>

[ Upstream commit 1acfc6e753ed978b36d722f54e57fe4d1e8a6ffa ]

With IC_INTR_RX_FULL slave interrupt handler reads data in a loop until
RX FIFO is empty. When testing with the slave-eeprom, each transaction
has 2 bytes for address/index and 1 byte for value, the address byte
can be written as data byte due to dropping STOP condition.

In the test below, the master continuously writes to the slave, first 2
bytes are index, 3rd byte is value and follow by a STOP condition.

 i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D1-D1]
 i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D2-D2]
 i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D3-D3]

Upon receiving STOP condition slave eeprom would reset `idx_write_cnt` so
next 2 bytes can be treated as buffer index for upcoming transaction.
Supposedly the slave eeprom buffer would be written as

 EEPROM[0x00D1] = 0xD1
 EEPROM[0x00D2] = 0xD2
 EEPROM[0x00D3] = 0xD3

When CPU load is high the slave irq handler may not read fast enough,
the interrupt status can be seen as 0x204 with both DW_IC_INTR_STOP_DET
(0x200) and DW_IC_INTR_RX_FULL (0x4) bits. The slave device may see
the transactions below.

 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1794 : INTR_STAT=0x204
 0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x1790 : INTR_STAT=0x200
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4

After `D1` is received, read loop continues to read `00` which is the
first bype of next index. Since STOP condition is ignored by the loop,
eeprom buffer index increased to `D2` and `00` is written as value.

So the slave eeprom buffer becomes

 EEPROM[0x00D1] = 0xD1
 EEPROM[0x00D2] = 0x00
 EEPROM[0x00D3] = 0xD3

The fix is to use `FIRST_DATA_BYTE` (bit 11) in `IC_DATA_CMD` to split
the transactions. The first index byte in this case would have bit 11
set. Check this indication to inject I2C_SLAVE_WRITE_REQUESTED event
which will reset `idx_write_cnt` in slave eeprom.

Signed-off-by: David Zheng <david.zheng@intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-designware-core.h  | 1 +
 drivers/i2c/busses/i2c-designware-slave.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 050d8c63ad3c5..0164d92163308 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -40,6 +40,7 @@
 #define DW_IC_CON_BUS_CLEAR_CTRL		BIT(11)
 
 #define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
+#define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
 
 /*
  * Registers offset
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index cec25054bb244..2e079cf20bb5b 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -176,6 +176,10 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
 
 		do {
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
+			if (tmp & DW_IC_DATA_CMD_FIRST_DATA_BYTE)
+				i2c_slave_event(dev->slave,
+						I2C_SLAVE_WRITE_REQUESTED,
+						&val);
 			val = tmp;
 			i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
 					&val);
-- 
2.39.2

