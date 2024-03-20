Return-Path: <linux-i2c+bounces-2419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ACB88092B
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 02:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 459271C219B9
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 01:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89084125B4;
	Wed, 20 Mar 2024 01:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b="sVzTOqwE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830DA125A9
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 01:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710898921; cv=none; b=I6W5tfqYr5IjuwAI1/EgD4C15q4l9xuJx0IxPr5rgNO3vZXtux/sD9GShHqQDjCG3UOyu5xI93yAuAVnT+J7zkQbADhPa4AJAIWYqe8/fu64IL+WjisJLhO9JUTp8mq3Cl2lhJxGScPOGkWxid2+wRilG1fCBbJar8+GtNH/CL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710898921; c=relaxed/simple;
	bh=MStPja89ObxZXXeU4b4lVLkUj/CkOnw+qYuus9zGsrs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Ijip843X4YdjsrAubSf1OQFcrQ//r8ldJE1+cJPE+PowA4+1bYx042+ZJhPVuwco2ufCVu08eMNeRCyqEHAICut15RC7tfssfN3n9iIi73p6LqbuQbkeAbwFeptYlPhSB43Uw1lB9x3OyAYXbLtL9ye7mnsJxrPcrmH04KM8dLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com; spf=pass smtp.mailfrom=turingpi.com; dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b=sVzTOqwE; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingpi.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7c7476a11e0so180603739f.3
        for <linux-i2c@vger.kernel.org>; Tue, 19 Mar 2024 18:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=turingpi.com; s=google; t=1710898919; x=1711503719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6Yma9553umU6CRbnvbx3EkCKMxLDNHzJJu+G+lgZ4E=;
        b=sVzTOqwEePiyWrC/HjXEN7I6vY+fNR8s2JpXacLYPyRV/xzHjmGIJZyqOfGknBWQOc
         xEBTnJ4T7JxRZg27S5H20OZ6n8gdIqWgpSvxwloP2uuBTdIZIWqp8fvg7/ULTBiykOla
         GQ86ZipPX3mczj28Bhn0/3SyIBMSJ8lj/y9ai9W9cjUZl8UXwpCjNHQ8Psc4aClly8lR
         y/3VziK14aVvvpdQR8WGZjPBEk24psD17cIQdHKW5MVVsTOLCDJW0arhol9Jhb38qPYd
         5vUdCEeN9kAPXvoiy5Z+ELVgPvW7nrHptBh3BPBpBuHBZy/ozVACcRP61422HEYvK7gu
         ZGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710898919; x=1711503719;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m6Yma9553umU6CRbnvbx3EkCKMxLDNHzJJu+G+lgZ4E=;
        b=FxKB/kKSGG3Mnd6QBYW5bMpM2taU8WqEgW5qn3RqbwEcuexrfNr1Fm+AES605efIQ3
         /YyMbC8RQl0eUMzaPxZDo6VjjHf2VEQH0PHK+7bE4LIxj/FHetCxiGmsPQLj7qF/3hda
         84Wi5//1wrZbAd7e5x972jwxMVihd8xvD3N+SPF6CYj+hKlz7B8Y+rYgzuI7xzfyFSWC
         3O24c1z14v9zv2w0afWqQHBaZ/J6jG04L2nwqKYkqTHJU7uAErkXKEJRAcNPhGjb+JNY
         UANFs/kdkbUawujpJ1+GnMMfKj6dPQosDpGSnJkTkkPIoIREJTy1C9m9D5KTMMvQ6t31
         P4/w==
X-Gm-Message-State: AOJu0Yz5XOGqQBzlcoX43HDmgsgfmInaVeFeFjzEWt1uIFe5EFezbhMV
	zSI/JwRXzjbyCFbsKN3j9jxCFGUnYyFUdSnis6O2oV5csD/u4PJRD2sO9QQJ8VQ=
X-Google-Smtp-Source: AGHT+IF8PWqBVNUTVdv1H6sqQcmfhaHlA59RJsL3qqvXJz7CZr2P6TZTb+R9x0W9EMQ0nGTIzUtxmQ==
X-Received: by 2002:a5e:c248:0:b0:7cb:fdd7:8de with SMTP id w8-20020a5ec248000000b007cbfdd708demr14357252iop.0.1710898918689;
        Tue, 19 Mar 2024 18:41:58 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:9af9:b18f:3f69:51be? ([2001:470:42c4:101:9af9:b18f:3f69:51be])
        by smtp.gmail.com with ESMTPSA id y19-20020a6bc813000000b007cc028ce258sm2632845iof.36.2024.03.19.18.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 18:41:58 -0700 (PDT)
