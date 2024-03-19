Return-Path: <linux-i2c+bounces-2433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5097E880AB9
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 06:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59B8A1C20F99
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 05:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C09423770;
	Wed, 20 Mar 2024 05:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIqJiztV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399A020DE5;
	Wed, 20 Mar 2024 05:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710912933; cv=none; b=RwU4oscJWczlgm7lyfsL1jHe3ge1OxC0kdxM7RJAOcyESfg04Am6cPTW1YnugqRBFtKeDGzzXDCZWBNPAZt9N7xJqayAfpq4zXpUfKq6pWEA8q/Vz0sySf22JYfMA5WEGTkUF2CeAAMQkjfHQbRegsD8iTRu9R+eue/5ULLTNNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710912933; c=relaxed/simple;
	bh=acjNLx8citQNYv7hc9P0dJeaGWmIbEhzPE1To+eghJk=;
	h=Message-ID:From:To:Cc:Date:Subject; b=Z/ZjAKWqB9z3+BzrFgVUrsz0V3J6PElb9BcPHLcUV8qdthJTJ/TyY+nmNQfGK0f2iwvNMveEHdyeF/T8u3sZ1EGU1QylME5OMQ+wTwDg030Agow/UZVL9vbStYD+RCQy+DuKpw0rQaQctU3E+pSRVg8MBpjdMPfBKcdxOZkAtcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIqJiztV; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7c8060a8489so138882939f.0;
        Tue, 19 Mar 2024 22:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710912930; x=1711517730; darn=vger.kernel.org;
        h=subject:date:cc:to:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1TVeylraIHS/40ZJpeh/ShzEqQdq14GVcFuMpcFTQQ=;
        b=PIqJiztVpIAemz0GZ4Q3r4Nu3zBud9gIX4bNTTfIADmVXe6TkQnADoZLxLTh4Z3tas
         FBy+lmoIUhVHAfVU3MKOSoYrRkdnhH+wKfA44gYH7rZXv3/77gTyXOIPon0Al6JcW0rk
         jYFMfCa/1WYZWnBXYpIkymz6+5ktXTei1WNxYwGgdSUli/IA6cz6neRFIVQqNK5xlA62
         iFpoYvm2IxDSPBdOF8m/T6WYO7grctEDT75cksGIEQfmy2C+K1C8OCAFkxFVkcPi1gHG
         L1kpA8ARCysfIo95M6JpX5L0g2TsByrM0Tlbf2Vp2cn/a92MX72cv8S5+dDApzUQIaoc
         K0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710912930; x=1711517730;
        h=subject:date:cc:to:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1TVeylraIHS/40ZJpeh/ShzEqQdq14GVcFuMpcFTQQ=;
        b=eLQzyNW+ET8mJC0uNLXN/ialUETfEFUoEUTXPUsfdWgRmc7XkW6cDajv7H6f2Y5IeP
         FSFL3gepG29pqhKuK1PNrTGtx6SvNhBq+WXfOooAvIezSxPf74SqJQSmByCnRQJM6f5K
         wYWy3m7KXPiYhjzR86mM+RZ2TXLUA0xNpDEaTLiHPt56h/PqjOqiFfUH+NNnHzNdcKGe
         C32SkWQcWq4yu14YbbefEdQ/nmxpIzqun93vF9abyuC4HVVGohWn1QkkRa0uwtYzJhsQ
         k1LH9cBUn/OXDRqlfXwaInv1+XcA5quVJu3LznoBcMk3NlY2+xljTvEomTjCE2GfWh0r
         rRLA==
X-Forwarded-Encrypted: i=1; AJvYcCVxiEbuQSHSBOgX3DPX0YAa5R3LifYLm4Kg23G+dBNQpMBDVBw6dD5bRiVy9MyUYSC4xl4N6bzpfGPdjJLxWEz+tQGHI8w6RGe2Er3s
X-Gm-Message-State: AOJu0YyHBSwDRUTaZd4DDsN6En9X5iu0/dcfF3n+EhxLRXhP1JsxI8E5
	HnpoF8DZycJAeWtyCkVcCiJZ2lH8tvgCG2oGgbAkBD++MsOP1fhd
