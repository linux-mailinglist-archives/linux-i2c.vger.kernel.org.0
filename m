Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555952A5088
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Nov 2020 20:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbgKCTys (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 14:54:48 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8031 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgKCTys (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Nov 2020 14:54:48 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa1b58b0000>; Tue, 03 Nov 2020 11:54:51 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 19:54:47 +0000
Received: from vdi.nvidia.com (10.124.1.5) by mail.nvidia.com (172.20.187.18)
 with Microsoft SMTP Server id 15.0.1473.3 via Frontend Transport; Tue, 3 Nov
 2020 19:54:47 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <kblaiech@nvidia.com>, <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-next v2 3/6] i2c: mlxbf: Remove unecessary wrapper functions
Date:   Tue, 3 Nov 2020 14:54:40 -0500
Message-ID: <e1d92125190a5846bae64f64168f48e642e2274d.1604432921.git.kblaiech@nvidia.com>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <cover.1604432921.git.kblaiech@nvidia.com>
References: <cover.1604432921.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604433291; bh=UZHactAh7auD8qGjRMNcFRckhJIt+RNpKfBXp5vCIgA=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=W4U9AsnhKdUqUd6WpWWqKPwmTvBjgSFVBv8b5mbU07vbeb1wKUjf4M9lRSMXi91WV
         QwoiecGc4EedJHu+sb+LzVvP9Uj013hlFy/CqOOclpFg3yT58q/lzQy1U3cpn7RI4i
         j9IGNEKN1Xc2Sq98G2ZdnyXeackHIR2Ohm+MSsy8T9y9vGfNoZ07o3hg6mXgYd+WP2
         CWqktuqr671w/SFmvuFd1TLljPP+XOG4WE2FaojNMjcxDPlPxyeE78041ZsrNNMpOU
         iXfgG6XCyaTDcnP51XszbV4lCVesB11BlzCfqcXcg9h2SuLVAuhd/0OA8KjWQJXFNK
         6MwXOoYNksshQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Few wrapper functions are useless and can be inlined. So
delete mlxbf_i2c_read() and mlxbf_i2c_write() and replace
them with readl() and writel(), respectively. Also delete
mlxbf_i2c_read_data() and mlxbf_i2c_write() and replace
them with ioread32be() and iowrite32be(), respectively.

Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueField SoC")
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 183 ++++++++++++++++-------------------------
 1 file changed, 72 insertions(+), 111 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 4bd80b1..fca8a3b 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -489,44 +489,6 @@ static struct mutex mlxbf_i2c_bus_lock;
 
 #define MLXBF_I2C_FREQUENCY_1GHZ  1000000000
 
-static void mlxbf_i2c_write(void __iomem *io, int reg, u32 val)
-{
-	writel(val, io + reg);
-}
-
-static u32 mlxbf_i2c_read(void __iomem *io, int reg)
-{
-	return readl(io + reg);
-}
-
-/*
- * This function is used to read data from Master GW Data Descriptor.
- * Data bytes in the Master GW Data Descriptor are shifted left so the
- * data starts at the MSB of the descriptor registers as set by the
- * underlying hardware. TYU_READ_DATA enables byte swapping while
- * reading data bytes, and MUST be called by the SMBus read routines
- * to copy data from the 32 * 32-bit HW Data registers a.k.a Master GW
- * Data Descriptor.
- */
-static u32 mlxbf_i2c_read_data(void __iomem *io, int reg)
-{
-	return ioread32be(io + reg);
-}
-
-/*
- * This function is used to write data to the Master GW Data Descriptor.
- * Data copied to the Master GW Data Descriptor MUST be shifted left so
- * the data starts at the MSB of the descriptor registers as required by
- * the underlying hardware. TYU_WRITE_DATA enables byte swapping when
- * writing data bytes, and MUST be called by the SMBus write routines to
- * copy data to the 32 * 32-bit HW Data registers a.k.a Master GW Data
- * Descriptor.
- */
-static void mlxbf_i2c_write_data(void __iomem *io, int reg, u32 val)
-{
-	iowrite32be(val, io + reg);
-}
-
 /*
  * Function to poll a set of bits at a specific address; it checks whether
  * the bits are equal to zero when eq_zero is set to 'true', and not equal
@@ -541,7 +503,7 @@ static u32 mlxbf_smbus_poll(void __iomem *io, u32 addr, u32 mask,
 	timeout = (timeout / MLXBF_I2C_POLL_FREQ_IN_USEC) + 1;
 
 	do {
-		bits = mlxbf_i2c_read(io, addr) & mask;
+		bits = readl(io + addr) & mask;
 		if (eq_zero ? bits == 0 : bits != 0)
 			return eq_zero ? 1 : bits;
 		udelay(MLXBF_I2C_POLL_FREQ_IN_USEC);
@@ -609,16 +571,16 @@ static int mlxbf_i2c_smbus_check_status(struct mlxbf_i2c_priv *priv)
 			 MLXBF_I2C_SMBUS_TIMEOUT);
 
 	/* Read cause status bits. */
-	cause_status_bits = mlxbf_i2c_read(priv->mst_cause->io,
-					   MLXBF_I2C_CAUSE_ARBITER);
+	cause_status_bits = readl(priv->mst_cause->io +
+					MLXBF_I2C_CAUSE_ARBITER);
 	cause_status_bits &= MLXBF_I2C_CAUSE_MASTER_ARBITER_BITS_MASK;
 
 	/*
 	 * Parse both Cause and Master GW bits, then return transaction status.
 	 */
 
-	master_status_bits = mlxbf_i2c_read(priv->smbus->io,
-					    MLXBF_I2C_SMBUS_MASTER_STATUS);
+	master_status_bits = readl(priv->smbus->io +
+					MLXBF_I2C_SMBUS_MASTER_STATUS);
 	master_status_bits &= MLXBF_I2C_SMBUS_MASTER_STATUS_MASK;
 
 	if (mlxbf_i2c_smbus_transaction_success(master_status_bits,
@@ -649,10 +611,17 @@ static void mlxbf_i2c_smbus_write_data(struct mlxbf_i2c_priv *priv,
 
 	aligned_length = round_up(length, 4);
 
-	/* Copy data bytes from 4-byte aligned source buffer. */
+	/*
+	 * Copy data bytes from 4-byte aligned source buffer.
+	 * Data copied to the Master GW Data Descriptor MUST be shifted
+	 * left so the data starts at the MSB of the descriptor registers
+	 * as required by the underlying hardware. Enable byte swapping
+	 * when writing data bytes to the 32 * 32-bit HW Data registers
+	 * a.k.a Master GW Data Descriptor.
+	 */
 	for (offset = 0; offset < aligned_length; offset += sizeof(u32)) {
 		data32 = *((u32 *)(data + offset));
-		mlxbf_i2c_write_data(priv->smbus->io, addr + offset, data32);
+		iowrite32be(data32, priv->smbus->io + addr + offset);
 	}
 }
 
@@ -664,15 +633,23 @@ static void mlxbf_i2c_smbus_read_data(struct mlxbf_i2c_priv *priv,
 
 	mask = sizeof(u32) - 1;
 
+	/*
+	 * Data bytes in the Master GW Data Descriptor are shifted left
+	 * so the data starts at the MSB of the descriptor registers as
+	 * set by the underlying hardware. Enable byte swapping while
+	 * reading data bytes from the 32 * 32-bit HW Data registers
+	 * a.k.a Master GW Data Descriptor.
+	 */
+
 	for (offset = 0; offset < (length & ~mask); offset += sizeof(u32)) {
-		data32 = mlxbf_i2c_read_data(priv->smbus->io, addr + offset);
+		data32 = ioread32be(priv->smbus->io + addr + offset);
 		*((u32 *)(data + offset)) = data32;
 	}
 
 	if (!(length & mask))
 		return;
 
-	data32 = mlxbf_i2c_read_data(priv->smbus->io, addr + offset);
+	data32 = ioread32be(priv->smbus->io + addr + offset);
 
 	for (byte = 0; byte < (length & mask); byte++) {
 		data[offset + byte] = data32 & GENMASK(7, 0);
@@ -698,16 +675,16 @@ static int mlxbf_i2c_smbus_enable(struct mlxbf_i2c_priv *priv, u8 slave,
 	command |= rol32(pec_en, MLXBF_I2C_MASTER_SEND_PEC_SHIFT);
 
 	/* Clear status bits. */
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_MASTER_STATUS, 0x0);
+	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_STATUS);
 	/* Set the cause data. */
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_CAUSE_OR_CLEAR, ~0x0);
+	writel(~0x0, priv->smbus->io + MLXBF_I2C_CAUSE_OR_CLEAR);
 	/* Zero PEC byte. */
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_MASTER_PEC, 0x0);
+	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_PEC);
 	/* Zero byte count. */
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_RS_BYTES, 0x0);
+	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_RS_BYTES);
 
 	/* GW activation. */
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_MASTER_GW, command);
+	writel(command, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_GW);
 
 	/*
 	 * Poll master status and check status bits. An ACK is sent when
@@ -823,8 +800,8 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 		 * needs to be 'manually' reset. This should be removed in
 		 * next tag integration.
 		 */
