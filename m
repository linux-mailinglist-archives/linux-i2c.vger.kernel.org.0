Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0260F5BD672
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 23:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiISVfD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 17:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbiISVes (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 17:34:48 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE16E5F9B
        for <linux-i2c@vger.kernel.org>; Mon, 19 Sep 2022 14:34:41 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 20 Sep 2022 00:34:39 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 28JLYc5p023076;
        Mon, 19 Sep 2022 17:34:38 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 28JLYcSb008206;
        Mon, 19 Sep 2022 17:34:38 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: [PATCH v4 6/8] i2c: i2c-mlxbf: add multi slave functionality
Date:   Mon, 19 Sep 2022 17:34:29 -0400
Message-Id: <20220919213431.8045-7-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220919213431.8045-1-asmaa@nvidia.com>
References: <20220919213431.8045-1-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Support the multi slave functionality which enables the BlueField
to be registered at up to 16 i2c slave addresses.

Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 320 +++++++++++++++------------------
 1 file changed, 149 insertions(+), 171 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 78b2bc9b0a34..e9e700012136 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -298,9 +298,6 @@ static u64 mlxbf_i2c_corepll_frequency;
 #define MLXBF_I2C_SMBUS_SLAVE_ADDR_EN_BIT     7
 #define MLXBF_I2C_SMBUS_SLAVE_ADDR_MASK       GENMASK(6, 0)
 
-#define MLXBF_I2C_SLAVE_ADDR_ENABLED(addr) \
-	((addr) & (1 << MLXBF_I2C_SMBUS_SLAVE_ADDR_EN_BIT))
-
 /*
  * Timeout is given in microsends. Note also that timeout handling is not
  * exact.
@@ -426,7 +423,7 @@ struct mlxbf_i2c_priv {
 	u64 frequency; /* Core frequency in Hz. */
 	int bus; /* Physical bus identifier. */
 	int irq;
-	struct i2c_client *slave;
+	struct i2c_client *slave[MLXBF_I2C_SMBUS_SLAVE_ADDR_CNT];
 };
 
 static struct mlxbf_i2c_resource mlxbf_i2c_coalesce_res[] = {
@@ -1543,25 +1540,23 @@ static int mlxbf_i2c_calculate_corepll_freq(struct platform_device *pdev,
 	return 0;
 }
 
-static int mlxbf_slave_enable(struct mlxbf_i2c_priv *priv, u8 addr)
+static int mlxbf_i2c_slave_enable(struct mlxbf_i2c_priv *priv,
+			      struct i2c_client *slave)
 {
-	u32 slave_reg, slave_reg_tmp, slave_reg_avail, slave_addr_mask;
-	u8 reg, reg_cnt, byte, addr_tmp, reg_avail, byte_avail;
-	bool avail, disabled;
-
-	disabled = false;
-	avail = false;
+	u8 reg, reg_cnt, byte, addr_tmp;
+	u32 slave_reg, slave_reg_tmp;
 
 	if (!priv)
 		return -EPERM;
 
 	reg_cnt = MLXBF_I2C_SMBUS_SLAVE_ADDR_CNT >> 2;
-	slave_addr_mask = MLXBF_I2C_SMBUS_SLAVE_ADDR_MASK;
 
 	/*
 	 * Read the slave registers. There are 4 * 32-bit slave registers.
-	 * Each slave register can hold up to 4 * 8-bit slave configuration
-	 * (7-bit address, 1 status bit (1 if enabled, 0 if not)).
+	 * Each slave register can hold up to 4 * 8-bit slave configuration:
+	 * 1) A 7-bit address
+	 * 2) And a status bit (1 if enabled, 0 if not).
+	 * Look for the next available slave register slot.
 	 */
 	for (reg = 0; reg < reg_cnt; reg++) {
 		slave_reg = readl(priv->smbus->io +
@@ -1576,121 +1571,87 @@ static int mlxbf_slave_enable(struct mlxbf_i2c_priv *priv, u8 addr)
 			addr_tmp = slave_reg_tmp & GENMASK(7, 0);
 
 			/*
-			 * Mark the first available slave address slot, i.e. its
-			 * enabled bit should be unset. This slot might be used
-			 * later on to register our slave.
-			 */
-			if (!avail && !MLXBF_I2C_SLAVE_ADDR_ENABLED(addr_tmp)) {
-				avail = true;
-				reg_avail = reg;
-				byte_avail = byte;
-				slave_reg_avail = slave_reg;
-			}
-
-			/*
-			 * Parse slave address bytes and check whether the
-			 * slave address already exists and it's enabled,
-			 * i.e. most significant bit is set.
+			 * If an enable bit is not set in the
+			 * MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG register, then the
+			 * slave address slot associated with that bit is
+			 * free. So set the enable bit and write the
+			 * slave address bits.
 			 */
-			if ((addr_tmp & slave_addr_mask) == addr) {
-				if (MLXBF_I2C_SLAVE_ADDR_ENABLED(addr_tmp))
-					return 0;
-				disabled = true;
-				break;
+			if (!(addr_tmp & MLXBF_I2C_SMBUS_SLAVE_ADDR_EN_BIT)) {
+				slave_reg &= ~(MLXBF_I2C_SMBUS_SLAVE_ADDR_MASK << (byte * 8));
+				slave_reg |= (slave->addr << (byte * 8));
+				slave_reg |= MLXBF_I2C_SMBUS_SLAVE_ADDR_EN_BIT << (byte * 8);
+				writel(slave_reg, priv->smbus->io +
+					MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG +
+					(reg * 0x4));
+
+				/*
+				 * Set the slave at the corresponding index.
+				 */
+				priv->slave[(reg * 4) + byte] = slave;
+
+				return 0;
 			}
 
 			/* Parse next byte. */
 			slave_reg_tmp >>= 8;
 		}
-
-		/* Exit the loop if the slave address is found. */
-		if (disabled)
-			break;
 	}
 
-	if (!avail && !disabled)
-		return -EINVAL; /* No room for a new slave address. */
-
-	if (avail && !disabled) {
-		reg = reg_avail;
-		byte = byte_avail;
-		/* Set the slave address. */
-		slave_reg_avail &= ~(slave_addr_mask << (byte * 8));
-		slave_reg_avail |= addr << (byte * 8);
-		slave_reg = slave_reg_avail;
-	}
-
-	/* Enable the slave address and update the register. */
-	slave_reg |= (1 << MLXBF_I2C_SMBUS_SLAVE_ADDR_EN_BIT) << (byte * 8);
-	writel(slave_reg, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG +
-		reg * 0x4);
-
-	return 0;
+	return -EBUSY;
 }
 
-static int mlxbf_slave_disable(struct mlxbf_i2c_priv *priv)
+static int mlxbf_i2c_slave_disable(struct mlxbf_i2c_priv *priv, u8 addr)
 {
-	u32 slave_reg, slave_reg_tmp, slave_addr_mask;
-	u8 addr, addr_tmp, reg, reg_cnt, slave_byte;
-	struct i2c_client *client = priv->slave;
-	bool exist;
+	u8 addr_tmp, reg, reg_cnt, byte;
+	u32 slave_reg, slave_reg_tmp;
 
-	exist = false;
-
-	addr = client->addr;
 	reg_cnt = MLXBF_I2C_SMBUS_SLAVE_ADDR_CNT >> 2;
-	slave_addr_mask = MLXBF_I2C_SMBUS_SLAVE_ADDR_MASK;
 
 	/*
 	 * Read the slave registers. There are 4 * 32-bit slave registers.
-	 * Each slave register can hold up to 4 * 8-bit slave configuration
-	 * (7-bit address, 1 status bit (1 if enabled, 0 if not)).
+	 * Each slave register can hold up to 4 * 8-bit slave configuration:
+	 * 1) A 7-bit address
+	 * 2) And a status bit (1 if enabled, 0 if not).
+	 * Check if addr is present in the registers.
 	 */
 	for (reg = 0; reg < reg_cnt; reg++) {
 		slave_reg = readl(priv->smbus->io +
 				MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG + reg * 0x4);
 
 		/* Check whether the address slots are empty. */
-		if (slave_reg == 0)
+		if (!slave_reg)
 			continue;
 
 		/*
-		 * Each register holds 4 slave addresses. So, we have to keep
-		 * the byte order consistent with the value read in order to
-		 * update the register correctly, if needed.
+		 * Check if addr matches any of the 4 slave addresses
+		 * in the register.
 		 */
 		slave_reg_tmp = slave_reg;
-		slave_byte = 0;
-		while (slave_reg_tmp != 0) {
-			addr_tmp = slave_reg_tmp & slave_addr_mask;
+		for (byte = 0; byte < 4; byte++) {
+			addr_tmp = slave_reg_tmp & MLXBF_I2C_SMBUS_SLAVE_ADDR_MASK;
 			/*
 			 * Parse slave address bytes and check whether the
 			 * slave address already exists.
 			 */
 			if (addr_tmp == addr) {
-				exist = true;
-				break;
+				/* Clear the slave address slot. */
+				slave_reg &= ~(GENMASK(7, 0) << (byte * 8));
+				writel(slave_reg, priv->smbus->io +
+					MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG +
+					(reg * 0x4));
+				/* Free slave at the corresponding index */
+				priv->slave[(reg * 4) + byte] = NULL;
+
+				return 0;
 			}
 
 			/* Parse next byte. */
 			slave_reg_tmp >>= 8;
-			slave_byte += 1;
 		}
-
-		/* Exit the loop if the slave address is found. */
-		if (exist)
-			break;
 	}
 
-	if (!exist)
-		return 0; /* Slave is not registered, nothing to do. */
-
-	/* Cleanup the slave address slot. */
-	slave_reg &= ~(GENMASK(7, 0) << (slave_byte * 8));
-	writel(slave_reg, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG +
-		reg * 0x4);
-
-	return 0;
+	return -ENXIO;
 }
 
 static int mlxbf_i2c_init_coalesce(struct platform_device *pdev,
@@ -1852,72 +1813,81 @@ static bool mlxbf_smbus_slave_wait_for_idle(struct mlxbf_i2c_priv *priv,
 	return false;
 }
 
-/* Send byte to 'external' smbus master. */
-static int mlxbf_smbus_irq_send(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
+static struct i2c_client *mlxbf_i2c_get_slave_from_addr(
+			struct mlxbf_i2c_priv *priv, u8 addr)
 {
-	u8 data_desc[MLXBF_I2C_SLAVE_DATA_DESC_SIZE] = { 0 };
-	u8 write_size, pec_en, addr, byte, value, byte_cnt, desc_size;
-	struct i2c_client *slave = priv->slave;
-	u32 control32, data32;
-	int ret;
+	int i;
 
-	if (!slave)
-		return -EINVAL;
+	for (i = 0; i < MLXBF_I2C_SMBUS_SLAVE_ADDR_CNT; i++) {
+		if (!priv->slave[i])
+			continue;
 
-	addr = 0;
-	byte = 0;
-	desc_size = MLXBF_I2C_SLAVE_DATA_DESC_SIZE;
+		if (priv->slave[i]->addr == addr)
+			return priv->slave[i];
+	}
+
+	return NULL;
+}
+
+/*
+ * Send byte to 'external' smbus master. This function is executed when
+ * an external smbus master wants to read data from the BlueField.
+ */
+static int mlxbf_i2c_irq_send(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
+{
+	u8 data_desc[MLXBF_I2C_SLAVE_DATA_DESC_SIZE] = { 0 };
+	u8 write_size, pec_en, addr, value, byte_cnt;
+	struct i2c_client *slave;
+	u32 control32, data32;
+	int ret = 0;
 
 	/*
-	 * Read bytes received from the external master. These bytes should
-	 * be located in the first data descriptor register of the slave GW.
-	 * These bytes are the slave address byte and the internal register
-	 * address, if supplied.
+	 * Read the first byte received from the external master to
+	 * determine the slave address. This byte is located in the
+	 * first data descriptor register of the slave GW.
 	 */
-	if (recv_bytes > 0) {
-		data32 = ioread32be(priv->smbus->io +
-					MLXBF_I2C_SLAVE_DATA_DESC_ADDR);
-
-		/* Parse the received bytes. */
-		switch (recv_bytes) {
-		case 2:
-			byte = (data32 >> 8) & GENMASK(7, 0);
-			fallthrough;
-		case 1:
-			addr = (data32 & GENMASK(7, 0)) >> 1;
-		}
+	data32 = ioread32be(priv->smbus->io +
+				MLXBF_I2C_SLAVE_DATA_DESC_ADDR);
+	addr = (data32 & GENMASK(7, 0)) >> 1;
 
-		/* Check whether it's our slave address. */
-		if (slave->addr != addr)
-			return -EINVAL;
+	/*
+	 * Check if the slave address received in the data descriptor register
+	 * matches any of the slave addresses registered. If there is a match,
+	 * set the slave.
+	 */
+	slave = mlxbf_i2c_get_slave_from_addr(priv, addr);
+	if (!slave) {
+		ret = -ENXIO;
+		goto clear_csr;
 	}
 
 	/*
-	 * I2C read transactions may start by a WRITE followed by a READ.
-	 * Indeed, most slave devices would expect the internal address
-	 * following the slave address byte. So, write that byte first,
-	 * and then, send the requested data bytes to the master.
+	 * An I2C read can consist of a WRITE bit transaction followed by
+	 * a READ bit transaction. Indeed, slave devices often expect
+	 * the slave address to be followed by the internal address.
+	 * So, write the internal address byte first, and then, send the
+	 * requested data to the master.
 	 */
 	if (recv_bytes > 1) {
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
-		value = byte;
+		value = (data32 >> 8) & GENMASK(7, 0);
 		ret = i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED,
 				      &value);
 		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
 
 		if (ret < 0)
-			return ret;
+			goto clear_csr;
 	}
 
 	/*
-	 * Now, send data to the master; currently, the driver supports
-	 * READ_BYTE, READ_WORD and BLOCK READ protocols. Note that the
-	 * hardware can send up to 128 bytes per transfer. That is the
-	 * size of its data registers.
+	 * Send data to the master. Currently, the driver supports
+	 * READ_BYTE, READ_WORD and BLOCK READ protocols. The
+	 * hardware can send up to 128 bytes per transfer which is
+	 * the total size of the data registers.
 	 */
 	i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
 
-	for (byte_cnt = 0; byte_cnt < desc_size; byte_cnt++) {
+	for (byte_cnt = 0; byte_cnt < MLXBF_I2C_SLAVE_DATA_DESC_SIZE; byte_cnt++) {
 		data_desc[byte_cnt] = value;
 		i2c_slave_event(slave, I2C_SLAVE_READ_PROCESSED, &value);
 	}
@@ -1925,8 +1895,6 @@ static int mlxbf_smbus_irq_send(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
 	/* Send a stop condition to the backend. */
 	i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
 
-	/* Handle the actual transfer. */
-
 	/* Set the number of bytes to write to master. */
 	write_size = (byte_cnt - 1) & 0x7f;
 
@@ -1949,38 +1917,44 @@ static int mlxbf_smbus_irq_send(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
 	 */
 	mlxbf_smbus_slave_wait_for_idle(priv, MLXBF_I2C_SMBUS_TIMEOUT);
 
+clear_csr:
 	/* Release the Slave GW. */
 	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_RS_MASTER_BYTES);
 	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_PEC);
 	writel(0x1, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_READY);
 
-	return 0;
+	return ret;
 }
 
-/* Receive bytes from 'external' smbus master. */
-static int mlxbf_smbus_irq_recv(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
+/*
+ * Receive bytes from 'external' smbus master. This function is executed when
+ * an external smbus master wants to write data to the BlueField.
+ */
+static int mlxbf_i2c_irq_recv(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
 {
 	u8 data_desc[MLXBF_I2C_SLAVE_DATA_DESC_SIZE] = { 0 };
-	struct i2c_client *slave = priv->slave;
+	struct i2c_client *slave;
 	u8 value, byte, addr;
 	int ret = 0;
 
-	if (!slave)
-		return -EINVAL;
-
 	/* Read data from Slave GW data descriptor. */
 	mlxbf_i2c_smbus_read_data(priv, data_desc, recv_bytes,
 				  MLXBF_I2C_SLAVE_DATA_DESC_ADDR);
-
-	/* Check whether its our slave address. */
 	addr = data_desc[0] >> 1;
-	if (slave->addr != addr)
-		return -EINVAL;
 
 	/*
-	 * Notify the slave backend; another I2C master wants to write data
-	 * to us. This event is sent once the slave address and the write bit
-	 * is detected.
+	 * Check if the slave address received in the data descriptor register
+	 * matches any of the slave addresses registered.
+	 */
+	slave = mlxbf_i2c_get_slave_from_addr(priv, addr);
+	if (!slave) {
+		ret = -EINVAL;
+		goto clear_csr;
+	}
+
+	/*
+	 * Notify the slave backend that an smbus master wants to write data
+	 * to the BlueField.
 	 */
 	i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
 
@@ -1993,9 +1967,13 @@ static int mlxbf_smbus_irq_recv(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
 			break;
 	}
 
-	/* Send a stop condition to the backend. */
+	/*
+	 * Send a stop event to the slave backend, to signal
+	 * the end of the write transactions.
+	 */
 	i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
 
+clear_csr:
 	/* Release the Slave GW. */
 	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_RS_MASTER_BYTES);
 	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_PEC);
@@ -2004,7 +1982,7 @@ static int mlxbf_smbus_irq_recv(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
 	return ret;
 }
 
-static irqreturn_t mlxbf_smbus_irq(int irq, void *ptr)
+static irqreturn_t mlxbf_i2c_irq(int irq, void *ptr)
 {
 	struct mlxbf_i2c_priv *priv = ptr;
 	bool read, write, irq_is_set;
@@ -2052,9 +2030,9 @@ static irqreturn_t mlxbf_smbus_irq(int irq, void *ptr)
 		MLXBF_I2C_SLAVE_DATA_DESC_SIZE : recv_bytes;
 
 	if (read)
-		mlxbf_smbus_irq_send(priv, recv_bytes);
+		mlxbf_i2c_irq_send(priv, recv_bytes);
 	else
-		mlxbf_smbus_irq_recv(priv, recv_bytes);
+		mlxbf_i2c_irq_recv(priv, recv_bytes);
 
 	return IRQ_HANDLED;
 }
@@ -2149,23 +2127,21 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 static int mlxbf_i2c_reg_slave(struct i2c_client *slave)
 {
 	struct mlxbf_i2c_priv *priv = i2c_get_adapdata(slave->adapter);
+	struct device *dev = &slave->dev;
 	int ret;
 
-	if (priv->slave)
-		return -EBUSY;
-
 	/*
 	 * Do not support ten bit chip address and do not use Packet Error
 	 * Checking (PEC).
 	 */
-	if (slave->flags & (I2C_CLIENT_TEN | I2C_CLIENT_PEC))
+	if (slave->flags & (I2C_CLIENT_TEN | I2C_CLIENT_PEC)) {
+		dev_err(dev, "SMBus PEC and 10 bit address not supported\n");
 		return -EAFNOSUPPORT;
+	}
 
-	ret = mlxbf_slave_enable(priv, slave->addr);
-	if (ret < 0)
-		return ret;
-
-	priv->slave = slave;
+	ret = mlxbf_i2c_slave_enable(priv, slave);
+	if (ret)
+		dev_err(dev, "Surpassed max number of registered slaves allowed\n");
 
 	return 0;
 }
@@ -2173,18 +2149,19 @@ static int mlxbf_i2c_reg_slave(struct i2c_client *slave)
 static int mlxbf_i2c_unreg_slave(struct i2c_client *slave)
 {
 	struct mlxbf_i2c_priv *priv = i2c_get_adapdata(slave->adapter);
+	struct device *dev = &slave->dev;
 	int ret;
 
-	WARN_ON(!priv->slave);
-
-	/* Unregister slave, i.e. disable the slave address in hardware. */
-	ret = mlxbf_slave_disable(priv);
-	if (ret < 0)
-		return ret;
-
-	priv->slave = NULL;
+	/*
+	 * Unregister slave by:
+	 * 1) Disabling the slave address in hardware
+	 * 2) Freeing priv->slave at the corresponding index
+	 */
+	ret = mlxbf_i2c_slave_disable(priv, slave->addr);
+	if (ret)
+		dev_err(dev, "Unable to find slave 0x%x\n", slave->addr);
 
-	return 0;
+	return ret;
 }
 
 static u32 mlxbf_i2c_functionality(struct i2c_adapter *adap)
@@ -2392,7 +2369,7 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
-	ret = devm_request_irq(dev, irq, mlxbf_smbus_irq,
+	ret = devm_request_irq(dev, irq, mlxbf_i2c_irq,
 			       IRQF_SHARED | IRQF_PROBE_SHARED,
 			       dev_name(dev), priv);
 	if (ret < 0) {
@@ -2487,4 +2464,5 @@ module_exit(mlxbf_i2c_exit);
 
 MODULE_DESCRIPTION("Mellanox BlueField I2C bus driver");
 MODULE_AUTHOR("Khalil Blaiech <kblaiech@nvidia.com>");
+MODULE_AUTHOR("Asmaa Mnebhi <asmaa@nvidia.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.30.1

