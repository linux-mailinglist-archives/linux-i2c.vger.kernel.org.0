Return-Path: <linux-i2c+bounces-10636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 201CAA9DD21
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 22:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 595393AB988
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Apr 2025 20:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B671B0F33;
	Sat, 26 Apr 2025 20:35:10 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 5.mo584.mail-out.ovh.net (5.mo584.mail-out.ovh.net [188.165.44.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512291A256E
	for <linux-i2c@vger.kernel.org>; Sat, 26 Apr 2025 20:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.44.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745699710; cv=none; b=Z3P7FCUJSVgR6pdy6OTOVNnh5gTSeZtw8Sbx1cejDl8xRSM2uqHkjXGHXLgzoFVGq7kjyuEB3RZYBab/pM5IphoLug+l/tCYt5unrkEwajNL5mpABA9R+jJsoEdeQYyy7QYG99YvGrt0suM2OhAmGpgKqvEG7jSZUX5bKZghqI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745699710; c=relaxed/simple;
	bh=LJbb8Cz77i/6Uh6ECZb6yKAqgpAu34nfZfypyzSg9a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGgFg+Cmsi9CXpu0RUCMbKFzg5ICjPq4tcokGyiNUFjPq83ghvTJARJDP/JUbHqMHn+KYbXLrvRJoi9uajQeNzxDlDKf8s63mjAMtDf3PU6aRVNl7ktElSh+ay01fWEJ4nAEqYpGLP9ujPk8N6NrYMOnbizy4h1UHmkcEynunRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.44.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.140.54])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4ZlLfT0pmWz1Rtk
	for <linux-i2c@vger.kernel.org>; Sat, 26 Apr 2025 20:19:45 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-7ffsh (unknown [10.111.174.233])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B271A1FE48;
	Sat, 26 Apr 2025 20:19:44 +0000 (UTC)
Received: from etezian.org ([37.59.142.102])
	by ghost-submission-5b5ff79f4f-7ffsh with ESMTPSA
	id x3iFGeA/DWgpMQAAVaAaLw
	(envelope-from <andi@etezian.org>); Sat, 26 Apr 2025 20:19:44 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-102R0049db3968a-746d-4132-a2e2-2a63eec7556b,
                    2A76D30921F14D4573FDC1C3147F166593CB1B6B) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v2 08/10] i2c: iproc: Move function and avoid prototypes
Date: Sat, 26 Apr 2025 22:19:20 +0200
Message-ID: <20250426201920.272135-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <6d3ac68e-d4de-4ea3-bfee-b4ac43e5ed1d@quicinc.com>
References: <6d3ac68e-d4de-4ea3-bfee-b4ac43e5ed1d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4602960295764626024
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheeiudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeegmgdpmhhouggvpehsmhhtphhouhht

Shuffle a bit the code in order to avoid prototypes.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
Hi,

as I am moving the functions, I can take the chance to fix the
two style issues that Mukesh has pointed out:

 - Leave a blank line before the return.
 - Arrange variable declaration in a reverse xmas tree alignment.

Thanks Mukesh,
Andi

 drivers/i2c/busses/i2c-bcm-iproc.c | 144 ++++++++++++++---------------
 1 file changed, 70 insertions(+), 74 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index d25b393f456b..4553225d7cdd 100644
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
@@ -988,6 +983,63 @@ static u32 bcm_iproc_i2c_functionality(struct i2c_adapter *adap)
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
+
+	return 0;
+}
+
+static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
+{
+	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(slave->adapter);
+	u32 tmp;
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
@@ -1173,62 +1225,6 @@ static const struct dev_pm_ops bcm_iproc_i2c_pm_ops = {
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


