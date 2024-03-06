Return-Path: <linux-i2c+bounces-2236-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FB48741EE
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 22:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28C921F227AA
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 21:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13181B275;
	Wed,  6 Mar 2024 21:25:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 18.mo581.mail-out.ovh.net (18.mo581.mail-out.ovh.net [188.165.56.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041B52FB2
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 21:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.56.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709760345; cv=none; b=L/hsKFr427+757nPO6ahUiTNphrh6PIBTETlWWKsKAmmwZHPn26hAt0xTneH5EVUd4jfr5UxGL0BoEF5YCaJj2ScmY6XJen5OjkPEoXcfNxvGttsi5SblSQ3VF8IFvzPp7iUV/wq2+71wQH22nDclRIEbLHlWYhWaVN4TdsleuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709760345; c=relaxed/simple;
	bh=vEPwQSBmpXtz2b0IMDNDTCtkPQ6O/170CyYhhoSL+Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PY5TrC8zVBv7HPkWxJKBzLPxryKlix8qVdmvmI0EuUXRymDdcCefOOEk7XdPqTKLQl2KNiB7oqm+u1H5nfkgS8rFLGwWO6TtmCgpWCO5guE8oo/iDdJJFP1bvuYOMS46JnCGWKLtcx6klGvFChvbCJqGocx370lyrVI4yQ61Ug0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.56.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.2.55])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4TqlpX2gSHz1Cvr
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 21:25:40 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-h6z75 (unknown [10.110.178.25])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3B58B1FDEF;
	Wed,  6 Mar 2024 21:25:39 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
	by ghost-submission-6684bf9d7b-h6z75 with ESMTPSA
	id mgSUDFPf6GXMUgAAWPXLQg
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 21:25:39 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S004f8db31e8-1d04-40ad-9f7f-645fafae14c8,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>,
	linux-i2c@vger.kernel.org
Cc: wsa@kernel.org,
	cobechen@zhaoxin.com,
	hanshu@zhaoxin.com,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v9 3/6] i2c: wmt: rename something
Date: Wed,  6 Mar 2024 22:24:10 +0100
Message-ID: <20240306212413.1850236-4-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240306212413.1850236-1-andi.shyti@kernel.org>
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <20240306212413.1850236-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16092487371701815879
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugddugeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth

From: Hans Hu <hanshu-oc@zhaoxin.com>

1. The I2C IP for both wmt and zhaoxin originates from VIA. Rename
   common registers, functions, and variable names to follow the
   VIAI2C_ and viai2c_ naming conventions for consistency and clarity.
2. rename i2c_dev to i2c, to shorten the length of a line.
3. rename wait_result to time_left, make it better to reflect the meaning
   of the value returned by wait_for_completion_timeout().
4. remove TCR_MASTER_WRITE, its value is 0.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 156 ++++++++++++-------------
 drivers/i2c/busses/i2c-viai2c-common.h |  70 ++++++-----
 drivers/i2c/busses/i2c-viai2c-wmt.c    |  62 +++++-----
 3 files changed, 143 insertions(+), 145 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index fa47a4d9549c0..3e565d5ee4c7c 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -2,14 +2,14 @@
 #include <linux/of_irq.h>
 #include "i2c-viai2c-common.h"
 