Message-ID: <6c6042bb-456b-4888-8a42-de79c92b2701@turingpi.com>
Date: Tue, 19 Mar 2024 19:41:58 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sam Edwards <sam@turingpi.com>
Subject: [RFC PATCH 3/5] i2c: mv64xxx: Refactor FSM
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Conceptually, there are two FSMs here: a hardware FSM in the MV64XXX
itself, and a software FSM in the driver. The current software FSM is
not a "real" FSM: it is just using the hardware status to decide what to
do next, and the `state` is mostly unused.

There are two drawbacks to this approach:
1) If the hardware returns an unexpected status, the driver will accept
    it blindly, allowing bugs to go unnoticed and complicating testing.
2) The driver FSM cannot have states/transitions not represented in
    hardware.

Rework this by making the hardware status decoder state-aware, and
introducing an enum of "events" which can be fed to the driver FSM that
reflect the hardware events deduced by the status decoder. Any
unexpected status results in an "invalid" event, which triggers the
driver's error recovery. The state machine logic is otherwise the same:
the sequence of actions emitted by the FSM is unchanged by this patch.

Note: The meaning of bytes_left in reads is now the number of byte reads
left to *start* on the hardware, not the number of bytes left to be read
from the data register.

Signed-off-by: Sam Edwards <sam@turingpi.com>
---
  drivers/i2c/busses/i2c-mv64xxx.c | 270 +++++++++++++++++++++----------
  1 file changed, 185 insertions(+), 85 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c 
b/drivers/i2c/busses/i2c-mv64xxx.c
index bb048e655be7..3ae74160001d 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -4,10 +4,12 @@
   *
   * Author: Mark A. Greer <mgreer@mvista.com>
   *
- * 2005 (c) MontaVista, Software, Inc.  This file is licensed under
- * the terms of the GNU General Public License version 2.  This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
+ * 2005 (c) MontaVista, Software, Inc.
+ * Copyright (c) 2024 Turing Machines, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public 
License v2.
+ * This program is licensed "as is" without any warranty of any kind, 
whether
+ * express or implied.
   */
  #include <linux/kernel.h>
  #include <linux/slab.h>
@@ -86,12 +88,24 @@
  enum mv64xxx_i2c_state {
  	MV64XXX_I2C_STATE_INVALID,
  	MV64XXX_I2C_STATE_IDLE,
-	MV64XXX_I2C_STATE_WAITING_FOR_START_COND,
-	MV64XXX_I2C_STATE_WAITING_FOR_RESTART,
-	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_1_ACK,
-	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_2_ACK,
-	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_ACK,
-	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_DATA,
+	MV64XXX_I2C_STATE_START,
+	MV64XXX_I2C_STATE_RESTART,
+	MV64XXX_I2C_STATE_SEND_ADDR_1,
+	MV64XXX_I2C_STATE_SEND_ADDR_2,
+	MV64XXX_I2C_STATE_WRITE,
+	MV64XXX_I2C_STATE_READ,
+};
+
+/* Driver events */
+enum mv64xxx_i2c_event {
+	MV64XXX_I2C_EVENT_INVALID,
+	MV64XXX_I2C_EVENT_STARTED,
+	MV64XXX_I2C_EVENT_ADDR_ACK,
+	MV64XXX_I2C_EVENT_ADDR_NO_ACK,
+	MV64XXX_I2C_EVENT_WR_ACK,
+	MV64XXX_I2C_EVENT_WR_NO_ACK,
+	MV64XXX_I2C_EVENT_RD_ACKED,
+	MV64XXX_I2C_EVENT_RD_UNACKED,
  };
   /* Driver actions */
@@ -232,9 +246,73 @@ mv64xxx_i2c_hw_init(struct mv64xxx_i2c_data *drv_data)
  	drv_data->state = MV64XXX_I2C_STATE_IDLE;
  }
  +static enum mv64xxx_i2c_event
