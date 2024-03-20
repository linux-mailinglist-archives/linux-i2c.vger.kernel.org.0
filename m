Return-Path: <linux-i2c+bounces-2421-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C63880931
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 02:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 691C51C219B9
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 01:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E152208B;
	Wed, 20 Mar 2024 01:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b="apvoJnmx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8E520DE5
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 01:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710898952; cv=none; b=lPVi7hnxWTjU/vuzZfWl0O0eWF37q7ESKcH5JtESy6y/wcnXNtGwR3L1APu4XNu5VQ/Qlar3zLHqrzsz4PGlArBF631hlURTWvfkcZLonGOMDvFrSqgcDE/99ANx7RUWO4M741ujtUoIFiDAuFW5sO/l0r6sv87II0xvdSUbr8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710898952; c=relaxed/simple;
	bh=gRhTT81m5w3zmkRy7+hU7ZO5W0SYFGJYswPUuXwVPvE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=dWewq4ZNoLv7qyGbD0lxgwd6OG8a9VCWo5Fpvees7pQBEzrAQLYnNSvwWTzQvnGhYcT/x2aBkWlV/Ula57qwrGzeUwacgdyXt32l/Ucq2c06R11fx17U4QWHHkJIrRHORa8r03kffUCpAsBtuFWneBbmuIm1hjKWCnevtzq8YGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com; spf=pass smtp.mailfrom=turingpi.com; dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b=apvoJnmx; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingpi.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7c7476a11e0so180610039f.3
        for <linux-i2c@vger.kernel.org>; Tue, 19 Mar 2024 18:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=turingpi.com; s=google; t=1710898949; x=1711503749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLgTdJH36mvwr2T0MphzrxnMySGTTW/Hx4ZBpDccgyA=;
        b=apvoJnmxXWN3EMqtVqRN8a8JTg185YBi1rt5o60QP0xqUr2Inx0lnieoynfDb9qpAR
         sqSlAXebWSeqkjkRoRAc+i3mggqCYR7R8PK4W6+8yWPo9j4wiKDhtbTgwP7N8aEdnDl3
         3LvcgXiSs+SdW8vpzjVm1fR0aDRio9i9Sv2bXLs9yPYfJQJmkHss3yDy+/1su+M1KMM1
         gecgaQmi279kVqjuIpfKPPBancqpsSVHjvA5+/XGfXYTXzS0fCIO77GP8f0x9tlQkLTJ
         A+03rmJ9Rkt/wzBRFu/5Z85aire3MH6Daz33aa8hhD+JiGbbWksjwc2Ei7lBEO0tM6S4
         +Jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710898949; x=1711503749;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pLgTdJH36mvwr2T0MphzrxnMySGTTW/Hx4ZBpDccgyA=;
        b=hsv5Zf7FtB3IJM11ft7Hk5CgZseeYuKB+hF9fOEoMlhNfr6gGehwYd5/MVr/0JKSMb
         C+ce5gBHITDpnQYXycBj3+WkOht/m8OPK59SR+1EhFmT7lVarl3LNRzLnX2S3yxuMDqX
         mju2WKNb5T3hvtylavpr/9v9QhmEpqucnQYL1lBiPP0ee5C5avIogUpXg/xHfMxNr6Gc
         9zDh/PCM0QUfrQxyeK7hnASYJwriRQEnTge6+dyK2C5AEzh8w6B6IDD1RWCJRbiC7BOZ
         4Z/uzsNezcl8AGSPHEJzoSxrFsxurkTgfGF3uWMHO/iOE98P/X6F/82kSc4sGjv4lCiC
         a0aQ==
X-Gm-Message-State: AOJu0YxUCNgLWQWspWmx4pbpm7UEdbbPo6zMZevWfZgXuY9hCvfflTOf
	Cx1Xx/XkZTrRk1RRpg2UVVHqJiRFq40UnK89G3y9zvoimKEH0Xnv3rP1ZjqP5xx745GpbVQhMA5
	3CpE=
