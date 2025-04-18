Return-Path: <linux-i2c+bounces-10481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8DAA93F71
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 23:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54ED13B378E
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 21:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F551C84D3;
	Fri, 18 Apr 2025 21:24:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 8.mo575.mail-out.ovh.net (8.mo575.mail-out.ovh.net [46.105.74.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA6F70805
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.74.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745011447; cv=none; b=nfieTyhou2n7kncGjTZsaRB39eWLNFD8cO+0rIKIzwH/5eSRUCcKD9TWXtRir2G/XgRPZ1aGsChvRCSyl9r+Xh9Sb4S0cd/hh1mctPJ0YuVSwuTPHVS07s5kjg0y4EuY/F24hSyZvgUvPpTK8dpYhUg5Rap3Vok/5kwvUDfiWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745011447; c=relaxed/simple;
	bh=o2ln017Zl9ileyW/vJmZqqPP0Shcf1lfLAeYoScXZ0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MT5MDc7pqMnUrDhvh4fk2A+7aa1CC/i0LwdF9W7rfEvW8u6iyWsuw8NyTzq3EuxoFN9qNnjP7kIYJOdd/xJO8ZLDFtjxtzGt9YsXciPVQn5aVJlbI/5EfE2+OBqyVKaGFzsALriST2SYx+Vkvj8rQLPQap/tICPAAJYSucP0Hc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.74.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.140.151])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZfSJC1DT5z1nvL
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:16:59 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-74q2x (unknown [10.110.164.123])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E712F1FDB8;
	Fri, 18 Apr 2025 21:16:58 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
	by ghost-submission-5b5ff79f4f-74q2x with ESMTPSA
	id blpXL0rBAmi1eQAAHE1v4A
	(envelope-from <andi@etezian.org>); Fri, 18 Apr 2025 21:16:58 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S001bd28fce3-5e9d-4766-a0c7-b70f6ca098a5,
                    9BBFD0B8C49B6260DDB62D1D32C292C5393E7E6E) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 08/10] i2c: iproc: Move function and avoid prototypes
Date: Fri, 18 Apr 2025 23:16:33 +0200
Message-ID: <20250418211635.2666234-9-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418211635.2666234-1-andi.shyti@kernel.org>
References: <20250418211635.2666234-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13928226274704362055
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeehmgdpmhhouggvpehsmhhtphhouhht

Shuffle a bit the code in order to avoid prototypes.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 143 ++++++++++++++---------------
 1 file changed, 69 insertions(+), 74 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index d25b393f456b..74903edb4925 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -224,11 +224,6 @@ static void slave_rx_tasklet_fn(unsigned long);
 		| BIT(IS_S_TX_UNDERRUN_SHIFT) | BIT(IS_S_RX_FIFO_FULL_SHIFT)\
 		| BIT(IS_S_RX_THLD_SHIFT))
 
-static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave);
-static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave);
-static void bcm_iproc_i2c_enable_disable(struct bcm_iproc_i2c_dev *iproc_i2c,
-					 bool enable);
-
 static inline u32 iproc_i2c_rd_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
 				   u32 offset)
 {
@@ -316,6 +311,19 @@ static void bcm_iproc_i2c_slave_init(struct bcm_iproc_i2c_dev *iproc_i2c,
 	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
 }
 
+static void bcm_iproc_i2c_enable_disable(struct bcm_iproc_i2c_dev *iproc_i2c,
+					 bool enable)
+{
+	u32 val;
+
+	val = iproc_i2c_rd_reg(iproc_i2c, CFG_OFFSET);
+	if (enable)
+		val |= BIT(CFG_EN_SHIFT);
+	else
+		val &= ~BIT(CFG_EN_SHIFT);
+	iproc_i2c_wr_reg(iproc_i2c, CFG_OFFSET, val);
+}
+
 static bool bcm_iproc_i2c_check_slave_status
 	(struct bcm_iproc_i2c_dev *iproc_i2c, u32 status)
 {
@@ -707,19 +715,6 @@ static void bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)
 	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, 0xffffffff);
 }
 
-static void bcm_iproc_i2c_enable_disable(struct bcm_iproc_i2c_dev *iproc_i2c,
-					 bool enable)
-{
-	u32 val;
-
-	val = iproc_i2c_rd_reg(iproc_i2c, CFG_OFFSET);
-	if (enable)
-		val |= BIT(CFG_EN_SHIFT);
-	else
-		val &= ~BIT(CFG_EN_SHIFT);
-	iproc_i2c_wr_reg(iproc_i2c, CFG_OFFSET, val);
-}
-
 static int bcm_iproc_i2c_check_status(struct bcm_iproc_i2c_dev *iproc_i2c,
 				      struct i2c_msg *msg)
 {
@@ -988,6 +983,62 @@ static u32 bcm_iproc_i2c_functionality(struct i2c_adapter *adap)
 	return val;
 }
 