-		mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_MASTER_FSM,
-				MLXBF_I2C_SMBUS_MASTER_FSM_PS_STATE_MASK);
+		writel(MLXBF_I2C_SMBUS_MASTER_FSM_PS_STATE_MASK,
+			priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_FSM);
 	}
 
 	return ret;
@@ -1113,8 +1090,8 @@ static void mlxbf_i2c_set_timings(struct mlxbf_i2c_priv *priv,
 	timer |= mlxbf_i2c_set_timer(priv, timings->scl_low,
 				     false, MLXBF_I2C_MASK_16,
 				     MLXBF_I2C_SHIFT_16);
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_TIMER_SCL_LOW_SCL_HIGH,
-			  timer);
+	writel(timer, priv->smbus->io +
+		MLXBF_I2C_SMBUS_TIMER_SCL_LOW_SCL_HIGH);
 
 	timer = mlxbf_i2c_set_timer(priv, timings->sda_rise, false,
 				    MLXBF_I2C_MASK_8, MLXBF_I2C_SHIFT_0);
@@ -1124,37 +1101,34 @@ static void mlxbf_i2c_set_timings(struct mlxbf_i2c_priv *priv,
 				     MLXBF_I2C_MASK_8, MLXBF_I2C_SHIFT_16);
 	timer |= mlxbf_i2c_set_timer(priv, timings->scl_fall, false,
 				     MLXBF_I2C_MASK_8, MLXBF_I2C_SHIFT_24);
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_TIMER_FALL_RISE_SPIKE,
-			  timer);
+	writel(timer, priv->smbus->io +
+		MLXBF_I2C_SMBUS_TIMER_FALL_RISE_SPIKE);
 
 	timer = mlxbf_i2c_set_timer(priv, timings->hold_start, true,
 				    MLXBF_I2C_MASK_16, MLXBF_I2C_SHIFT_0);
 	timer |= mlxbf_i2c_set_timer(priv, timings->hold_data, true,
 				     MLXBF_I2C_MASK_16, MLXBF_I2C_SHIFT_16);
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_TIMER_THOLD, timer);
+	writel(timer, priv->smbus->io + MLXBF_I2C_SMBUS_TIMER_THOLD);
 
 	timer = mlxbf_i2c_set_timer(priv, timings->setup_start, true,
 				    MLXBF_I2C_MASK_16, MLXBF_I2C_SHIFT_0);
 	timer |= mlxbf_i2c_set_timer(priv, timings->setup_stop, true,
 				     MLXBF_I2C_MASK_16, MLXBF_I2C_SHIFT_16);
