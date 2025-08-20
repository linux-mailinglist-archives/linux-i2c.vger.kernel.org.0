Return-Path: <linux-i2c+bounces-12359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CBB2E184
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 17:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B38AC1C43E62
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 15:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A492F322754;
	Wed, 20 Aug 2025 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKPOZ26/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E47332274E;
	Wed, 20 Aug 2025 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755704928; cv=none; b=nvYcV6zxszCj0e5F1waYSrPqvzbp4K5b+aMRI0rfIIaSO/Wx15vOeX7lHTEQ+CDXM+XtuqKEGrBzrdLnFRo2vemnF9Y+adI6TkU6h8K7VLrpcZdx1at2Q/qb+qsUBJEKE9zntl44Hh2YH4zKwy9guP0NTyK9t3EMt+7U44pBC38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755704928; c=relaxed/simple;
	bh=rq3CZA4VGSUKbwkFapgCSXvkYDvqT5nxUvNcLVO3jc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M40j554XiAEajAF9bEpUG4xoucctlXmKek2QToeQIyElgQJIduMvzcR32/NEl9nkPfKkj6coLMJpa0F0CueSSWSrjbfXnLYsR6UAhFzd4NGfS3zSCanwxsw1tOumPNc15Xhio0Ikhj/TXOD0xWgAxG4hf82GVXnKLqucICbVT1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKPOZ26/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C04C4CEEB;
	Wed, 20 Aug 2025 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755704925;
	bh=rq3CZA4VGSUKbwkFapgCSXvkYDvqT5nxUvNcLVO3jc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kKPOZ26/3xjUICdvVUcrO0VhwN+sV8a91wxW1394DpOaca/X3AC0/9a6Fw6KS+qvr
	 v2a+LZOszdnkb/782uMMQtDav2IucFID7I0SPEf1I9qs57c0jaSlgoDdJBj7Gov8UW
	 rfp8Db7MyZNHDWAwG9KJ8AGhEEb6e9bZIsQL6KvCwNNVXxJaPHQHj/XXXrGkkILzXY
	 4IKiIZRgbkyeHdYXi850Teb1m9R/M1zQZFC1NmmKJYnY9I4adpqF3LmN+Vr2Tq0nnX
	 mjDrvPqCPEBNjeEaxDzzDyywvwho5LvgqsWBJPgRWr9hPWViwiaCSF6Iao/NG2aa8u
	 h5o2mrjS8RSMA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 2/2] i2c: designware: Implement atomic transfer suppot
Date: Wed, 20 Aug 2025 23:31:25 +0800
Message-ID: <20250820153125.22002-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820153125.22002-1-jszhang@kernel.org>
References: <20250820153125.22002-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the read and write code paths in the driver to support operation
in atomic contexts. To achieve this, the driver must not rely on IRQs
or perform any scheduling, e.g., via a sleep or schedule routine.

Implement atomic, sleep-free, and IRQ-less operation. This increases
complexity but is necessary for atomic I2C transfers required by some
hardware configurations, e.g., to trigger reboots on an external PMIC chip.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i2c/busses/i2c-designware-common.c | 38 +++++++---
 drivers/i2c/busses/i2c-designware-core.h   |  5 +-
 drivers/i2c/busses/i2c-designware-master.c | 80 +++++++++++++++++++---
 3 files changed, 100 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index b4e38bc0f876..0b24ac0357ad 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -532,15 +532,23 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 			 * 25us) to ensure the I2C ENABLE bit is already set
 			 * as described in the DesignWare I2C databook.
 			 */
-			fsleep(DIV_ROUND_CLOSEST_ULL(10 * MICRO, t->bus_freq_hz));
+			if (dev->atomic)
+				udelay(DIV_ROUND_CLOSEST_ULL(10 * MICRO, t->bus_freq_hz));
+			else
+				fsleep(DIV_ROUND_CLOSEST_ULL(10 * MICRO, t->bus_freq_hz));
 			/* Set ENABLE bit before setting ABORT */
 			enable |= DW_IC_ENABLE_ENABLE;
 		}
 
 		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
