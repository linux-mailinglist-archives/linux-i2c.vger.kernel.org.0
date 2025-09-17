Return-Path: <linux-i2c+bounces-13023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7988AB7F7DE
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 15:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5DE5188F175
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 13:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4C931960F;
	Wed, 17 Sep 2025 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICoWZToB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06E8330D27
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116201; cv=none; b=VKMJxy78dnk5WFWQKH5krZbnUn7YduJfz13SxpkytD7bTVE5n/IpGA/qaO708/NaUw7mqgyudKFBZ05dn+PDnxfh5fuWqzQm0Q7WCG4/IbNo9ndnQm/qZuua/oEcT8qsPonL3Ir+ZDDYZQ3bSrU3zhlaRmvdf/M+2iebYOAb0qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116201; c=relaxed/simple;
	bh=Zz0IopogDoMvhYvB0P75k7TloLTRPPBtZlmYSUPEptE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+zHo4QOfDzeBWynmyDNtML/ipUpowTlkVKGjnMxi+rEZwXGXabBeCvH0BRhkpJf4iywDoElTAwCzfRzP5RYWXQCZv7gzim1BZWE8kRUU0SNwPKdRW+dgG2CWRGFAGr+iahgH1Lu93n2zhjU2X4ETTV+eULkyhcXJA6CVNxvBGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICoWZToB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so41720305e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 06:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758116197; x=1758720997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze5DP8lBOEWJ8GFCJ1XOs6/oD1a6usgeVZS8cBMdDlE=;
        b=ICoWZToBYDCAl+zMhnOt/WiH8CL3oiK+Qfx/kS2WrLK83RWBUchroX7CMXddFIYmI/
         JkHWCc7dFUi+ULftShy229CzGZWrS+ubP5/KHFqY1nNxqmyBw7wHHwHvnoEoFDGrxho8
         imfB4ZDC+ARdLlq+tJtXHFeoH4fMYC54Q/Lki/RUfqvi84YKY/Uz5LuLJ6QRoDBwoGIn
         +K7SdOt4gAYjab/d10fYFfLlgC4InLlBFw8fzScFcV4nuTSU9qbvJyxzmoZ0tD8zvNob
         p9rbokNQlL3U9RfwvgWoWgw6itSJ4qcoPjEOrMWTBiNxZsik1CJptFsdD1olTG3XVMUI
         CISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116197; x=1758720997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ze5DP8lBOEWJ8GFCJ1XOs6/oD1a6usgeVZS8cBMdDlE=;
        b=idMekEQga5KrZAXlU7qDyTcGgTxDNIiBAJt63VlhVqoDp9tlFMvbBf5ko1wjwQzW51
         TGUBYHeV1OEQlc5iZzxuqBnIS/e0iXEn4kS4u8+o1G2/+lKbmjWfbMCZcOMEdlXPDmFv
         QT0qZS2Hh5Yx3KnqfrKwIuF5x6F8xmNAfVFYplVAASosJVbsKS89A5x2vyxLASmcizLT
         rVXhn6Z1Ls02kAQ8LdQoFuXpdqHTOMysZBIpVKF9ZLiHnBuzQMo16NJBKm+rs7OMXSVQ
         ky9jGBquMibS8g+CMrthqbZo8SFVxJcB+TH922I0RfZz0Yy/RpeBxwTT3FPhJm7VgBKf
         z56g==
X-Gm-Message-State: AOJu0YxS8I858GyRMGnpTGBVk5JLZDQr4dh96qmxQSHkqLw4dBLr8EwL
	+buh8tfM88TqtCuAxuj/XvIuZJ7G3g6XuRIEYibu8ms2JM633X6x4miS
X-Gm-Gg: ASbGnctfnGfQZFyvmZAaLs5yiE3dgbMhUMO87WDFL+4NEUtBhZeR5zDS1AVTWS9m4p/
	wzWKe5u4qZlfNVVkRQsjhxiMAH4ZhBNmi140J3Uc+CLZrtVCluh6bWroI9JOJ2yGkSKgeOD0AS1
	QtbkvFgSLeeoFpheqcbXyUhaENEcabCwtuH9sfMnPbC6110tCjh909Sv1pzAHKnMIsEdjolu5Pd
	88Q6yqsjIy6K9A+iYNfg3B9uSd/hzjNyAEwbKMe2zvXtu1afe0wElTz8HIh97Arpqx/T1pTDmpZ
	+BDOiyDoaqjwG6AezoHRe+DvgVujRn2AijoNpDusOpSZLE9YHGLc9rA/1N2OBiHQytlqv4y8J86
	ZocmhPlJznWIcparoFM5NUmKU2aiM7g==
X-Google-Smtp-Source: AGHT+IEgHr69wasYUN/vjySljN+1+rUxqFqFWAPOwJ+y4oYduihftX6FWrGrruJItBCX9veOlg7bpw==
X-Received: by 2002:a05:600c:1d12:b0:45d:d291:5dc1 with SMTP id 5b1f17b1804b1-46202a0e8dbmr22930955e9.15.1758116196764;
        Wed, 17 Sep 2025 06:36:36 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139ab391bsm38198075e9.21.2025.09.17.06.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:36:36 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v4 3/3] i2c: pcf8584: Fix space(s) required before or after different operators
Date: Wed, 17 Sep 2025 16:35:24 +0300
Message-ID: <20250917133524.85063-4-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917133524.85063-1-chiru.cezar.89@gmail.com>
References: <20250907114557.15453-1-chiru.cezar.89@gmail.com>
 <20250917133524.85063-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Require spaces around or before or after '=', ';', '<' and ','.
Add space(s) around or before or after binary and ternary operators and
punctuation marks. Enforce errors fixing based on checkpatch.pl output on
file.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 598bf000bf4a..3439b7387a54 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -223,7 +223,7 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	int wrcount, status, timeout;
 
-	for (wrcount=0; wrcount<count; ++wrcount) {
+	for (wrcount = 0; wrcount < count; ++wrcount) {
 		DEB2(dev_dbg(&i2c_adap->dev, "i2c_write: writing %2.2X\n",
 				buf[wrcount] & 0xff));
 		i2c_outb(adap, buf[wrcount]);
@@ -314,7 +314,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	struct i2c_msg *pmsg;
 	int i;
-	int ret=0, timeout, status;
+	int ret = 0, timeout, status;
 
 	if (adap->xfer_begin)
 		adap->xfer_begin(adap->data);
@@ -328,7 +328,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		goto out;
 	}
 
-	for (i = 0;ret >= 0 && i < num; i++) {
+	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 
 		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
@@ -373,9 +373,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
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
@@ -383,9 +383,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
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
-- 
2.43.0


