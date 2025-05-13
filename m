Return-Path: <linux-i2c+bounces-10952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A18AB4C17
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 08:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BDB117E943
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 06:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98EEA1E9B2B;
	Tue, 13 May 2025 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGvS9U+m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9CD35976;
	Tue, 13 May 2025 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118204; cv=none; b=OKnJTkOfqy5rcuKtFkvaxtNfX26X50uVuWdQAQD+kjJbcUhoB42u/ZO1e0HHsEWA7jruqYPFFHPpjus/jhJAu5Upi6PgoL/lvZeuCcD9MimqRfxMCyKgo3+XimBMhH1001bdMqysZrS3lyDetlDf8lIOld5BbaAm+OHRp7ZiyIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118204; c=relaxed/simple;
	bh=h+IkIgCUvVv5X/EgaxFnbE68t9F1Ebt3Kltz7OM6R0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0is6jHCNec0u+8kpO2YlbVpJ/W6QHN72FeHZrWXig++prSu0a7zJ+bemCBRFYV+MO5vWBNza+WoUxDj7yXYSX9iXwF9VGfPw/7EbMMZvHtHz5vVQhhStKuw6fyw3+8YeDS3aLfMAZ0OVBtLtIs0sPjnqUixLE1ripwti1hl7i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGvS9U+m; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-73712952e1cso5207886b3a.1;
        Mon, 12 May 2025 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118200; x=1747723000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/m+/Li5pJXxIfZ18YdvYQcc+JWVJfDghRV2cswxgso=;
        b=QGvS9U+mMsVePLgXLrPvcw9OJDbDLB9YsYOCcuZuube1dyKBnphYCltp2FLxOIomJ+
         U420ix0rVklgTZMdUU6U6YnnoIxzqP1W+0misKHtqQZJM3ihYLbg9r/rYWx2nWfhoYVL
         MTVTQwU7yqlYTrwHKSEbQy5EzZ8mlVERmZzxVExLSKQ9o4PSUD4moC4mr5tusHYt0bhf
         moR0k7LZQNaz38X4jUinprrD5xAsMCv//MVq4EPzsohJD3QQdFr8A5Gb8xqIAxWiqcgr
         B8Cg+wfDqan74ll2CXiJU7dRj2BIo13EorMNFIpLF5IWHfw2fvnTm8zw3zlzXA3q91QH
         0puA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118200; x=1747723000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/m+/Li5pJXxIfZ18YdvYQcc+JWVJfDghRV2cswxgso=;
        b=cobPh4FEshpm4BXfFFQddKR6nSK0APVZ0GRKlZ5VuVwWpnDfRYn/jeWYFHAumkwHun
         LYn/k+ebceni8h2wFean6ge9nlmcaIag03P6weF+mnzF9BRgnfTv2FdyuqNanWVryYeD
         CHrZ8S/6r9C4CKi5GXyXyUqG2k95CP1gaS46r+N3nejJ+kUJsxqIIXInV+EPqWGXw8ps
         b8kFvW++b7XSA429zowdGfikjhTv2duH3V5J0lZI54Z21t2c9Ol053u/Ht1/PKrEiFKh
         YzqUuSVyKBGi/fbV42+orJnlBb2aqAViaFUXR9KvhSdGbsCVKpRXuBOB3I3SrODkiXAd
         JNUw==
X-Forwarded-Encrypted: i=1; AJvYcCUaVPca0bIgqgVptdvUKCebUnN7l5F1jM0IuLco44G694+v/55yz2ZgeFHQUHFZnTjC74mHyf21QH1yQkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMzVrVXfAkecv1sXMf2wgOGKG6rbX2VTGTavzA4QC1dW8rnSji
	gbQqGLl/qjLHJSdRqiH6jfxVDTbGGv/cBfvLeSiTEvW9rvyNNuaLMKUpHAk5CHKl2dvh
X-Gm-Gg: ASbGncutp5iUAH9ipjtYyUbj3Ij0yAbVIi+tt0OvDjUfgx/cilq6FcFY5pqH9Bav2+g
	GqAMs16bPCiHLuuSqwCKxCnV0bMOi+i9bSj4N9wI4Cly2ab2rGx30JRkDlwLtmFg9xNDryMpehq
	BwzBFFKvWi73y/gFr/Jnowz7P1t39vnePvoo0WycyhXIblATxegyZ7FjVZguJyBli5pBaVnu93s
	LjDq66+TX/XwLjwB6kTvR9ArH3NQ83H4FeoJOPE87jcDAnkA49KHdpV9D72kjpYMhK5wsHR122+
	AdPqKq9X5b6tFAVpIeQi/fSq9BzDNKje3GJlKw/ofimoVwOwlQ5ChBQ=
X-Google-Smtp-Source: AGHT+IGZ12WCZaO89aqysPWzb8ptQomhGLUKACz8fvPTEYceAq2R5hRP0UZ1mryvPQHCijtI5AB34g==
X-Received: by 2002:a05:6a20:7fa4:b0:1f5:83da:2f9f with SMTP id adf61e73a8af0-215abaf92e9mr22671112637.12.1747118199649;
        Mon, 12 May 2025 23:36:39 -0700 (PDT)
Received: from [127.0.1.1] ([91.124.30.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234a0b76ccsm6657936a12.27.2025.05.12.23.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:36:39 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Tue, 13 May 2025 14:36:13 +0800
Subject: [PATCH v3 1/2] i2c: imx: use guard to take spinlock
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-i2c-imx-update-v3-1-817b7426a67e@gmail.com>
References: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
In-Reply-To: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747118187; l=3101;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=h+IkIgCUvVv5X/EgaxFnbE68t9F1Ebt3Kltz7OM6R0o=;
 b=GEBTx6+w7HdlyIV2HGzJrrowsb4WUjf9YUDMcusHX61zNyz4tZoMS2uN2u12UPh1FXB5/cVSC
 QhMiNEnbqgnAxvnM70de3VHUi8VKsRvt/VNeqwQ9jVbxs9ve176vtez
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Use guard to automatically release the lock after going out of scope
instead of calling it manually.

i2c_imx_slave_handle() can safely be entered with the lock held.

Refactored the i2c_imx_isr function so that i2c_imx_master_isr
does not participate in the guard scope

So Using scoped_guard simplifies the control flow
by ensuring consistent and automatic unlock,
which improves readability without affecting correctness.

Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318..5b276e007292 100644
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
 
@@ -1125,32 +1126,26 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
 {
 	struct imx_i2c_struct *i2c_imx = dev_id;
 	unsigned int ctl, status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
-	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	scoped_guard(spinlock_irqsave, &i2c_imx->slave_lock) {
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


