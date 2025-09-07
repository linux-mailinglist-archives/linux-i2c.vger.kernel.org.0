Return-Path: <linux-i2c+bounces-12713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92218B47B15
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 13:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3951F17E587
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 11:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA26221F2D;
	Sun,  7 Sep 2025 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1YT7bBH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679CC189;
	Sun,  7 Sep 2025 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757245632; cv=none; b=MTps3aReeFR6WY1erFiuKBXpd7oeTbTWc5R5ZIABAF6e1yJKJ/X3CdkysK8VuUyWDcbOo3hUPdWOmcA6FLpUH7lolDsILkxT+xNFh2+Q1rEIUZ1+sRW7QM7iDsHNjqIySW4SXiQMBiTTrH3u/l6ZnoF3ymj2k+VEiJ/23JKki4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757245632; c=relaxed/simple;
	bh=Fk0gTWMlRran9x4WVxTFRk/KhL+hgRfZMmVp1C2GC5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=djvvM1dKV+Bv1DIOn9SK7IOnHRA6lt9zl+FWj+EusBe4ywDF6oBX+oY0J7uspjqOR2BaKN37gy/drd7bH5jOcqR1KjC5MGQjL2YGi6N2QysX8TkvTYqwiiFE+Yjse3tGo+m315RDAp+7r5yj63G3EDzy2JJzRtn1IYnKbyYtFtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1YT7bBH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so21927425e9.0;
        Sun, 07 Sep 2025 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757245629; x=1757850429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NW6uX5v1JD6iEFqaLUl2PAM0nK6/Y7b2LI3Xk8odK6A=;
        b=W1YT7bBHiI7VUQSEmCZOaar0ewOiScFse+hct4j8omQOkCAY1vzBVV1WiHGcA4hRXF
         GbGumnkrUoEw1dubUxuugoZblXiw7m9jULJASpNz5k0VhlkIOMJskmR1dU5rafUnq2UF
         pAxHSv5kPsuDbJf5YhTyKjEMOO+7aS4VGqT3l+rgqAjWytdy1+c+N4vTnsSoDIWztsl1
         ei9lQgKuu7IvV5OO53H+ufUQiJMGhZ2Pk+f7+uGZinlUwt7GC1+h543xM6qTImN4QMDF
         wYTk2YJIVr1pnPI+L5dsbPG8+LskjmEzDkXpuPjBJdp+SE18ODRcB8oyFONNVYeSFMD+
         rueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757245629; x=1757850429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NW6uX5v1JD6iEFqaLUl2PAM0nK6/Y7b2LI3Xk8odK6A=;
        b=qblB9IcyPEEK1roSF8ZAugnJJvbG3JwCuNPE2JSSpcAcUjkWXKa0R6TZ5ttuMPQRUb
         CAr3xCGvfjbrgw2bPVKLhiX5yz3auA9cqa2L9Zoww3lPxIWbXiGlRHWlsN0LYRBHrnFK
         Y0mwQQe43VUFMCyjOiPa2sPUfL5qe0giUV3g7EYVdMGphjlrQk2XQ991XoBzrAhxQ7zb
         aDNJA/ul91pwBMS5JnYADAWPgXEScFOSg8Ql4Yr75NTW9ORF1KK64u3wEC/3KZOJGjOK
         bZzmMD2TRR8HWwHTkz4Xk8XlNCD3Dsq+qqLT+3D1rAb8cy51LBzRMqmG8gQLLXkh+vpL
         9DLw==
X-Forwarded-Encrypted: i=1; AJvYcCUSsk4/lNotoDj5RIaV8h43wJKNfuvbQfdOuvw3awdwMTz/Afv25Rf9Qv5tKYo8N6UyrZsQN6NZstbW/eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaYEeHBxvO/NZZyRF2ctBCKdqA75BkAPLmITzQkFRJ6ghgNQhx
	Jpu/4riqoSDDPAVxTDnMkVPOaSeskXeGBoXZA4/wG1OBi1ZkLFpvJt7Y
X-Gm-Gg: ASbGncslDwtee052dQNzNcjuWpzVTjfVBiUQ+Ml6ZV2Op1xNfVYUU3VHQyjEtJ9iJDW
	F42UM4N+kObG2DF8VIA2J9vFzHXVzY7u1oaXMClwR0CP0J6J/bgw9Tp8Ww73hpif27kLadRCklq
	rhP7It930X5aoMcWvkruSQPFGGXuYbVl9EAiDeIo9Y+ZCP7Q+dS3Nqmg5nc3y71lyza4QLwWYjz
	xp/EZdn5oyT+pO8Jzr9a0WJ3OAj4rR3FrWdtiJD+I6r7ja5JC8yD3dZ+vPR0l0y6fiYlelLHSGa
	BfDFN2/tiDevKiYe57hp9QkRG2fggj6RHUMYlZip/QAG6CGHPndpftiFNoHkOkiCFgib5+HIU/8
	IlNDeSCZ2F6NVHhXnWk4BeoKHO7jguVaCVxVWey70