X-Google-Smtp-Source: AGHT+IFeTXuAPeXLWOVlq0s9pDmy1UbOozTVrwXXAc2vOXvnntIM64WhUsakNOGV6i1W8aOWWdyufg==
X-Received: by 2002:a05:6602:5ce:b0:7c8:b447:c3e9 with SMTP id w14-20020a05660205ce00b007c8b447c3e9mr18716646iox.7.1710898949393;
        Tue, 19 Mar 2024 18:42:29 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:9af9:b18f:3f69:51be? ([2001:470:42c4:101:9af9:b18f:3f69:51be])
        by smtp.gmail.com with ESMTPSA id y19-20020a6bc813000000b007cc028ce258sm2632845iof.36.2024.03.19.18.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 18:42:29 -0700 (PDT)
Message-ID: <82dd7a07-dd9a-46d1-989f-ea3be7c16c46@turingpi.com>
Date: Tue, 19 Mar 2024 19:42:28 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sam Edwards <sam@turingpi.com>
Subject: [RFC PATCH 5/5] i2c: mv64xxx: Implement I2C_FUNC_NOSTART
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

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

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c 
b/drivers/i2c/busses/i2c-mv64xxx.c
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
@@ -185,6 +187,7 @@ static struct mv64xxx_i2c_regs 
mv64xxx_i2c_regs_sun4i = {
  	.status		= 0x10,
  	.clock		= 0x14,
  	.soft_reset	= 0x18,
+	.enh_feat	= 0x1c,
  };
   static void
@@ -306,9 +309,9 @@ mv64xxx_i2c_decode_status(struct mv64xxx_i2c_data 
*drv_data, u32 status)
  }
   static void
-mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
+mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data,
+		enum mv64xxx_i2c_event event, u32 status)
  {
-	enum mv64xxx_i2c_event event;
  	enum mv64xxx_i2c_state prev_state = drv_data->state;
   	drv_data->action = MV64XXX_I2C_ACTION_INVALID;
@@ -329,7 +332,6 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, 
u32 status)
  	 * 2) Handle hardware event driven state transitions
  	 * 3) Perform internal state transitions and action emission
  	 */
-	event = mv64xxx_i2c_decode_status(drv_data, status);
   	/* Handle event; determine state transition */
  	switch (event) {
@@ -337,6 +339,7 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, 
u32 status)
  		drv_data->state = MV64XXX_I2C_STATE_SEND_ADDR_1;
  		break;
  +	case MV64XXX_I2C_EVENT_NOSTART:
  	case MV64XXX_I2C_EVENT_ADDR_ACK:
  		if ((drv_data->state == MV64XXX_I2C_STATE_SEND_ADDR_1)
  		    && (drv_data->msg->flags & I2C_M_TEN))
@@ -399,7 +402,7 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, 
u32 status)
  				drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
  				drv_data->state = MV64XXX_I2C_STATE_IDLE;
  			} else {
-				drv_data->action = MV64XXX_I2C_ACTION_SEND_RESTART;
+				drv_data->action = MV64XXX_I2C_ACTION_NEXT_MESSAGE;
  				drv_data->state = MV64XXX_I2C_STATE_RESTART;
  			}
  		} else {
@@ -429,7 +432,7 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, 
u32 status)
  				drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
  				drv_data->state = MV64XXX_I2C_STATE_IDLE;
  			} else {
-				drv_data->action = MV64XXX_I2C_ACTION_SEND_RESTART;
+				drv_data->action = MV64XXX_I2C_ACTION_NEXT_MESSAGE;
  				drv_data->state = MV64XXX_I2C_STATE_RESTART;
  			}
  		} else {
@@ -444,18 +447,38 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, 
u32 status)
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
+	    (drv_data->num_msgs > 1) && (drv_data->msgs[1].flags == 
I2C_M_NOSTART))
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
  @@ -481,6 +504,10 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data 
*drv_data)
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
@@ -830,7 +863,54 @@ mv64xxx_i2c_can_offload(struct mv64xxx_i2c_data 
*drv_data)
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
@@ -840,6 +920,9 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, 
struct i2c_msg msgs[], int num)
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

