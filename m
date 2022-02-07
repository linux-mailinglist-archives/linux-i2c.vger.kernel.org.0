Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB8F4AB54C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 07:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbiBGG4N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 01:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241891AbiBGGeB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 01:34:01 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA12C043184;
        Sun,  6 Feb 2022 22:34:00 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id y7so5129950plp.2;
        Sun, 06 Feb 2022 22:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+MqqM6tGyjbKjTboDXjFmiWET4pIP1qrQBFIZ6c46cU=;
        b=P5bnYBJfDsOkUTYIaJSy2VvWW6Wvh+nbRYCQSGnR2534RfjwGkvzzMq4LHkL2/jvmL
         IGGGq5CA3TPG8U3jqleottZ+CMFBfuUOjh5soppe68jXg92Z2Gq/EHXhqaSbR4TbSNjc
         Sn/dOR7lMKK9jfaaFuAfp9LrNl3FnJiYagFq/S30TNOh49id2d83TOe9VOHVhr8Nl2IR
         cbptwC0i/cY2aoZZDSP23ZLSGUaPLVRE7ZJtmdOGFoBPIzMuQ0pAx0aLHIlg2D7cxD1f
         JlGfOEXt1DSzUFGy6PJkxGN9H/9ALtDSKzXH2nD+dHDWUwX+D+it29GLEwPa5RdCVAAb
         bh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+MqqM6tGyjbKjTboDXjFmiWET4pIP1qrQBFIZ6c46cU=;
        b=j3mJqauV5vtCsmEAmakEXJ05xapjxKuyoTbqdoW3A8GObnYc+b7fLbjRzlwJpkSsyo
         xJ0wXs/uuLkGSFvVQrIkmN3FQurC9T/gi5uLo6iRiU2Y6/x+vUR+KUdZbY8VPqJ9V9nn
         7BcCoc10BY2RU3jpqPNeqmQpZ9D8T6FLW57dJzzL0f2amIrf9gr6FbBGR8nkePIaUTaz
         j9KgbPpmd2ckndR5mxXNRVfUizePX2e54e/8hEja9oyhyRe2vXsvgC0M55VXYnqe5Mf/
         ZzLL10RYC0/+KUHNnV7HaluaTXmhjyr7aUlE3/nLXgurkf7xKjJTT/UTAQ0jxJhplo2T
         BtjQ==
X-Gm-Message-State: AOAM531SDiDbQY79JznTxVg9cUnETP9qKtjXXiNoRFGy9IVNKqGwGdku
        3r0lOCs6AhyGmetD6dm9oXjRqXGuXMfjMlw=
X-Google-Smtp-Source: ABdhPJxlUUaid24a39E6u5RfKpUrqK+tScS5xaa9m6Q/VX1CeNlx7GBM6zh5bvKdVgUmtzRktoxi6g==
X-Received: by 2002:a17:902:d641:: with SMTP id y1mr14826366plh.64.1644215639633;
        Sun, 06 Feb 2022 22:33:59 -0800 (PST)
Received: from localhost ([2401:e180:8894:9737:7848:1ec7:b697:7d50])
        by smtp.gmail.com with ESMTPSA id e14sm10546295pfv.219.2022.02.06.22.33.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Feb 2022 22:33:59 -0800 (PST)
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
Subject: [PATCH v1 5/6] i2c: npcm: Remove own slave addresses 2:10
Date:   Mon,  7 Feb 2022 14:33:37 +0800
Message-Id: <20220207063338.6570-6-warp5tw@gmail.com>
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

NPCM can support up to 10 own slave addresses.
In practice, only one address is actually being used.
In order to access addresses 2 and above, need to switch
register banks. The switch needs spinlock.
To avoid using spinlock for this useless feature
removed support of SA >= 2.

Also fix returned slave event enum.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 44 +++++++++++++++++---------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 1ddf309b91a3..0af97f179af2 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -124,6 +124,8 @@ enum i2c_addr {
  * use this array to get the address or each register.
  */
 #define I2C_NUM_OWN_ADDR 10
+#define I2C_NUM_OWN_ADDR_SUPPORTED 2
+
 static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 	NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
 	NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
@@ -393,13 +395,11 @@ static void npcm_i2c_disable(struct npcm_i2c *bus)
 	int i;
 
 	/* select bank 0 for I2C addresses */
-	npcm_i2c_select_bank(bus, I2C_BANK_0);
 
 	/* Slave addresses removal */
-	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OWN_ADDR; i++)
+	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OWN_ADDR_SUPPORTED; i++)
 		iowrite8(0, bus->reg + npcm_i2caddr[i]);
 
