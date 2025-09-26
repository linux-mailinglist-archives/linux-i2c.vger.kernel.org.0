Return-Path: <linux-i2c+bounces-13208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2727ABA4789
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 17:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AA99741986
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 15:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936B1226CF0;
	Fri, 26 Sep 2025 15:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zeg3gkqR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBA9221F03
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758901584; cv=none; b=NqA7SYunwaYB0/7J9VcpAfvYrorMvBnLcA/HewgALb2R4JA+l0+eF5cL3sgPbdJHDujEjqU2QPRQ9jsUgaWPx1AYxM67KHi29s0LwZeqqPXfZS9glNIux8RfxgsWUnGEZYAIdr+aTckMxmkHx8CsLdEEGtjYXXUKHcnMyulsgwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758901584; c=relaxed/simple;
	bh=G6JEcT8G2/8sDchY2PsdInwUeTIGTLznNgglrJII2ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SD2PoH4u1z3mkq0+bFuouAK3l2ZB6pNVRiw4zChhuJeJCFfnRrts0hg6L/avxLN7BedwXmGmQNXd7rLdtop7rmRI6nTfr23iJzYI5W9O6wKx9k/KFNtnLQuuHBX+JL/h91Y7tNJqeU9F8eNX7CUszBk0Q32pAZu0XfEfNo3Css8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zeg3gkqR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46b7bf21fceso17705735e9.3
        for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 08:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758901580; x=1759506380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVSoAzHry56rTyovTSJD65Fgy8GO0QeGApGj/x7GoPI=;
        b=Zeg3gkqRMTMoreyEJPeYHpD2/suLxYajRGoJIJrsVINZDoyKhQEb1p1XyNlDh+xpw/
         wjH0T0NrjhhW9ovhDUOvYgUgKPMK9VUrVnEGXqEMr2H88W9QZoEdY1/uR5IyuiPy7awG
         VzY5M1ecfysDT9ZHc0Ewj/oQphoBkM3rQuG+sb2twq87M4n5pfrfrLdLsOXSU6WFNZZv
         FRhfYTQF8TG4uwiXg4883cKp/mqe4zlBCyHzRHpQwj4ec0R1QO3EtUIO5EUirWAHc3yV
         gD0PC/SyKXYxtFVXl+Pjd3hF0YtKJzectbiog3mHIBjJ51SGr+vLKjMktSJuKpAv/0do
         6s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758901580; x=1759506380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVSoAzHry56rTyovTSJD65Fgy8GO0QeGApGj/x7GoPI=;
        b=MuvZXGhjiK+SLZhquX9N085KK/YssUvDoCQ090TKh9XYko62jEDe+Qn9OmjIDQT2HC
         HUiHEPcj5SqrbYHHBgPzQcbwHG0+99MoMwvj/oENxw9AEa3O2GN/IwJjEURRvtLxmqAA
         u/xgFpGGoKykxtcqR992ijPO5LxCBBREmiLf8GwYI+AyqIyBnBwNM7q7u6UZyRdV+E06
         8Fn0ubuu/Os1mTjIF7gcj4dk29Pnz1ur9HIP845A5cmbYs005ddAx2W7hnFcq1Lk+8Yo
         WVz6tztYkM2+/dccqJ8bF7fnd/VBp+gjNU2suVTzNGIbTWZuZMl5iqGevdG5GwQzvnDy
         wZOg==
X-Gm-Message-State: AOJu0Yz/JqpX7fzs7TotH7m5ZFk/mcxyxbEPZNSdICWrHw5yOZmCUasc
	apeA0VstJHIjZt5+7fVsysi9coNJ+e6UTsGAZp8DPPFHw52jZT+9pTeu
X-Gm-Gg: ASbGncsoVDNz5BS+iqjlElKBkmPT9i5+xjQfPvuWeWy0H5K4oH0TIQWSvgzUzpVEHpY
	PfSoSNfBy04Db4KbCdiY8qfbfArAGAa12QurQ/n+jpBnLZm7k0H83a47FYbEqvHN4v5uq7mUl6y
	9FLEpWUI0jEnVszPjUvctTNowT5aVlmyfwacTAZjnecGWPk6XeO90tQjkls1vzj1gqb4W7XuMcx
	sRJaWYE2n4UQ/kuuLkX6Hg6SNCmlNAUmjjvpVjxus6pjq75M8sxPb4Fiu+i9mnfG+vijgB7babE
	C9KQf/5pOk5EUXTkQJ1P2lMsveVhLnoqRHH+SHxdYmjVQUmi2k5jjRjD1/t9Q7FUYYHD/+HQ11n
	QBGNTbkWHUWr8l7z54m7ScrE8vZJeM1VbFJOvLbnA4varGqZksrE=
