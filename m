Return-Path: <linux-i2c+bounces-2432-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7C880AB7
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 06:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98E401F22DCB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 05:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DF91EB22;
	Wed, 20 Mar 2024 05:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsRYkQ8J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579FE1DFC6;
	Wed, 20 Mar 2024 05:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710912930; cv=none; b=YLsDBdcDfF+CIVvIqNlj/RNE9OssBS9CVQiq6i9ivc+iKsmcxRreH/VGaaLXI4KxHeqGBwYHc/QbJO4mKO4TBmsvJx4kWoThr2YT7bAOEC6EJNRB4XRw+DVIlT2tXlgaa0p5wA9P8ql7h1f0wPOSSjUDGe43lgnq9fRk0ULra+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710912930; c=relaxed/simple;
	bh=8+XRLv4yspwrSxXIBKsMaAahMv/pc1nzpXoHyOWLr6E=;
	h=Message-ID:From:To:Cc:Date:Subject; b=ow4N9lneAfl0kk2fhg2Dt0yg4AT05jEgPc/feNtYFP3RExUxWRnapP28qmXPG1SBYy6hBu1uyWweDIl8WWEa2ZsllZfLw8FWTcNtc2VU2Jga2hT6nA7kDGXcMt2044wUKqI982+d04S5BwJPe5lnlIeqcE1m4ttc3033/ukTgjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsRYkQ8J; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7cc864215caso79707039f.3;
        Tue, 19 Mar 2024 22:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710912928; x=1711517728; darn=vger.kernel.org;
        h=subject:date:cc:to:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkJly6CToglvrrSNNJ0loQzOxfua+P4wReRnQggto/w=;
        b=DsRYkQ8Jnam5lUM6cH3WXUfS7osc1aL5BeJtcEPTUWG4/qC7zB/QsUbnYBx7fepvzj
         xVGqUDvIFZ7YsIM49iGUksoEnSfDwUx1oiKK44qhONFYOIRSlgqtEiK/4oD2bXUbu7I4
         mM5EJdbh3GMAB1B2C/CmYJcXulZIEYU37Z6uFufwJS4k4S9H2PpzvRdEpJNFCZrF4BbS
         +eBzdKake6zocWs4HR/A7Qticd4C/4vE9oeYKAutKzv0b9cvEzoVNIGgMsZfrXCZOiVT
         yutH+Db830j/mCIB9xr71suYPm23hoF7Bp0okmw9P1THtdVOeKBuM067SE09+UEpSpky
         0MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710912928; x=1711517728;
        h=subject:date:cc:to:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkJly6CToglvrrSNNJ0loQzOxfua+P4wReRnQggto/w=;
        b=NE7QscgqWuk/+/rfQW/dzZXyMUhmG2UzRq+1UG+NUMBH/SyvIsoBzCMJh2OuUQFjvJ
         qzA9lFx/o48Qeb9vlDRQzsvy+4c/YyGW70Gsui3n2iDM0tQnTbuxZIAvKZmc4QmLT5j6
         fkzM4YG1Jc05ALbLEA+eZ47/MKY/0KWLcbSB2s7NI+9Jr3vEEOm1KgoQpkHe3VqHjIst
         r9eAJCqFWy6k3eu/ncy+O+TMPh/yPh9Gt0ngu90UY6qcr4cPo7Xs6OOGvAnnm1hjIzZS
         49DCenCiTMp9bEzz/gJOI+Lpq79G4U/tePD/26lp1yjQpaG2Ots2Zwi5G8wWo8yDzmV6
         ihdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8oXs9A7xeIyWoVIgF9iIjiJjzd7HIfVmBAcRA0ggfasX/B2vmGoM3ItfiyU2iqn2nJA/3pYFzbRgPa2sMLhlddXt1yHCzRZQ3JwoS
X-Gm-Message-State: AOJu0YypVqnPbnT5e8RI0OY5wFjyTCZRh/ijfXOpvxM/u+bYOJf8bJCT
	4fizF3Ho53yIhHA8G1LvXJ9GFEGbIA7GWu0VzgIkosRf0ERzKTw7OBz/Vcjt
