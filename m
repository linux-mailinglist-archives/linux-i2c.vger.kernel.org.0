Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D2A35FDD2
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 00:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbhDNWeG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 18:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233430AbhDNWeF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 18:34:05 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB8CC061756
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 15:33:43 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 49CBA891AE;
        Thu, 15 Apr 2021 10:33:40 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618439620;
        bh=RuETiTyFiuIhSllmR1qfOYzPqtp6INGBwlxsgYnU5vc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=eehHmdBGKGYaNCPuWFWWcN1VUQiG2nRAnQz19ZCPnTtNtdLb5clsATRzhs9y0DuJR
         mA+kClsZPUc2AZqw8z2tHlGu5PgSq2gNyqR97vjBuxS3uuqaALhQGmzct05ry6W01L
         wlfVR73vgruvRRHYNcAXJcRGQEqM/M2VInWuhYB2KDGBvIfFRQxFB3bfSyVYvvBD/k
         WcN6VQ4yub3iHLI/rEnynN+crORhZ//PpFtQeaUe2px8lGPOpYmeYiwj+ep9hRHfC9
         rL4WgA7bG2Ifq4d94RTURYYC9VnDFHXp2YWUMSJH3wuANSQ9ko1YH5t5TI4B5vIAN6
         EUvqOhFwFUO/Q==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60776dc40000>; Thu, 15 Apr 2021 10:33:40 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id AB1DC13EEED;
        Thu, 15 Apr 2021 10:34:00 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 1387828945B; Thu, 15 Apr 2021 10:33:40 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 1/6] i2c: mpc: Interrupt driven transfer
Date:   Thu, 15 Apr 2021 10:33:20 +1200
Message-Id: <20210414223325.23352-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
References: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=3YhXtTcJ-WEA:10 a=pu0HztFv4GyyMxr_WEcA:9 a=_fp7lqJBY8z6Mao4:21 a=V9OIF9dgZ1Ca0ZV1:21 a=YoDOTsA-hFS9TtNj:21
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

Notes:
    Changes in v4:
    - Split license/copyright change to separate patch
    - Remove MPC_I2C_ACTION_INVALID
    - make action_str const
    - Remove __func__ from dev_dbg output
    - Use Tx ACK/Rx ACK consistently in comments and messages
    - Use spin_lock() instead of spin_lock_irqsave() in hardirq context
    - Typo fix arbiritration -> arbitration
    - Make mpc_i2c_wait_for_completion return an error and use that to se=
t i2c->rc
    - Minor style fixes in mpc_i2c_isr and mpc_i2c_wait_for_completion
    - I haven't deduplicated the read/write debug in mpc_i2c_do_action() =
as
      doing so seems to make things overly complex
    Changes in v3:
    - use WARN/WARN_ON instead of BUG/BUG_ON
    Changes in v2:
    - add static_assert for state debug strings
    - remove superfluous space

 drivers/i2c/busses/i2c-mpc.c | 426 ++++++++++++++++++++---------------
 1 file changed, 239 insertions(+), 187 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 3c8bcdfff7e7..0a80fafbe6c6 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -58,11 +58,35 @@
 #define CSR_MIF  0x02
 #define CSR_RXAK 0x01