X-Google-Smtp-Source: AGHT+IHC9MzVHOVrOCsaJR8/rfIdxDy/QNivNBbF5FndmQsqyI42tzg0tECR+wZ3LOdRwgLs/ROPUg==
X-Received: by 2002:a05:600c:190e:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-46e329fca6emr93350875e9.30.1758901579551;
        Fri, 26 Sep 2025 08:46:19 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32bcd016sm41680005e9.1.2025.09.26.08.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:46:19 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v5 1/3] i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
Date: Fri, 26 Sep 2025 18:45:18 +0300
Message-ID: <20250926154520.40583-2-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926154520.40583-1-chiru.cezar.89@gmail.com>
References: <aNUa-9HcQzyjZkvE@shikoro>
 <20250926154520.40583-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove debug macros from file as no change was done for 16 years.
Request by I2C SUBSYSTEM maintainer Wolfram Sang.
Enforce errors fixing based on checkpatch.pl output on file.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 78 +++++++++++++-------------------
 1 file changed, 31 insertions(+), 47 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index fd563e845d4b..d4d82f3729d3 100644
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
@@ -47,27 +38,26 @@ static int i2c_debug;
 
 static void i2c_start(struct i2c_algo_pcf_data *adap)
 {
-	DEBPROTO(printk(KERN_DEBUG "S "));
+	printk(KERN_DEBUG "S ");
 	set_pcf(adap, 1, I2C_PCF_START);
 }
 
 static void i2c_repstart(struct i2c_algo_pcf_data *adap)
 {
-	DEBPROTO(printk(" Sr "));
+	printk(" Sr ");
 	set_pcf(adap, 1, I2C_PCF_REPSTART);
 }
 
 static void i2c_stop(struct i2c_algo_pcf_data *adap)
 {
-	DEBPROTO(printk("P\n"));
+	printk("P\n");
 	set_pcf(adap, 1, I2C_PCF_STOP);
 }
 
 static void handle_lab(struct i2c_algo_pcf_data *adap, const int *status)
 {
-	DEB2(printk(KERN_INFO
-		"i2c-algo-pcf.o: lost arbitration (CSR 0x%02x)\n",
-		*status));
+	printk(KERN_INFO "i2c-algo-pcf.o: lost arbitration (CSR 0x%02x)\n",
+		*status);
 	/*
 	 * Cleanup from LAB -- reset and enable ESO.
 	 * This resets the PCF8584; since we've lost the bus, no
@@ -88,9 +78,8 @@ static void handle_lab(struct i2c_algo_pcf_data *adap, const int *status)
 	if (adap->lab_mdelay)
 		mdelay(adap->lab_mdelay);
 
-	DEB2(printk(KERN_INFO
-		"i2c-algo-pcf.o: reset LAB condition (CSR 0x%02x)\n",
-		get_pcf(adap, 1)));
+	printk(KERN_INFO "i2c-algo-pcf.o: reset LAB condition (CSR 0x%02x)\n",
+		get_pcf(adap, 1));
 }
 
 static int wait_for_bb(struct i2c_algo_pcf_data *adap)
@@ -151,8 +140,7 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 {
 	unsigned char temp;
 
-	DEB3(printk(KERN_DEBUG "i2c-algo-pcf.o: PCF state 0x%02x\n",
-				get_pcf(adap, 1)));
+	printk(KERN_DEBUG "i2c-algo-pcf.o: PCF state 0x%02x\n", get_pcf(adap, 1));
 
 	/* S1=0x80: S0 selected, serial interface off */
 	set_pcf(adap, 1, I2C_PCF_PIN);
@@ -161,7 +149,7 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	 * PCF8584 does that when ESO is zero
 	 */
 	if (((temp = get_pcf(adap, 1)) & 0x7f) != (0)) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S0 (0x%02x).\n", temp));
+		printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S0 (0x%02x).\n", temp);
 		return -ENXIO; /* definitely not PCF8584 */
 	}
 
@@ -169,7 +157,7 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	i2c_outb(adap, get_own(adap));
 	/* check it's really written */
 	if ((temp = i2c_inb(adap)) != get_own(adap)) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S0 (0x%02x).\n", temp));
+		printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S0 (0x%02x).\n", temp);
 		return -ENXIO;
 	}
 
@@ -177,7 +165,7 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	set_pcf(adap, 1, I2C_PCF_PIN | I2C_PCF_ES1);
 	/* check to see S2 now selected */
 	if (((temp = get_pcf(adap, 1)) & 0x7f) != I2C_PCF_ES1) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S2 (0x%02x).\n", temp));
+		printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S2 (0x%02x).\n", temp);
 		return -ENXIO;
 	}
 
@@ -185,7 +173,7 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	i2c_outb(adap, get_clock(adap));
 	/* check it's really written, the only 5 lowest bits does matter */
 	if (((temp = i2c_inb(adap)) & 0x1f) != get_clock(adap)) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S2 (0x%02x).\n", temp));
+		printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S2 (0x%02x).\n", temp);
 		return -ENXIO;
 	}
 
