Return-Path: <linux-i2c+bounces-12714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACDB47B2E
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 14:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52C651898F0F
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 12:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F0A261585;
	Sun,  7 Sep 2025 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahM7+fKV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A901C84A6;
	Sun,  7 Sep 2025 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757246840; cv=none; b=eA/wnq0flwcOHpAMFoaSCG8ehSpppsWLyRCsK0t4jLWVbWie2tZfmqfLUp1Huigm6pR1w2g+zb8TiCxw9tB5UJVcGhdBmKO5TgeTpRTmAsfCnlNPqI/BjYqmfMsDWVmWMRIKVztMPZzHCoVbWFdpWf7ydoVWhyP699o7SdG2pSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757246840; c=relaxed/simple;
	bh=IeaLlXwPyu2cNAS9zasxAo8Sro4IotddBqINAmWFbUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HcfKmowSJdgb/5t46G3NbZVObgAl3zOLNu0y6YqHGnucXtZMbszBA4Kufgkt3ZKLtm5hTBB+KVkC3mQ1H3ZLB6nVcTEcQJP7bOXaWNs4xql6zS3kkca+3bOMj7WaYXARQlpiKbgdJnm2kBNElYo+aSE1v0DlemqoAoZR0YuvTq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahM7+fKV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45de6490e74so868225e9.2;
        Sun, 07 Sep 2025 05:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757246837; x=1757851637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msh1ZATcrXJ2GJuH9NWwag9G5icF2zxJPgSWKOuUf/c=;
        b=ahM7+fKVjWz69RJ2qT4h98dd7p6XW7/fJIe8YYSwERa6kO74LlmO1tPhqbOJ8ZI+kd
         Q6TbXW/8/tbsJTkkaYOXdaHsbdxV61rNk/jRe4dv3BevXEblBAJI11RlLrMAB2y/eow0
         z7BXAVL8m79k5/bE3pF2zuS0ErGIQ5bbPbScV2U1vSyrHbK3jiQVRbiWmiw3DdZAXDe8
         x6cjm89OFjBKj7B/9nSakyu+cVDy7AQW3s6yjXr3srxj3ZNbbtE65di1ZZ7ARIDtHb2s
         u6iNlAHet58YDY44DlaytSYJlPn+jqhv/Z8jWOlyiskDSxQeDyhKFEPqLmaSXEqeZhcm
         nZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757246837; x=1757851637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msh1ZATcrXJ2GJuH9NWwag9G5icF2zxJPgSWKOuUf/c=;
        b=WbZRw2lfbnNNI2OWCzbrPgH4Hfcli472IFfMLndlhNR5EPGBlCwy/V2oBtetgWguf+
         Wc1+9fUeRM9Cyza7pa5wqEGvQ6EXnXa/unIIOO92HIZyiQkxCFE2y4vRW5NkI6zXtoAh
         xaTZs6Tv281yTVfTq4kCbG1D+EnHE09/74WX/7iKS2Oa2ygP2q1YvtOsx0zocb0DNF9A
         sodjFHocv4SqOqsSuB/FdJpqLeQK0btLMK5Xd5IDnhG1R4ggKxC7SvrSQTbPuiMlNWS5
         43anRf+/qtlKlHW38luvMb0y21AEj1BGBmzYauLX9nz2evSjoP1sCes+SHo/6SjE5yqT
         NwmA==
X-Forwarded-Encrypted: i=1; AJvYcCVwv0RGo2AJl8yupd36zyNTE95fvwd28RpO6jnmOy7A42ZZwB72mJBwwRG5aRDM0LUBzrxlw0HII4z1AvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKz9v+znHK1fRCO93k2ebEz7Alk3IdZN4Ok86OIWXLGJIIz3Ut
	B5qQ6//gvmHiqpupu2P2aC/w5+dgdSPM8uuSuz+/tKP2PomaBA32WH3Y
X-Gm-Gg: ASbGnctlvL+vK2UXnLTMh3R3vISZRPpJABPZ6Zc0DOuaVJP1NrzpdDjlv7W1Pjk5Rbm
	4COe7tHan9HkM2ofgMhTyncYFGVfBqD8FFdDkU6tEs9d5lXD/TY+cKkPgEBb4bWC2J/PMrd119F
	l1khCTAdENOX3+ABLXxpGjMGKeDXDKkW1mTGhkNvU1NTr7trNNFY24RtWuH5QaDQqFZk6HdOu6p
	k40UxxIhfavuBF3cPfNSNg5t0ULrNM+JBLMY9lXlMZAH9cthhkHjrTvzGn3kPlW4BLe8MsaJiRE
	hQzNaBkyzfVpxVJ8Utvd9CkEKBnUlBt+m84n20U2ZhYiyVkuR+XTn+8+QFTque5kbtg5rYbfNQu
	nUPjFrMnn6tqAsdq7BjSF0rcxFCg5dyJoYoaLk/oF
X-Google-Smtp-Source: AGHT+IHtMNLhKqBq98pR0r9VX4J5t8KYLL789/mlm0sOdCDdz84iX6TX23evvfGrlLrOWSwhsQv7DA==
X-Received: by 2002:a05:600c:a43:b0:45b:81ad:336 with SMTP id 5b1f17b1804b1-45dddea520dmr48320685e9.16.1757246836654;
        Sun, 07 Sep 2025 05:07:16 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd2df4c8dsm131354165e9.15.2025.09.07.05.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 05:07:16 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v2] i2c : algos : i2c-algo-pcf.c : fixed errors shown by checkpatch