+mv64xxx_i2c_decode_status(struct mv64xxx_i2c_data *drv_data, u32 status)
+{
+	/* Decode status to event (state-driven; catches unexpected status) */
+	switch (drv_data->state) {
+	case MV64XXX_I2C_STATE_RESTART:
+	case MV64XXX_I2C_STATE_START:
+		if (status == MV64XXX_I2C_STATUS_MAST_START ||
+		    status == MV64XXX_I2C_STATUS_MAST_REPEAT_START)
+			return MV64XXX_I2C_EVENT_STARTED;
+		return MV64XXX_I2C_EVENT_INVALID;
+
+	case MV64XXX_I2C_STATE_SEND_ADDR_1:
+		if (drv_data->msg->flags & I2C_M_RD) {
+			if (status == MV64XXX_I2C_STATUS_MAST_RD_ADDR_ACK)
+				return MV64XXX_I2C_EVENT_ADDR_ACK;
+			else if (status == MV64XXX_I2C_STATUS_MAST_RD_ADDR_NO_ACK)
+				return MV64XXX_I2C_EVENT_ADDR_NO_ACK;
+		} else {
+			if (status == MV64XXX_I2C_STATUS_MAST_WR_ADDR_ACK)
+				return MV64XXX_I2C_EVENT_ADDR_ACK;
+			else if (status == MV64XXX_I2C_STATUS_MAST_WR_ADDR_NO_ACK)
+				return MV64XXX_I2C_EVENT_ADDR_NO_ACK;
+		}
+		return MV64XXX_I2C_EVENT_INVALID;
+
+	case MV64XXX_I2C_STATE_SEND_ADDR_2:
+		if (drv_data->msg->flags & I2C_M_RD) {
+			if (status == MV64XXX_I2C_STATUS_MAST_RD_ADDR_2_ACK)
+				return MV64XXX_I2C_EVENT_ADDR_ACK;
+			else if (status == MV64XXX_I2C_STATUS_MAST_RD_ADDR_2_NO_ACK)
+				return MV64XXX_I2C_EVENT_ADDR_NO_ACK;
+		} else {
+			if (status == MV64XXX_I2C_STATUS_MAST_WR_ADDR_2_ACK)
+				return MV64XXX_I2C_EVENT_ADDR_ACK;
+			else if (status == MV64XXX_I2C_STATUS_MAST_WR_ADDR_2_NO_ACK)
+				return MV64XXX_I2C_EVENT_ADDR_NO_ACK;
+		}
+		return MV64XXX_I2C_EVENT_INVALID;
+
+	case MV64XXX_I2C_STATE_WRITE:
+		if (status == MV64XXX_I2C_STATUS_MAST_WR_ACK)
+			return MV64XXX_I2C_EVENT_WR_ACK;
+		else if (status == MV64XXX_I2C_STATUS_MAST_WR_NO_ACK)
+			return MV64XXX_I2C_EVENT_ADDR_NO_ACK;
+		return MV64XXX_I2C_EVENT_INVALID;
+
+	case MV64XXX_I2C_STATE_READ:
+		if (status == MV64XXX_I2C_STATUS_MAST_RD_DATA_ACK)
+			return MV64XXX_I2C_EVENT_RD_ACKED;
+		else if (status == MV64XXX_I2C_STATUS_MAST_RD_DATA_NO_ACK)
+			return MV64XXX_I2C_EVENT_RD_UNACKED;
+		return MV64XXX_I2C_EVENT_INVALID;
+
+	default:
+		return MV64XXX_I2C_EVENT_INVALID;
+	}
+}
+
  static void
  mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
  {
+	enum mv64xxx_i2c_event event;
+	enum mv64xxx_i2c_state prev_state = drv_data->state;
+
+	drv_data->action = MV64XXX_I2C_ACTION_INVALID;
+
  	/*
  	 * If state is idle, then this is likely the remnants of an old
  	 * operation that driver has given up on or the user has killed.
@@ -245,99 +323,121 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data 
*drv_data, u32 status)
  		return;
  	}
  -	/* The status from the ctlr [mostly] tells us what to do next */
-	switch (status) {
-	/* Start condition interrupt */
-	case MV64XXX_I2C_STATUS_MAST_START: /* 0x08 */
-	case MV64XXX_I2C_STATUS_MAST_REPEAT_START: /* 0x10 */
-		drv_data->action = MV64XXX_I2C_ACTION_SEND_ADDR_1;
-		drv_data->state = MV64XXX_I2C_STATE_WAITING_FOR_ADDR_1_ACK;
+	/*
+	 * The FSM is broken into 3 parts:
+	 * 1) Decode `status` to determine the underlying hardware event
+	 * 2) Handle hardware event driven state transitions
+	 * 3) Perform internal state transitions and action emission
+	 */
+	event = mv64xxx_i2c_decode_status(drv_data, status);
+
+	/* Handle event; determine state transition */
+	switch (event) {
+	case MV64XXX_I2C_EVENT_STARTED:
+		drv_data->state = MV64XXX_I2C_STATE_SEND_ADDR_1;
  		break;
  -	/* Performing a write */
-	case MV64XXX_I2C_STATUS_MAST_WR_ADDR_ACK: /* 0x18 */
-		if (drv_data->msg->flags & I2C_M_TEN) {
-			drv_data->action = MV64XXX_I2C_ACTION_SEND_ADDR_2;
-			drv_data->state =
-				MV64XXX_I2C_STATE_WAITING_FOR_ADDR_2_ACK;
-			break;
-		}
-		fallthrough;
-	case MV64XXX_I2C_STATUS_MAST_WR_ADDR_2_ACK: /* 0xd0 */
-	case MV64XXX_I2C_STATUS_MAST_WR_ACK: /* 0x28 */
-		if ((drv_data->bytes_left == 0)
-				|| (drv_data->aborting
-					&& (drv_data->byte_posn != 0))) {
-			if (drv_data->send_stop || drv_data->aborting) {
-				drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
-				drv_data->state = MV64XXX_I2C_STATE_IDLE;
-			} else {
-				drv_data->action =
-					MV64XXX_I2C_ACTION_SEND_RESTART;
-				drv_data->state =
-					MV64XXX_I2C_STATE_WAITING_FOR_RESTART;
-			}
-		} else {
-			drv_data->action = MV64XXX_I2C_ACTION_SEND_DATA;
-			drv_data->state =
-				MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_ACK;
-			drv_data->bytes_left--;
-		}
+	case MV64XXX_I2C_EVENT_ADDR_ACK:
+		if ((drv_data->state == MV64XXX_I2C_STATE_SEND_ADDR_1)
+		    && (drv_data->msg->flags & I2C_M_TEN))
+			drv_data->state = MV64XXX_I2C_STATE_SEND_ADDR_2;
+		else if (drv_data->msg->flags & I2C_M_RD)
+			drv_data->state = MV64XXX_I2C_STATE_READ;
+		else
+			drv_data->state = MV64XXX_I2C_STATE_WRITE;
  		break;
  -	/* Performing a read */
-	case MV64XXX_I2C_STATUS_MAST_RD_ADDR_ACK: /* 40 */
-		if (drv_data->msg->flags & I2C_M_TEN) {
-			drv_data->action = MV64XXX_I2C_ACTION_SEND_ADDR_2;
-			drv_data->state =
-				MV64XXX_I2C_STATE_WAITING_FOR_ADDR_2_ACK;
-			break;
-		}
-		fallthrough;
-	case MV64XXX_I2C_STATUS_MAST_RD_ADDR_2_ACK: /* 0xe0 */
-		if (drv_data->bytes_left == 0) {
-			drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
-			drv_data->state = MV64XXX_I2C_STATE_IDLE;
-			break;
-		}
-		fallthrough;
-	case MV64XXX_I2C_STATUS_MAST_RD_DATA_ACK: /* 0x50 */
-		if (status != MV64XXX_I2C_STATUS_MAST_RD_DATA_ACK)
-			drv_data->action = MV64XXX_I2C_ACTION_CONTINUE;
-		else {
-			drv_data->action = MV64XXX_I2C_ACTION_RCV_DATA;
-			drv_data->bytes_left--;
-		}
-		drv_data->state = MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_DATA;
+	case MV64XXX_I2C_EVENT_ADDR_NO_ACK:
+	case MV64XXX_I2C_EVENT_WR_NO_ACK:
+		/* Doesn't seem to be a device at other end */
+		drv_data->state = MV64XXX_I2C_STATE_IDLE;
+		break;
  -		if ((drv_data->bytes_left == 1) || drv_data->aborting)
-			drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_ACK;
+	case MV64XXX_I2C_EVENT_WR_ACK:
  		break;
  -	case MV64XXX_I2C_STATUS_MAST_RD_DATA_NO_ACK: /* 0x58 */
-		drv_data->action = MV64XXX_I2C_ACTION_RCV_DATA_STOP;
-		drv_data->state = MV64XXX_I2C_STATE_IDLE;
+	case MV64XXX_I2C_EVENT_RD_ACKED:
+		BUG_ON(drv_data->bytes_left == 0);
  		break;
  -	case MV64XXX_I2C_STATUS_MAST_WR_ADDR_NO_ACK: /* 0x20 */
-	case MV64XXX_I2C_STATUS_MAST_WR_NO_ACK: /* 30 */
-	case MV64XXX_I2C_STATUS_MAST_RD_ADDR_NO_ACK: /* 48 */
-		/* Doesn't seem to be a device at other end */
-		drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
-		drv_data->state = MV64XXX_I2C_STATE_IDLE;
-		drv_data->rc = -ENXIO;
+	case MV64XXX_I2C_EVENT_RD_UNACKED:
+		BUG_ON(drv_data->bytes_left != 0);
  		break;
  +	case MV64XXX_I2C_EVENT_INVALID:
  	default:
  		dev_err(&drv_data->adapter.dev,
  			"mv64xxx_i2c_fsm: Ctlr Error -- state: 0x%x, "
-			"status: 0x%x, addr: 0x%x, flags: 0x%x\n",
-			 drv_data->state, status, drv_data->msg->addr,
+			"status: 0x%x, event: 0x%x, addr: 0x%x, flags: 0x%x\n",
+			 drv_data->state, status, event, drv_data->msg->addr,
  			 drv_data->msg->flags);
  		drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
  		mv64xxx_i2c_hw_init(drv_data);
  		i2c_recover_bus(&drv_data->adapter);
  		drv_data->rc = -EAGAIN;
+		return;
+	}
+
+	/* Internal FSM transitions and action emission */
+	switch (drv_data->state) {
+	case MV64XXX_I2C_STATE_IDLE:
+		drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
+		drv_data->rc = -ENXIO;
+		break;
+
+	case MV64XXX_I2C_STATE_SEND_ADDR_1:
+		drv_data->action = MV64XXX_I2C_ACTION_SEND_ADDR_1;
+		break;
+
+	case MV64XXX_I2C_STATE_SEND_ADDR_2:
+		drv_data->action = MV64XXX_I2C_ACTION_SEND_ADDR_2;
+		break;
+
+	case MV64XXX_I2C_STATE_READ:
+		if (drv_data->bytes_left == 0) {
+			if (prev_state == MV64XXX_I2C_STATE_READ)
+				drv_data->action = MV64XXX_I2C_ACTION_RCV_DATA_STOP;
+			else
+				drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
+			drv_data->state = MV64XXX_I2C_STATE_IDLE;
+		} else {
+			if (prev_state == MV64XXX_I2C_STATE_READ)
+				drv_data->action = MV64XXX_I2C_ACTION_RCV_DATA;
+			else
+				drv_data->action = MV64XXX_I2C_ACTION_CONTINUE;
+
+			/*
+			 * bytes_left counts the remaining read actions to send
+			 * to the hardware, not the remaining bytes to be
+			 * retrieved from the data register
+			 */
+			if (drv_data->aborting)
+				drv_data->bytes_left = 0;
+			else
+				drv_data->bytes_left--;
+
+			if (drv_data->bytes_left == 0)
+				drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_ACK;
+		}
+		break;
+
+	case MV64XXX_I2C_STATE_WRITE:
+		if ((drv_data->bytes_left == 0)
+		    || (drv_data->aborting && (drv_data->byte_posn != 0))) {
+			if (drv_data->send_stop || drv_data->aborting) {
+				drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
+				drv_data->state = MV64XXX_I2C_STATE_IDLE;
+			} else {
+				drv_data->action = MV64XXX_I2C_ACTION_SEND_RESTART;
+				drv_data->state = MV64XXX_I2C_STATE_RESTART;
+			}
+		} else {
+			drv_data->action = MV64XXX_I2C_ACTION_SEND_DATA;
+			drv_data->bytes_left--;
+		}
+		break;
+
+	default:
  	}
  }
  @@ -611,7 +711,7 @@ mv64xxx_i2c_execute_msg(struct mv64xxx_i2c_data 
*drv_data, struct i2c_msg *msg,
   	spin_lock_irqsave(&drv_data->lock, flags);
  -	drv_data->state = MV64XXX_I2C_STATE_WAITING_FOR_START_COND;
+	drv_data->state = MV64XXX_I2C_STATE_START;
   	drv_data->send_stop = is_last;
  	drv_data->block = 1;
-- 
2.43.2