X-Google-Smtp-Source: AGHT+IF5/q16vRWg25pzVE4/V1Y8i6AaZhh6eyiGEAHYlmU+l+JJS05HF01ZhsjnRmeznpsW1fMviQ==
X-Received: by 2002:a5d:8c95:0:b0:7cc:6e18:4627 with SMTP id g21-20020a5d8c95000000b007cc6e184627mr1159899ion.20.1710912930417;
        Tue, 19 Mar 2024 22:35:30 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:9af9:b18f:3f69:51be? ([2001:470:42c4:101:9af9:b18f:3f69:51be])
        by smtp.gmail.com with ESMTPSA id q6-20020a5d9f06000000b007cc6af6686esm1679597iot.30.2024.03.19.22.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 22:35:30 -0700 (PDT)
Message-ID: <65fa75a2.5d0a0220.fe5f7.1fa4@mx.google.com>
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <sam@turingpi.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 19 Mar 2024 16:52:25 -0600
Subject: [RESEND v2 RFC 5/5] i2c: mv64xxx: Implement I2C_FUNC_NOSTART
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

There are certain I2C devices [1] that require some extra parameter bytes
in any read operation, after the start byte but before the bus turnaround,
in contrast to the "conventional" approach of using a normal write to
parameterize the upcoming read.

The (Allwinner variant of) mv64xxx supports this kind of transfer, for
up to 3 bytes of additional data, through a register called "TWI_EFR"
("Enhance Feature Register"). These devices can be supported by setting
this register appropriately when beginning the read operation.

In absence of a specialized flag to represent this in Linux's I2C
subsystem, clients use I2C_M_NOSTART to achieve this. In fact, this
appears to be the most common use of I2C_M_NOSTART in the Linux
codebase, with the second most common being to implement "gather" I/O by
chaining a series of NOSTART writes.

This patch implements both of these use cases when the EFR is present:
1) Continuing a write message with further write bytes, as a sort of
   "gather" operation.
2) Inserting extra parameter bytes after the address of a read
   operation, using a zero-byte read, a small (<= 3 bytes) NOSTART
   write, and then a NOSTART read.

...the hardware is likely too strict to allow any other uses, so the
message bundle is checked for proper use of NOSTART before it begins.
That being said, there's a good chance that these are the only two uses
of NOSTART "in the wild," which would mean that this isn't much of a
limitation.

The implementation redesigns the hardware event handler slightly, so
that the FSM can be invoked in a loop if the do_action function
generates follow-up events. The NEXT_MESSAGE (formerly SEND_RESTART)
action now results in either a restart, or (for NOSTART) a follow-up
NOSTART event to the FSM, which allows it to bypass the entire start
sequence and jump straight to the data.

[1]: See e.g. `as5011_i2c_read`, `ivch_read`, `maven_get_reg`

