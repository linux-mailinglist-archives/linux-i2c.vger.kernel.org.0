Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C8A4CB905
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 09:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbiCCIdN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 03:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbiCCIdK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 03:33:10 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D547172E75;
        Thu,  3 Mar 2022 00:32:15 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id c1so3884017pgk.11;
        Thu, 03 Mar 2022 00:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y//RU/4VzwzbwZsNALQrmSPuNCm9Hke3VkzvMiuvz6g=;
        b=UUhpPRvos48lh285ZhRwAabBN1+RsiVt4/9k/U74qTkwJo8QC3Q0i/fJfvcnkGwUiy
         eO+wjRedRCmdJVsMmvyDlSirRHb+apzEkC2dhQa9ejBtWxs0H6tdfmF8jG5hXg2+DwVH
         mIQ2k1fIniE/Sm0Qxx56XAQoovVS/ll5Yzzd1JRJRzcWJTHJ1cUgBQQvG8QfotJsH18r
         0KLORRJnrpU8O2iy5NSq6oM1V+jpKW9yjLHGqJy9TdNdz0kQsC5WTrvcfQOyPMINJKPi
         QWVmlAGwh07LEnIVw0PzLOZKx0XWFAoumsOpKAwEEnN989UNXNjfcbrL4BW/QWu+/RE3
         jSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y//RU/4VzwzbwZsNALQrmSPuNCm9Hke3VkzvMiuvz6g=;
        b=iaMzy7feq3v3Z/aItt2zFVNGA1ryo4SxzmdbJLHYUjdcns4OqGTPfmQQAanRW7vigm
         fFK+v80+Vscu7S34LI4NMkHDTuAjp0YYzn+ng5VMo2HghRaj7DqTCIA2vPK83/lF56r3
         aOkGFj38IXBcKDcyX6n+iipLdDUn9AKrmaFxos4viYkO+VIuOnDd1jMvCvtr75QbS7Tl
         XHIDvgG20A2XXj4lyNf5FqomP1Z/ckeA/Hx52O4ewzRWYaNFV3kRAEhUo6bHmtZ5KI+J
         whl5OsCVFsRKPj/B7w6JKChhlB0+UroQTtLFzeqYhVRgX/RVAdNV2y24zhgKRaxPNbkq
         kJ9Q==
X-Gm-Message-State: AOAM533JHfERNDERcrWqqXRYCC+N1jTQ90UMuxhMApGBp67YICN2TXO8
        9HxvCf7c3Ogcl6JkYldgMQ==
X-Google-Smtp-Source: ABdhPJy7Y8hVaK2kxGbLGvT8t3PQzc54GmunPGLgWi/+Awr9d0k/Bpe/zy/7T8sQIaFDuWJRiTezew==
X-Received: by 2002:a62:7990:0:b0:4e0:5ae8:6c11 with SMTP id u138-20020a627990000000b004e05ae86c11mr37465188pfc.34.1646296334640;
        Thu, 03 Mar 2022 00:32:14 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
        by smtp.gmail.com with ESMTPSA id z8-20020aa79588000000b004e1dc67ead3sm1635153pfj.126.2022.03.03.00.32.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 00:32:14 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/11] i2c: npcm: Support NPCM845
Date:   Thu,  3 Mar 2022 16:31:41 +0800
Message-Id: <20220303083141.8742-12-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
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

Add NPCM8XX I2C support.
The NPCM8XX uses a similar i2c module as NPCM7XX.
The internal HW FIFO is larger in NPCM8XX.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/Kconfig       |   8 +-
 drivers/i2c/busses/Makefile      |   2 +-
 drivers/i2c/busses/i2c-npcm7xx.c | 126 +++++++++++++++++++------------
 3 files changed, 83 insertions(+), 53 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 8a6c6ee28556..ea0b63274442 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -817,13 +817,13 @@ config I2C_NOMADIK
 	  I2C interface from ST-Ericsson's Nomadik and Ux500 architectures,
 	  as well as the STA2X11 PCIe I/O HUB.
 
-config I2C_NPCM7XX
+config I2C_NPCM
 	tristate "Nuvoton I2C Controller"
-	depends on ARCH_NPCM7XX || COMPILE_TEST
+	depends on ARCH_NPCM || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for the
-	  Nuvoton I2C controller, which is available on the NPCM7xx BMC
-	  controller.
+	  Nuvoton I2C controller, which is available on the NPCM BMC
+	  controllers.
 	  Driver can also support slave mode (select I2C_SLAVE).
 
 config I2C_OCORES
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1d00dce77098..01fdf74a5565 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -80,7 +80,7 @@ obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
 obj-$(CONFIG_I2C_MV64XXX)	+= i2c-mv64xxx.o
 obj-$(CONFIG_I2C_MXS)		+= i2c-mxs.o
 obj-$(CONFIG_I2C_NOMADIK)	+= i2c-nomadik.o