-int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev)
+int viai2c_wait_bus_not_busy(struct viai2c *i2c)
 {
 	unsigned long timeout;
 
-	timeout = jiffies + WMT_I2C_TIMEOUT;
-	while (!(readw(i2c_dev->base + REG_CSR) & CSR_READY_MASK)) {
+	timeout = jiffies + VIAI2C_TIMEOUT;
+	while (!(readw(i2c->base + VIAI2C_REG_CSR) & VIAI2C_CSR_READY_MASK)) {
 		if (time_after(jiffies, timeout)) {
-			dev_warn(i2c_dev->dev, "timeout waiting for bus ready\n");
+			dev_warn(i2c->dev, "timeout waiting for bus ready\n");
 			return -EBUSY;
 		}
 		msleep(20);
@@ -18,28 +18,28 @@ int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev)
 	return 0;
 }
 
-int wmt_check_status(struct wmt_i2c_dev *i2c_dev)
+int viai2c_check_status(struct viai2c *i2c)
 {
 	int ret = 0;
-	unsigned long wait_result;
+	unsigned long time_left;
 
-	wait_result = wait_for_completion_timeout(&i2c_dev->complete,
+	time_left = wait_for_completion_timeout(&i2c->complete,
 						msecs_to_jiffies(500));
-	if (!wait_result)
+	if (!time_left)
 		return -ETIMEDOUT;
 
-	if (i2c_dev->cmd_status & ISR_NACK_ADDR)
+	if (i2c->cmd_status & VIAI2C_ISR_NACK_ADDR)
 		ret = -EIO;
 
-	if (i2c_dev->cmd_status & ISR_SCL_TIMEOUT)
+	if (i2c->cmd_status & VIAI2C_ISR_SCL_TIMEOUT)
 		ret = -ETIMEDOUT;
 
 	return ret;
 }
 
-static int wmt_i2c_write(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg, int last)
+static int viai2c_write(struct viai2c *i2c, struct i2c_msg *pmsg, int last)
 {
-	u16 val, tcr_val = i2c_dev->tcr;
+	u16 val, tcr_val = i2c->tcr;
 	int ret;
 	int xfer_len = 0;
 
@@ -49,173 +49,173 @@ static int wmt_i2c_write(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg, int
 		 * start at -1 and break out early from the loop
 		 */
 		xfer_len = -1;
-		writew(0, i2c_dev->base + REG_CDR);
+		writew(0, i2c->base + VIAI2C_REG_CDR);
 	} else {
-		writew(pmsg->buf[0] & 0xFF, i2c_dev->base + REG_CDR);
+		writew(pmsg->buf[0] & 0xFF, i2c->base + VIAI2C_REG_CDR);
 	}
 
 	if (!(pmsg->flags & I2C_M_NOSTART)) {
-		val = readw(i2c_dev->base + REG_CR);
-		val &= ~CR_TX_END;
-		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
+		val = readw(i2c->base + VIAI2C_REG_CR);
+		val &= ~VIAI2C_CR_TX_END;
+		val |= VIAI2C_CR_CPU_RDY;
+		writew(val, i2c->base + VIAI2C_REG_CR);
 	}
 
-	reinit_completion(&i2c_dev->complete);
+	reinit_completion(&i2c->complete);
 
-	tcr_val |= (TCR_MASTER_WRITE | (pmsg->addr & TCR_SLAVE_ADDR_MASK));
+	tcr_val |= pmsg->addr & VIAI2C_TCR_ADDR_MASK;
 
-	writew(tcr_val, i2c_dev->base + REG_TCR);
+	writew(tcr_val, i2c->base + VIAI2C_REG_TCR);
 
 	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(i2c_dev->base + REG_CR);
-		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
+		val = readw(i2c->base + VIAI2C_REG_CR);
+		val |= VIAI2C_CR_CPU_RDY;
+		writew(val, i2c->base + VIAI2C_REG_CR);
 	}
 
 	while (xfer_len < pmsg->len) {
-		ret = wmt_check_status(i2c_dev);
+		ret = viai2c_check_status(i2c);
 		if (ret)
 			return ret;
 
 		xfer_len++;
 
-		val = readw(i2c_dev->base + REG_CSR);
-		if ((val & CSR_RCV_ACK_MASK) == CSR_RCV_NOT_ACK) {
-			dev_dbg(i2c_dev->dev, "write RCV NACK error\n");
+		val = readw(i2c->base + VIAI2C_REG_CSR);
+		if (val & VIAI2C_CSR_RCV_NOT_ACK) {
+			dev_dbg(i2c->dev, "write RCV NACK error\n");
 			return -EIO;
 		}
 
 		if (pmsg->len == 0) {
-			val = CR_TX_END | CR_CPU_RDY | CR_ENABLE;
-			writew(val, i2c_dev->base + REG_CR);
+			val = VIAI2C_CR_TX_END | VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE;
+			writew(val, i2c->base + VIAI2C_REG_CR);
 			break;
 		}
 
 		if (xfer_len == pmsg->len) {
 			if (last != 1)
-				writew(CR_ENABLE, i2c_dev->base + REG_CR);
+				writew(VIAI2C_CR_ENABLE, i2c->base + VIAI2C_REG_CR);
 		} else {
-			writew(pmsg->buf[xfer_len] & 0xFF, i2c_dev->base +
-								REG_CDR);
-			writew(CR_CPU_RDY | CR_ENABLE, i2c_dev->base + REG_CR);
+			writew(pmsg->buf[xfer_len] & 0xFF, i2c->base + VIAI2C_REG_CDR);
+			writew(VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE,
+					i2c->base + VIAI2C_REG_CR);
 		}
 	}
 
 	return 0;
 }
 
-static int wmt_i2c_read(struct wmt_i2c_dev *i2c_dev, struct i2c_msg *pmsg)
+static int viai2c_read(struct viai2c *i2c, struct i2c_msg *pmsg)
 {
-	u16 val, tcr_val = i2c_dev->tcr;
+	u16 val, tcr_val = i2c->tcr;
 	int ret;
 	u32 xfer_len = 0;
 
-	val = readw(i2c_dev->base + REG_CR);
-	val &= ~(CR_TX_END | CR_TX_NEXT_NO_ACK);
+	val = readw(i2c->base + VIAI2C_REG_CR);
+	val &= ~(VIAI2C_CR_TX_END | VIAI2C_CR_RX_END);
 
 	if (!(pmsg->flags & I2C_M_NOSTART))
-		val |= CR_CPU_RDY;
+		val |= VIAI2C_CR_CPU_RDY;
 
 	if (pmsg->len == 1)
-		val |= CR_TX_NEXT_NO_ACK;
+		val |= VIAI2C_CR_RX_END;
 
-	writew(val, i2c_dev->base + REG_CR);
+	writew(val, i2c->base + VIAI2C_REG_CR);
 
-	reinit_completion(&i2c_dev->complete);
+	reinit_completion(&i2c->complete);
 
-	tcr_val |= TCR_MASTER_READ | (pmsg->addr & TCR_SLAVE_ADDR_MASK);
+	tcr_val |= VIAI2C_TCR_READ | (pmsg->addr & VIAI2C_TCR_ADDR_MASK);
 
-	writew(tcr_val, i2c_dev->base + REG_TCR);
+	writew(tcr_val, i2c->base + VIAI2C_REG_TCR);
 
 	if (pmsg->flags & I2C_M_NOSTART) {
-		val = readw(i2c_dev->base + REG_CR);
-		val |= CR_CPU_RDY;
-		writew(val, i2c_dev->base + REG_CR);
+		val = readw(i2c->base + VIAI2C_REG_CR);
+		val |= VIAI2C_CR_CPU_RDY;
+		writew(val, i2c->base + VIAI2C_REG_CR);
 	}
 
 	while (xfer_len < pmsg->len) {
-		ret = wmt_check_status(i2c_dev);
+		ret = viai2c_check_status(i2c);
 		if (ret)
 			return ret;
 
-		pmsg->buf[xfer_len] = readw(i2c_dev->base + REG_CDR) >> 8;
+		pmsg->buf[xfer_len] = readw(i2c->base + VIAI2C_REG_CDR) >> 8;
 		xfer_len++;
 
-		val = readw(i2c_dev->base + REG_CR) | CR_CPU_RDY;
+		val = readw(i2c->base + VIAI2C_REG_CR) | VIAI2C_CR_CPU_RDY;
 		if (xfer_len == pmsg->len - 1)
-			val |= CR_TX_NEXT_NO_ACK;
-		writew(val, i2c_dev->base + REG_CR);
+			val |= VIAI2C_CR_RX_END;
+		writew(val, i2c->base + VIAI2C_REG_CR);
 	}
 
 	return 0;
 }
 
-int wmt_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
 	struct i2c_msg *pmsg;
 	int i;
 	int ret = 0;
-	struct wmt_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
+	struct viai2c *i2c = i2c_get_adapdata(adap);
 
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 		if (!(pmsg->flags & I2C_M_NOSTART)) {
-			ret = wmt_i2c_wait_bus_not_busy(i2c_dev);
+			ret = viai2c_wait_bus_not_busy(i2c);
 			if (ret < 0)
 				return ret;
 		}
 
 		if (pmsg->flags & I2C_M_RD)
-			ret = wmt_i2c_read(i2c_dev, pmsg);
+			ret = viai2c_read(i2c, pmsg);
 		else
-			ret = wmt_i2c_write(i2c_dev, pmsg, (i + 1) == num);
+			ret = viai2c_write(i2c, pmsg, (i + 1) == num);
 	}
 
 	return (ret < 0) ? ret : i;
 }
 
