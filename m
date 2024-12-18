Return-Path: <linux-i2c+bounces-8596-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A39F658D
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 13:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5612816F54E
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 12:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D545D1A2C04;
	Wed, 18 Dec 2024 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSxU3b7i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAF31A23BF;
	Wed, 18 Dec 2024 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734523687; cv=none; b=KfRTyQ/LGBYFkmDAMpYTLP8heO6MAelfJrRcnp/uZNITxG54yLtsLxoGA5I17bgSNE4FGFduVxgsrHALeL9GvUhnRKbLPeTpLij6Fiadgcc5HVJrRE4H1Rqx6kE3gBwPDdihmR+pkSFm9oL9P+XhnBgOH/WShkpjSXaBYxW1ggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734523687; c=relaxed/simple;
	bh=AQLU0Q8cFQjLvr25vZUEK5lZ20NqxcXHXm5DN+eiw5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N13owcGH14S+gutPd6D4H7I5yg8GCCR4TQ9Wb++ZvzSWRtwmWmChJ06AvOENjwUWNnFbXtvJIQx7pJChr8DRTdNs4uouX8//5BK8S7lcUWUgCsOdMoAh2YFVbCEevG24Kc2B4iUzV/Ds7BwnKKKiGA7PIiM0NQNyK5e0kQ56L0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSxU3b7i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689AFC4CED4;
	Wed, 18 Dec 2024 12:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734523687;
	bh=AQLU0Q8cFQjLvr25vZUEK5lZ20NqxcXHXm5DN+eiw5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BSxU3b7iAjpSsButUhn0fiEoV3VJlwsuI1jywq7fGH562E0Gb7wdKhHq62A2AFHSH
	 TNmiW8sHrn9Kd0lkVOm3cYsFG7wTr4WoCoCgI4SISnBtgME05Vm+enRZibQXcXprIo
	 Q3hSL0p7R7VRjEzrUZyq3l4NgkTcsQdwuXu7t/SO8ws2kiQXolSZcZhnv/biiqCvAT
	 12WxUCoAqSFRGb1w+JksES3q+64SZdy7dP0fviJ2U9WIXsVusPQUvVhpT4dpJlmC0j
	 /f+yFEVU+v5fwql1ItGq+c7yPAanah8ZKifwIOOAAtlLSONmzKdR5bZ/kUUIFcPGP3
	 jhIo54GhtPNpQ==
From: Conor Dooley <conor@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] i2c: microchip-core: actually use repeated sends
Date: Wed, 18 Dec 2024 12:07:40 +0000
Message-ID: <20241218-football-composure-e56df2461461@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
References: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6229; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=fyLCcxFql6reCLgGItzI26EB/OD8RBiql59BUhKOfsc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlJu7njs/TF3RRnu3Iax3K1rLhotO9xTJigxvaaC9cuf VFk5fHtKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwETO2zAynJ1yI1vwSVWEjsf8 jvLLv8ydYi53sfUGcvu4f27lepL8npFhkk3HkXNNlTqdu3n7Xuy25DOcUnJFacP/KULdslXfdBm ZAQ==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

At present, where repeated sends are intended to be used, the
i2c-microchip-core driver sends a stop followed by a start. Lots of i2c
devices must not malfunction in the face of this behaviour, because the
driver has operated like this for years! Try to keep track of whether or
not a repeated send is required, and suppress sending a stop in these
cases.

CC: stable@vger.kernel.org
Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controllers")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 124 ++++++++++++++++-----
 1 file changed, 96 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 0b0a1c4d17ca..e5af38dfaa81 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -93,27 +93,35 @@
  * @base:		pointer to register struct
  * @dev:		device reference
  * @i2c_clk:		clock reference for i2c input clock
+ * @msg_queue:		pointer to the messages requiring sending
  * @buf:		pointer to msg buffer for easier use
  * @msg_complete:	xfer completion object
  * @adapter:		core i2c abstraction
  * @msg_err:		error code for completed message
  * @bus_clk_rate:	current i2c bus clock rate
  * @isr_status:		cached copy of local ISR status
+ * @total_num:		total number of messages to be sent/received
+ * @current_num:	index of the current message being sent/received
  * @msg_len:		number of bytes transferred in msg
  * @addr:		address of the current slave
+ * @restart_needed:	whether or not a repeated start is required after current message
  */
 struct mchp_corei2c_dev {
 	void __iomem *base;
 	struct device *dev;
 	struct clk *i2c_clk;
+	struct i2c_msg *msg_queue;
 	u8 *buf;
 	struct completion msg_complete;
 	struct i2c_adapter adapter;
 	int msg_err;
+	int total_num;
+	int current_num;
 	u32 bus_clk_rate;
 	u32 isr_status;
 	u16 msg_len;
 	u8 addr;
+	bool restart_needed;
 };
 
 static void mchp_corei2c_core_disable(struct mchp_corei2c_dev *idev)