-obj-$(CONFIG_I2C_NPCM7XX)	+= i2c-npcm7xx.o
+obj-$(CONFIG_I2C_NPCM)		+= i2c-npcm7xx.o
 obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
 obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 5c0bbc134f9d..a6266ebc6a6f 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
@@ -91,7 +92,6 @@ enum i2c_addr {
 
 /* init register and default value required to enable module */
 #define NPCM_I2CSEGCTL			0xE4
-#define NPCM_I2CSEGCTL_INIT_VAL		0x0333F000
 
 /* Common regs */
 #define NPCM_I2CSDA			0x00
@@ -228,8 +228,7 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define NPCM_I2CFIF_CTS_CLR_FIFO	BIT(6)
 #define NPCM_I2CFIF_CTS_SLVRSTR		BIT(7)
 
-/* NPCM_I2CTXF_CTL reg fields */
-#define NPCM_I2CTXF_CTL_TX_THR		GENMASK(4, 0)
+/* NPCM_I2CTXF_CTL reg field */
 #define NPCM_I2CTXF_CTL_THR_TXIE	BIT(6)
 
 /* NPCM_I2CT_OUT reg fields */
@@ -238,22 +237,18 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define NPCM_I2CT_OUT_T_OUTST		BIT(7)
 
 /* NPCM_I2CTXF_STS reg fields */
-#define NPCM_I2CTXF_STS_TX_BYTES	GENMASK(4, 0)
 #define NPCM_I2CTXF_STS_TX_THST		BIT(6)
 
 /* NPCM_I2CRXF_STS reg fields */
-#define NPCM_I2CRXF_STS_RX_BYTES	GENMASK(4, 0)
 #define NPCM_I2CRXF_STS_RX_THST		BIT(6)
 
 /* NPCM_I2CFIF_CTL reg fields */
 #define NPCM_I2CFIF_CTL_FIFO_EN		BIT(4)
 
 /* NPCM_I2CRXF_CTL reg fields */
-#define NPCM_I2CRXF_CTL_RX_THR		GENMASK(4, 0)
-#define NPCM_I2CRXF_CTL_LAST_PEC	BIT(5)
 #define NPCM_I2CRXF_CTL_THR_RXIE	BIT(6)
 
-#define I2C_HW_FIFO_SIZE		16
+#define MAX_I2C_HW_FIFO_SIZE		32
 
 /* I2C_VER reg fields */
 #define I2C_VER_VERSION			GENMASK(6, 0)
@@ -270,11 +265,36 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
 #define I2C_FREQ_MIN_HZ			10000
 #define I2C_FREQ_MAX_HZ			I2C_MAX_FAST_MODE_PLUS_FREQ
 
+struct npcm_i2c_data {
+	u8 fifo_size;
+	u32 segctl_init_val;
+	u8 txf_sts_tx_bytes;
+	u8 rxf_sts_rx_bytes;
+	u8 rxf_ctl_last_pec;
+};
+
+static const struct npcm_i2c_data npxm7xx_i2c_data = {
+	.fifo_size = 16,
+	.segctl_init_val = 0x0333F000,
+	.txf_sts_tx_bytes = GENMASK(4, 0),
+	.rxf_sts_rx_bytes = GENMASK(4, 0),
+	.rxf_ctl_last_pec = BIT(5)
+};
+
+static const struct npcm_i2c_data npxm8xx_i2c_data = {
+	.fifo_size = 32,
+	.segctl_init_val = 0x9333F000,
+	.txf_sts_tx_bytes = GENMASK(5, 0),
+	.rxf_sts_rx_bytes = GENMASK(5, 0),
+	.rxf_ctl_last_pec = BIT(7)
+};
+
 /* Status of one I2C module */
 struct npcm_i2c {
 	struct i2c_adapter adap;
 	struct device *dev;
 	unsigned char __iomem *reg;
+	const struct npcm_i2c_data *data;
 	spinlock_t lock;   /* IRQ synchronization */
 	struct completion cmd_complete;
 	int cmd_err;
@@ -307,8 +327,8 @@ struct npcm_i2c {
 	int slv_rd_ind;
 	int slv_wr_size;
 	int slv_wr_ind;
-	u8 slv_rd_buf[I2C_HW_FIFO_SIZE];
-	u8 slv_wr_buf[I2C_HW_FIFO_SIZE];
+	u8 slv_rd_buf[MAX_I2C_HW_FIFO_SIZE];
+	u8 slv_wr_buf[MAX_I2C_HW_FIFO_SIZE];
 #endif
 	struct dentry *debugfs; /* debugfs device directory */
 	u64 ber_cnt;
@@ -441,7 +461,7 @@ static inline bool npcm_i2c_tx_fifo_empty(struct npcm_i2c *bus)
 
 	tx_fifo_sts = ioread8(bus->reg + NPCM_I2CTXF_STS);
 	/* check if TX FIFO is not empty */
-	if ((tx_fifo_sts & NPCM_I2CTXF_STS_TX_BYTES) == 0)
+	if ((tx_fifo_sts & bus->data->txf_sts_tx_bytes) == 0)
 		return false;
 
 	/* check if TX FIFO status bit is set: */
@@ -454,7 +474,7 @@ static inline bool npcm_i2c_rx_fifo_full(struct npcm_i2c *bus)
 
 	rx_fifo_sts = ioread8(bus->reg + NPCM_I2CRXF_STS);
 	/* check if RX FIFO is not empty: */
-	if ((rx_fifo_sts & NPCM_I2CRXF_STS_RX_BYTES) == 0)
+	if ((rx_fifo_sts & bus->data->rxf_sts_rx_bytes) == 0)
 		return false;
 
 	/* check if rx fifo full status is set: */
@@ -743,11 +763,11 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
 static u8 npcm_i2c_fifo_usage(struct npcm_i2c *bus)
 {
 	if (bus->operation == I2C_WRITE_OPER)
-		return FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
-				 ioread8(bus->reg + NPCM_I2CTXF_STS));
+		return (bus->data->txf_sts_tx_bytes &
+			ioread8(bus->reg + NPCM_I2CTXF_STS));
 	if (bus->operation == I2C_READ_OPER)
-		return FIELD_GET(NPCM_I2CRXF_STS_RX_BYTES,
-				 ioread8(bus->reg + NPCM_I2CRXF_STS));
+		return (bus->data->rxf_sts_rx_bytes &
+			ioread8(bus->reg + NPCM_I2CRXF_STS));
 	return 0;
 }
 
@@ -759,13 +779,13 @@ static void npcm_i2c_write_to_fifo_master(struct npcm_i2c *bus, u16 max_bytes)
 	 * Fill the FIFO, while the FIFO is not full and there are more bytes
 	 * to write
 	 */
-	size_free_fifo = I2C_HW_FIFO_SIZE - npcm_i2c_fifo_usage(bus);
+	size_free_fifo = bus->data->fifo_size - npcm_i2c_fifo_usage(bus);
 	while (max_bytes-- && size_free_fifo) {
 		if (bus->wr_ind < bus->wr_size)
 			npcm_i2c_wr_byte(bus, bus->wr_buf[bus->wr_ind++]);
 		else
 			npcm_i2c_wr_byte(bus, 0xFF);
-		size_free_fifo = I2C_HW_FIFO_SIZE - npcm_i2c_fifo_usage(bus);
+		size_free_fifo = bus->data->fifo_size - npcm_i2c_fifo_usage(bus);
 	}
 }
 
@@ -786,11 +806,11 @@ static void npcm_i2c_set_fifo(struct npcm_i2c *bus, int nread, int nwrite)
 
 	/* configure RX FIFO */
 	if (nread > 0) {
-		rxf_ctl = min_t(int, nread, I2C_HW_FIFO_SIZE);
+		rxf_ctl = min_t(int, nread, bus->data->fifo_size);
 
 		/* set LAST bit. if LAST is set next FIFO packet is nacked */
-		if (nread <= I2C_HW_FIFO_SIZE)
-			rxf_ctl |= NPCM_I2CRXF_CTL_LAST_PEC;
+		if (nread <= bus->data->fifo_size)
+			rxf_ctl |= bus->data->rxf_ctl_last_pec;
 
 		/*
 		 * if we are about to read the first byte in blk rd mode,
@@ -808,9 +828,9 @@ static void npcm_i2c_set_fifo(struct npcm_i2c *bus, int nread, int nwrite)
 
 	/* configure TX FIFO */
 	if (nwrite > 0) {
-		if (nwrite > I2C_HW_FIFO_SIZE)
+		if (nwrite > bus->data->fifo_size)
 			/* data to send is more then FIFO size. */
-			iowrite8(I2C_HW_FIFO_SIZE, bus->reg + NPCM_I2CTXF_CTL);
+			iowrite8(bus->data->fifo_size, bus->reg + NPCM_I2CTXF_CTL);
 		else
 			iowrite8(nwrite, bus->reg + NPCM_I2CTXF_CTL);
 
@@ -879,13 +899,13 @@ static void npcm_i2c_write_fifo_slave(struct npcm_i2c *bus, u16 max_bytes)
 	npcm_i2c_clear_fifo_int(bus);
 	npcm_i2c_clear_tx_fifo(bus);
 	iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
-	while (max_bytes-- && I2C_HW_FIFO_SIZE != npcm_i2c_fifo_usage(bus)) {
+	while (max_bytes-- && bus->data->fifo_size != npcm_i2c_fifo_usage(bus)) {
 		if (bus->slv_wr_size <= 0)
 			break;
-		bus->slv_wr_ind = bus->slv_wr_ind % I2C_HW_FIFO_SIZE;
+		bus->slv_wr_ind = bus->slv_wr_ind & (bus->data->fifo_size - 1);
 		npcm_i2c_wr_byte(bus, bus->slv_wr_buf[bus->slv_wr_ind]);
 		bus->slv_wr_ind++;
-		bus->slv_wr_ind = bus->slv_wr_ind % I2C_HW_FIFO_SIZE;
+		bus->slv_wr_ind = bus->slv_wr_ind & (bus->data->fifo_size - 1);
 		bus->slv_wr_size--;
 	}
 }
@@ -900,7 +920,7 @@ static void npcm_i2c_read_fifo_slave(struct npcm_i2c *bus, u8 bytes_in_fifo)
 	while (bytes_in_fifo--) {
 		data = npcm_i2c_rd_byte(bus);
 
-		bus->slv_rd_ind = bus->slv_rd_ind % I2C_HW_FIFO_SIZE;
+		bus->slv_rd_ind = bus->slv_rd_ind & (bus->data->fifo_size - 1);
 		bus->slv_rd_buf[bus->slv_rd_ind] = data;
 		bus->slv_rd_ind++;
 
@@ -918,8 +938,8 @@ static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
 	int ret = bus->slv_wr_ind;
 
 	/* fill a cyclic buffer */
-	for (i = 0; i < I2C_HW_FIFO_SIZE; i++) {
-		if (bus->slv_wr_size >= I2C_HW_FIFO_SIZE)
+	for (i = 0; i < bus->data->fifo_size; i++) {
+		if (bus->slv_wr_size >= bus->data->fifo_size)
 			break;
 		if (bus->state == I2C_SLAVE_MATCH) {
 			i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
@@ -927,11 +947,11 @@ static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
 		} else {
 			i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
 		}
-		ind = (bus->slv_wr_ind + bus->slv_wr_size) % I2C_HW_FIFO_SIZE;
+		ind = (bus->slv_wr_ind + bus->slv_wr_size) & (bus->data->fifo_size - 1);
 		bus->slv_wr_buf[ind] = value;
 		bus->slv_wr_size++;
 	}
-	return I2C_HW_FIFO_SIZE - ret;
+	return bus->data->fifo_size - ret;
 }
 
 static void npcm_i2c_slave_send_rd_buf(struct npcm_i2c *bus)
@@ -966,7 +986,7 @@ static void npcm_i2c_slave_receive(struct npcm_i2c *bus, u16 nread,
 	bus->slv_rd_ind = 0;
 
 	iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
-	iowrite8(I2C_HW_FIFO_SIZE, bus->reg + NPCM_I2CRXF_CTL);
+	iowrite8(bus->data->fifo_size, bus->reg + NPCM_I2CRXF_CTL);
 	npcm_i2c_clear_tx_fifo(bus);
 	npcm_i2c_clear_rx_fifo(bus);
 }
@@ -999,12 +1019,12 @@ static void npcm_i2c_slave_wr_buf_sync(struct npcm_i2c *bus)
 {
 	int left_in_fifo;
 
-	left_in_fifo = FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
-				 ioread8(bus->reg + NPCM_I2CTXF_STS));
+	left_in_fifo = (bus->data->txf_sts_tx_bytes &
+			ioread8(bus->reg + NPCM_I2CTXF_STS));
 
 	/* fifo already full: */
-	if (left_in_fifo >= I2C_HW_FIFO_SIZE ||
-	    bus->slv_wr_size >= I2C_HW_FIFO_SIZE)
+	if (left_in_fifo >= bus->data->fifo_size ||
+	    bus->slv_wr_size >= bus->data->fifo_size)
 		return;
 
 	/* update the wr fifo index back to the untransmitted bytes: */
@@ -1012,7 +1032,7 @@ static void npcm_i2c_slave_wr_buf_sync(struct npcm_i2c *bus)
 	bus->slv_wr_size = bus->slv_wr_size + left_in_fifo;
 
 	if (bus->slv_wr_ind < 0)
-		bus->slv_wr_ind += I2C_HW_FIFO_SIZE;
+		bus->slv_wr_ind += bus->data->fifo_size;
 }
 
 static void npcm_i2c_slave_rd_wr(struct npcm_i2c *bus)
@@ -1158,7 +1178,7 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
 		npcm_i2c_clear_rx_fifo(bus);
 		npcm_i2c_clear_tx_fifo(bus);
 		iowrite8(0, bus->reg + NPCM_I2CTXF_CTL);
-		iowrite8(I2C_HW_FIFO_SIZE, bus->reg + NPCM_I2CRXF_CTL);
+		iowrite8(bus->data->fifo_size, bus->reg + NPCM_I2CRXF_CTL);
 		if (NPCM_I2CST_XMIT & i2cst) {
 			bus->operation = I2C_WRITE_OPER;
 		} else {
@@ -1319,8 +1339,8 @@ static void npcm_i2c_master_fifo_read(struct npcm_i2c *bus)
 	 * read == FIFO Size + C (where C < FIFO Size)then first read C bytes
 	 * and in the next int we read rest of the data.
 	 */
-	if (rcount < (2 * I2C_HW_FIFO_SIZE) && rcount > I2C_HW_FIFO_SIZE)
-		fifo_bytes = rcount - I2C_HW_FIFO_SIZE;
+	if (rcount < (2 * bus->data->fifo_size) && rcount > bus->data->fifo_size)
+		fifo_bytes = rcount - bus->data->fifo_size;
 
 	if (rcount <= fifo_bytes) {
 		/* last bytes are about to be read - end of tx */
@@ -2200,7 +2220,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	 * It cannot be cleared without resetting the module.
 	 */
 	else if (bus->cmd_err &&
-		 (NPCM_I2CRXF_CTL_LAST_PEC & ioread8(bus->reg + NPCM_I2CRXF_CTL)))
+		 (bus->data->rxf_ctl_last_pec & ioread8(bus->reg + NPCM_I2CRXF_CTL)))
 		npcm_i2c_reset(bus);
 
 	/* after any xfer, successful or not, stall and EOB must be disabled */
@@ -2265,12 +2285,21 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	bus->debugfs = d;
 }
 
+static const struct of_device_id npcm_i2c_bus_of_table[] = {
+	{ .compatible = "nuvoton,npcm750-i2c", .data = &npxm7xx_i2c_data },
+	{ .compatible = "nuvoton,npcm845-i2c", .data = &npxm8xx_i2c_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
+
 static int npcm_i2c_probe_bus(struct platform_device *pdev)
 {
 	struct npcm_i2c *bus;
 	struct i2c_adapter *adap;
 	struct clk *i2c_clk;
 	static struct regmap *gcr_regmap;
+	struct device *dev = &pdev->dev;
+	const struct of_device_id *match;
 	int irq;
 	int ret;
 	struct device_node *np = pdev->dev.of_node;
@@ -2281,6 +2310,13 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 
 	bus->dev = &pdev->dev;
 
+	match = of_match_device(npcm_i2c_bus_of_table, dev);
+	if (!match) {
+		dev_err(dev, "OF data missing\n");
+		return -EINVAL;
+	}
+	bus->data = match->data;
+
 	bus->num = of_alias_get_id(pdev->dev.of_node, "i2c");
 	/* core clk must be acquired to calculate module timing settings */
 	i2c_clk = devm_clk_get(&pdev->dev, NULL);
@@ -2294,7 +2330,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 
 	if (IS_ERR(gcr_regmap))
 		return PTR_ERR(gcr_regmap);
-	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
+	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, bus->data->segctl_init_val);
 
 	bus->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bus->reg))
@@ -2355,12 +2391,6 @@ static int npcm_i2c_remove_bus(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id npcm_i2c_bus_of_table[] = {
-	{ .compatible = "nuvoton,npcm750-i2c", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, npcm_i2c_bus_of_table);
-
 static struct platform_driver npcm_i2c_bus_driver = {
 	.probe = npcm_i2c_probe_bus,
 	.remove = npcm_i2c_remove_bus,
-- 
2.17.1