-static irqreturn_t wmt_i2c_isr(int irq, void *data)
+static irqreturn_t viai2c_isr(int irq, void *data)
 {
-	struct wmt_i2c_dev *i2c_dev = data;
+	struct viai2c *i2c = data;
 
 	/* save the status and write-clear it */
-	i2c_dev->cmd_status = readw(i2c_dev->base + REG_ISR);
-	writew(i2c_dev->cmd_status, i2c_dev->base + REG_ISR);
+	i2c->cmd_status = readw(i2c->base + VIAI2C_REG_ISR);
+	writew(i2c->cmd_status, i2c->base + VIAI2C_REG_ISR);
 
-	complete(&i2c_dev->complete);
+	complete(&i2c->complete);
 
 	return IRQ_HANDLED;
 }
 
-int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev **pi2c_dev)
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c)
 {
 	int err;
-	struct wmt_i2c_dev *i2c_dev;
+	struct viai2c *i2c;
 	struct device_node *np = pdev->dev.of_node;
 
-	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
-	if (!i2c_dev)
+	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
 		return -ENOMEM;
 
-	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(i2c_dev->base))
-		return PTR_ERR(i2c_dev->base);
+	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(i2c->base))
+		return PTR_ERR(i2c->base);
 
-	i2c_dev->irq = irq_of_parse_and_map(np, 0);
-	if (!i2c_dev->irq)
+	i2c->irq = irq_of_parse_and_map(np, 0);
+	if (!i2c->irq)
 		return -EINVAL;
 