-	mlxbf_i2c_write(priv->smbus->io,
-			MLXBF_I2C_SMBUS_TIMER_TSETUP_START_STOP, timer);
+	writel(timer, priv->smbus->io +
+		MLXBF_I2C_SMBUS_TIMER_TSETUP_START_STOP);
 
 	timer = mlxbf_i2c_set_timer(priv, timings->setup_data, true,
 				    MLXBF_I2C_MASK_16, MLXBF_I2C_SHIFT_0);
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_TIMER_TSETUP_DATA,
-			  timer);
+	writel(timer, priv->smbus->io + MLXBF_I2C_SMBUS_TIMER_TSETUP_DATA);
 
 	timer = mlxbf_i2c_set_timer(priv, timings->buf, false,
 				    MLXBF_I2C_MASK_16, MLXBF_I2C_SHIFT_0);
 	timer |= mlxbf_i2c_set_timer(priv, timings->thigh_max, false,
 				     MLXBF_I2C_MASK_16, MLXBF_I2C_SHIFT_16);
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_THIGH_MAX_TBUF,
-			timer);
+	writel(timer, priv->smbus->io + MLXBF_I2C_SMBUS_THIGH_MAX_TBUF);
 
 	timer = timings->timeout;
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_SCL_LOW_TIMEOUT,
-			timer);
+	writel(timer, priv->smbus->io + MLXBF_I2C_SMBUS_SCL_LOW_TIMEOUT);
 }
 
 enum mlxbf_i2c_timings_config {
@@ -1426,19 +1400,15 @@ static int mlxbf_i2c_init_master(struct platform_device *pdev,
 	 * platform firmware; disabling the bus might compromise the system
 	 * functionality.
 	 */
-	config_reg = mlxbf_i2c_read(gpio_res->io,
-				    MLXBF_I2C_GPIO_0_FUNC_EN_0);
+	config_reg = readl(gpio_res->io + MLXBF_I2C_GPIO_0_FUNC_EN_0);
 	config_reg = MLXBF_I2C_GPIO_SMBUS_GW_ASSERT_PINS(priv->bus,
 							 config_reg);
-	mlxbf_i2c_write(gpio_res->io, MLXBF_I2C_GPIO_0_FUNC_EN_0,
-			config_reg);
+	writel(config_reg, gpio_res->io + MLXBF_I2C_GPIO_0_FUNC_EN_0);
 
-	config_reg = mlxbf_i2c_read(gpio_res->io,
-				    MLXBF_I2C_GPIO_0_FORCE_OE_EN);
+	config_reg = readl(gpio_res->io + MLXBF_I2C_GPIO_0_FORCE_OE_EN);
 	config_reg = MLXBF_I2C_GPIO_SMBUS_GW_RESET_PINS(priv->bus,
 							config_reg);
-	mlxbf_i2c_write(gpio_res->io, MLXBF_I2C_GPIO_0_FORCE_OE_EN,
-			config_reg);
+	writel(config_reg, gpio_res->io + MLXBF_I2C_GPIO_0_FORCE_OE_EN);
 
 	mutex_unlock(gpio_res->lock);
 
@@ -1454,8 +1424,7 @@ static u64 mlxbf_calculate_freq_from_tyu(struct mlxbf_i2c_resource *corepll_res)
 
 	pad_frequency = MLXBF_I2C_TYU_PLL_IN_FREQ;
 
-	corepll_val = mlxbf_i2c_read(corepll_res->io,
-				     MLXBF_I2C_CORE_PLL_REG1);
+	corepll_val = readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG1);
 
 	/* Get Core PLL configuration bits. */
 	core_f = rol32(corepll_val, MLXBF_I2C_COREPLL_CORE_F_TYU_SHIFT) &
@@ -1490,10 +1459,8 @@ static u64 mlxbf_calculate_freq_from_yu(struct mlxbf_i2c_resource *corepll_res)
 
 	pad_frequency = MLXBF_I2C_YU_PLL_IN_FREQ;
 
-	corepll_reg1_val = mlxbf_i2c_read(corepll_res->io,
-					  MLXBF_I2C_CORE_PLL_REG1);
-	corepll_reg2_val = mlxbf_i2c_read(corepll_res->io,
-					  MLXBF_I2C_CORE_PLL_REG2);
+	corepll_reg1_val = readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG1);
+	corepll_reg2_val = readl(corepll_res->io + MLXBF_I2C_CORE_PLL_REG2);
 
 	/* Get Core PLL configuration bits */
 	core_f = rol32(corepll_reg1_val, MLXBF_I2C_COREPLL_CORE_F_YU_SHIFT) &