Date: Sun,  7 Sep 2025 15:07:06 +0300
Message-ID: <20250907120706.44114-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250907114557.15453-1-chiru.cezar.89@gmail.com>
References: <20250907114557.15453-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed all 18 errors revealed using checkpatch.pl on i2c-algo-pcf.c
file. Errors fixed were: macros starting with 'if' should be
enclosed by do - while loop to avoid possible if/else logic defects,
do not use assignment in if condition, spaces required around '=' ,
';', '<' and ','.
Motivation is to fix all errors and warnings i2c-algo-pcf kerenel
module.

Testing:
    * built kernel with my changes and I2C_ALGOPCF=m enabled
    and it built successfully.
    * installed kernel and external modules generated by build
    * rebooted and loaded using modprobe i2c-algo-pcf kernel module
    with param i2c_debug=3 and no message was found related to
    module in dmesg. But also no error was generated.

Checkpatch.pl warnings  on patch: on running checkpatch.pl on this
patch 7 warnings were raised. Will be fixed on following warnings
fixes patch.

v2:
    Fixed build errors generated by missing ; after do - while.
    Missed to git add latest changes to patch. Build is ok.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 42 +++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index fd563e845d4b..f5174f38d777 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -23,9 +23,10 @@
 #include "i2c-algo-pcf.h"
 
 
-#define DEB2(x) if (i2c_debug >= 2) x
-#define DEB3(x) if (i2c_debug >= 3) x /* print several statistical values */
-#define DEBPROTO(x) if (i2c_debug >= 9) x;
+#define DEB2(x) do { if (i2c_debug >= 2) x; } while (0);
+#define DEB3(x) do { if (i2c_debug >= 3) x; } while (0);
+	/* print several statistical values */
+#define DEBPROTO(x) do { if (i2c_debug >= 9) x; } while (0);
 	/* debug the protocol by showing transferred bits */
 #define DEF_TIMEOUT 16
 
@@ -160,7 +161,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	 * check to see S1 now used as R/W ctrl -
 	 * PCF8584 does that when ESO is zero
 	 */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != (0)) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != (0)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S0 (0x%02x).\n", temp));
 		return -ENXIO; /* definitely not PCF8584 */
 	}
@@ -168,7 +170,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load own address in S0, effective address is (own << 1) */
 	i2c_outb(adap, get_own(adap));
 	/* check it's really written */
-	if ((temp = i2c_inb(adap)) != get_own(adap)) {
+	temp = i2c_inb(adap);
+	if (temp  != get_own(adap)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S0 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -176,7 +179,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* S1=0xA0, next byte in S2 */
 	set_pcf(adap, 1, I2C_PCF_PIN | I2C_PCF_ES1);
 	/* check to see S2 now selected */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != I2C_PCF_ES1) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != I2C_PCF_ES1) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -184,7 +188,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load clock register S2 */
 	i2c_outb(adap, get_clock(adap));
 	/* check it's really written, the only 5 lowest bits does matter */
-	if (((temp = i2c_inb(adap)) & 0x1f) != get_clock(adap)) {
+	temp = i2c_inb(adap);
+	if ((temp & 0x1f) != get_clock(adap)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -193,7 +198,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	set_pcf(adap, 1, I2C_PCF_IDLE);
 
 	/* check to see PCF is really idled and we can access status register */
-	if ((temp = get_pcf(adap, 1)) != (I2C_PCF_PIN | I2C_PCF_BB)) {
+	temp = get_pcf(adap, 1);
+	if (temp != (I2C_PCF_PIN | I2C_PCF_BB)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S1` (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -209,7 +215,7 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	int wrcount, status, timeout;
 
-	for (wrcount=0; wrcount<count; ++wrcount) {
+	for (wrcount = 0; wrcount < count; ++wrcount) {
 		DEB2(dev_dbg(&i2c_adap->dev, "i2c_write: writing %2.2X\n",
 				buf[wrcount] & 0xff));
 		i2c_outb(adap, buf[wrcount]);
@@ -246,7 +252,8 @@ static int pcf_readbytes(struct i2c_adapter *i2c_adap, char *buf,
 	/* increment number of bytes to read by one -- read dummy byte */
 	for (i = 0; i <= count; i++) {
 
-		if ((wfp = wait_for_pin(adap, &status))) {
+		wfp = wait_for_pin(adap, &status);
+		if (wfp) {
 			if (wfp == -EINTR)
 				return -EINTR; /* arbitration lost */
 
@@ -299,7 +306,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	struct i2c_msg *pmsg;
 	int i;
-	int ret=0, timeout, status;
+	int ret = 0, timeout, status;
 
 	if (adap->xfer_begin)
 		adap->xfer_begin(adap->data);
@@ -313,7 +320,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		goto out;
 	}
 
-	for (i = 0;ret >= 0 && i < num; i++) {
+	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 
 		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
@@ -358,9 +365,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
 			if (ret != pmsg->len) {
 				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only read %d bytes.\n",ret));
+					    "only read %d bytes.\n", ret));
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n",ret));
+				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n", ret));
 			}
 		} else {
 			ret = pcf_sendbytes(i2c_adap, pmsg->buf, pmsg->len,
@@ -368,9 +375,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
 			if (ret != pmsg->len) {
 				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only wrote %d bytes.\n",ret));
+					    "only wrote %d bytes.\n", ret));
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n",ret));
+				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n", ret));
 			}
 		}
 	}
@@ -406,7 +413,8 @@ int i2c_pcf_add_bus(struct i2c_adapter *adap)
 	/* register new adapter to i2c module... */
 	adap->algo = &pcf_algo;
 
-	if ((rval = pcf_init_8584(pcf_adap)))
+	rval = pcf_init_8584(pcf_adap);
+	if (rval)
 		return rval;
 
 	rval = i2c_add_adapter(adap);
-- 
2.43.0