-	err = devm_request_irq(&pdev->dev, i2c_dev->irq, wmt_i2c_isr,
-					0, pdev->name, i2c_dev);
+	err = devm_request_irq(&pdev->dev, i2c->irq, viai2c_isr,
+					0, pdev->name, i2c);
 	if (err)
 		return dev_err_probe(&pdev->dev, err,
-				"failed to request irq %i\n", i2c_dev->irq);
+				"failed to request irq %i\n", i2c->irq);
 
-	i2c_dev->dev = &pdev->dev;
-	init_completion(&i2c_dev->complete);
-	platform_set_drvdata(pdev, i2c_dev);
+	i2c->dev = &pdev->dev;
+	init_completion(&i2c->complete);
+	platform_set_drvdata(pdev, i2c);
 
-	*pi2c_dev = i2c_dev;
+	*pi2c = i2c;
 	return 0;
 }
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index fcff8e4456eb8..28799e7e97f0b 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -11,48 +11,46 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
-#define REG_CR		0x00
-#define REG_TCR		0x02
-#define REG_CSR		0x04
-#define REG_ISR		0x06
-#define REG_IMR		0x08
-#define REG_CDR		0x0A
-#define REG_TR		0x0C
-#define REG_MCR		0x0E
-
 /* REG_CR Bit fields */
-#define CR_TX_NEXT_ACK		0x0000
-#define CR_ENABLE		0x0001
-#define CR_TX_NEXT_NO_ACK	0x0002
-#define CR_TX_END		0x0004
-#define CR_CPU_RDY		0x0008
-#define SLAV_MODE_SEL		0x8000
+#define VIAI2C_REG_CR		0x00
+#define VIAI2C_CR_ENABLE		BIT(0)
+#define VIAI2C_CR_RX_END		BIT(1)
+#define VIAI2C_CR_TX_END		BIT(2)
+#define VIAI2C_CR_CPU_RDY		BIT(3)
+#define VIAI2C_CR_END_MASK		GENMASK(2, 1)
 
 /* REG_TCR Bit fields */
-#define TCR_STANDARD_MODE	0x0000
-#define TCR_MASTER_WRITE	0x0000
-#define TCR_HS_MODE		0x2000
-#define TCR_MASTER_READ		0x4000
-#define TCR_FAST_MODE		0x8000
-#define TCR_SLAVE_ADDR_MASK	0x007F
+#define VIAI2C_REG_TCR		0x02
+#define VIAI2C_TCR_HS_MODE		BIT(13)
+#define VIAI2C_TCR_READ			BIT(14)
+#define VIAI2C_TCR_FAST			BIT(15)
+#define VIAI2C_TCR_ADDR_MASK		GENMASK(6, 0)
+
+/* REG_CSR Bit fields */
+#define VIAI2C_REG_CSR		0x04
+#define VIAI2C_CSR_RCV_NOT_ACK		BIT(0)
+#define VIAI2C_CSR_RCV_ACK_MASK		BIT(0)
+#define VIAI2C_CSR_READY_MASK		BIT(1)
 
 /* REG_ISR Bit fields */
