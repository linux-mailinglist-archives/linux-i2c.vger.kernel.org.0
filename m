Return-Path: <linux-i2c+bounces-13223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B79BA58D3
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 06:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6248A2A7E7A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 04:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9B31FECBA;
	Sat, 27 Sep 2025 04:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4/paOX1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1711C155389
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 04:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758946521; cv=none; b=XVsekQm+R9SWorEZB1WtuR2UWgT1NKC3HwU+IctGWIkxVT5El80yy4wcjFVdskuhagd7OpE7+tmaqtdM3LmW2LY9yYkMhjb1FSeecYKiTvJUwxZk8W258v/XMFSG4GpJSzDfTZb94gwJiqV5AAk3eIVJGiqYyLYbQWuBrI/yCaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758946521; c=relaxed/simple;
	bh=CAhmlVpNgjfXOj8lSkUQjgUpSSdRvC/yRyLgyFGBUv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GcZwWy2AgYZIhMxrIVns+jyK8d5xvZvbjmNzZt1JcPUJQYwZyozYoRKT8QkI8UVnM7F93qVfI5IyWXUHykU6WC+nSrGVEsZVSB2l39t8VLY4OKUacn2DwHMQQlpUXiA6wM6fl+v3+/T1luCf3kYtPrLjJxGGZtL+QNnEQhhPnow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4/paOX1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so11534215e9.0
        for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 21:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758946517; x=1759551317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsjCaRuVjABsOrX7YYvRpKJqzHL0cubRF6Hom6jKdNU=;
        b=I4/paOX193anl4+objMT7p7JjIvynp8etVhg33dnK363NdfAONY9qnMoCY2AAFVYQM
         jg/MvPyNgNIM8CgJWsZyfwhtsCuNqoLjcXXtLBAEOuZGR6xJ4oY/CjinJDwW56Hi0H7a
         yZS+SzPj6pDhuGhXcuu61pUGGnunFB4dBAcVG0RyLx4SxX4RjDI/p171UQDgLv+AJ7f+
         qAj2/TNdnBct9fhMwKscQfsiGckTODsSNMASK4rfV4i3xJH3YbHRbH+npMc4yJMRhWnu
         eAM9AkcxnqDXWXLXHMmEewJc3gsq/ktUHEnX7lQ18AcMUZaOaMUw5LpuEunjB+Duc4/m
         l19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758946517; x=1759551317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsjCaRuVjABsOrX7YYvRpKJqzHL0cubRF6Hom6jKdNU=;
        b=XEf1PIGUeghKXjCOfR9qOe8NMmjha2JbU/2iQTZM0kgWm8s8Mymm5MV1cwHVYYzjfq
         JQ4TdaEFxYvVTJetXuHOJX+PzmdoUvt60VHhQ9Sy0ACicRbfy/uC8+vUBpg1LrLtOaNi
         9YoN6U8bTIaNIhgwT0VcWHja2YIw9kYV4PVA+UghJm4J6oxHsGvwupAPYBCW4yyQA8zz
         lCCKD2KtP18n1U7uONhm0Lfg6Flp5/QwYJPxitli/SGl7If46BTWZmVGqsyekh1LKBv0
         JiGQtal5qfQsove1SSuKf36AivfHXHka276iBNqam3k5D33WdVwXZJlv6tOYZH3gt5uw
         pBuQ==
X-Gm-Message-State: AOJu0Yzx+VnLL1iUGAMmp0J0efvBYE3iIYiM3ov+Kg8fhH/t5IT8Apfh
	gG8l2v58S2R9CayuO5SnuPRqEnEyfWt0B4eUQ8cRE4OE5DaevID+4CLhiAgNFQ==
X-Gm-Gg: ASbGnctlg5h8XxDme2t7gnsP5BWmPpz3tQJ0WYj0Y7qbZTKhwjz1d8Hwtr3DzKp/pRh
	Q1tKoaC044zb8espn7Fl0+71klBwD4Qfc8GKV2Gi6LazByG048Ct4flRK6ssimVy7OPLGuMID+d
	/ARWDFNBRcRrkkUXJw4C+GqD4S50MgKQ46l++RLxDfibeQKqQiGfP0n+3YgCvBNuxW7x7tCmJtO
	1ILmD5ctzB5sFbG6fOaKOPW6um6+ER6VRx4r222m6tYCC23B2Y9WQ04LQU5MQpuik3VNRlqDyZh
	M2D5YqVD6rGAOcP4BbV52xWt3YuMZVwnX81SaxpOHW79rJLKaYmDZ4cToD6Jsf8s11E/ZET/Iap
	tVLphWm8W6//5ilgivgbT+Me7fTOnHQ==
X-Google-Smtp-Source: AGHT+IEPcTCyqVHiaP3/xNF/dla38CK58yAcvJfn7hE3rAnPGiZrQiLP4KgDRmqBXjwsRnQ8sbA6PQ==
X-Received: by 2002:a05:600c:4508:b0:46e:3e72:a56 with SMTP id 5b1f17b1804b1-46e3e720b94mr37653005e9.1.1758946517224;
        Fri, 26 Sep 2025 21:15:17 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33105e0bsm50386665e9.5.2025.09.26.21.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 21:15:16 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v6 1/3] i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
Date: Sat, 27 Sep 2025 07:13:58 +0300
Message-ID: <20250927041400.172949-2-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927041400.172949-1-chiru.cezar.89@gmail.com>
References: <aNbWejNZLYGuNvCI@ninjato>
 <20250927041400.172949-1-chiru.cezar.89@gmail.com>
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


