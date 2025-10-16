Return-Path: <linux-i2c+bounces-13595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41418BE47F6
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 18:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A23C1891F11
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 16:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1256823EA8F;
	Thu, 16 Oct 2025 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfmYPOQu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAAB32D0CA
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631302; cv=none; b=a0EZ2Ey8i+p0D4Z91U0nJMyezua7orkYbjgsdgmzvxWUST2hYZ87kKnHIzm14yfywhgHlH7oJCw43YF761DRajZp7dJV/r+0W0+0NJ5uZ+89QBNN78fxL8CWjte0os1FqexIEqbMA4qMvzQ1EOPtBwR2XxFI0ziOnTbw+kDJ7Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631302; c=relaxed/simple;
	bh=CAhmlVpNgjfXOj8lSkUQjgUpSSdRvC/yRyLgyFGBUv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+fvrgTO7/EVfpoADIGsGyA1G4X1yKMpJsFl40Pt3Ev1ze/BI6zOjzBhPHptBqf+GRG6ylVn/Id36GhC3Q4k6dktR73isAQ86vRNPPWKLZIatQdRjNlub4b9ZOGiACkvkvEznAZbS/mfldjexkdrxDEF09S0sNPsuYe8MsyyxHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfmYPOQu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e2e363118so8016625e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 09:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760631299; x=1761236099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsjCaRuVjABsOrX7YYvRpKJqzHL0cubRF6Hom6jKdNU=;
        b=CfmYPOQuAikafPBC05CFasy6cKk0kmj8+cef0TVGMdrsoPsrO0qJKYOqoGGBptXVWQ
         xhc+HlvAE1pMqbG5viZwR6993tMi1d/MNUmIopfNA6RgesglzF4NdfdwzsA5t1fAyzSH
         BK7YC5k+0Yf6thHzt+LxGv4+S9ncoxwwWfcrsz/upX71PX52O7WDSAtNZQsZEohnKw2M
         z2Z3kQ95nMdeekoBC1/yo2BGKOQGQUfHWrAi+A4RAOjrIMZqBPVAatyLkzF5ncmVic9U
         w6Ey/9nGIk2sp4pbRUNTV6WkDNW2e0ZnZAWS81VkyVzf6fPF+K4q5zqv/ezDCcN7/WMf
         zDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631299; x=1761236099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsjCaRuVjABsOrX7YYvRpKJqzHL0cubRF6Hom6jKdNU=;
        b=k2k7TiRGHVz1ojEj1O8esw3tyGViZb7cb/aP5nz1ZX6PNHkMjs0JPaELIjNEGI7j+U
         LBFA7eV+qVvVVlLOxq9rAtZaHxOlEglUnhfjFEY5Qv8IT3NTv22SmPnFsvWJAv4a2pSv
         iHwoXmHZpoqyjHDZF0+Nnxarf7Z1dbwYy2FwSQqHgKpD/qQy5Hcw9/OFGz9NRlcC8OUw
         X44kxAJuq1xCsBDVAZ6oodzjP995pP3PCq9rguHZqQZPOETeIiJsWt1QpNNyHRxl+Omv
         KIGvHEEkFBQaLmDOEWuHUlnxckQfqfUjTkBYpEiJshpDUF5diyOoAJOi+umo2bQXs+c+
         ccvw==
X-Gm-Message-State: AOJu0YyLjWvIZm1FYls49VTDQEB+r7fdaD2pALqtuMVbE+6LJoxjfoOm
	U+sfFv2sYxyMem1gB9QjtZiGAmI04QVcJs/p9AgMz/AH8gE0U/HctVDw
X-Gm-Gg: ASbGnctCviBnHdFkQjV67orW6rLtisqhwoZ0cX5gUN4jhjagsA5X4V8RLsjOP9k9sKD
	ob8WA5i82a4E2+8o1pv47B24v2rENJtMm20E8M2IhOJq369qjceea4yOo3XzlesEuYhfVWCUIRo
	oRevT0Wqh+CG5+1zCtfA2Tc759B0srartgy2cnE1EUSs5n8XFlAWiadG9lRuxraudPkdYN2xMYh
	CvwgsqY5imsMXeDgwJu7E4eUTV5vk3oV1ATh6EO8KhXzp9riQMS1kKVpmda5pT2/IoEqTAAk94R
	4uAT2RSssZgIiF9BvpyWlRQOtTloNm7rTSzURkZO06I2ltoWbrfJ+BXYy3okB6hPdhMIdtGDyNN
	pGbu0ggaZ+1tYWQJbJgUMVO2NjNyXkZ1RrsZg/+iVdRMLUNoCxRxQFte0sKfVrFU+8fVnLYsxAs
	DUIfQMPA==