@@ -1585,7 +1552,7 @@ static int mlxbf_slave_enable(struct mlxbf_i2c_priv *priv, u8 addr)
 	 * (7-bit address, 1 status bit (1 if enabled, 0 if not)).
 	 */
 	for (reg = 0; reg < reg_cnt; reg++) {
-		slave_reg = mlxbf_i2c_read(priv->smbus->io,
+		slave_reg = readl(priv->smbus->io +
 				MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG + reg * 0x4);
 		/*
 		 * Each register holds 4 slave addresses. So, we have to keep
@@ -1643,8 +1610,8 @@ static int mlxbf_slave_enable(struct mlxbf_i2c_priv *priv, u8 addr)
 
 	/* Enable the slave address and update the register. */
 	slave_reg |= (1 << MLXBF_I2C_SMBUS_SLAVE_ADDR_EN_BIT) << (byte * 8);
-	mlxbf_i2c_write(priv->smbus->io,
-			MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG + reg * 0x4, slave_reg);
+	writel(slave_reg, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG +
+		reg * 0x4);
 
 	return 0;
 }
@@ -1668,7 +1635,7 @@ static int mlxbf_slave_disable(struct mlxbf_i2c_priv *priv)
 	 * (7-bit address, 1 status bit (1 if enabled, 0 if not)).
 	 */
 	for (reg = 0; reg < reg_cnt; reg++) {
-		slave_reg = mlxbf_i2c_read(priv->smbus->io,
+		slave_reg = readl(priv->smbus->io +
 				MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG + reg * 0x4);
 
 		/* Check whether the address slots are empty. */
@@ -1708,8 +1675,8 @@ static int mlxbf_slave_disable(struct mlxbf_i2c_priv *priv)
 
 	/* Cleanup the slave address slot. */
 	slave_reg &= ~(GENMASK(7, 0) << (slave_byte * 8));
-	mlxbf_i2c_write(priv->smbus->io,
-			MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG + reg * 0x4, slave_reg);
+	writel(slave_reg, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_ADDR_CFG +
+		reg * 0x4);
 
 	return 0;
 }
@@ -1801,7 +1768,7 @@ static int mlxbf_i2c_init_slave(struct platform_device *pdev,
 	int ret;
 
 	/* Reset FSM. */
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_SLAVE_FSM, 0);
+	writel(0, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_FSM);
 
 	/*
 	 * Enable slave cause interrupt bits. Drive
@@ -1810,15 +1777,13 @@ static int mlxbf_i2c_init_slave(struct platform_device *pdev,
 	 * masters issue a Read and Write, respectively. But, clear all
 	 * interrupts first.
 	 */
-	mlxbf_i2c_write(priv->slv_cause->io,
-			  MLXBF_I2C_CAUSE_OR_CLEAR, ~0);
+	writel(~0, priv->slv_cause->io + MLXBF_I2C_CAUSE_OR_CLEAR);
 	int_reg = MLXBF_I2C_CAUSE_READ_WAIT_FW_RESPONSE;
 	int_reg |= MLXBF_I2C_CAUSE_WRITE_SUCCESS;
-	mlxbf_i2c_write(priv->slv_cause->io,
-			  MLXBF_I2C_CAUSE_OR_EVTEN0, int_reg);
+	writel(int_reg, priv->slv_cause->io + MLXBF_I2C_CAUSE_OR_EVTEN0);
 
 	/* Finally, set the 'ready' bit to start handling transactions. */
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_SLAVE_READY, 0x1);
+	writel(0x1, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_READY);
 
 	/* Initialize the cause coalesce resource. */
 	ret = mlxbf_i2c_init_coalesce(pdev, priv);
@@ -1844,23 +1809,21 @@ static bool mlxbf_i2c_has_coalesce(struct mlxbf_i2c_priv *priv, bool *read,
 				MLXBF_I2C_CAUSE_YU_SLAVE_BIT :
 				priv->bus + MLXBF_I2C_CAUSE_TYU_SLAVE_BIT;
 
-	coalesce0_reg = mlxbf_i2c_read(priv->coalesce->io,
-				       MLXBF_I2C_CAUSE_COALESCE_0);
+	coalesce0_reg = readl(priv->coalesce->io + MLXBF_I2C_CAUSE_COALESCE_0);
 	is_set = coalesce0_reg & (1 << slave_shift);
 
 	if (!is_set)
 		return false;
 
 	/* Check the source of the interrupt, i.e. whether a Read or Write. */
-	cause_reg = mlxbf_i2c_read(priv->slv_cause->io,
-				     MLXBF_I2C_CAUSE_ARBITER);
+	cause_reg = readl(priv->slv_cause->io + MLXBF_I2C_CAUSE_ARBITER);
 	if (cause_reg & MLXBF_I2C_CAUSE_READ_WAIT_FW_RESPONSE)
 		*read = true;
 	else if (cause_reg & MLXBF_I2C_CAUSE_WRITE_SUCCESS)
 		*write = true;
 
 	/* Clear cause bits. */
-	mlxbf_i2c_write(priv->slv_cause->io, MLXBF_I2C_CAUSE_OR_CLEAR, ~0x0);
+	writel(~0x0, priv->slv_cause->io + MLXBF_I2C_CAUSE_OR_CLEAR);
 
 	return true;
 }
@@ -1900,8 +1863,8 @@ static int mlxbf_smbus_irq_send(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
 	 * address, if supplied.
 	 */
 	if (recv_bytes > 0) {
-		data32 = mlxbf_i2c_read_data(priv->smbus->io,
-					     MLXBF_I2C_SLAVE_DATA_DESC_ADDR);
+		data32 = ioread32be(priv->smbus->io +
+					MLXBF_I2C_SLAVE_DATA_DESC_ADDR);
 
 		/* Parse the received bytes. */
 		switch (recv_bytes) {
@@ -1966,7 +1929,7 @@ static int mlxbf_smbus_irq_send(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
 	control32 |= rol32(write_size, MLXBF_I2C_SLAVE_WRITE_BYTES_SHIFT);
 	control32 |= rol32(pec_en, MLXBF_I2C_SLAVE_SEND_PEC_SHIFT);
 
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_SLAVE_GW, control32);
+	writel(control32, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_GW);
 
 	/*
 	 * Wait until the transfer is completed; the driver will wait
@@ -1975,10 +1938,9 @@ static int mlxbf_smbus_irq_send(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
 	mlxbf_smbus_slave_wait_for_idle(priv, MLXBF_I2C_SMBUS_TIMEOUT);
 
 	/* Release the Slave GW. */
-	mlxbf_i2c_write(priv->smbus->io,
-			MLXBF_I2C_SMBUS_SLAVE_RS_MASTER_BYTES, 0x0);
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_SLAVE_PEC, 0x0);
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_SLAVE_READY, 0x1);
+	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_RS_MASTER_BYTES);
+	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_PEC);
+	writel(0x1, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_READY);
 
 	return 0;
 }
