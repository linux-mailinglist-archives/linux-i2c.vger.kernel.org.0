Return-Path: <linux-i2c+bounces-14577-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18CCC33A5
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 14:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 883413045F3B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 13:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85123930EE;
	Tue, 16 Dec 2025 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QENCmJoC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3FE391FB1;
	Tue, 16 Dec 2025 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890895; cv=none; b=NcDu6FrvVQxFjsyWi7C5kkI161tcns7L/1q/EVx3jG9IIMSIMIgP/jIn+dFNQ00ux9bSDzFhJ1USZewU6OY2arMLjskB3AZgHywTCC6ePNurkVvYQHeH4GrN8mHRdSoB0x/FenidUwgocDmAw8XVjZMo2ud0XnmNzVqtHaLs/6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890895; c=relaxed/simple;
	bh=h2CfKmhj1e2iNy+EfQqUf3AUSlc1m884tGeK2nMZ1xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8TvP583Dl/+0JksylC7LqwEI2Fs+BRu/TYWm7lZo01KrhEVCtM7TLVj7aiQKorOtWNlkfuxLa6s9BkbVuyL9qi9BXcx+bB+by+KwWtXHfrSqbTe68jnlFNk/dYPizRrT6SQ7vbDpyOqan/wOswaCftr8vYOxEYYlY5Amb346Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QENCmJoC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765890894; x=1797426894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h2CfKmhj1e2iNy+EfQqUf3AUSlc1m884tGeK2nMZ1xw=;
  b=QENCmJoC6oFBdwQIqa2oJonTILeEy0pidJkDYoNt4GxyJnRka39yGP1A
   YwvikGyCY/X0pxRRx3yxH3BxFtSxXUj3ZfxXeOhvnUHQyrX97teFnwvAv
   /G4dCLwgZFwRshK+z+DrHArqXjGuZi0Xa7iajr2T6DPFsY4DmSiu4x3oW
   3z2MSLQH+nxtwTkKxm3EeynzKwqGt+iRbZ4SJt4Rs99ZkuMOgXhyDCihH
   Z0wGFHWjgXloOoSWFJunBFGNUP6nHRAFUgn8dH0YwnmrJnFS6vyPMhDwz
   WlY+9bsKewOEgf9LqYA4RxO+5vC3xcGICIzXr48i/J0Il2ciiRllbaL8v
   Q==;