X-Google-Smtp-Source: AGHT+IEKty8nwgNyyjLYDrrm1byKY80JX1Lr6PPCNGTkEJg3G1LBRa0WdrhWOustfFNHSRExFFdAew==
X-Received: by 2002:a05:600c:4710:b0:471:115e:9605 with SMTP id 5b1f17b1804b1-4711791fc13mr4177695e9.35.1760631298908;
        Thu, 16 Oct 2025 09:14:58 -0700 (PDT)
Received: from hangmanPC.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471143663afsm35654025e9.0.2025.10.16.09.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:14:58 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v6 1/3] i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
Date: Thu, 16 Oct 2025 19:14:15 +0300
Message-ID: <20251016161417.15545-2-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016161417.15545-1-chiru.cezar.89@gmail.com>
References: <20250926154520.40583-1-chiru.cezar.89@gmail.com>
 <20251016161417.15545-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove debug macros and printk and dev_debg function calls from file
as no change was done for 16 years.
Request by I2C SUBSYSTEM maintainer Wolfram Sang.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 59 --------------------------------
 1 file changed, 59 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index fd563e845d4b..7e2d8ff33d75 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -23,17 +23,8 @@
 #include "i2c-algo-pcf.h"
 
 
-#define DEB2(x) if (i2c_debug >= 2) x
-#define DEB3(x) if (i2c_debug >= 3) x /* print several statistical values */
-#define DEBPROTO(x) if (i2c_debug >= 9) x;
-	/* debug the protocol by showing transferred bits */
 #define DEF_TIMEOUT 16
 
-/*
- * module parameters:
- */
-static int i2c_debug;
-
 /* setting states on the bus with the right timing: */
 
 #define set_pcf(adap, ctl, val) adap->setpcf(adap->data, ctl, val)
@@ -47,27 +38,21 @@ static int i2c_debug;
 
 static void i2c_start(struct i2c_algo_pcf_data *adap)
 {
-	DEBPROTO(printk(KERN_DEBUG "S "));
 	set_pcf(adap, 1, I2C_PCF_START);
 }
 
 static void i2c_repstart(struct i2c_algo_pcf_data *adap)
 {
-	DEBPROTO(printk(" Sr "));
 	set_pcf(adap, 1, I2C_PCF_REPSTART);
 }
 
 static void i2c_stop(struct i2c_algo_pcf_data *adap)
 {
-	DEBPROTO(printk("P\n"));
 	set_pcf(adap, 1, I2C_PCF_STOP);
 }
 
 static void handle_lab(struct i2c_algo_pcf_data *adap, const int *status)
 {
-	DEB2(printk(KERN_INFO
-		"i2c-algo-pcf.o: lost arbitration (CSR 0x%02x)\n",
-		*status));
 	/*
 	 * Cleanup from LAB -- reset and enable ESO.
 	 * This resets the PCF8584; since we've lost the bus, no
@@ -88,9 +73,6 @@ static void handle_lab(struct i2c_algo_pcf_data *adap, const int *status)
 	if (adap->lab_mdelay)
 		mdelay(adap->lab_mdelay);
 
-	DEB2(printk(KERN_INFO
-		"i2c-algo-pcf.o: reset LAB condition (CSR 0x%02x)\n",
-		get_pcf(adap, 1)));
 }
 
 static int wait_for_bb(struct i2c_algo_pcf_data *adap)
@@ -151,9 +133,6 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 {
 	unsigned char temp;
 
-	DEB3(printk(KERN_DEBUG "i2c-algo-pcf.o: PCF state 0x%02x\n",
-				get_pcf(adap, 1)));
-
 	/* S1=0x80: S0 selected, serial interface off */
 	set_pcf(adap, 1, I2C_PCF_PIN);
 	/*
@@ -161,7 +140,6 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	 * PCF8584 does that when ESO is zero
 	 */
 	if (((temp = get_pcf(adap, 1)) & 0x7f) != (0)) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S0 (0x%02x).\n", temp));
 		return -ENXIO; /* definitely not PCF8584 */
 	}
 
