Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F2984326
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 06:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfHGENC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 00:13:02 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41574 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbfHGENC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 00:13:02 -0400
Received: by mail-pf1-f193.google.com with SMTP id m30so42719694pff.8
        for <linux-i2c@vger.kernel.org>; Tue, 06 Aug 2019 21:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=uRto+pkhe5Du3IWHFhe244+N5TxyIz37a1eOSfZs8KE=;
        b=dki+4lRGF7CNX7upEXTzvVUabZY5Cei3k16WLlLS8no3qBlywLENfOJOeuRI8Zwl3I
         Ga41vssYEvRuynC16XfUbjFUHTrT7CjgLAgOSw1OczeceoJo0whizzVNJ7OuQVJ6Aq0p
         WWQnFJDWj2qD2mgZy/J/L/vw5sY02azRo8ue8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uRto+pkhe5Du3IWHFhe244+N5TxyIz37a1eOSfZs8KE=;
        b=M7CQf+CqkqhI/S2mOFbdAC+uEb12avEp/dPsCJcYsLB5xlll9yp3um3tlyASlqKpF1
         bv6SOOmmJHnOmTkgacD6QFicA3Gu5HKefNAV8DK8gam4iiiMYXbQjLLgpDwjjGvt2qSg
         jgBYFQBIk15nSJcURptXUJHQhtCnleSekaSIdDr7OTUUXgCqeuRj9ld3e2KNYXTR8KfU
         ZTStSuCGqnWctDcMYDCJZHquXF7j5FhFggun/6lzO6ACMh6X2szIvu+pMsfEIO9AICGY
         KnzpyRLKTvy2ecOMJPofROiivy54JCQqM+xcPcZsEELmZCgx9bugJxXq0WI4Vt17KWNX
         609w==
X-Gm-Message-State: APjAAAViiqKqC1N8ceIziKbQUCQerHSihB1FnlxK1N1K/0h7wrTSwzs9
        tbMeGvJTo+2//4OSss+zYx7ueg==
X-Google-Smtp-Source: APXvYqxujd1Qtdb9S37cZo2t4LAv8/sx/z3ZVoIPWqPx0Ew506AYO2DLEhGWx00uI7nzre+h6KOdWg==
X-Received: by 2002:a63:31cc:: with SMTP id x195mr5898444pgx.147.1565151181522;
        Tue, 06 Aug 2019 21:13:01 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id i7sm18279100pjk.24.2019.08.06.21.12.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 06 Aug 2019 21:13:00 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Ray Jui <ray.jui@broadcom.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Icarus Chau <icarus.chau@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
Subject: [PATCH v1 1/1] i2c: iproc: Add i2c repeated start capability
Date:   Wed,  7 Aug 2019 09:39:01 +0530
Message-Id: <1565150941-27297-1-git-send-email-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Lori Hikichi <lori.hikichi@broadcom.com>

Enable handling of i2c repeated start. The current code
handles a multi msg i2c transfer as separate i2c bus
transactions. This change will now handle this case
using the i2c repeated start protocol. The number of msgs
in a transfer is limited to two, and must be a write
followed by a read.

Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Signed-off-by: Icarus Chau <icarus.chau@broadcom.com>
Signed-off-by: Ray Jui <ray.jui@broadcom.com>
Signed-off-by: Shivaraj Shetty <sshetty1@broadcom.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 70 +++++++++++++++++++++++++++++++-------
 1 file changed, 57 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index d7fd76b..15fedcf 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -81,6 +81,7 @@
 #define M_CMD_PROTOCOL_MASK          0xf
 #define M_CMD_PROTOCOL_BLK_WR        0x7
 #define M_CMD_PROTOCOL_BLK_RD        0x8
+#define M_CMD_PROTOCOL_PROCESS       0xa
 #define M_CMD_PEC_SHIFT              8
 #define M_CMD_RD_CNT_SHIFT           0
 #define M_CMD_RD_CNT_MASK            0xff
@@ -675,13 +676,20 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i2c_dev *iproc_i2c,
 	return 0;
 }
 