-#define ISR_NACK_ADDR		0x0001
-#define ISR_BYTE_END		0x0002
-#define ISR_SCL_TIMEOUT		0x0004
-#define ISR_WRITE_ALL		0x0007
+#define VIAI2C_REG_ISR		0x06
+#define VIAI2C_ISR_NACK_ADDR		BIT(0)
+#define VIAI2C_ISR_BYTE_END		BIT(1)
+#define VIAI2C_ISR_SCL_TIMEOUT		BIT(2)
+#define VIAI2C_ISR_MASK_ALL		GENMASK(2, 0)
 
 /* REG_IMR Bit fields */
-#define IMR_ENABLE_ALL		0x0007
+#define VIAI2C_REG_IMR		0x08
+#define VIAI2C_IMR_BYTE			BIT(1)
+#define VIAI2C_IMR_ENABLE_ALL		GENMASK(2, 0)
 
-/* REG_CSR Bit fields */
-#define CSR_RCV_NOT_ACK		0x0001
-#define CSR_RCV_ACK_MASK	0x0001
-#define CSR_READY_MASK		0x0002
+#define VIAI2C_REG_CDR		0x0A
+#define VIAI2C_REG_TR		0x0C
+#define VIAI2C_REG_MCR		0x0E
 
-#define WMT_I2C_TIMEOUT		(msecs_to_jiffies(1000))
+#define VIAI2C_TIMEOUT		(msecs_to_jiffies(1000))
 
