Return-Path: <linux-i2c+bounces-10638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC87A9DF4E
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 08:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BD881889921
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 06:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9572376E6;
	Sun, 27 Apr 2025 06:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lt3w3DzG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28EC23814A;
	Sun, 27 Apr 2025 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734586; cv=none; b=YXO7/SOyV/hbT9tZvWaJOn2AwApPI1JVd3XOuTiHbztpENgC8VfnnpBgdeKpIA7tAOWHv2pMLHaOLr7jrYt66SHLu1LJKsK+5my+Q34PghYneykAl57S9gLlCYDPvZjXdjXh6VODMfdU8aceiEpW+kyvxLymLhXo1gVpmLr/sz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734586; c=relaxed/simple;
	bh=E1ouHhYW5PVDVuXzVF747nKwomAL6wn6Nilv3Ee5mas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2QWzK2Qu9uGBNJveN4mQaoZkiAXfBi52k35hUMkvm+3SPVxzY7NxhMf2kmK4tBVxjOYf+7A5o96ZC5A0ehkiWaaWmLKOhs8aKMsy5ko3gJpbHM1TDjZk2FTJqUrzfvTG8NGzonznD+/OUN1jY7Qz3EHRsv41uijGbf7I8uzUmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lt3w3DzG; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-b07d607dc83so3250651a12.1;
        Sat, 26 Apr 2025 23:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745734584; x=1746339384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EU3GcwlVx1NDSs8nRLWvQptaTgy/PPey4t/ZeBvdCf4=;
        b=lt3w3DzG22yNGNxA1k+yNXBBxLlFduUO6qWvuvmzlTz7W++hKOfs8fRkyP821OkNuY
         eTlTwO0MoAc20VzwRe6ngX1Lry6knRnTQBNMAfzAy3jJFj0g2EbWcwEskH8lY2ZIFS0F
         6hUdi/55rUthiyqn0Hv27oGjdQVzLBk7Qfk+6n93mWRpVdlA6F3nOM2EVxsRQhnb44gM
         GVT/CbTkFM/FGv6ONjaWVSO7ANNRl3hl26o0s+2FzkbK2QedT+/AJ8D8Ie5Fok9LHa5C
         F85t9EKaI+H8QvoiXlBJCAQ+w0Fbuii6AERZoGLSH5NexiMtxeQXgvDPbKmFa1an4bzL
         g7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745734584; x=1746339384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU3GcwlVx1NDSs8nRLWvQptaTgy/PPey4t/ZeBvdCf4=;
        b=QuXJmjRNVODCM8CJMDngd0MOCJ1gyNprYZw1L0ur2C1B0zNVfTu0uN7mz5iC9xR1J8
         Drk6OwEfs1v8zPYb22MCTnWBUN9SViM/Gz44JCIF+q1xx53o8Dv08JwO5HgowvhDphBz
         lwhBke81zbh85+aWwa//u0sOshzn3opw9Li+9IaBq0EtEYYwIOsnWJj3NgRgtlEACw+v
         IxIQ6Kn5GGnJnslNuqslEw+Qaw1j8PgxtQLJWhNDeoDSVfVLPkDIHSQyL8u4J7tIra+4
         /l9IkFVBmE5lOA4Go6r1ru7a66M4o19bmVMc7wfcUaKlcmL4S6GVKXjhrkRSExDDpwej
         gbpg==
X-Forwarded-Encrypted: i=1; AJvYcCXbMNDcU7AiGqaPVmR9DNjqPL3/TSrM3ZCiBqLNVIemZf4OxYgFf6z3hmhaVIiCyaycy0ujkLBNJiiknxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDHmKT5qs4Vk+nPfYn4ZKoRBLfaHM2IxwcQSO67tzo8CYjOVEu
	ekzjjETLdfXoRcaV1ocBjJo/9yZyDqaR8X8MhZQ8zx2MyREeKqtkK7vvjAZP2k+U+TJ/
X-Gm-Gg: ASbGncs/HNZ2rwBtn7AdNsh7FPfhC0BZ+1p5QJ6xd1hKqeO+3wdzNzpNALX+UJU4Z1d
	yxVd7GOebYQWPVbMx/KtcqINbcn3TO2uYjv+3/sJoa9VkE4djI9jo40Z3GI+dBPEqb/Mr2QLHOE
	kiJt8JgsX8EoP3kW6tPRmv38XX8O5qjHuhewtmnXOVW/LWSTahPQtxldi/pDqwucmXRCuFfYfnY
	Yp24spQNzYsCCM+jbTUmuk78lEINfVtPl0I7exmG3CN1R6FWBugNERDi7lrrESZLxuOFGAdwIyr
	PCfiqrmt7DouzivRk/tqWJjA
X-Google-Smtp-Source: AGHT+IE3i6OjCQRWdv18uxdsodyVfMfSGch53emtn4PADO6a09T0tF9jjDHqnBrDwcUxVZwLyWkrPQ==
X-Received: by 2002:a17:90b:4f45:b0:2fa:228d:5b03 with SMTP id 98e67ed59e1d1-309f7ddd53cmr10233411a91.19.1745734583686;
        Sat, 26 Apr 2025 23:16:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d461sm5080287a91.39.2025.04.26.23.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 23:16:23 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sun, 27 Apr 2025 14:16:09 +0800
Subject: [PATCH v2 1/2] i2c: imx: use guard to take spinlock
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-i2c-imx-update-v2-1-d312e394b573@gmail.com>
References: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
In-Reply-To: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745734572; l=3115;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=E1ouHhYW5PVDVuXzVF747nKwomAL6wn6Nilv3Ee5mas=;
 b=xfkTzhbIKjZVihZsGuN+Wiqoz3QU8UyXVphp6monpZqAVNl9kksWQe1ths3ySasDwYc/f6Dq4
 YzWT/UQnMRlB6Zefe3NjGRJCt+XV1q7GScMa4RCx+WxAvwDOXAvW01M
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Use guard to automatically release the lock after going out of scope
instead of calling it manually.

i2c_imx_slave_handle() can safely be entered with the lock held.

Refactored the i2c_imx_isr function so that i2c_imx_master_isr
does not participate in the guard scope

So Using guard(spinlock_irqsave) simplifies the control flow
by ensuring consistent and automatic unlock,
which improves readability without affecting correctness.

Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318..a98bf01c5dde 100644
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
 
@@ -1125,32 +1126,28 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
-	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	{
+		guard(spinlock_irqsave)(&i2c_imx->slave_lock);
+
+		status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
+		ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
+		if (!(status & I2SR_IIF))
+			return IRQ_NONE;
 
-	if (status & I2SR_IIF) {
 		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
+
 		if (i2c_imx->slave) {
-			if (!(ctl & I2CR_MSTA)) {
-				irqreturn_t ret;
-
-				ret = i2c_imx_slave_handle(i2c_imx,
-							   status, ctl);
-				spin_unlock_irqrestore(&i2c_imx->slave_lock,
-						       flags);
-				return ret;
-			}
+			if (!(ctl & I2CR_MSTA))
+				return i2c_imx_slave_handle(i2c_imx,
+							    status, ctl);
+
 			i2c_imx_slave_finish_op(i2c_imx);
 		}
-		spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
-		return i2c_imx_master_isr(i2c_imx, status);
 	}
-	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
 
-	return IRQ_NONE;
+	return i2c_imx_master_isr(i2c_imx, status);
 }
 
 static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,

-- 
2.34.1


