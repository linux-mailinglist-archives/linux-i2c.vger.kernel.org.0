Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEB13456DA
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 05:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhCWEe3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 00:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhCWEdy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 00:33:54 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B212EC0613D9
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 21:33:53 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C25C6891B3;
        Tue, 23 Mar 2021 17:33:48 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616474028;
        bh=QfeDP95sCv2SewuqWItI7gTMDloyQxHEwRRt8dG7Dr8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=AJSeMcwxhs7CRawp/+BUuT4/Y/qrNRZ1EKeebnZhdLAP38SmEXAeV30xMzezpXw77
         fCshKxpRywvJAAYJ+xlAi8pUHucGlPuyB0UbTujQcLNWlejkjFBO5w+A55uuA0u5Ao
         W1g/3dJkJbnue3Z4C5BKY/nJ6jL3MKJX1FrzJsScwrqCa9Hl+JLtRN9ws6week/uKu
         OdemY5p4Ctyk8SWCVl+CRck0WACkZgcahCWveZ7VrKJRMdLAg89Pc+pxYH+PpTOfOA
         poBhwLmAVx7twLLyR0DzjodjkUh2CWfdkEKFhMJmRIXnyphvtf7FnNOI+4goRJdZpl
         acAesl4Kck4sg==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60596fac0003>; Tue, 23 Mar 2021 17:33:48 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 249B013EED4;
        Tue, 23 Mar 2021 17:34:04 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 947B528409A; Tue, 23 Mar 2021 17:33:48 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, linux@roeck-us.net, wsa@kernel.org,
        jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 6/6] i2c: mpc: Interrupt driven transfer
Date:   Tue, 23 Mar 2021 17:33:31 +1300
Message-Id: <20210323043331.21878-7-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=uHd7jcRfAAAA:8 a=5ev65v1id6XjEa6wf1UA:9 a=FVs-WqTgHo97eV9s:21 a=eDJpZUWDSCT-sJcP:21 a=W4h6EnClZ8UN7yAF:21 a=Ht9MEGjvesGdgnQqdPSO:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The fsl-i2c controller will generate an interrupt after every byte
transferred. Make use of this interrupt to drive a state machine which
allows the next part of a transfer to happen as soon as the interrupt is
received. This is particularly helpful with SMBUS devices like the LM81
which will timeout if we take too long between bytes in a transfer.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 430 +++++++++++++++++++----------------
 1 file changed, 237 insertions(+), 193 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 46cdb36e2f9b..5ffde3428232 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -1,16 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * (C) Copyright 2003-2004
- * Humboldt Solutions Ltd, adrian@humboldt.co.uk.
-
  * This is a combined i2c adapter and algorithm driver for the
  * MPC107/Tsi107 PowerPC northbridge and processors that include
  * the same I2C unit (8240, 8245, 85xx).
  *
- * Release 0.8
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
+ * Copyright (C) 2003-2004 Humboldt Solutions Ltd, adrian@humboldt.co.uk
+ * Copyright (C) 2021 Allied Telesis Labs
  */
=20
 #include <linux/kernel.h>
@@ -58,11 +53,32 @@
 #define CSR_MIF  0x02
 #define CSR_RXAK 0x01