X-Google-Smtp-Source: AGHT+IEZXkMghds1FSnsqYDp4eoun7ENEdWKTUS1VXeqOmcK7Go63JKhsOnbfqX67JeKWmRuCfpSow==
X-Received: by 2002:a05:6602:1799:b0:7cc:5e1:5418 with SMTP id y25-20020a056602179900b007cc05e15418mr12463029iox.19.1710912928485;
        Tue, 19 Mar 2024 22:35:28 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:9af9:b18f:3f69:51be? ([2001:470:42c4:101:9af9:b18f:3f69:51be])
        by smtp.gmail.com with ESMTPSA id q6-20020a5d9f06000000b007cc6af6686esm1679597iot.30.2024.03.19.22.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 22:35:28 -0700 (PDT)
Message-ID: <65fa75a0.5d0a0220.fe5f7.1fa3@mx.google.com>
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <sam@turingpi.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 19 Mar 2024 16:52:21 -0600
Subject: [RESEND v2 RFC 4/5] i2c: mv64xxx: Allow continuing after read
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

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
-	MV64XXX_I2C_ACTION_RCV_DATA,
-	MV64XXX_I2C_ACTION_RCV_DATA_STOP,
 	MV64XXX_I2C_ACTION_SEND_STOP,
+
+	MV64XXX_I2C_ACTION_RECEIVE = 0x80,
 };
 
 struct mv64xxx_i2c_regs {
@@ -395,16 +395,15 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 
 	case MV64XXX_I2C_STATE_READ:
 		if (drv_data->bytes_left == 0) {
-			if (prev_state == MV64XXX_I2C_STATE_READ)
-				drv_data->action = MV64XXX_I2C_ACTION_RCV_DATA_STOP;
-			else
+			if (drv_data->send_stop || drv_data->aborting) {
 				drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
-			drv_data->state = MV64XXX_I2C_STATE_IDLE;
+				drv_data->state = MV64XXX_I2C_STATE_IDLE;
+			} else {
+				drv_data->action = MV64XXX_I2C_ACTION_SEND_RESTART;
+				drv_data->state = MV64XXX_I2C_STATE_RESTART;
+			}
 		} else {
-			if (prev_state == MV64XXX_I2C_STATE_READ)
-				drv_data->action = MV64XXX_I2C_ACTION_RCV_DATA;
-			else
-				drv_data->action = MV64XXX_I2C_ACTION_CONTINUE;
+			drv_data->action = MV64XXX_I2C_ACTION_CONTINUE;
 
 			/*
 			 * bytes_left counts the remaining read actions to send
@@ -419,6 +418,8 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 			if (drv_data->bytes_left == 0)
 				drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_ACK;
 		}
+		if (prev_state == MV64XXX_I2C_STATE_READ)
+			drv_data->action |= MV64XXX_I2C_ACTION_RECEIVE;
 		break;
 
 	case MV64XXX_I2C_STATE_WRITE:
@@ -457,6 +458,11 @@ static void mv64xxx_i2c_send_start(struct mv64xxx_i2c_data *drv_data)
 static void
 mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 {
+	if (drv_data->action & MV64XXX_I2C_ACTION_RECEIVE)
+		drv_data->msg->buf[drv_data->byte_posn++] =
+			readl(drv_data->reg_base + drv_data->reg_offsets.data);
+	drv_data->action &= ~MV64XXX_I2C_ACTION_RECEIVE;
+
 	switch(drv_data->action) {
 	case MV64XXX_I2C_ACTION_SEND_RESTART:
 		/* We should only get here if we have further messages */
@@ -503,27 +509,6 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 			drv_data->reg_base + drv_data->reg_offsets.control);
 		break;
 
-	case MV64XXX_I2C_ACTION_RCV_DATA:
-		drv_data->msg->buf[drv_data->byte_posn++] =
-			readl(drv_data->reg_base + drv_data->reg_offsets.data);
-		writel(drv_data->cntl_bits,
-			drv_data->reg_base + drv_data->reg_offsets.control);
-		break;
-
-	case MV64XXX_I2C_ACTION_RCV_DATA_STOP:
-		drv_data->msg->buf[drv_data->byte_posn++] =
-			readl(drv_data->reg_base + drv_data->reg_offsets.data);
-		if (!drv_data->atomic)
-			drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
-		writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
-			drv_data->reg_base + drv_data->reg_offsets.control);
-		drv_data->block = 0;
-		if (drv_data->errata_delay)
-			udelay(5);
-
-		wake_up(&drv_data->waitq);
-		break;
-
 	case MV64XXX_I2C_ACTION_INVALID:
 	default:
 		dev_err(&drv_data->adapter.dev,
-- 
2.43.2