+static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(slave->adapter);
+
+	if (iproc_i2c->slave)
+		return -EBUSY;
+
+	if (slave->flags & I2C_CLIENT_TEN)
+		return -EAFNOSUPPORT;
+
+	iproc_i2c->slave = slave;
+
+	tasklet_init(&iproc_i2c->slave_rx_tasklet, slave_rx_tasklet_fn,
+		     (unsigned long)iproc_i2c);
+
+	bcm_iproc_i2c_slave_init(iproc_i2c, false);
+	return 0;
+}
+
+static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
+{
+	u32 tmp;
+	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(slave->adapter);
+
+	if (!iproc_i2c->slave)
+		return -EINVAL;
+
+	disable_irq(iproc_i2c->irq);
+
+	tasklet_kill(&iproc_i2c->slave_rx_tasklet);
+
+	/* disable all slave interrupts */
+	tmp = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
+	tmp &= ~(IE_S_ALL_INTERRUPT_MASK <<
+			IE_S_ALL_INTERRUPT_SHIFT);
+	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, tmp);
+
+	/* Erase the slave address programmed */
+	tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
+	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
+	iproc_i2c_wr_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET, tmp);
+
+	/* flush TX/RX FIFOs */
+	tmp = (BIT(S_FIFO_RX_FLUSH_SHIFT) | BIT(S_FIFO_TX_FLUSH_SHIFT));
+	iproc_i2c_wr_reg(iproc_i2c, S_FIFO_CTRL_OFFSET, tmp);
+
+	/* clear all pending slave interrupts */
+	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, ISR_MASK_SLAVE);
+
+	iproc_i2c->slave = NULL;
+
+	enable_irq(iproc_i2c->irq);
+
+	return 0;
+}
+
 static struct i2c_algorithm bcm_iproc_algo = {
 	.master_xfer = bcm_iproc_i2c_xfer,
 	.functionality = bcm_iproc_i2c_functionality,
@@ -1173,62 +1224,6 @@ static const struct dev_pm_ops bcm_iproc_i2c_pm_ops = {
 	.resume_early = &bcm_iproc_i2c_resume
 };
 
-static int bcm_iproc_i2c_reg_slave(struct i2c_client *slave)
-{
-	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(slave->adapter);
-
-	if (iproc_i2c->slave)
-		return -EBUSY;
-
-	if (slave->flags & I2C_CLIENT_TEN)
-		return -EAFNOSUPPORT;
-
-	iproc_i2c->slave = slave;
-
-	tasklet_init(&iproc_i2c->slave_rx_tasklet, slave_rx_tasklet_fn,
-		     (unsigned long)iproc_i2c);
-
-	bcm_iproc_i2c_slave_init(iproc_i2c, false);
-	return 0;
-}
-
-static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
-{
-	u32 tmp;
-	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(slave->adapter);
-
-	if (!iproc_i2c->slave)
-		return -EINVAL;
-
-	disable_irq(iproc_i2c->irq);
-
-	tasklet_kill(&iproc_i2c->slave_rx_tasklet);
-
-	/* disable all slave interrupts */
-	tmp = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
-	tmp &= ~(IE_S_ALL_INTERRUPT_MASK <<
-			IE_S_ALL_INTERRUPT_SHIFT);
-	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, tmp);
-
-	/* Erase the slave address programmed */
-	tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
-	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
-	iproc_i2c_wr_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET, tmp);
-
-	/* flush TX/RX FIFOs */
-	tmp = (BIT(S_FIFO_RX_FLUSH_SHIFT) | BIT(S_FIFO_TX_FLUSH_SHIFT));
-	iproc_i2c_wr_reg(iproc_i2c, S_FIFO_CTRL_OFFSET, tmp);
-
-	/* clear all pending slave interrupts */
-	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, ISR_MASK_SLAVE);
-
-	iproc_i2c->slave = NULL;
-
-	enable_irq(iproc_i2c->irq);
-
-	return 0;
-}
-
 static const struct of_device_id bcm_iproc_i2c_of_match[] = {
 	{
 		.compatible = "brcm,iproc-i2c",
-- 
2.49.0