@@ -2023,10 +1985,9 @@ static int mlxbf_smbus_irq_recv(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
 	i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
 
 	/* Release the Slave GW. */
-	mlxbf_i2c_write(priv->smbus->io,
-			MLXBF_I2C_SMBUS_SLAVE_RS_MASTER_BYTES, 0x0);
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_SLAVE_PEC, 0x0);
-	mlxbf_i2c_write(priv->smbus->io, MLXBF_I2C_SMBUS_SLAVE_READY, 0x1);
+	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_RS_MASTER_BYTES);
+	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_PEC);
+	writel(0x1, priv->smbus->io + MLXBF_I2C_SMBUS_SLAVE_READY);
 
 	return ret;
 }
@@ -2061,8 +2022,8 @@ static irqreturn_t mlxbf_smbus_irq(int irq, void *ptr)
 	 * slave, if the higher 8 bits are sent then the slave expect N bytes
 	 * from the master.
 	 */
-	rw_bytes_reg = mlxbf_i2c_read(priv->smbus->io,
-				      MLXBF_I2C_SMBUS_SLAVE_RS_MASTER_BYTES);
+	rw_bytes_reg = readl(priv->smbus->io +
+				MLXBF_I2C_SMBUS_SLAVE_RS_MASTER_BYTES);
 	recv_bytes = (rw_bytes_reg >> 8) & GENMASK(7, 0);
 
 	/*
-- 
2.1.2