X-CSE-ConnectionGUID: 8MUiGf1PTXylE3vYHQpGzw==
X-CSE-MsgGUID: 6r7DmyYHQeu5Ii8/FjFCJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78444912"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78444912"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:14:53 -0800
X-CSE-ConnectionGUID: 5oqGRDCwT4qkkN4NHVqjEg==
X-CSE-MsgGUID: kwhDZKFVRKmooT6B2vd6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198274420"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2025 05:14:51 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jan Dabros <jsd@semihalf.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/6] i2c: designware: Combine the init functions
Date: Tue, 16 Dec 2025 14:14:39 +0100
Message-ID: <20251216131442.8464-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251216131442.8464-1-heikki.krogerus@linux.intel.com>
References: <20251216131442.8464-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Providing a single function for controller initialisation.
The controller initialisation has the same steps for master
and slave modes, except the timing parameters are only
needed in master mode.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 80 +++++++++++++++++++++-
 drivers/i2c/busses/i2c-designware-core.h   |  3 +-
 drivers/i2c/busses/i2c-designware-master.c | 70 +------------------
 drivers/i2c/busses/i2c-designware-slave.c  | 44 ------------
 4 files changed, 82 insertions(+), 115 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 1823e4b71004..ed9fa2837fef 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -358,6 +358,82 @@ static inline u32 i2c_dw_acpi_round_bus_speed(struct device *device) { return 0;
 
 #endif	/* CONFIG_ACPI */
 
+static void i2c_dw_configure_mode(struct dw_i2c_dev *dev)
+{
+	switch (dev->mode) {
+	case DW_IC_MASTER:
+		regmap_write(dev->map, DW_IC_TX_TL, dev->tx_fifo_depth / 2);
+		regmap_write(dev->map, DW_IC_RX_TL, 0);
+		regmap_write(dev->map, DW_IC_CON, dev->master_cfg);
+		break;
+	case DW_IC_SLAVE:
+		regmap_write(dev->map, DW_IC_TX_TL, 0);
+		regmap_write(dev->map, DW_IC_RX_TL, 0);
+		regmap_write(dev->map, DW_IC_CON, dev->slave_cfg);
+		regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_SLAVE_MASK);
+		break;
+	default:
+		return;
+	}
+}
+
+static void i2c_dw_write_timings(struct dw_i2c_dev *dev)
+{
+	/* Write standard speed timing parameters */
+	regmap_write(dev->map, DW_IC_SS_SCL_HCNT, dev->ss_hcnt);
+	regmap_write(dev->map, DW_IC_SS_SCL_LCNT, dev->ss_lcnt);
+
+	/* Write fast mode/fast mode plus timing parameters */
+	regmap_write(dev->map, DW_IC_FS_SCL_HCNT, dev->fs_hcnt);
+	regmap_write(dev->map, DW_IC_FS_SCL_LCNT, dev->fs_lcnt);
+
+	/* Write high speed timing parameters if supported */
+	if (dev->hs_hcnt && dev->hs_lcnt) {
+		regmap_write(dev->map, DW_IC_HS_SCL_HCNT, dev->hs_hcnt);
+		regmap_write(dev->map, DW_IC_HS_SCL_LCNT, dev->hs_lcnt);
+	}
+}
+
+/**
+ * i2c_dw_init() - Initialize the DesignWare I2C hardware
+ * @dev: device private data
+ *
+ * This functions configures and enables the DesigWare I2C hardware.
+ *
+ * Return: 0 on success, or negative errno otherwise.
+ */
+int i2c_dw_init(struct dw_i2c_dev *dev)
+{
+	int ret;
+
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		return ret;
+
+	/* Disable the adapter */
+	__i2c_dw_disable(dev);
+
+	/*
+	 * Mask SMBus interrupts to block storms from broken
+	 * firmware that leaves IC_SMBUS=1; the handler never
+	 * services them.
+	 */
+	regmap_write(dev->map, DW_IC_SMBUS_INTR_MASK, 0);
+
+	if (dev->mode == DW_IC_MASTER)
+		i2c_dw_write_timings(dev);
+
+	/* Write SDA hold time if supported */
+	if (dev->sda_hold_time)
+		regmap_write(dev->map, DW_IC_SDA_HOLD, dev->sda_hold_time);
+
+	i2c_dw_configure_mode(dev);
+
+	i2c_dw_release_lock(dev);
+
+	return 0;
+}
+
 static void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
 {
 	u32 acpi_speed = i2c_dw_acpi_round_bus_speed(dev->dev);
@@ -798,7 +874,7 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
-	ret = dev->init(dev);
+	ret = i2c_dw_init(dev);
 	if (ret)
 		return ret;
 
@@ -891,7 +967,7 @@ static int i2c_dw_runtime_resume(struct device *device)
 	if (!dev->shared_with_punit)
 		i2c_dw_prepare_clk(dev, true);
 
-	dev->init(dev);
+	i2c_dw_init(dev);
 
 	return 0;
 }
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 0f58c4b50377..82465b134c34 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -240,7 +240,6 @@ struct reset_control;
  * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
  *	-1 if there is no semaphore.
  * @shared_with_punit: true if this bus is shared with the SoC's PUNIT
- * @init: function to initialize the I2C hardware
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
  * @rinfo: I²C GPIO recovery information
@@ -301,7 +300,6 @@ struct dw_i2c_dev {
 	void			(*release_lock)(void);
 	int			semaphore_idx;
 	bool			shared_with_punit;
-	int			(*init)(struct dw_i2c_dev *dev);
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
 	struct i2c_bus_recovery_info rinfo;
@@ -408,6 +406,7 @@ static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
 }
 
 int i2c_dw_probe(struct dw_i2c_dev *dev);
+int i2c_dw_init(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL)
 int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 91540a4520a3..33432bbaec1f 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -31,16 +31,6 @@
 #define AMD_TIMEOUT_MAX_US	250
 #define AMD_MASTERCFG_MASK	GENMASK(15, 0)
 