Signed-off-by: Sam Edwards <sam@turingpi.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 105 +++++++++++++++++++++++++++----
 1 file changed, 94 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 6a205cca603a..f09f23404784 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -100,6 +100,7 @@ enum mv64xxx_i2c_state {
 enum mv64xxx_i2c_event {
 	MV64XXX_I2C_EVENT_INVALID,
 	MV64XXX_I2C_EVENT_STARTED,
+	MV64XXX_I2C_EVENT_NOSTART,
 	MV64XXX_I2C_EVENT_ADDR_ACK,
 	MV64XXX_I2C_EVENT_ADDR_NO_ACK,
 	MV64XXX_I2C_EVENT_WR_ACK,
@@ -112,7 +113,7 @@ enum mv64xxx_i2c_event {
 enum mv64xxx_i2c_action {
 	MV64XXX_I2C_ACTION_INVALID,
 	MV64XXX_I2C_ACTION_CONTINUE,
-	MV64XXX_I2C_ACTION_SEND_RESTART,
+	MV64XXX_I2C_ACTION_NEXT_MESSAGE,
 	MV64XXX_I2C_ACTION_SEND_ADDR_1,
 	MV64XXX_I2C_ACTION_SEND_ADDR_2,
 	MV64XXX_I2C_ACTION_SEND_DATA,
@@ -129,6 +130,7 @@ struct mv64xxx_i2c_regs {
 	u8	status;
 	u8	clock;
 	u8	soft_reset;
+	u8	enh_feat;
 };
 
 struct mv64xxx_i2c_data {
@@ -185,6 +187,7 @@ static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_sun4i = {
 	.status		= 0x10,
 	.clock		= 0x14,
 	.soft_reset	= 0x18,
+	.enh_feat	= 0x1c,
 };
 
 static void
@@ -306,9 +309,9 @@ mv64xxx_i2c_decode_status(struct mv64xxx_i2c_data *drv_data, u32 status)
 }
 
 static void
-mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
+mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data,
+		enum mv64xxx_i2c_event event, u32 status)
 {
-	enum mv64xxx_i2c_event event;
 	enum mv64xxx_i2c_state prev_state = drv_data->state;
 
 	drv_data->action = MV64XXX_I2C_ACTION_INVALID;
@@ -329,7 +332,6 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 	 * 2) Handle hardware event driven state transitions
 	 * 3) Perform internal state transitions and action emission
 	 */
-	event = mv64xxx_i2c_decode_status(drv_data, status);
 
 	/* Handle event; determine state transition */
 	switch (event) {
@@ -337,6 +339,7 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 		drv_data->state = MV64XXX_I2C_STATE_SEND_ADDR_1;
 		break;
 
+	case MV64XXX_I2C_EVENT_NOSTART:
 	case MV64XXX_I2C_EVENT_ADDR_ACK:
 		if ((drv_data->state == MV64XXX_I2C_STATE_SEND_ADDR_1)
 		    && (drv_data->msg->flags & I2C_M_TEN))
@@ -399,7 +402,7 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 				drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
 				drv_data->state = MV64XXX_I2C_STATE_IDLE;
 			} else {
-				drv_data->action = MV64XXX_I2C_ACTION_SEND_RESTART;
+				drv_data->action = MV64XXX_I2C_ACTION_NEXT_MESSAGE;
 				drv_data->state = MV64XXX_I2C_STATE_RESTART;
 			}
 		} else {
@@ -429,7 +432,7 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 				drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
 				drv_data->state = MV64XXX_I2C_STATE_IDLE;
 			} else {
-				drv_data->action = MV64XXX_I2C_ACTION_SEND_RESTART;
+				drv_data->action = MV64XXX_I2C_ACTION_NEXT_MESSAGE;
 				drv_data->state = MV64XXX_I2C_STATE_RESTART;
 			}
 		} else {
@@ -444,18 +447,38 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 
 static void mv64xxx_i2c_send_start(struct mv64xxx_i2c_data *drv_data)
 {
+	u8 extra_bytes;
+
 	drv_data->msg = drv_data->msgs;
 	drv_data->byte_posn = 0;
 	drv_data->bytes_left = drv_data->msg->len;
 	drv_data->aborting = 0;
 	drv_data->rc = 0;
 
+	if (drv_data->msg->flags & I2C_M_NOSTART)
+		return;
+
+	/*
+	 * If this is a zero-length read, and the next message is a NOSTART
+	 * write, the client driver is trying to insert extra bytes after the
+	 * address but before the read proper.
+	 */
+	if ((drv_data->msg->len == 0) && (drv_data->msg->flags & I2C_M_RD) &&
+	    (drv_data->num_msgs > 1) && (drv_data->msgs[1].flags == I2C_M_NOSTART))
+		extra_bytes = drv_data->msgs[1].len;
+	else
+		extra_bytes = 0;
+
+	if (drv_data->reg_offsets.enh_feat != 0)
+		writel(extra_bytes,
+		       drv_data->reg_base + drv_data->reg_offsets.enh_feat);
+
 	mv64xxx_i2c_prepare_for_io(drv_data, drv_data->msgs);
 	writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_START,
 	       drv_data->reg_base + drv_data->reg_offsets.control);
 }
 
