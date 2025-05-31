Return-Path: <linux-i2c+bounces-11184-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 632BBAC99BB
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 08:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2AF53B7EA6
	for <lists+linux-i2c@lfdr.de>; Sat, 31 May 2025 06:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA2522DA0E;
	Sat, 31 May 2025 06:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8DIYj8p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1758208A7;
	Sat, 31 May 2025 06:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748674671; cv=none; b=Wkqj1CoInJWZFSrqi4nymdVafqxYKqZmWdiHeVBp6VZr5oswZjj++HEQWmwW2dJyviYDQaLs2ipuYsmbEoOukphT2XbdW4QVrxldIW0QsJGY0W/QjKn+VfB2ClqEDjv4w6E+Z7BTTHxQFlJrunOfTjAz77yCJlsxjaXSABsGVjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748674671; c=relaxed/simple;
	bh=kzfikvqslmcNoM9cU44BoA71y4mZZRBxiPJC+FC3nqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tleUEVI4HmECAGXfaxc2XFqwROd5r9S2YmmvlpPOIowfeeMVFhupyNKo+UEM2vS5m4q3kNxh+h5tqQWnXMXMxKO6KFGb+NUoHmAVD6MDd33jwJLFNm7l42QLAvEQ1CQmthOg9yyLlcc790VKeGwcc8gF8p/dfefNNqJQBaGrZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8DIYj8p; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2349282084bso34753385ad.1;
        Fri, 30 May 2025 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748674669; x=1749279469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=204UNc2Wl3rmtEs6OGcSVTV/VNrUI6SdVkUZQOxQBr8=;
        b=K8DIYj8p6CbBMRRg81gvu77MeAHIRXoO/KAAs46onRfG7Hg9BG6vpcss24t3yc1FqW
         kXPCJjYuJriLXbloLKzmZ/uNkgOtnguyJl7Wp3gJ+HLCkt1by1dqFwvCvkfkQHcw2k2Z
         230rk71VBuotr4IxDzzN7voOIXaNb6aBKFtmLT0NXEJmMNNm2vvL50MPwB/8LwwQznFo
         vBxFqJjuOL1ZMhtq/ymlrtipWarlMbrNOHlWbG7ANfOrElQlLlE6n0uTTVizSq2RF//j
         7lN0ek9DiANnYATx4+rNnA2f9fFrpLAoxBLMb6tkPXzIdPGPS76EX1b2WKV4drzwwJI3
         3/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748674669; x=1749279469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=204UNc2Wl3rmtEs6OGcSVTV/VNrUI6SdVkUZQOxQBr8=;
        b=VzkJWBH3qUMgR7dX7JsKDBnrq1bjnPr7Ju98TGuc5t1GlSjX5IeSLhxbQqJyfCw6rW
         lAK4BnRgRpvipD5FLfmFYhsRrAedDgFDdpsBoFRIJmhQSeZ35chDZMhNiIxZoRJQvkLs
         zwZETDB0pEL74TjhWgsrJ+O1oZLQEdScUS1laAlQyzY4LbtSSHNk6MqRanDtKPu4zAWA
         pb90npebkltswkvbtqNJUZw/flcVR88HtK8ttL5ZF8yEgENvBg/zw8JgQHxS/F3tdWPI
         QS6S64wiXYtY2zaaAvDLdd++oFmw7Lq5pkvY5E52cTydX42whhB/78pA5Cfw/eyWgYCl
         mK7A==
X-Forwarded-Encrypted: i=1; AJvYcCWm0ne4vX5AAEFMaOtd3WzlOA3b7zH/goBgusi1nGBoAmIBoDLURjA5LsG6nBBoHEOTtmI8dlJuPLh/YvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJlbAaIsukt8143hRPex/FlJ6sVyOMkOx2NCkwDWtfH43BoBAH
	eRbA5aLK1IkGNszelfKzt+2eXgISDWHAn0iXhZpGCsf+YzKYQZitmG4o
X-Gm-Gg: ASbGnctPpLqPyOXX3lLwvyv4cvORScoMvex0ur0wrv6x7rFiAdhanRxJ9j4iiLNPImH
	MPKP+I17uDnL/dKzU1RxiJESuc2zx9K6YTdvQ94qWXiOlt2dZyhSvk1939/z+CNpwToVXilGK0a
	4kjlY3qzFbUjztgpT432t3JHXNyWZ8/Yqtj4wecKG1t/wFBiZxoJRJ5aX86HphYv9emGJEjAXLZ
	oLbZFHX+lCMAad4X4nhZnXCgmePppG1iC/dexQ3Bbv12lNFYsnZJXajCMIHLGtb3aGmPNf4/+sa
	ETMEL/HdengGTj0esWShLQoq9qH/7Ci92AU=
X-Google-Smtp-Source: AGHT+IFyM1uZ0Xpp3l9OJV7SKmrYyK0ZVxdW6vyRglphqDLVvMKdPGkWMU7FlfnGr4XgkK+hBC/f3A==
X-Received: by 2002:a17:903:289:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-2352920a1b6mr86911505ad.31.1748674669029;
        Fri, 30 May 2025 23:57:49 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5448sm37596625ad.185.2025.05.30.23.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:57:48 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sat, 31 May 2025 14:57:26 +0800
Subject: [PATCH v4 1/2] i2c: imx: use guard to take spinlock
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-i2c-imx-update-v4-1-bfad0c8fd45c@gmail.com>
References: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
In-Reply-To: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748674650; l=3153;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=kzfikvqslmcNoM9cU44BoA71y4mZZRBxiPJC+FC3nqM=;
 b=mSmDu4RPXx7Q/E/jz8U9/3TeqXi9A+CHJVNhbEnD/etxzCaQKeXuGPBn44QvPeKRfsEUAomxS
 RS7ibvc1PWlD2+I2WStej5tGgy79/YVJzveC6SOm9EFUHoN+iWAemox
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
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
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