-static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
-{
-	/* Configure Tx/Rx FIFO threshold levels */
-	regmap_write(dev->map, DW_IC_TX_TL, dev->tx_fifo_depth / 2);
-	regmap_write(dev->map, DW_IC_RX_TL, 0);
-
-	/* Configure the I2C master */
-	regmap_write(dev->map, DW_IC_CON, dev->master_cfg);
-}
-
 static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 {
 	unsigned int comp_param1;
@@ -195,58 +185,6 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-/**
- * i2c_dw_init_master() - Initialize the DesignWare I2C master hardware
- * @dev: device private data
- *
- * This functions configures and enables the I2C master.
- * This function is called during I2C init function, and in case of timeout at
- * run time.
- *
- * Return: 0 on success, or negative errno otherwise.
- */
-static int i2c_dw_init_master(struct dw_i2c_dev *dev)
-{
-	int ret;
-
-	ret = i2c_dw_acquire_lock(dev);
-	if (ret)
-		return ret;
-
-	/* Disable the adapter */
-	__i2c_dw_disable(dev);
-
-	/*
-	 * Mask SMBus interrupts to block storms from broken
-	 * firmware that leaves IC_SMBUS=1; the handler never
-	 * services them.
-	 */
-	regmap_write(dev->map, DW_IC_SMBUS_INTR_MASK, 0);
-
-	/* Write standard speed timing parameters */
-	regmap_write(dev->map, DW_IC_SS_SCL_HCNT, dev->ss_hcnt);
-	regmap_write(dev->map, DW_IC_SS_SCL_LCNT, dev->ss_lcnt);
-
-	/* Write fast mode/fast mode plus timing parameters */
-	regmap_write(dev->map, DW_IC_FS_SCL_HCNT, dev->fs_hcnt);
-	regmap_write(dev->map, DW_IC_FS_SCL_LCNT, dev->fs_lcnt);
-
-	/* Write high speed timing parameters if supported */
-	if (dev->hs_hcnt && dev->hs_lcnt) {
-		regmap_write(dev->map, DW_IC_HS_SCL_HCNT, dev->hs_hcnt);
-		regmap_write(dev->map, DW_IC_HS_SCL_LCNT, dev->hs_lcnt);
-	}
-
-	/* Write SDA hold time if supported */
-	if (dev->sda_hold_time)
-		regmap_write(dev->map, DW_IC_SDA_HOLD, dev->sda_hold_time);
-
-	i2c_dw_configure_fifo_master(dev);
-	i2c_dw_release_lock(dev);
-
-	return 0;
-}
-
 static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 {
 	struct i2c_msg *msgs = dev->msgs;
@@ -843,9 +781,9 @@ i2c_dw_xfer_common(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
 	ret = i2c_dw_wait_transfer(dev);
 	if (ret) {
 		dev_err(dev->dev, "controller timed out\n");
-		/* i2c_dw_init_master() implicitly disables the adapter */
+		/* i2c_dw_init() implicitly disables the adapter */
 		i2c_recover_bus(&dev->adapter);
-		i2c_dw_init_master(dev);
+		i2c_dw_init(dev);
 		goto done;
 	}
 
@@ -950,7 +888,7 @@ static void i2c_dw_unprepare_recovery(struct i2c_adapter *adap)
 
 	i2c_dw_prepare_clk(dev, true);
 	reset_control_deassert(dev->rst);
-	i2c_dw_init_master(dev);
+	i2c_dw_init(dev);
 }
 
 static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
@@ -999,8 +937,6 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 
 	init_completion(&dev->cmd_complete);
 
-	dev->init = i2c_dw_init_master;
-
 	ret = i2c_dw_set_timings_master(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index c0baf53e97d8..9fc8faa33735 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -21,48 +21,6 @@
 
 #include "i2c-designware-core.h"
 
-static void i2c_dw_configure_fifo_slave(struct dw_i2c_dev *dev)
-{
-	/* Configure Tx/Rx FIFO threshold levels. */
-	regmap_write(dev->map, DW_IC_TX_TL, 0);
-	regmap_write(dev->map, DW_IC_RX_TL, 0);
-
-	/* Configure the I2C slave. */
-	regmap_write(dev->map, DW_IC_CON, dev->slave_cfg);
-	regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_SLAVE_MASK);
-}
-
-/**
- * i2c_dw_init_slave() - Initialize the DesignWare i2c slave hardware
- * @dev: device private data
- *
- * This function configures and enables the I2C in slave mode.
- * This function is called during I2C init function, and in case of timeout at
- * run time.
- *
- * Return: 0 on success, or negative errno otherwise.
- */
-static int i2c_dw_init_slave(struct dw_i2c_dev *dev)
-{
-	int ret;
-
-	ret = i2c_dw_acquire_lock(dev);
-	if (ret)
-		return ret;
-
-	/* Disable the adapter. */
-	__i2c_dw_disable(dev);
-
-	/* Write SDA hold time if supported */
-	if (dev->sda_hold_time)
-		regmap_write(dev->map, DW_IC_SDA_HOLD, dev->sda_hold_time);
-
-	i2c_dw_configure_fifo_slave(dev);
-	i2c_dw_release_lock(dev);
-
-	return 0;
-}
-
 int i2c_dw_reg_slave(struct i2c_client *slave)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
@@ -232,8 +190,6 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 	if (dev->flags & ACCESS_POLLING)
 		return -EOPNOTSUPP;
 
-	dev->init = i2c_dw_init_slave;
-
 	return 0;
 }
 
-- 
2.50.1