-static void
+static enum mv64xxx_i2c_event
 mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 {
 	if (drv_data->action & MV64XXX_I2C_ACTION_RECEIVE)
@@ -464,7 +487,7 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 	drv_data->action &= ~MV64XXX_I2C_ACTION_RECEIVE;
 
 	switch(drv_data->action) {
-	case MV64XXX_I2C_ACTION_SEND_RESTART:
+	case MV64XXX_I2C_ACTION_NEXT_MESSAGE:
 		/* We should only get here if we have further messages */
 		BUG_ON(drv_data->num_msgs == 0);
 
@@ -481,6 +504,10 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 		 * Thankfully, do not advertise support for that feature.
 		 */
 		drv_data->send_stop = drv_data->num_msgs == 1;
+
+		if (drv_data->msg->flags & I2C_M_NOSTART)
+			return MV64XXX_I2C_EVENT_NOSTART;
+
 		break;
 
 	case MV64XXX_I2C_ACTION_CONTINUE:
@@ -525,6 +552,8 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 		wake_up(&drv_data->waitq);
 		break;
 	}
+
+	return MV64XXX_I2C_EVENT_INVALID;
 }
 
 static void
@@ -595,6 +624,7 @@ static irqreturn_t
 mv64xxx_i2c_intr(int irq, void *dev_id)
 {
 	struct mv64xxx_i2c_data	*drv_data = dev_id;
+	enum mv64xxx_i2c_event event;
 	u32		status;
 	irqreturn_t	rc = IRQ_NONE;
 
@@ -617,8 +647,11 @@ mv64xxx_i2c_intr(int irq, void *dev_id)
 			ndelay(100);
 
 		status = readl(drv_data->reg_base + drv_data->reg_offsets.status);
-		mv64xxx_i2c_fsm(drv_data, status);
-		mv64xxx_i2c_do_action(drv_data);
+		event = mv64xxx_i2c_decode_status(drv_data, status);
+		do {
+			mv64xxx_i2c_fsm(drv_data, event, status);
+			event = mv64xxx_i2c_do_action(drv_data);
+		} while (event != MV64XXX_I2C_EVENT_INVALID);
 
 		if (drv_data->irq_clear_inverted)
 			writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_IFLG,
@@ -830,7 +863,54 @@ mv64xxx_i2c_can_offload(struct mv64xxx_i2c_data *drv_data)
 static u32
 mv64xxx_i2c_functionality(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SMBUS_EMUL;
+	struct mv64xxx_i2c_data *drv_data = i2c_get_adapdata(adap);
+	u32 func = I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SMBUS_EMUL;
+
+	if (drv_data->reg_offsets.enh_feat != 0)
+		func |= I2C_FUNC_NOSTART;
+
+	return func;
+}
+
+static bool
+mv64xxx_i2c_check_msgs(struct i2c_msg msgs[], int num)
+{
+	int i;
+	bool is_write, prev_is_write;
+
+	/*
+	 * The I2C hardware is pretty strict about ensuring that the protocol
+	 * is followed properly, and doesn't allow a lot of "creativity" how
+	 * transfers are composed. This driver advertises I2C_FUNC_NOSTART, but
+	 * can only support the two most common patterns for use of NOSTART:
+	 * 1) Continuing a write message with further write bytes, as a sort of
+	 *    "gather" operation.
+	 * 2) Inserting extra parameter bytes after the address of a read
+	 *    operation, using a zero-byte read, a small (<= 3 bytes) NOSTART
+	 *    write, and then a NOSTART read.
+	 */
+
+	for (i = 0; i < num; i++) {
+		/* Check for case 1 */
+		if (msgs[i].flags & I2C_M_NOSTART) {
+			if (i == 0)
+				return false;
+			is_write = !(msgs[i].flags & I2C_M_RD);
+			prev_is_write = !(msgs[i-1].flags & I2C_M_RD);
+			if (!is_write || !prev_is_write)
+				return false;
+		}
+
+		/* Check for case 2 */
+		if (i + 2 < num) {
+			if ((msgs[i].flags == I2C_M_RD) && (msgs[i].len == 0) &&
+			    (msgs[i+1].flags == I2C_M_NOSTART) && (msgs[i+1].len <= 3) &&
+			    (msgs[i+2].flags == (I2C_M_NOSTART|I2C_M_RD)))
+				i += 2;
+		}
+	}
+
+	return true;
 }
 
 static int
@@ -840,6 +920,9 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	int rc, ret = num;
 	u32 status;
 
+	if (!mv64xxx_i2c_check_msgs(msgs, num))
+		return -ENOTSUPP;
+
 	rc = pm_runtime_resume_and_get(&adap->dev);
 	if (rc)
 		return rc;
-- 
2.43.2


