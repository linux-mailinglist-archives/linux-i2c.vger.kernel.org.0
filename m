Return-Path: <linux-i2c+bounces-10503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCB4A94C29
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 07:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C9737A3CCF
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 05:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82AB32580F7;
	Mon, 21 Apr 2025 05:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtBAQvnX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA8E4A3C;
	Mon, 21 Apr 2025 05:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745213818; cv=none; b=C7spUz186TCcGSx/7Cux25EMxZhVWAIZpzgvhINSZjA3WaawgUiUPS4gpR8sLe8LuM7vnAsZAhUGOCzoQvR7z6wwxvT7sybwJ5wINPKzigD+3BIwGUYD9muxgUaPGOOFaGCc4//fea3U4fH9bg3haVCcrKjOUF8Gv2+pKOjZZs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745213818; c=relaxed/simple;
	bh=Set1fjuf1biaf2SuWAgg0znD5Dkrjnd4oyOs91sYddk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XymFWpNoO7HdojP150tcYZ2FsWffbzJiEAyt0XCABiety4ArX+jyfm4YsKl14L+wggBSwwg3EOR6fVYW8Y14HoFxSaETnvsIHyCxQLj1/kQO+2nnMYG2NcJBj76x/v5Hcz/evK0qiqS3sYI+zVBfl3skzYgnYShP3KVFnyLmPgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtBAQvnX; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-224100e9a5cso42275575ad.2;
        Sun, 20 Apr 2025 22:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745213816; x=1745818616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSA5b1FEsUGzIuKxMEGaepPxh4bbazOZcDDU8ZWSGNA=;
        b=TtBAQvnXww+Z3hxoriXA2iNYLXKR04h3K+VoXZ3oBp/mXMFjNjh6I3nwE+r1viOi8S
         bevDLOP84ZhQx4LMC86A9Wzznhy/g9U8wr7KowOAmJKYSmrG4Ujj0ZTOlJYCuk8EEwSj
         DEKUuSMLMA1rBCka7ziT14Is9iriTrqImO7p4Y5nh5VPuXBKc8gCvKXX9UqqYovH/LIT
         ZemS2g3iUz38bE2I3UEf4mpHtoWs7kgD9l9rXxf/6DZDdRyTLMmxQSmDPORlGjdlz/wj
         sruDVHeWGMdb75nggAU+xDdCUmizOS6GQNj/jcAdhSgW2lKA+ZD5Dd4hgXY+/r2acOjW
         ZdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745213816; x=1745818616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSA5b1FEsUGzIuKxMEGaepPxh4bbazOZcDDU8ZWSGNA=;
        b=EzsMo9Pda6e7+nnSqjVWk6CJfdiYGR72T2i5rKnvvE/u+1yZPu2nRNvoeMjFVc5Hiw
         CLfCP2OT440MmHp2t7lbt3mP4SxCTASflfZAWki1lG/AQFW1NYmhN1sr9vd9otl3CDcc
         zSgIUqbLtLeiU/YhIW5aKrnLizFlZDIqo43+URhyvlbNEvtUuZz03IXIvishG19M6mm+
         YwG+Q5vQfrkiF9CSt3AvhlBd9ZNHbnwG/lYJ1sH6mjtRnAY26VVlN1X+fSAEpQdx4n04
         S/YOii+nq0b/RCYNvH/PlTw8JiS7QiUmRkejvDcDMbprGyneicbaXN6wVwb+YnI6/sZx
         GxjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsGq9voTadQ5sQxEoa3VLc4rXf/E8qQTvZNJB/sMs9sQV0b38c3r0Zy7ppKk6q53NEnzvw/qSHF+deBJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr9t5ryU+xpjxFqdFRZ5haUvkGf7JyQmab7xfcCBGk3hZ/kv91
	2vYlYw//h7rV1sk/CseTPMr6nX1+KnyFOtvkItAQvR7fjbeW2/ew
X-Gm-Gg: ASbGncuDY4i4S4Z3r7opHB30OYgQIO/Imx0oDW0jtyU1qmVbSVJb072x3lbmLPWKag+
	F3Q6nnkbjWl9MIsjzoTJZ0EsqyhsGc9fIhL/zRRo2Re79p0x2wg/vjY2BtxftC2eJR54cjAcDZU
	WSDwzuIPMWZFFcvdG6wiasAO/m0LMbM00XWZ8MQVI3cQCmWkoXzd0Xhec9sbG3+OvYVgGheAO5y
	WWPOlR2MfbMGeSyrQ3KP3aGGbhCEfjUCmznd6WVomoJXKKimPukGFti1JoQM+uLfgb9E5zFm1QW
	uTu/Hcq8whG/vpV5MhcFaDhVbGVYaKp+NAA=
X-Google-Smtp-Source: AGHT+IFdvPVdGt6bGKOTEAZd0BvJShuSbJm+7EE2v5LaJ6enDyDnKAh0CiwtMffaCxTIlWx67pF8CQ==
X-Received: by 2002:a17:902:cf07:b0:220:f140:f7be with SMTP id d9443c01a7336-22c53601243mr174775625ad.41.1745213815840;
        Sun, 20 Apr 2025 22:36:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beaf2sm5634270b3a.5.2025.04.20.22.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:36:55 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Mon, 21 Apr 2025 13:36:38 +0800
Subject: [PATCH 1/2] i2c: imx: use guard to take spinlock
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
In-Reply-To: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745213806; l=2404;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Set1fjuf1biaf2SuWAgg0znD5Dkrjnd4oyOs91sYddk=;
 b=tEP6aUtRbhbNcn6p9VRzN+spiIyigQUd5XmgAGlJJju83zFNFwP1FbHiog/EELaoE+7jIMtv1
 HzZyFy6JtjXCJNVtNJGJRHL3XnOMgmh10UhQYJf2EgpnP3gz+4xhOf0
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Use guard to automatically release the lock after going out of scope
instead of calling it manually.

Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318..cb96a57df4a0 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -23,6 +23,7 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
@@ -891,13 +892,13 @@ static enum hrtimer_restart i2c_imx_slave_timeout(struct hrtimer *t)
 	struct imx_i2c_struct *i2c_imx = container_of(t, struct imx_i2c_struct,
 						      slave_timer);
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
+	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
+
 	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	i2c_imx_slave_handle(i2c_imx, status, ctl);
-	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
+
 	return HRTIMER_NORESTART;
 }
 
@@ -1125,30 +1126,27 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
+	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
+
 	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 
 	if (status & I2SR_IIF) {
 		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
+
 		if (i2c_imx->slave) {
 			if (!(ctl & I2CR_MSTA)) {
 				irqreturn_t ret;
 
-				ret = i2c_imx_slave_handle(i2c_imx,
-							   status, ctl);
-				spin_unlock_irqrestore(&i2c_imx->slave_lock,
-						       flags);
-				return ret;
+				return i2c_imx_slave_handle(i2c_imx,
+							    status, ctl);
 			}
 			i2c_imx_slave_finish_op(i2c_imx);
 		}
-		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
+
 		return i2c_imx_master_isr(i2c_imx, status);
 	}
-	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
 
 	return IRQ_NONE;
 }

-- 
2.34.1