@@ -194,7 +182,7 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 
 	/* check to see PCF is really idled and we can access status register */
 	if ((temp = get_pcf(adap, 1)) != (I2C_PCF_PIN | I2C_PCF_BB)) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S1` (0x%02x).\n", temp));
+		printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S1` (0x%02x).\n", temp);
 		return -ENXIO;
 	}
 
@@ -210,8 +198,8 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	int wrcount, status, timeout;
 
 	for (wrcount=0; wrcount<count; ++wrcount) {
-		DEB2(dev_dbg(&i2c_adap->dev, "i2c_write: writing %2.2X\n",
-				buf[wrcount] & 0xff));
+		dev_dbg(&i2c_adap->dev, "i2c_write: writing %2.2X\n",
+				buf[wrcount] & 0xff);
 		i2c_outb(adap, buf[wrcount]);
 		timeout = wait_for_pin(adap, &status);
 		if (timeout) {
@@ -307,8 +295,8 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	/* Check for bus busy */
 	timeout = wait_for_bb(adap);
 	if (timeout) {
-		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: "
-			    "Timeout waiting for BB in pcf_xfer\n");)
+		printk(KERN_ERR "i2c-algo-pcf.o: "
+			    "Timeout waiting for BB in pcf_xfer\n");
 		i = -EIO;
 		goto out;
 	}
@@ -316,9 +304,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	for (i = 0;ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 
-		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
+		printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
 		     str_read_write(pmsg->flags & I2C_M_RD),
-		     pmsg->len, pmsg->addr, i + 1, num);)
+		     pmsg->len, pmsg->addr, i + 1, num);
 
 		ret = pcf_doAddress(adap, pmsg);
 
@@ -335,8 +323,8 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 				goto out;
 			}
 			i2c_stop(adap);
-			DEB2(printk(KERN_ERR "i2c-algo-pcf.o: Timeout waiting "
-				    "for PIN(1) in pcf_xfer\n");)
+			printk(KERN_ERR "i2c-algo-pcf.o: Timeout waiting "
+				    "for PIN(1) in pcf_xfer\n");
 			i = -EREMOTEIO;
 			goto out;
 		}
@@ -344,33 +332,33 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		/* Check LRB (last rcvd bit - slave ack) */
 		if (status & I2C_PCF_LRB) {
 			i2c_stop(adap);
-			DEB2(printk(KERN_ERR "i2c-algo-pcf.o: No LRB(1) in pcf_xfer\n");)
+			printk(KERN_ERR "i2c-algo-pcf.o: No LRB(1) in pcf_xfer\n");
 			i = -EREMOTEIO;
 			goto out;
 		}
 
-		DEB3(printk(KERN_DEBUG "i2c-algo-pcf.o: Msg %d, addr=0x%x, flags=0x%x, len=%d\n",
-			    i, msgs[i].addr, msgs[i].flags, msgs[i].len);)
+		printk(KERN_DEBUG "i2c-algo-pcf.o: Msg %d, addr=0x%x, flags=0x%x, len=%d\n",
+			    i, msgs[i].addr, msgs[i].flags, msgs[i].len);
 
 		if (pmsg->flags & I2C_M_RD) {
 			ret = pcf_readbytes(i2c_adap, pmsg->buf, pmsg->len,
 					    (i + 1 == num));
 
 			if (ret != pmsg->len) {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only read %d bytes.\n",ret));
+				printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
+					    "only read %d bytes.\n",ret);
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n",ret));
+				printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n",ret);
 			}
 		} else {
 			ret = pcf_sendbytes(i2c_adap, pmsg->buf, pmsg->len,
 					    (i + 1 == num));
 
 			if (ret != pmsg->len) {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only wrote %d bytes.\n",ret));
+				printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
+					    "only wrote %d bytes.\n",ret);
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n",ret));
+				printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n",ret);
 			}
 		}
 	}
@@ -401,7 +389,7 @@ int i2c_pcf_add_bus(struct i2c_adapter *adap)
 	struct i2c_algo_pcf_data *pcf_adap = adap->algo_data;
 	int rval;
 
-	DEB2(dev_dbg(&adap->dev, "hw routines registered.\n"));
+	dev_dbg(&adap->dev, "hw routines registered.\n");
 
 	/* register new adapter to i2c module... */
 	adap->algo = &pcf_algo;
@@ -418,7 +406,3 @@ EXPORT_SYMBOL(i2c_pcf_add_bus);
 MODULE_AUTHOR("Hans Berglund <hb@spacetec.no>");
 MODULE_DESCRIPTION("I2C-Bus PCF8584 algorithm");
 MODULE_LICENSE("GPL");
-
-module_param(i2c_debug, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(i2c_debug,
-	"debug level - 0 off; 1 normal; 2,3 more verbose; 9 pcf-protocol");
-- 
2.43.0


