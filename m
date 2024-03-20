Return-Path: <linux-i2c+bounces-2426-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE41E880A50
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 05:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E5601C21C71
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 04:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8002012E58;
	Wed, 20 Mar 2024 04:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b="MXUEz6/r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B985412E48
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 04:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710908452; cv=none; b=Hbe5mqUHr+f47A74VePikfGBX0w1kUUYQQnJ3yxRwLvlqkp3CVnQzkr0Zl+eRARZKSVDLn9gmWqCeMsyMOHJF2whpr139pi0GtOUM7lCwUMuG0JgE6MKOgfld+9kwR520WIueiDd1KNeqMB2ozp1s07QBdcOeafGOWBIxtC/oBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710908452; c=relaxed/simple;
	bh=UlPOs3tIIxZhbkUElypu4cny/3BJ5z+E4k+yUP6J+Oo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eSfjiHRaHr16u+PjSfho7xirlsrdIKzlhA+/rSrvRN8JU4fpm8clbTwxysncqpL9JJN0oytkzKu+piaT2oJg1WuXAk93KDdk3/ejwjU92koTnqsM3A10c7LlCclZWtf2qjLbwqPkblT1PGdThODihBqIOeu+WgWRGHY92cMl8NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com; spf=pass smtp.mailfrom=turingpi.com; dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b=MXUEz6/r; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingpi.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-29fb7e52731so1991911a91.2
        for <linux-i2c@vger.kernel.org>; Tue, 19 Mar 2024 21:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=turingpi.com; s=google; t=1710908450; x=1711513250; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W3pFWuhAHC9co53c1lcHeStcZG/8RoQn2TUU6VVtrFc=;
        b=MXUEz6/rSatSZ/i5E/BQSAI6FK00FcgCThel+7C9nM9FwWzLhYYhyjREgSOBby+kjK
         1rRUgQlBtAqPd43Lf1hSxTzPwavSc79m7xubHI9MwFiJFJPEE5iUDvAEj8JUxuFf5Xqu
         M66Waf7XjG3gUHpXhCrcEknb5CaEsouzj1Y4ZR36C65vzaDJdVkBh/E4k7dAyphBvB3v
         Sy0NcAz1ucU7pcBgmWdOKFPLbo0kFeK1J4MxgEiy6SAnLX7KaMis4gSMINA1SoBGVytV
         +eribLdpEsJHuJvau5y3bpbv/pxTtNdI3E0xtCZiJ5h3rtvh2v0kn3/801pQvoDNvSax
         qdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710908450; x=1711513250;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3pFWuhAHC9co53c1lcHeStcZG/8RoQn2TUU6VVtrFc=;
        b=dId3h5A80lGLCckNcBMy2FxvREswEs+duf0GHBQPyGUZrrVoDiYa225jKA7SWm9nU6
         dAq0iTRP0Mo2hmsKNAJbU+uu7Rgj7OOguRK94h7EaUk2diSaJk+4Egyuve2IRSW3Bi3E
         3tjoXOfeOA36t+vtMPXfRr3OLDHDjMrTQa12lvg/vta9y+iDAbW6bgH9V3eCZkTvdPFK
         k5Q+OdZ9gPQ4ZxcbpRXLdUKmItl9nGGo5ckS7fqIk+vGUfy5YuYWmFPexgrfkKFIJKd3
         ABSPgyMYTPX5Az4Xodu80CZEtEuikcagTVdkndjuaMeqQaFBmvmXFr3YgFRlgBH2zuQf
         uBxg==
X-Gm-Message-State: AOJu0Yz0Enk8/JXUSmJIJbzs0Qtb5pC1gLlpjxqKlkF+Q6IfGvqoWFFa
	Ym4hLiPesyLcCYBebo8nGo33t00+RUunkr2F9hAV8PZCaXM1pPEcAEKqq8unf/So91dLSNHp2iv
	kErvBZVUhB4f/iVpO82OW+/w7pBAe3D8EbFMF6U8eujPOKl7a8uc=
X-Google-Smtp-Source: AGHT+IFk5PDxWwRKK7+uq9PFy7yBCr9PGqYEewLxuuXFT9HM6SkCFkeNAFShZf1ykJJGazkzJG+dUcAvHTYhM3S9rdA=
X-Received: by 2002:a17:90b:1056:b0:29b:acc6:c54f with SMTP id
 gq22-20020a17090b105600b0029bacc6c54fmr4441532pjb.35.1710908450007; Tue, 19
 Mar 2024 21:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sam Edwards <sam@turingpi.com>
Date: Tue, 19 Mar 2024 22:20:39 -0600
Message-ID: <CAF8uH3vzy3GmxxrQ4Vnj=i-_p+rGZ7ip2r6fR4mm7+_FCY+R2w@mail.gmail.com>
Subject: [RESEND RFC PATCH 4/5] i2c: mv64xxx: Allow continuing after read
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The current FSM does not check the `send_stop` flag when completing a
read message; it just assumes any read message is always the end of the
transfer. This means subsequent messages go unprocessed, with no error
code to indicate otherwise.