@@ -169,7 +147,6 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	i2c_outb(adap, get_own(adap));
 	/* check it's really written */
 	if ((temp = i2c_inb(adap)) != get_own(adap)) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S0 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
 
@@ -177,7 +154,6 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	set_pcf(adap, 1, I2C_PCF_PIN | I2C_PCF_ES1);
 	/* check to see S2 now selected */
 	if (((temp = get_pcf(adap, 1)) & 0x7f) != I2C_PCF_ES1) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
 
@@ -185,7 +161,6 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	i2c_outb(adap, get_clock(adap));
 	/* check it's really written, the only 5 lowest bits does matter */
 	if (((temp = i2c_inb(adap)) & 0x1f) != get_clock(adap)) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
 
@@ -194,7 +169,6 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 
 	/* check to see PCF is really idled and we can access status register */
 	if ((temp = get_pcf(adap, 1)) != (I2C_PCF_PIN | I2C_PCF_BB)) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S1` (0x%02x).\n", temp));
 		return -ENXIO;
 	}
 
@@ -210,8 +184,6 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	int wrcount, status, timeout;
 
 	for (wrcount=0; wrcount<count; ++wrcount) {
-		DEB2(dev_dbg(&i2c_adap->dev, "i2c_write: writing %2.2X\n",
-				buf[wrcount] & 0xff));
 		i2c_outb(adap, buf[wrcount]);
 		timeout = wait_for_pin(adap, &status);
 		if (timeout) {
@@ -307,8 +279,6 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	/* Check for bus busy */
 	timeout = wait_for_bb(adap);
 	if (timeout) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: "
-			    "Timeout waiting for BB in pcf_xfer\n");)
 		i = -EIO;
 		goto out;
 	}
@@ -316,10 +286,6 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	for (i = 0;ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 
-		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
-		     str_read_write(pmsg->flags & I2C_M_RD),
-		     pmsg->len, pmsg->addr, i + 1, num);)
-
 		ret = pcf_doAddress(adap, pmsg);
 
 		/* Send START */
@@ -335,8 +301,6 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 				goto out;
 			}
 			i2c_stop(adap);
-			DEB2(printk(KERN_ERR "i2c-algo-pcf.o: Timeout waiting "
-				    "for PIN(1) in pcf_xfer\n");)
 			i = -EREMOTEIO;
 			goto out;
 		}
@@ -344,34 +308,17 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		/* Check LRB (last rcvd bit - slave ack) */
 		if (status & I2C_PCF_LRB) {
 			i2c_stop(adap);
-			DEB2(printk(KERN_ERR "i2c-algo-pcf.o: No LRB(1) in pcf_xfer\n");)
 			i = -EREMOTEIO;
 			goto out;
 		}
 
-		DEB3(printk(KERN_DEBUG "i2c-algo-pcf.o: Msg %d, addr=0x%x, flags=0x%x, len=%d\n",
-			    i, msgs[i].addr, msgs[i].flags, msgs[i].len);)
 
 		if (pmsg->flags & I2C_M_RD) {
 			ret = pcf_readbytes(i2c_adap, pmsg->buf, pmsg->len,
 					    (i + 1 == num));
-
-			if (ret != pmsg->len) {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only read %d bytes.\n",ret));
-			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n",ret));
-			}
 		} else {
 			ret = pcf_sendbytes(i2c_adap, pmsg->buf, pmsg->len,
 					    (i + 1 == num));
-
-			if (ret != pmsg->len) {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only wrote %d bytes.\n",ret));
-			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n",ret));
-			}
 		}
 	}
 
@@ -401,8 +348,6 @@ int i2c_pcf_add_bus(struct i2c_adapter *adap)
 	struct i2c_algo_pcf_data *pcf_adap = adap->algo_data;
 	int rval;
 
-	DEB2(dev_dbg(&adap->dev, "hw routines registered.\n"));
-
 	/* register new adapter to i2c module... */
 	adap->algo = &pcf_algo;
 
@@ -418,7 +363,3 @@ EXPORT_SYMBOL(i2c_pcf_add_bus);
 MODULE_AUTHOR("Hans Berglund <hb@spacetec.no>");
 MODULE_DESCRIPTION("I2C-Bus PCF8584 algorithm");
 MODULE_LICENSE("GPL");
-
-module_param(i2c_debug, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(i2c_debug,
-	"debug level - 0 off; 1 normal; 2,3 more verbose; 9 pcf-protocol");
-- 
2.43.0