X-Google-Smtp-Source: AGHT+IHcr/Po+xpnFVyr+eN4rn1WhJOFlhzPrDKk4/V1Mktebo8x93Q43Svk2iyC3lkecD7T9HMgdw==
X-Received: by 2002:a05:6000:4027:b0:3e7:4414:794b with SMTP id ffacd0b85a97d-3e744147d2fmr1072047f8f.50.1757245628412;
        Sun, 07 Sep 2025 04:47:08 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e74893acecsm369100f8f.36.2025.09.07.04.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:47:07 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH] i2c : algos : i2c-algo-pcf.c : fixed errors shown by checkpatch
Date: Sun,  7 Sep 2025 14:45:57 +0300
Message-ID: <20250907114557.15453-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Errors on patch: on running checkpatch.pl on this patch 4 warnings
were raised. Will be fixed on following warnings fixes patch.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 50 +++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index fd563e845d4b..18ba21ff8992 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -23,9 +23,18 @@
 #include "i2c-algo-pcf.h"
 
 
-#define DEB2(x) if (i2c_debug >= 2) x
-#define DEB3(x) if (i2c_debug >= 3) x /* print several statistical values */
-#define DEBPROTO(x) if (i2c_debug >= 9) x;
+#define DEB2(x) do { \
+			if (i2c_debug >= 2)	\
+				x;	\
+		} while (0)
+#define DEB3(x) do { \
+			if (i2c_debug >= 3)	\
+				x;	\ /* print several statistical values */
+		} while (0)
+#define DEBPROTO(x) do { \
+			if (i2c_debug >= 9)	\
+				x;	\
+		} while (0)
 	/* debug the protocol by showing transferred bits */
 #define DEF_TIMEOUT 16
 
@@ -160,7 +169,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	 * check to see S1 now used as R/W ctrl -
 	 * PCF8584 does that when ESO is zero
 	 */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != (0)) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != (0)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S0 (0x%02x).\n", temp));
 		return -ENXIO; /* definitely not PCF8584 */
 	}
@@ -168,7 +178,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load own address in S0, effective address is (own << 1) */
 	i2c_outb(adap, get_own(adap));
 	/* check it's really written */
-	if ((temp = i2c_inb(adap)) != get_own(adap)) {
+	temp = i2c_inb(adap);
+	if (temp  != get_own(adap)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S0 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -176,7 +187,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* S1=0xA0, next byte in S2 */
 	set_pcf(adap, 1, I2C_PCF_PIN | I2C_PCF_ES1);
 	/* check to see S2 now selected */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != I2C_PCF_ES1) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != I2C_PCF_ES1) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -184,7 +196,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load clock register S2 */
 	i2c_outb(adap, get_clock(adap));
 	/* check it's really written, the only 5 lowest bits does matter */
-	if (((temp = i2c_inb(adap)) & 0x1f) != get_clock(adap)) {
+	temp = i2c_inb(adap);
+	if ((temp & 0x1f) != get_clock(adap)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -193,7 +206,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	set_pcf(adap, 1, I2C_PCF_IDLE);
 
 	/* check to see PCF is really idled and we can access status register */
-	if ((temp = get_pcf(adap, 1)) != (I2C_PCF_PIN | I2C_PCF_BB)) {
+	temp = get_pcf(adap, 1);
+	if (temp != (I2C_PCF_PIN | I2C_PCF_BB)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S1` (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -209,7 +223,7 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	int wrcount, status, timeout;
 
-	for (wrcount=0; wrcount<count; ++wrcount) {
+	for (wrcount = 0; wrcount < count; ++wrcount) {
 		DEB2(dev_dbg(&i2c_adap->dev, "i2c_write: writing %2.2X\n",
 				buf[wrcount] & 0xff));
 		i2c_outb(adap, buf[wrcount]);
@@ -246,7 +260,8 @@ static int pcf_readbytes(struct i2c_adapter *i2c_adap, char *buf,
 	/* increment number of bytes to read by one -- read dummy byte */
 	for (i = 0; i <= count; i++) {
 
-		if ((wfp = wait_for_pin(adap, &status))) {
+		wfp = wait_for_pin(adap, &status);
+		if (wfp) {
 			if (wfp == -EINTR)
 				return -EINTR; /* arbitration lost */
 
@@ -299,7 +314,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	struct i2c_msg *pmsg;
 	int i;
-	int ret=0, timeout, status;
+	int ret = 0, timeout, status;
 
 	if (adap->xfer_begin)
 		adap->xfer_begin(adap->data);
@@ -313,7 +328,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		goto out;
 	}
 
-	for (i = 0;ret >= 0 && i < num; i++) {
+	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 
 		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
@@ -358,9 +373,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
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
@@ -368,9 +383,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
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
@@ -406,7 +421,8 @@ int i2c_pcf_add_bus(struct i2c_adapter *adap)
 	/* register new adapter to i2c module... */
 	adap->algo = &pcf_algo;
 
-	if ((rval = pcf_init_8584(pcf_adap)))
+	rval = pcf_init_8584(pcf_adap);
+	if (rval)
 		return rval;
 
 	rval = i2c_add_adapter(adap);
-- 
2.43.0