-static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *iproc_i2c,
-					 struct i2c_msg *msg)
+/*
+ * If 'process_call' is true, then this is a multi-msg transfer that requires
+ * a repeated start between the messages.
+ * More specifically, it must be a write (reg) followed by a read (data).
+ * The i2c quirks are set to enforce this rule.
+ */
+static int bcm_iproc_i2c_xfer_internal(struct bcm_iproc_i2c_dev *iproc_i2c,
+					struct i2c_msg *msgs, bool process_call)
 {
 	int i;
 	u8 addr;
 	u32 val, tmp, val_intr_en;
 	unsigned int tx_bytes;
+	struct i2c_msg *msg = &msgs[0];
 
 	/* check if bus is busy */
 	if (!!(iproc_i2c_rd_reg(iproc_i2c,
@@ -707,14 +715,29 @@ static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *iproc_i2c,
 			val = msg->buf[i];
 
 			/* mark the last byte */
-			if (i == msg->len - 1)
-				val |= BIT(M_TX_WR_STATUS_SHIFT);
+			if (!process_call && (i == msg->len - 1))
+				val |= 1 << M_TX_WR_STATUS_SHIFT;
 
 			iproc_i2c_wr_reg(iproc_i2c, M_TX_OFFSET, val);
 		}
 		iproc_i2c->tx_bytes = tx_bytes;
 	}
 
+	/* Process the read message if this is process call */
+	if (process_call) {
+		msg++;
+		iproc_i2c->msg = msg;  /* point to second msg */
+
+		/*
+		 * The last byte to be sent out should be a slave
+		 * address with read operation
+		 */
+		addr = msg->addr << 1 | 1;
+		/* mark it the last byte out */
+		val = addr | (1 << M_TX_WR_STATUS_SHIFT);
+		iproc_i2c_wr_reg(iproc_i2c, M_TX_OFFSET, val);
+	}
+
 	/* mark as incomplete before starting the transaction */
 	if (iproc_i2c->irq)
 		reinit_completion(&iproc_i2c->done);
@@ -733,7 +756,7 @@ static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *iproc_i2c,
 	 * underrun interrupt, which will be triggerred when the TX FIFO is
 	 * empty. When that happens we can then pump more data into the FIFO
 	 */
-	if (!(msg->flags & I2C_M_RD) &&
+	if (!process_call && !(msg->flags & I2C_M_RD) &&
 	    msg->len > iproc_i2c->tx_bytes)
 		val_intr_en |= BIT(IE_M_TX_UNDERRUN_SHIFT);
 
@@ -743,6 +766,8 @@ static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *iproc_i2c,
 	 */
 	val = BIT(M_CMD_START_BUSY_SHIFT);
 	if (msg->flags & I2C_M_RD) {
+		u32 protocol;
+
 		iproc_i2c->rx_bytes = 0;
 		if (msg->len > M_RX_FIFO_MAX_THLD_VALUE)
 			iproc_i2c->thld_bytes = M_RX_FIFO_THLD_VALUE;
@@ -758,7 +783,10 @@ static int bcm_iproc_i2c_xfer_single_msg(struct bcm_iproc_i2c_dev *iproc_i2c,
 		/* enable the RX threshold interrupt */
 		val_intr_en |= BIT(IE_M_RX_THLD_SHIFT);
 
-		val |= (M_CMD_PROTOCOL_BLK_RD << M_CMD_PROTOCOL_SHIFT) |
+		protocol = process_call ?
+				M_CMD_PROTOCOL_PROCESS : M_CMD_PROTOCOL_BLK_RD;
+
+		val |= (protocol << M_CMD_PROTOCOL_SHIFT) |
 		       (msg->len << M_CMD_RD_CNT_SHIFT);
 	} else {
 		val |= (M_CMD_PROTOCOL_BLK_WR << M_CMD_PROTOCOL_SHIFT);
@@ -774,17 +802,31 @@ static int bcm_iproc_i2c_xfer(struct i2c_adapter *adapter,
 			      struct i2c_msg msgs[], int num)
 {
 	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adapter);
-	int ret, i;
+	bool process_call = false;
+	int ret;
 
-	/* go through all messages */
-	for (i = 0; i < num; i++) {
-		ret = bcm_iproc_i2c_xfer_single_msg(iproc_i2c, &msgs[i]);
-		if (ret) {
-			dev_dbg(iproc_i2c->device, "xfer failed\n");
-			return ret;
+	if (num > 2) {
+		dev_err(iproc_i2c->device,
+			"Only support up to 2 messages. Current msg count %d\n",
+			num);
+		return -EOPNOTSUPP;
+	}
+
+	if (num == 2) {
+		/* Repeated start, use process call */
+		process_call = true;
+		if (msgs[1].flags & I2C_M_NOSTART) {
+			dev_err(iproc_i2c->device, "Invalid repeated start\n");
+			return -EOPNOTSUPP;
 		}
 	}
 
+	ret = bcm_iproc_i2c_xfer_internal(iproc_i2c, msgs, process_call);
+	if (ret) {
+		dev_dbg(iproc_i2c->device, "xfer failed\n");
+		return ret;
+	}
+
 	return num;
 }
 
@@ -806,6 +848,8 @@ static uint32_t bcm_iproc_i2c_functionality(struct i2c_adapter *adap)
 };
 
 static struct i2c_adapter_quirks bcm_iproc_i2c_quirks = {
+	.flags = I2C_AQ_COMB_WRITE_THEN_READ,
+	.max_comb_1st_msg_len = M_TX_RX_FIFO_SIZE,
 	.max_read_len = M_RX_MAX_READ_LEN,
 };
 
-- 
1.9.1