=20
+enum mpc_i2c_action {
+	MPC_I2C_ACTION_START =3D 1,
+	MPC_I2C_ACTION_RESTART,
+	MPC_I2C_ACTION_READ_BEGIN,
+	MPC_I2C_ACTION_READ_BYTE,
+	MPC_I2C_ACTION_WRITE,
+	MPC_I2C_ACTION_STOP,
+
+	__MPC_I2C_ACTION_CNT
+};
+
+static const char * const action_str[] =3D {
+	"invalid",
+	"start",
+	"restart",
+	"read begin",
+	"read",
+	"write",
+	"stop",
+};
+
+static_assert(ARRAY_SIZE(action_str) =3D=3D __MPC_I2C_ACTION_CNT);
+
 struct mpc_i2c {
 	struct device *dev;
 	void __iomem *base;
 	u32 interrupt;
-	wait_queue_head_t queue;
+	wait_queue_head_t waitq;
+	spinlock_t lock;
 	struct i2c_adapter adap;
 	int irq;
 	u32 real_clk;
@@ -70,6 +94,16 @@ struct mpc_i2c {
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
@@ -86,19 +120,6 @@ static inline void writeccr(struct mpc_i2c *i2c, u32 =
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
@@ -121,45 +142,6 @@ static void mpc_i2c_fixup(struct mpc_i2c *i2c)
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
@@ -434,168 +416,209 @@ static void mpc_i2c_setup_8xxx(struct device_node=
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
+	dev_dbg(i2c->dev, "action =3D %s\n", action_str[i2c->action]);
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
+
+	case MPC_I2C_ACTION_READ_BYTE:
+		if (i2c->byte_posn || !recv_len) {
+			/* Generate Tx ACK on next to last byte */
+			if (i2c->byte_posn =3D=3D msg->len - 2)
+				i2c->cntl_bits |=3D CCR_TXAK;
+			/* Do not generate stop on last byte */
+			if (i2c->byte_posn =3D=3D msg->len - 1)
+				i2c->cntl_bits |=3D CCR_MTX;
=20
-static int mpc_write(struct mpc_i2c *i2c, int target,
-		     const u8 *data, int length, int restart)
-{
-	int i, result;
-	unsigned timeout =3D i2c->adap.timeout;
-	u32 flags =3D restart ? CCR_RSTA : 0;
+			writeccr(i2c, i2c->cntl_bits);
+		}
=20
-	/* Start as master */
-	writeccr(i2c, CCR_MIEN | CCR_MEN | CCR_MSTA | CCR_MTX | flags);
-	/* Write target byte */
-	writeb((target << 1), i2c->base + MPC_I2C_DR);
+		byte =3D readb(i2c->base + MPC_I2C_DR);
=20
-	result =3D i2c_wait(i2c, timeout, 1);
-	if (result < 0)
-		return result;
+		if (i2c->byte_posn =3D=3D 0 && recv_len) {
+			if (byte =3D=3D 0 || byte > I2C_SMBUS_BLOCK_MAX) {
+				mpc_i2c_finish(i2c, -EPROTO);
+				return;
+			}
+			msg->len +=3D byte;
+			/*
+			 * For block reads, generate Tx ACK here if data length
+			 * is 1 byte (total length is 2 bytes).
+			 */
+			if (msg->len =3D=3D 2) {
+				i2c->cntl_bits |=3D CCR_TXAK;
+				writeccr(i2c, i2c->cntl_bits);
+			}
+		}
+
+		dev_dbg(i2c->dev, "%s %02x\n", action_str[i2c->action], byte);
+		msg->buf[i2c->byte_posn++] =3D byte;
+		break;
=20
-	for (i =3D 0; i < length; i++) {
-		/* Write data byte */
-		writeb(data[i], i2c->base + MPC_I2C_DR);
+	case MPC_I2C_ACTION_WRITE:
+		dev_dbg(i2c->dev, "%s %02x\n", action_str[i2c->action],
+			msg->buf[i2c->byte_posn]);
+		writeb(msg->buf[i2c->byte_posn++], i2c->base + MPC_I2C_DR);
+		i2c->expect_rxack =3D 1;
+		break;
=20
-		result =3D i2c_wait(i2c, timeout, 1);
-		if (result < 0)
-			return result;
+	case MPC_I2C_ACTION_STOP:
+		mpc_i2c_finish(i2c, 0);
+		break;
+
+	default:
+		WARN(1, "Unexpected action %d\n", i2c->action);
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
+	spin_lock(&i2c->lock);
=20
-	/* Switch to read - restart */
-	writeccr(i2c, CCR_MIEN | CCR_MEN | CCR_MSTA | CCR_MTX | flags);
-	/* Write target address byte - this time with the read flag set */
-	writeb((target << 1) | 1, i2c->base + MPC_I2C_DR);
+	if (!(status & CSR_MCF)) {
+		dev_dbg(i2c->dev, "unfinished\n");
+		mpc_i2c_finish(i2c, -EIO);
+		goto out;
+	}
=20
-	result =3D i2c_wait(i2c, timeout, 1);
-	if (result < 0)
-		return result;
+	if (status & CSR_MAL) {
+		dev_dbg(i2c->dev, "arbitration lost\n");
+		mpc_i2c_finish(i2c, -EAGAIN);
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
+	if (i2c->expect_rxack && (status & CSR_RXAK)) {
+		dev_dbg(i2c->dev, "no Rx ACK\n");
+		mpc_i2c_finish(i2c, -ENXIO);
+		goto out;
 	}
+	i2c->expect_rxack =3D 0;
=20
-	for (i =3D 0; i < length; i++) {
-		u8 byte;
-
-		result =3D i2c_wait(i2c, timeout, 0);
-		if (result < 0)
-			return result;
-
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
+	mpc_i2c_do_action(i2c);
=20
-		byte =3D readb(i2c->base + MPC_I2C_DR);
+out:
+	spin_unlock(&i2c->lock);
+}
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
+static irqreturn_t mpc_i2c_isr(int irq, void *dev_id)
+{
+	struct mpc_i2c *i2c =3D dev_id;
+	u8 status;
+
+	status =3D readb(i2c->base + MPC_I2C_SR);
+	if (status & CSR_MIF) {
+		writeb(0, i2c->base + MPC_I2C_SR);
+		mpc_i2c_do_intr(i2c, status);
+		return IRQ_HANDLED;
 	}
+	return IRQ_NONE;
+}
=20
-	return length;
+static int mpc_i2c_wait_for_completion(struct mpc_i2c *i2c)
+{
+	long time_left;
+
+	time_left =3D wait_event_timeout(i2c->waitq, !i2c->block, i2c->adap.tim=
eout);
+	if (!time_left)
+		return -ETIMEDOUT;
+	if (time_left < 0)
+		return time_left;
+
+	return 0;
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
+	int ret;
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
+	ret =3D mpc_i2c_wait_for_completion(i2c);
+	if (ret)
+		i2c->rc =3D ret;
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
@@ -612,7 +635,35 @@ static int mpc_xfer(struct i2c_adapter *adap, struct=
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
+	dev_dbg(i2c->dev, "num =3D %d\n", num);
+	for (i =3D 0; i < num; i++)
+		dev_dbg(i2c->dev, "  addr =3D %02x, flags =3D %02x, len =3D %d, %*ph\n=
",
+			msgs[i].addr, msgs[i].flags, msgs[i].len,
+			msgs[i].flags & I2C_M_RD ? 0 : msgs[i].len,
+			msgs[i].buf);
+
+	WARN_ON(i2c->msgs !=3D NULL);
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
@@ -667,7 +718,8 @@ static int fsl_i2c_probe(struct platform_device *op)
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
2.31.1