Fixing this requires that the FSM check the `send_stop` flag and issue
the `SEND_RESTART` action instead of stop, but there are only two RCV_*
variants, one for receive-and-continue and one for receive-and-stop. We
could add another variant, however, the new FSM from the previous patch
makes it pretty clear that the RCV_* variants aren't really full actions
in their own respect, since they both implement the same observable
functionality as another action, just with an added read from the data
register first.

Therefore, convert the receive actions to a flag that can be set,
allowing any action to have an "...and also read" variant. The FSM can
then just use the plain SEND_RESTART action, but OR-in the flag, to
represent "read a byte, finish this message, go to the next message."

Signed-off-by: Sam Edwards <sam@turingpi.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 47 +++++++++++---------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 3ae74160001d..6a205cca603a 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -116,9 +116,9 @@ enum mv64xxx_i2c_action {
        MV64XXX_I2C_ACTION_SEND_ADDR_1,
        MV64XXX_I2C_ACTION_SEND_ADDR_2,
        MV64XXX_I2C_ACTION_SEND_DATA,
-       MV64XXX_I2C_ACTION_RCV_DATA,
-       MV64XXX_I2C_ACTION_RCV_DATA_STOP,
        MV64XXX_I2C_ACTION_SEND_STOP,
+
+       MV64XXX_I2C_ACTION_RECEIVE = 0x80,
 };

 struct mv64xxx_i2c_regs {
@@ -395,16 +395,15 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data
*drv_data, u32 status)

        case MV64XXX_I2C_STATE_READ:
                if (drv_data->bytes_left == 0) {
-                       if (prev_state == MV64XXX_I2C_STATE_READ)
-                               drv_data->action =
MV64XXX_I2C_ACTION_RCV_DATA_STOP;
-                       else
+                       if (drv_data->send_stop || drv_data->aborting) {
                                drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
-                       drv_data->state = MV64XXX_I2C_STATE_IDLE;
+                               drv_data->state = MV64XXX_I2C_STATE_IDLE;
+                       } else {
+                               drv_data->action =
MV64XXX_I2C_ACTION_SEND_RESTART;
+                               drv_data->state = MV64XXX_I2C_STATE_RESTART;
+                       }
                } else {
-                       if (prev_state == MV64XXX_I2C_STATE_READ)
-                               drv_data->action = MV64XXX_I2C_ACTION_RCV_DATA;
-                       else
-                               drv_data->action = MV64XXX_I2C_ACTION_CONTINUE;
+                       drv_data->action = MV64XXX_I2C_ACTION_CONTINUE;

                        /*
                         * bytes_left counts the remaining read actions to send
@@ -419,6 +418,8 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data,
u32 status)
                        if (drv_data->bytes_left == 0)
                                drv_data->cntl_bits &=
~MV64XXX_I2C_REG_CONTROL_ACK;
                }
+               if (prev_state == MV64XXX_I2C_STATE_READ)
+                       drv_data->action |= MV64XXX_I2C_ACTION_RECEIVE;
                break;

        case MV64XXX_I2C_STATE_WRITE:
@@ -457,6 +458,11 @@ static void mv64xxx_i2c_send_start(struct
mv64xxx_i2c_data *drv_data)
 static void
 mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 {
+       if (drv_data->action & MV64XXX_I2C_ACTION_RECEIVE)
+               drv_data->msg->buf[drv_data->byte_posn++] =
+                       readl(drv_data->reg_base + drv_data->reg_offsets.data);
+       drv_data->action &= ~MV64XXX_I2C_ACTION_RECEIVE;
+
        switch(drv_data->action) {
        case MV64XXX_I2C_ACTION_SEND_RESTART:
                /* We should only get here if we have further messages */
@@ -503,27 +509,6 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
                        drv_data->reg_base + drv_data->reg_offsets.control);
                break;

-       case MV64XXX_I2C_ACTION_RCV_DATA:
-               drv_data->msg->buf[drv_data->byte_posn++] =
-                       readl(drv_data->reg_base + drv_data->reg_offsets.data);
-               writel(drv_data->cntl_bits,
-                       drv_data->reg_base + drv_data->reg_offsets.control);
-               break;
-
-       case MV64XXX_I2C_ACTION_RCV_DATA_STOP:
-               drv_data->msg->buf[drv_data->byte_posn++] =
-                       readl(drv_data->reg_base + drv_data->reg_offsets.data);
-               if (!drv_data->atomic)
-                       drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
-               writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
-                       drv_data->reg_base + drv_data->reg_offsets.control);
-               drv_data->block = 0;
-               if (drv_data->errata_delay)
-                       udelay(5);
-
-               wake_up(&drv_data->waitq);
-               break;
-
        case MV64XXX_I2C_ACTION_INVALID:
        default:
                dev_err(&drv_data->adapter.dev,
--
2.43.2