@@ -222,6 +230,47 @@ static int mchp_corei2c_fill_tx(struct mchp_corei2c_dev *idev)
 	return 0;
 }
 
+static void mchp_corei2c_next_msg(struct mchp_corei2c_dev *idev)
+{
+	struct i2c_msg *this_msg;
+	u8 ctrl;
+
+	if (idev->current_num >= idev->total_num) {
+		complete(&idev->msg_complete);
+		return;
+	}
+
+	/*
+	 * If there's been an error, the isr needs to return control
+	 * to the "main" part of the driver, so as not to keep sending
+	 * messages once it completes and clears the SI bit.
+	 */
+	if (idev->msg_err) {
+		complete(&idev->msg_complete);
+		return;
+	}
+
+	this_msg = idev->msg_queue++;
+
+	if (idev->current_num < (idev->total_num - 1)) {
+		struct i2c_msg *next_msg = idev->msg_queue;
+
+		idev->restart_needed = next_msg->flags & I2C_M_RD;
+	} else {
+		idev->restart_needed = false;
+	}
+
+	idev->addr = i2c_8bit_addr_from_msg(this_msg);
+	idev->msg_len = this_msg->len;
+	idev->buf = this_msg->buf;
+
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	ctrl |= CTRL_STA;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+
+	idev->current_num++;
+}
+
 static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
 {
 	u32 status = idev->isr_status;
@@ -247,10 +296,14 @@ static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
 		break;
 	case STATUS_M_SLAW_ACK:
 	case STATUS_M_TX_DATA_ACK:
-		if (idev->msg_len > 0)
+		if (idev->msg_len > 0) {
 			mchp_corei2c_fill_tx(idev);
-		else
-			last_byte = true;
+		} else {
+			if (idev->restart_needed)
+				finished = true;
+			else
+				last_byte = true;
+		}
 		break;
 	case STATUS_M_TX_DATA_NACK:
 	case STATUS_M_SLAR_NACK:
@@ -287,7 +340,7 @@ static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
 		mchp_corei2c_stop(idev);
 
 	if (last_byte || finished)
-		complete(&idev->msg_complete);
+		mchp_corei2c_next_msg(idev);
 
 	return IRQ_HANDLED;
 }
@@ -311,21 +364,48 @@ static irqreturn_t mchp_corei2c_isr(int irq, void *_dev)
 	return ret;
 }
 
-static int mchp_corei2c_xfer_msg(struct mchp_corei2c_dev *idev,
-				 struct i2c_msg *msg)
+static int mchp_corei2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			     int num)
 {
-	u8 ctrl;
+	struct mchp_corei2c_dev *idev = i2c_get_adapdata(adap);
+	struct i2c_msg *this_msg = msgs;
 	unsigned long time_left;
-
-	idev->addr = i2c_8bit_addr_from_msg(msg);
-	idev->msg_len = msg->len;
-	idev->buf = msg->buf;
-	idev->msg_err = 0;
-
-	reinit_completion(&idev->msg_complete);
+	u8 ctrl;
 
 	mchp_corei2c_core_enable(idev);
 
+	/*
+	 * The isr controls the flow of a transfer, this info needs to be saved
+	 * to a location that it can access the queue information from.
+	 */
+	idev->restart_needed = false;
+	idev->msg_queue = msgs;
+	idev->total_num = num;
+	idev->current_num = 0;
+
+	/*
+	 * But the first entry to the isr is triggered by the start in this
+	 * function, so the first message needs to be "dequeued".
+	 */
+	idev->addr = i2c_8bit_addr_from_msg(this_msg);
+	idev->msg_len = this_msg->len;
+	idev->buf = this_msg->buf;
+	idev->msg_err = 0;
+
+	if (idev->total_num > 1) {
+		struct i2c_msg *next_msg = msgs + 1;
+
+		idev->restart_needed = next_msg->flags & I2C_M_RD;
+	}
+
+	idev->current_num++;
+	idev->msg_queue++;
+
+	reinit_completion(&idev->msg_complete);
+
+	/*
+	 * Send the first start to pass control to the isr
+	 */
 	ctrl = readb(idev->base + CORE_I2C_CTRL);
 	ctrl |= CTRL_STA;
 	writeb(ctrl, idev->base + CORE_I2C_CTRL);
@@ -335,20 +415,8 @@ static int mchp_corei2c_xfer_msg(struct mchp_corei2c_dev *idev,
 	if (!time_left)
 		return -ETIMEDOUT;
 
-	return idev->msg_err;
-}
-
-static int mchp_corei2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			     int num)
-{
-	struct mchp_corei2c_dev *idev = i2c_get_adapdata(adap);
-	int i, ret;
-
-	for (i = 0; i < num; i++) {
-		ret = mchp_corei2c_xfer_msg(idev, msgs++);
-		if (ret)
-			return ret;
-	}
+	if (idev->msg_err)
+		return idev->msg_err;
 
 	return num;
 }
-- 
2.45.2