=20
+enum mpc_i2c_action {
+	MPC_I2C_ACTION_INVALID =3D 0,
+	MPC_I2C_ACTION_START,
+	MPC_I2C_ACTION_RESTART,
+	MPC_I2C_ACTION_READ_BEGIN,
+	MPC_I2C_ACTION_READ_BYTE,
+	MPC_I2C_ACTION_WRITE,
+	MPC_I2C_ACTION_STOP,
+};
+
+static char *action_str[] =3D {
+	"invalid",
+	"start",
+	"restart",
+	"read begin",
+	"read",
+	"write",
+	"stop",
+};
+
 struct mpc_i2c {
 	struct device *dev;
 	void __iomem *base;
 	u32 interrupt;
-	wait_queue_head_t queue;
+	wait_queue_head_t waitq;
+	spinlock_t              lock;
 	struct i2c_adapter adap;
 	int irq;
 	u32 real_clk;
@@ -70,6 +86,16 @@ struct mpc_i2c {
 	u8 fdr, dfsrr;
 #endif
 	struct clk *clk_per;
+	u32 cntl_bits;
+	enum mpc_i2c_action action;
+	struct i2c_msg *msgs;
+	int num_msgs;
+	int curr_msg;
+	u32 byte_posn;
+	u32 block;
+	int rc;
+	int expect_rxack;
+
 };
=20
 struct mpc_i2c_divider {
@@ -86,19 +112,6 @@ static inline void writeccr(struct mpc_i2c *i2c, u32 =
x)
 	writeb(x, i2c->base + MPC_I2C_CR);
 }
=20
-static irqreturn_t mpc_i2c_isr(int irq, void *dev_id)
-{
-	struct mpc_i2c *i2c =3D dev_id;
-	if (readb(i2c->base + MPC_I2C_SR) & CSR_MIF) {
-		/* Read again to allow register to stabilise */
-		i2c->interrupt =3D readb(i2c->base + MPC_I2C_SR);
-		writeb(0, i2c->base + MPC_I2C_SR);
-		wake_up(&i2c->queue);
-		return IRQ_HANDLED;
-	}
-	return IRQ_NONE;
-}
-
 /* Sometimes 9th clock pulse isn't generated, and slave doesn't release
  * the bus, because it wants to send ACK.
  * Following sequence of enabling/disabling and sending start/stop gener=
ates
@@ -121,45 +134,6 @@ static void mpc_i2c_fixup(struct mpc_i2c *i2c)
 	}
 }
=20
-static int i2c_wait(struct mpc_i2c *i2c, unsigned timeout, int writing)
-{
-	u32 cmd_err;
-	int result;
-
-	result =3D wait_event_timeout(i2c->queue,
-			(i2c->interrupt & CSR_MIF), timeout);
-
-	if (unlikely(!(i2c->interrupt & CSR_MIF))) {
-		dev_dbg(i2c->dev, "wait timeout\n");
-		writeccr(i2c, 0);
-		result =3D -ETIMEDOUT;
-	}
-
-	cmd_err =3D i2c->interrupt;
-	i2c->interrupt =3D 0;
-
-	if (result < 0)
-		return result;
-
-	if (!(cmd_err & CSR_MCF)) {
-		dev_dbg(i2c->dev, "unfinished\n");
-		return -EIO;
-	}
-
-	if (cmd_err & CSR_MAL) {
-		dev_dbg(i2c->dev, "MAL\n");
-		return -EAGAIN;
-	}
-
-	if (writing && (cmd_err & CSR_RXAK)) {
-		dev_dbg(i2c->dev, "No RXAK\n");
-		/* generate stop */
-		writeccr(i2c, CCR_MEN);
-		return -ENXIO;
-	}
-	return 0;
-}
-
 #if defined(CONFIG_PPC_MPC52xx) || defined(CONFIG_PPC_MPC512x)
 static const struct mpc_i2c_divider mpc_i2c_dividers_52xx[] =3D {
 	{20, 0x20}, {22, 0x21}, {24, 0x22}, {26, 0x23},
@@ -434,168 +408,209 @@ static void mpc_i2c_setup_8xxx(struct device_node=
 *node,
 }
 #endif /* CONFIG_FSL_SOC */
=20
-static void mpc_i2c_start(struct mpc_i2c *i2c)
+static void mpc_i2c_finish(struct mpc_i2c *i2c, int rc)
 {
-	/* Clear arbitration */
-	writeb(0, i2c->base + MPC_I2C_SR);
-	/* Start with MEN */
-	writeccr(i2c, CCR_MEN);
+	i2c->rc =3D rc;
+	i2c->block =3D 0;
+	i2c->cntl_bits =3D CCR_MEN;
+	writeccr(i2c, i2c->cntl_bits);
+	wake_up(&i2c->waitq);
 }
=20
-static void mpc_i2c_stop(struct mpc_i2c *i2c)
+static void mpc_i2c_do_action(struct mpc_i2c *i2c)
 {
-	writeccr(i2c, CCR_MEN);
-}
+	struct i2c_msg *msg =3D &i2c->msgs[i2c->curr_msg];
+	int dir =3D 0;
+	int recv_len =3D 0;
+	u8 byte;
+
+	dev_dbg(i2c->dev, "%s: action =3D %s\n", __func__,
+		action_str[i2c->action]);
+
+	i2c->cntl_bits &=3D ~(CCR_RSTA | CCR_MTX | CCR_TXAK);
+
+	if (msg->flags & I2C_M_RD)
+		dir =3D 1;
+	if (msg->flags & I2C_M_RECV_LEN)
+		recv_len =3D 1;
+
+	switch (i2c->action) {
+	case MPC_I2C_ACTION_RESTART:
+		i2c->cntl_bits |=3D CCR_RSTA;
+		fallthrough;
+
+	case MPC_I2C_ACTION_START:
+		i2c->cntl_bits |=3D CCR_MSTA | CCR_MTX;
+		writeccr(i2c, i2c->cntl_bits);
+		writeb((msg->addr << 1) | dir, i2c->base + MPC_I2C_DR);
+		i2c->expect_rxack =3D 1;
+		i2c->action =3D dir ? MPC_I2C_ACTION_READ_BEGIN : MPC_I2C_ACTION_WRITE=
;
+		break;
+
+	case MPC_I2C_ACTION_READ_BEGIN:
+		if (msg->len) {
+			if (msg->len =3D=3D 1 && !(msg->flags & I2C_M_RECV_LEN))
+				i2c->cntl_bits |=3D CCR_TXAK;
+
+			writeccr(i2c, i2c->cntl_bits);
+			/* Dummy read */
+			readb(i2c->base + MPC_I2C_DR);
+		}
+		i2c->action =3D MPC_I2C_ACTION_READ_BYTE;
+		break;
=20
-static int mpc_write(struct mpc_i2c *i2c, int target,
-		     const u8 *data, int length, int restart)
-{
-	int i, result;
-	unsigned timeout =3D i2c->adap.timeout;
-	u32 flags =3D restart ? CCR_RSTA : 0;
+	case MPC_I2C_ACTION_READ_BYTE:
+		if (i2c->byte_posn || !recv_len) {
+			/* Generate txack on next to last byte */
+			if (i2c->byte_posn =3D=3D msg->len - 2)
+				i2c->cntl_bits |=3D CCR_TXAK;
+			/* Do not generate stop on last byte */
+			if (i2c->byte_posn =3D=3D msg->len - 1)
+				i2c->cntl_bits |=3D CCR_MTX;
=20
-	/* Start as master */
-	writeccr(i2c, CCR_MIEN | CCR_MEN | CCR_MSTA | CCR_MTX | flags);
-	/* Write target byte */
-	writeb((target << 1), i2c->base + MPC_I2C_DR);
+			writeccr(i2c, i2c->cntl_bits);
+		}
=20
-	result =3D i2c_wait(i2c, timeout, 1);
-	if (result < 0)
-		return result;
+		byte =3D readb(i2c->base + MPC_I2C_DR);
=20
-	for (i =3D 0; i < length; i++) {
-		/* Write data byte */
-		writeb(data[i], i2c->base + MPC_I2C_DR);
+		if (i2c->byte_posn =3D=3D 0 && recv_len) {
+			if (byte =3D=3D 0 || byte > I2C_SMBUS_BLOCK_MAX) {
+				mpc_i2c_finish(i2c, -EPROTO);
+				return;
+			}
+			msg->len +=3D byte;
+			/*
+			 * For block reads, generate txack here if data length
+			 * is 1 byte (total length is 2 bytes).
+			 */
+			if (msg->len =3D=3D 2) {
+				i2c->cntl_bits |=3D CCR_TXAK;
+				writeccr(i2c, i2c->cntl_bits);
+			}
+		}
=20
-		result =3D i2c_wait(i2c, timeout, 1);
-		if (result < 0)
-			return result;
+		dev_dbg(i2c->dev, "%s: %s %02x\n", __func__,
+			action_str[i2c->action], byte);
+		msg->buf[i2c->byte_posn++] =3D byte;
+		break;
+
+	case MPC_I2C_ACTION_WRITE:
+		dev_dbg(i2c->dev, "%s: %s %02x\n", __func__,
+			action_str[i2c->action], msg->buf[i2c->byte_posn]);
+		writeb(msg->buf[i2c->byte_posn++], i2c->base + MPC_I2C_DR);
+		i2c->expect_rxack =3D 1;
+		break;
+
+	case MPC_I2C_ACTION_STOP:
+		mpc_i2c_finish(i2c, 0);
+		break;
+
+	case MPC_I2C_ACTION_INVALID:
+	default:
+		BUG();
+		break;
 	}
=20
-	return 0;
+	if (msg->len =3D=3D i2c->byte_posn) {
+		i2c->curr_msg++;
+		i2c->byte_posn =3D 0;
+
+		if (i2c->curr_msg =3D=3D i2c->num_msgs) {
+			i2c->action =3D MPC_I2C_ACTION_STOP;
+			/*
+			 * We don't get another interrupt on read so
+			 * finish the transfer now
+			 */
+			if (dir)
+				mpc_i2c_finish(i2c, 0);
+		} else {
+			i2c->action =3D MPC_I2C_ACTION_RESTART;
+		}
+	}
 }
=20
-static int mpc_read(struct mpc_i2c *i2c, int target,
-		    u8 *data, int length, int restart, bool recv_len)
+static void mpc_i2c_do_intr(struct mpc_i2c *i2c, u8 status)
 {
-	unsigned timeout =3D i2c->adap.timeout;
-	int i, result;
-	u32 flags =3D restart ? CCR_RSTA : 0;
+	unsigned long flags;
=20
-	/* Switch to read - restart */
-	writeccr(i2c, CCR_MIEN | CCR_MEN | CCR_MSTA | CCR_MTX | flags);
-	/* Write target address byte - this time with the read flag set */
-	writeb((target << 1) | 1, i2c->base + MPC_I2C_DR);
+	spin_lock_irqsave(&i2c->lock, flags);
=20
-	result =3D i2c_wait(i2c, timeout, 1);
-	if (result < 0)
-		return result;
+	if (!(status & CSR_MCF)) {
+		dev_dbg(i2c->dev, "unfinished\n");
+		mpc_i2c_finish(i2c, -EIO);
+		goto out;
+	}
=20
-	if (length) {
-		if (length =3D=3D 1 && !recv_len)
-			writeccr(i2c, CCR_MIEN | CCR_MEN | CCR_MSTA | CCR_TXAK);
-		else
-			writeccr(i2c, CCR_MIEN | CCR_MEN | CCR_MSTA);
-		/* Dummy read */
-		readb(i2c->base + MPC_I2C_DR);
+	if (status & CSR_MAL) {
+		dev_dbg(i2c->dev, "arbiritration lost\n");
+		mpc_i2c_finish(i2c, -EAGAIN);
+		goto out;
 	}
=20
-	for (i =3D 0; i < length; i++) {
-		u8 byte;
+	if (i2c->expect_rxack && (status & CSR_RXAK)) {
+		dev_dbg(i2c->dev, "no RXAK\n");
+		mpc_i2c_finish(i2c, -ENXIO);
+		goto out;
+	}
+	i2c->expect_rxack =3D 0;
=20
-		result =3D i2c_wait(i2c, timeout, 0);
-		if (result < 0)
-			return result;
+	mpc_i2c_do_action(i2c);
=20
-		/*
-		 * For block reads, we have to know the total length (1st byte)
-		 * before we can determine if we are done.
-		 */
-		if (i || !recv_len) {
-			/* Generate txack on next to last byte */
-			if (i =3D=3D length - 2)
-				writeccr(i2c, CCR_MIEN | CCR_MEN | CCR_MSTA
-					 | CCR_TXAK);
-			/* Do not generate stop on last byte */
-			if (i =3D=3D length - 1)
-				writeccr(i2c, CCR_MIEN | CCR_MEN | CCR_MSTA
-					 | CCR_MTX);
-		}
+out:
+	spin_unlock_irqrestore(&i2c->lock, flags);
+}
=20
-		byte =3D readb(i2c->base + MPC_I2C_DR);
+static irqreturn_t mpc_i2c_isr(int irq, void *dev_id)
+{
+	struct mpc_i2c *i2c =3D dev_id;
+	u8 status =3D readb(i2c->base + MPC_I2C_SR);
=20
-		/*
-		 * Adjust length if first received byte is length.
-		 * The length is 1 length byte plus actually data length
-		 */
-		if (i =3D=3D 0 && recv_len) {
-			if (byte =3D=3D 0 || byte > I2C_SMBUS_BLOCK_MAX)
-				return -EPROTO;
-			length +=3D byte;
-			/*
-			 * For block reads, generate txack here if data length
-			 * is 1 byte (total length is 2 bytes).
-			 */
-			if (length =3D=3D 2)
-				writeccr(i2c, CCR_MIEN | CCR_MEN | CCR_MSTA
-					 | CCR_TXAK);
-		}
-		data[i] =3D byte;
+	if (status & CSR_MIF) {
+		writeb(0, i2c->base + MPC_I2C_SR);
+		mpc_i2c_do_intr(i2c, status);
+		return IRQ_HANDLED;
 	}
+	return IRQ_NONE;
+}
+
+static void mpc_i2c_wait_for_completion(struct mpc_i2c *i2c)
+{
+	long time_left;
=20
-	return length;
+	time_left =3D wait_event_timeout(i2c->waitq, !i2c->block, i2c->adap.tim=
eout);
+
+	if (!time_left)
+		i2c->rc =3D -ETIMEDOUT;
+	else if (time_left < 0)
+		i2c->rc =3D time_left;
 }
=20
-static int mpc_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int =
num)
+static int mpc_i2c_execute_msg(struct mpc_i2c *i2c)
 {
-	struct i2c_msg *pmsg;
-	int i;
-	int ret =3D 0;
-	unsigned long orig_jiffies =3D jiffies;
-	struct mpc_i2c *i2c =3D i2c_get_adapdata(adap);
+	unsigned long orig_jiffies;
+	unsigned long flags;
=20
-	mpc_i2c_start(i2c);
+	spin_lock_irqsave(&i2c->lock, flags);
=20
-	/* Allow bus up to 1s to become not busy */
-	while (readb(i2c->base + MPC_I2C_SR) & CSR_MBB) {
-		if (signal_pending(current)) {
-			dev_dbg(i2c->dev, "Interrupted\n");
-			writeccr(i2c, 0);
-			return -EINTR;
-		}
-		if (time_after(jiffies, orig_jiffies + HZ)) {
-			u8 status =3D readb(i2c->base + MPC_I2C_SR);
+	i2c->curr_msg =3D 0;
+	i2c->rc =3D 0;
+	i2c->byte_posn =3D 0;
+	i2c->block =3D 1;
+	i2c->action =3D MPC_I2C_ACTION_START;
=20
-			dev_dbg(i2c->dev, "timeout\n");
-			if ((status & (CSR_MCF | CSR_MBB | CSR_RXAK)) !=3D 0) {
-				writeb(status & ~CSR_MAL,
-				       i2c->base + MPC_I2C_SR);
-				i2c_recover_bus(&i2c->adap);
-			}
-			return -EIO;
-		}
-		schedule();
-	}
+	i2c->cntl_bits =3D CCR_MEN | CCR_MIEN;
+	writeb(0, i2c->base + MPC_I2C_SR);
+	writeccr(i2c, i2c->cntl_bits);
+
+	mpc_i2c_do_action(i2c);
+
+	spin_unlock_irqrestore(&i2c->lock, flags);
+
+	mpc_i2c_wait_for_completion(i2c);
+
+	if (i2c->rc =3D=3D -EIO || i2c->rc =3D=3D -EAGAIN || i2c->rc =3D=3D -ET=
IMEDOUT)
+		i2c_recover_bus(&i2c->adap);
=20
-	for (i =3D 0; ret >=3D 0 && i < num; i++) {
-		pmsg =3D &msgs[i];
-		dev_dbg(i2c->dev,
-			"Doing %s %d bytes to 0x%02x - %d of %d messages\n",
-			pmsg->flags & I2C_M_RD ? "read" : "write",
-			pmsg->len, pmsg->addr, i + 1, num);
-		if (pmsg->flags & I2C_M_RD) {
-			bool recv_len =3D pmsg->flags & I2C_M_RECV_LEN;
-
-			ret =3D mpc_read(i2c, pmsg->addr, pmsg->buf, pmsg->len, i,
-				       recv_len);
-			if (recv_len && ret > 0)
-				pmsg->len =3D ret;
-		} else {
-			ret =3D
-			    mpc_write(i2c, pmsg->addr, pmsg->buf, pmsg->len, i);
-		}
-	}
-	mpc_i2c_stop(i2c); /* Initiate STOP */
 	orig_jiffies =3D jiffies;
 	/* Wait until STOP is seen, allow up to 1 s */
 	while (readb(i2c->base + MPC_I2C_SR) & CSR_MBB) {
@@ -612,7 +627,35 @@ static int mpc_xfer(struct i2c_adapter *adap, struct=
 i2c_msg *msgs, int num)
 		}
 		cond_resched();
 	}
-	return (ret < 0) ? ret : num;
+
+	return i2c->rc;
+}
+
+static int mpc_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int =
num)
+{
+	int rc, ret =3D num;
+	struct mpc_i2c *i2c =3D i2c_get_adapdata(adap);
+	int i;
+
+	dev_dbg(i2c->dev, "%s: num =3D %d\n", __func__, num);
+	for (i =3D 0; i < num; i++)
+		dev_dbg(i2c->dev, "  addr =3D %02x, flags =3D %02x, len =3D %d, %*ph\n=
",
+			msgs[i].addr, msgs[i].flags, msgs[i].len,
+			msgs[i].flags & I2C_M_RD ? 0 : msgs[i].len,
+			msgs[i].buf);
+
+	BUG_ON(i2c->msgs !=3D NULL);
+	i2c->msgs =3D msgs;
+	i2c->num_msgs =3D num;
+
+	rc =3D mpc_i2c_execute_msg(i2c);
+	if (rc < 0)
+		ret =3D rc;
+
+	i2c->num_msgs =3D 0;
+	i2c->msgs =3D NULL;
+
+	return ret;
 }
=20
 static u32 mpc_functionality(struct i2c_adapter *adap)
@@ -667,7 +710,8 @@ static int fsl_i2c_probe(struct platform_device *op)
=20
 	i2c->dev =3D &op->dev; /* for debug and error output */
=20
-	init_waitqueue_head(&i2c->queue);
+	init_waitqueue_head(&i2c->waitq);
+	spin_lock_init(&i2c->lock);
=20
 	i2c->base =3D devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(i2c->base)) {
--=20
2.30.2