-	npcm_i2c_select_bank(bus, I2C_BANK_1);
 #endif
 	/* Disable module */
 	i2cctl2 = ioread8(bus->reg + NPCM_I2CCTL2);
@@ -604,8 +604,7 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
 			i2cctl1 &= ~NPCM_I2CCTL1_GCMEN;
 		iowrite8(i2cctl1, bus->reg + NPCM_I2CCTL1);
 		return 0;
-	}
-	if (addr_type == I2C_ARP_ADDR) {
+	} else if (addr_type == I2C_ARP_ADDR) {
 		i2cctl3 = ioread8(bus->reg + NPCM_I2CCTL3);
 		if (enable)
 			i2cctl3 |= I2CCTL3_ARPMEN;
@@ -614,16 +613,18 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
 		iowrite8(i2cctl3, bus->reg + NPCM_I2CCTL3);
 		return 0;
 	}
+	if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10) {
+		dev_err(bus->dev,
+			"try to enable more then 2 SA not supported\n");
+	}
 	if (addr_type >= I2C_ARP_ADDR)
 		return -EFAULT;
 	/* select bank 0 for address 3 to 10 */
-	if (addr_type > I2C_SLAVE_ADDR2)
-		npcm_i2c_select_bank(bus, I2C_BANK_0);
+
 	/* Set and enable the address */
 	iowrite8(sa_reg, bus->reg + npcm_i2caddr[addr_type]);
 	npcm_i2c_slave_int_enable(bus, enable);
-	if (addr_type > I2C_SLAVE_ADDR2)
-		npcm_i2c_select_bank(bus, I2C_BANK_1);
+
 	return 0;
 }
 #endif
@@ -846,15 +847,13 @@ static u8 npcm_i2c_get_slave_addr(struct npcm_i2c *bus, enum i2c_addr addr_type)
 {
 	u8 slave_add;
 
-	/* select bank 0 for address 3 to 10 */
-	if (addr_type > I2C_SLAVE_ADDR2)
-		npcm_i2c_select_bank(bus, I2C_BANK_0);
+	if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10) {
+		dev_err(bus->dev,
+			"get slave: try to use more then 2 slave addresses not supported\n");
+	}
 
 	slave_add = ioread8(bus->reg + npcm_i2caddr[(int)addr_type]);
 
-	if (addr_type > I2C_SLAVE_ADDR2)
-		npcm_i2c_select_bank(bus, I2C_BANK_1);
-
 	return slave_add;
 }
 
@@ -864,12 +863,12 @@ static int npcm_i2c_remove_slave_addr(struct npcm_i2c *bus, u8 slave_add)
 
 	/* Set the enable bit */
 	slave_add |= 0x80;
-	npcm_i2c_select_bank(bus, I2C_BANK_0);
-	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OWN_ADDR; i++) {
+
+	for (i = I2C_SLAVE_ADDR1; i < I2C_NUM_OWN_ADDR_SUPPORTED; i++) {
 		if (ioread8(bus->reg + npcm_i2caddr[i]) == slave_add)
 			iowrite8(0, bus->reg + npcm_i2caddr[i]);
 	}
-	npcm_i2c_select_bank(bus, I2C_BANK_1);
+
 	return 0;
 }
 
@@ -924,11 +923,15 @@ static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
 	for (i = 0; i < I2C_HW_FIFO_SIZE; i++) {
 		if (bus->slv_wr_size >= I2C_HW_FIFO_SIZE)
 			break;
-		i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
+		if (bus->state == I2C_SLAVE_MATCH) {
+			i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
+			bus->state = I2C_OPER_STARTED;
+		} else {
+			i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
+		}
 		ind = (bus->slv_wr_ind + bus->slv_wr_size) % I2C_HW_FIFO_SIZE;
 		bus->slv_wr_buf[ind] = value;
 		bus->slv_wr_size++;
-		i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
 	}
 	return I2C_HW_FIFO_SIZE - ret;
 }
@@ -976,7 +979,6 @@ static void npcm_i2c_slave_xmit(struct npcm_i2c *bus, u16 nwrite,
 	if (nwrite == 0)
 		return;
 
-	bus->state = I2C_OPER_STARTED;
 	bus->operation = I2C_WRITE_OPER;
 
 	/* get the next buffer */
-- 
2.17.1