-		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
-					       !(enable & DW_IC_ENABLE_ABORT), 10,
-					       100);
+		if (dev->atomic)
+			ret = regmap_read_poll_timeout_atomic(dev->map, DW_IC_ENABLE, enable,
+							      !(enable & DW_IC_ENABLE_ABORT), 10,
+							      100);
+		else
+			ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
+						       !(enable & DW_IC_ENABLE_ABORT), 10,
+						       100);
 		if (ret)
 			dev_err(dev->dev, "timeout while trying to abort current transfer\n");
 	}
@@ -560,7 +568,10 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 		 * transfer supported by the driver (for 400kHz this is
 		 * 25us) as described in the DesignWare I2C databook.
 		 */
-		usleep_range(25, 250);
+		if (dev->atomic)
+			udelay(25);
+		else
+			usleep_range(25, 250);
 	} while (timeout--);
 
 	dev_warn(dev->dev, "timeout in disabling adapter\n");
@@ -607,7 +618,7 @@ int i2c_dw_acquire_lock(struct dw_i2c_dev *dev)
 {
 	int ret;
 
-	if (!dev->acquire_lock)
+	if (dev->atomic || !dev->acquire_lock)
 		return 0;
 
 	ret = dev->acquire_lock();
@@ -621,7 +632,7 @@ int i2c_dw_acquire_lock(struct dw_i2c_dev *dev)
 
 void i2c_dw_release_lock(struct dw_i2c_dev *dev)
 {
-	if (dev->release_lock)
+	if (!dev->atomic && dev->release_lock)
 		dev->release_lock();
 }
 
@@ -633,11 +644,18 @@ int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev)
 	unsigned int status;
 	int ret;
 