-struct wmt_i2c_dev {
+struct viai2c {
 	struct i2c_adapter	adapter;
 	struct completion	complete;
 	struct device		*dev;
@@ -63,9 +61,9 @@ struct wmt_i2c_dev {
 	u16			cmd_status;
 };
 
-int wmt_i2c_wait_bus_not_busy(struct wmt_i2c_dev *i2c_dev);
-int wmt_check_status(struct wmt_i2c_dev *i2c_dev);
-int wmt_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
-int wmt_i2c_init(struct platform_device *pdev, struct wmt_i2c_dev **pi2c_dev);
+int viai2c_wait_bus_not_busy(struct viai2c *i2c);
+int viai2c_check_status(struct viai2c *i2c);
+int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
+int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c);
 
 #endif
diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
index 0af0009eab8fe..07fd954f1d008 100644
--- a/drivers/i2c/busses/i2c-viai2c-wmt.c
+++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
@@ -35,39 +35,39 @@ static u32 wmt_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm wmt_i2c_algo = {
-	.master_xfer	= wmt_i2c_xfer,
+	.master_xfer	= viai2c_xfer,
 	.functionality	= wmt_i2c_func,
 };
 
-static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
+static int wmt_i2c_reset_hardware(struct viai2c *i2c)
 {
 	int err;
 
-	err = clk_prepare_enable(i2c_dev->clk);
+	err = clk_prepare_enable(i2c->clk);
 	if (err) {
-		dev_err(i2c_dev->dev, "failed to enable clock\n");
+		dev_err(i2c->dev, "failed to enable clock\n");
 		return err;
 	}
 
-	err = clk_set_rate(i2c_dev->clk, 20000000);
+	err = clk_set_rate(i2c->clk, 20000000);
 	if (err) {
-		dev_err(i2c_dev->dev, "failed to set clock = 20Mhz\n");
-		clk_disable_unprepare(i2c_dev->clk);
+		dev_err(i2c->dev, "failed to set clock = 20Mhz\n");
+		clk_disable_unprepare(i2c->clk);
 		return err;
 	}
 
-	writew(0, i2c_dev->base + REG_CR);
-	writew(MCR_APB_166M, i2c_dev->base + REG_MCR);
-	writew(ISR_WRITE_ALL, i2c_dev->base + REG_ISR);
-	writew(IMR_ENABLE_ALL, i2c_dev->base + REG_IMR);
-	writew(CR_ENABLE, i2c_dev->base + REG_CR);
-	readw(i2c_dev->base + REG_CSR);		/* read clear */
-	writew(ISR_WRITE_ALL, i2c_dev->base + REG_ISR);
+	writew(0, i2c->base + VIAI2C_REG_CR);
+	writew(MCR_APB_166M, i2c->base + VIAI2C_REG_MCR);
+	writew(VIAI2C_ISR_MASK_ALL, i2c->base + VIAI2C_REG_ISR);
+	writew(VIAI2C_IMR_ENABLE_ALL, i2c->base + VIAI2C_REG_IMR);
+	writew(VIAI2C_CR_ENABLE, i2c->base + VIAI2C_REG_CR);
+	readw(i2c->base + VIAI2C_REG_CSR);		/* read clear */
+	writew(VIAI2C_ISR_MASK_ALL, i2c->base + VIAI2C_REG_ISR);
 
-	if (i2c_dev->tcr == TCR_FAST_MODE)
-		writew(SCL_TIMEOUT(128) | TR_HS, i2c_dev->base + REG_TR);
+	if (i2c->tcr == VIAI2C_TCR_FAST)
+		writew(SCL_TIMEOUT(128) | TR_HS, i2c->base + VIAI2C_REG_TR);
 	else
-		writew(SCL_TIMEOUT(128) | TR_STD, i2c_dev->base + REG_TR);
+		writew(SCL_TIMEOUT(128) | TR_STD, i2c->base + VIAI2C_REG_TR);
 
 	return 0;
 }
@@ -75,34 +75,34 @@ static int wmt_i2c_reset_hardware(struct wmt_i2c_dev *i2c_dev)
 static int wmt_i2c_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct wmt_i2c_dev *i2c_dev;
+	struct viai2c *i2c;
 	struct i2c_adapter *adap;
 	int err;
 	u32 clk_rate;
 
-	err = wmt_i2c_init(pdev, &i2c_dev);
+	err = viai2c_init(pdev, &i2c);
 	if (err)
 		return err;
 
-	i2c_dev->clk = of_clk_get(np, 0);
-	if (IS_ERR(i2c_dev->clk)) {
+	i2c->clk = of_clk_get(np, 0);
+	if (IS_ERR(i2c->clk)) {
 		dev_err(&pdev->dev, "unable to request clock\n");
-		return PTR_ERR(i2c_dev->clk);
+		return PTR_ERR(i2c->clk);
 	}
 
 	err = of_property_read_u32(np, "clock-frequency", &clk_rate);
 	if (!err && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
-		i2c_dev->tcr = TCR_FAST_MODE;
+		i2c->tcr = VIAI2C_TCR_FAST;
 
-	adap = &i2c_dev->adapter;
-	i2c_set_adapdata(adap, i2c_dev);
+	adap = &i2c->adapter;
+	i2c_set_adapdata(adap, i2c);
 	strscpy(adap->name, "WMT I2C adapter", sizeof(adap->name));
 	adap->owner = THIS_MODULE;
 	adap->algo = &wmt_i2c_algo;
 	adap->dev.parent = &pdev->dev;
 	adap->dev.of_node = pdev->dev.of_node;
 
-	err = wmt_i2c_reset_hardware(i2c_dev);
+	err = wmt_i2c_reset_hardware(i2c);
 	if (err) {
 		dev_err(&pdev->dev, "error initializing hardware\n");
 		return err;
@@ -111,19 +111,19 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	err = i2c_add_adapter(adap);
 	if (err)
 		/* wmt_i2c_reset_hardware() enables i2c_dev->clk */
-		clk_disable_unprepare(i2c_dev->clk);
+		clk_disable_unprepare(i2c->clk);
 
 	return err;
 }
 
 static void wmt_i2c_remove(struct platform_device *pdev)
 {
-	struct wmt_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
+	struct viai2c *i2c = platform_get_drvdata(pdev);
 
 	/* Disable interrupts, clock and delete adapter */
-	writew(0, i2c_dev->base + REG_IMR);
-	clk_disable_unprepare(i2c_dev->clk);
-	i2c_del_adapter(&i2c_dev->adapter);
+	writew(0, i2c->base + VIAI2C_REG_IMR);
+	clk_disable_unprepare(i2c->clk);
+	i2c_del_adapter(&i2c->adapter);
 }
 
 static const struct of_device_id wmt_i2c_dt_ids[] = {
-- 
2.43.0