-	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
-				       !(status & DW_IC_STATUS_ACTIVITY),
-				       1100, 20000);
+	if (dev->atomic)
+		ret = regmap_read_poll_timeout_atomic(dev->map, DW_IC_STATUS, status,
+						      !(status & DW_IC_STATUS_ACTIVITY),
+						      1100, 20000);
+	else
+		ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
+					       !(status & DW_IC_STATUS_ACTIVITY),
+					       1100, 20000);
 	if (ret) {
 		dev_warn(dev->dev, "timeout waiting for bus ready\n");
+		if (dev->atomic)
+			return ret;
 
 		i2c_recover_bus(&dev->adapter);
 
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 347843b4f5dd..7384ec5a7ab7 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -299,6 +299,7 @@ struct dw_i2c_dev {
 	void			(*release_lock)(void);
 	int			semaphore_idx;
 	bool			shared_with_punit;
+	bool			atomic;
 	int			(*init)(struct dw_i2c_dev *dev);
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
@@ -365,7 +366,7 @@ static inline void __i2c_dw_disable_nowait(struct dw_i2c_dev *dev)
 static inline void __i2c_dw_write_intr_mask(struct dw_i2c_dev *dev,
 					    unsigned int intr_mask)
 {
-	unsigned int val = dev->flags & ACCESS_POLLING ? 0 : intr_mask;
+	unsigned int val = (dev->atomic || dev->flags & ACCESS_POLLING) ? 0 : intr_mask;
 
 	regmap_write(dev->map, DW_IC_INTR_MASK, val);
 	dev->sw_mask = intr_mask;
@@ -374,7 +375,7 @@ static inline void __i2c_dw_write_intr_mask(struct dw_i2c_dev *dev,
 static inline void __i2c_dw_read_intr_mask(struct dw_i2c_dev *dev,
 					   unsigned int *intr_mask)
 {
-	if (!(dev->flags & ACCESS_POLLING))
+	if (!(dev->flags & ACCESS_POLLING) && !dev->atomic)
 		regmap_read(dev->map, DW_IC_INTR_MASK, intr_mask);
 	else
 		*intr_mask = dev->sw_mask;
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index cbd88ffa5610..333ec9bacae4 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -312,9 +312,14 @@ static bool i2c_dw_is_controller_active(struct dw_i2c_dev *dev)
 	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
 		return false;
 
-	return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
-				       !(status & DW_IC_STATUS_MASTER_ACTIVITY),
-				       1100, 20000) != 0;
+	if (dev->atomic)
+		return regmap_read_poll_timeout_atomic(dev->map, DW_IC_STATUS, status,
+						       !(status & DW_IC_STATUS_MASTER_ACTIVITY),
+						       1100, 20000) != 0;
+	else
+		return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
+					       !(status & DW_IC_STATUS_MASTER_ACTIVITY),
+					       1100, 20000) != 0;
 }
 
 static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
@@ -654,7 +659,7 @@ static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
 	 *
 	 * The raw version might be useful for debugging purposes.
 	 */
-	if (!(dev->flags & ACCESS_POLLING)) {
+	if (!(dev->flags & ACCESS_POLLING) && !dev->atomic) {
 		regmap_read(dev->map, DW_IC_INTR_STAT, &stat);
 	} else {
 		regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
@@ -801,11 +806,32 @@ static int i2c_dw_wait_transfer(struct dw_i2c_dev *dev)
 	return ret ? 0 : -ETIMEDOUT;
 }
 
+static int i2c_dw_wait_transfer_atomic(struct dw_i2c_dev *dev)
+{
+	ktime_t timeout = ktime_add_us(ktime_get(), jiffies_to_usecs(dev->adapter.timeout));
+	unsigned int stat;
+	int ret;
+
+	do {
+		ret = try_wait_for_completion(&dev->cmd_complete);
+		if (ret)
+			break;
+
+		stat = i2c_dw_read_clear_intrbits(dev);
+		if (stat)
+			i2c_dw_process_transfer(dev, stat);
+		else
+			udelay(15);
+	} while (ktime_compare(ktime_get(), timeout) < 0);
+
+	return ret ? 0 : -ETIMEDOUT;
+}
+
 /*
  * Prepare controller for a transaction and call i2c_dw_xfer_msg.
  */
 static int
-i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+i2c_dw_xfer_core(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
 	int ret;
@@ -816,13 +842,19 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_AMD_NAVI_GPU:
+		if (dev->atomic) {
+			ret = -EOPNOTSUPP;
+			goto done_nolock;
+		}
+
 		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
 		goto done_nolock;
 	default:
 		break;
 	}
 
-	reinit_completion(&dev->cmd_complete);
+	if (!dev->atomic)
+		reinit_completion(&dev->cmd_complete);
 	dev->msgs = msgs;
 	dev->msgs_num = num;
 	dev->cmd_err = 0;
@@ -845,12 +877,18 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	i2c_dw_xfer_init(dev);
 
 	/* Wait for tx to complete */
-	ret = i2c_dw_wait_transfer(dev);
+	if (dev->atomic)
+		ret = i2c_dw_wait_transfer_atomic(dev);
+	else
+		ret = i2c_dw_wait_transfer(dev);
+
 	if (ret) {
 		dev_err(dev->dev, "controller timed out\n");
-		/* i2c_dw_init_master() implicitly disables the adapter */
-		i2c_recover_bus(&dev->adapter);
-		i2c_dw_init_master(dev);
+		if (!dev->atomic) {
+			/* i2c_dw_init_master() implicitly disables the adapter */
+			i2c_recover_bus(&dev->adapter);
+			i2c_dw_init_master(dev);
+		}
 		goto done;
 	}
 
@@ -907,7 +945,25 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	return ret;
 }
 
-static const struct i2c_algorithm i2c_dw_algo = {
+static int
+i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	dev->atomic = false;
+	return i2c_dw_xfer_core(adap, msgs, num);
+}
+
+static int
+i2c_dw_xfer_atomic(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	dev->atomic = true;
+	return i2c_dw_xfer_core(adap, msgs, num);
+}
+
+static struct i2c_algorithm i2c_dw_algo = {
 	.xfer = i2c_dw_xfer,
 	.functionality = i2c_dw_func,
 };
@@ -1048,6 +1104,8 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 			  "Synopsys DesignWare I2C adapter");
 	adap->retries = 3;
 	adap->algo = &i2c_dw_algo;
+	if (!dev->acquire_lock)
+		i2c_dw_algo.xfer_atomic = i2c_dw_xfer_atomic,
 	adap->quirks = &i2c_dw_quirks;
 	adap->dev.parent = dev->dev;
 	i2c_set_adapdata(adap, dev);
-- 
2.50.1


