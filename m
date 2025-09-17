Return-Path: <linux-i2c+bounces-13021-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BEAB7F7B1
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 15:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69F864A1F18
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 13:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA22432D5C2;
	Wed, 17 Sep 2025 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYF8otPY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B46D32BC19
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116195; cv=none; b=K2hSBs9eWq6JwkGXIW406lqV09h0PZRI8V6YvCuXpp21uf4gYRUJtXTrowXBCrGY6t6xc0DaKEG6nWUXvFM64mKPOb6X3H2W/idC1mmpjH2eqlUTHNNaK7+B+4ZbiPrZOm+qs+ewv2hVq91JUtMZQv6d43yc4RdtodQiF4Vzt2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116195; c=relaxed/simple;
	bh=gWMmpxO3/QyySBmyRF9UaNZFqybtXo64CSoJ0E1jRmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXmRq0C2qorlpCYpgys4PoJJHrV55YhU92bH1fBmdfSkE+Pfo5CbjHQfOlgNSHZFe/xsM9FaS1CvuTotOsJUCRuk85plkSiLn1weBd7UHuZ8ITyZGizJDiJOYHGyJ8u1p8FFmRwEnmHrgvYbuPyQNWsYeYv1CHYG6WlawkoPdNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYF8otPY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dde353b47so40505575e9.3
        for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758116192; x=1758720992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSoCVcELFMldoX3y3Du2YUF3k7DlmnQItruU/P14Jd4=;
        b=UYF8otPYX4EcGx1GUcbiqykrIIKP6VPcWQyn8zjMNfmfiE22WZTfnIDqi/gIG3BXUz
         Ve2JCX5yNr/fTkQzTBCZp4Ud+0Uih+4GHtoYVEkV1qMZPVZQ5cW5eAXCb+oIFyBlMkAi
         sIQhOMdhN7/mff9qLxjPqdo6g15vx982ow0ib/kV/9JDfSQLngeia9yGciqCl7MLOose
         qgLTt9oNoD3JpWa1TOGYM/0HiJXvryH9o1tvpU+7u/CUvxGZyMmDSsVSP89lMhJ0axhv
         yg29hEpuTWpT0qhyv8HcRK3RGKsNaKJ+iFvLJ/LIzpZrBqsuOxAEFHVv76DIeUQYSsOM
         Os7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116192; x=1758720992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSoCVcELFMldoX3y3Du2YUF3k7DlmnQItruU/P14Jd4=;
        b=DaBXewh7i/YF9P2/Pp/DeTm5z2oNU/2yHJrxSFu9rJqbgiPQRYh14rCquwiZRzhJtB
         0lPx6leoel00IDGp0BPd4UiE+uB6ec11pRHcz6D5r/bTChsKMil5CUJORv1F3ymj7lUo
         +SnuuSG6RbYHNwTzrPaYc2mDGqIth6R2xj7K35OJ6TsgXEMn0BvGqMlHIF2FZ0MXas3c
         qWGhCQFt1PAUncVNCPFjyrX0O2vV/1P/nlMwtdmPWY9ZcA/qKbP1BPjJihmZV3mVhv7/
         dYR1NeXXNZEw8E7CiGQ4rou5sGQac/ufF+dVzINL6OaU/0/GDAPWOD6N5+2j4CWFiuqY
         cl2Q==
X-Gm-Message-State: AOJu0YyzZLrobXgXtq3QNikVOFK+5/Tspq7CQLck8nzvnjkhywTwbkny
	ln+KGrsLdGKSiWS983vvYtnj5i91ipGI30Vnj8mwMQeKGOIVoYrQCatR
X-Gm-Gg: ASbGncv7506hosnG3q9Vi+dbAXnjVL/4eMcYcA9GG5eOBnYlLdV0iq/ukqVMcFWPPAd
	ZW+14Y69xvV/y352BjGi4OD8nf+s8lDlmCbKbWgwUPzUh3/NjHZuQvcMFLtQGafqpU8OpZuiJQp
	EOfUjyDkajy+3f2yQ9LrMcVSrIqWQBBOqU1NV9p5j5tm4yC+lTwbjGbJnEiZtrGg2jgq/BIoOkV
	Ga7sz51nXbkawwioWfYIJStgIz7HkPgxxmZZxT1+0HMLkILyL73icrEmWvYjDMFAKYDZsydqx1X
	ZMjh4HDb00K3991Yf69RzHsFgsBk561T+BiUGi8YUepLeTslsojJ1kMDYJBa7DOCtCc+Xzj+tJK
	KSpyrVqZZ9T9XdMxHu65mWsd51Flsprbh1x6EG7+9
X-Google-Smtp-Source: AGHT+IGXv7lCvSiC5jwcu15TTnkjthCUCqYkUi8gYvCV4k6lcJVuvHccVU1DUXs4EAeskxxTkOh/sA==
X-Received: by 2002:a05:600c:4f86:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-46206842450mr18528565e9.21.1758116191764;
        Wed, 17 Sep 2025 06:36:31 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139ab391bsm38198075e9.21.2025.09.17.06.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 06:36:31 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v4 1/3] i2c: pcf8584: Fix debug macros defines of if statements
Date: Wed, 17 Sep 2025 16:35:22 +0300
Message-ID: <20250917133524.85063-2-chiru.cezar.89@gmail.com>
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

Enclose 'if' statements debug macros defines in do - while loops.
Fix inconsistent macro usage ending ';', which caused build errors in some
cases. Enforce errors fixing based on checkpatch.pl output on file.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index fd563e845d4b..3fc4b5080a32 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -23,10 +23,19 @@
 #include "i2c-algo-pcf.h"
 
 
-#define DEB2(x) if (i2c_debug >= 2) x
-#define DEB3(x) if (i2c_debug >= 3) x /* print several statistical values */
-#define DEBPROTO(x) if (i2c_debug >= 9) x;
-	/* debug the protocol by showing transferred bits */
+#define DEB2(x) do { \
+			if (i2c_debug >= 2)	\
+				x;	\
+		} while (0)
+#define DEB3(x) do { \
+			if (i2c_debug >= 3)	\
+				x; /* print several statistical values */ \
+		} while (0)
+#define DEBPROTO(x)	do { \
+				if (i2c_debug >= 9)	\
+					x;	\
+				/* debug the protocol by showing transferred bits */	\
+			} while (0)
 #define DEF_TIMEOUT 16
 
 /*
@@ -308,7 +317,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	timeout = wait_for_bb(adap);
 	if (timeout) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: "
-			    "Timeout waiting for BB in pcf_xfer\n");)
+			    "Timeout waiting for BB in pcf_xfer\n"));
 		i = -EIO;
 		goto out;
 	}
@@ -318,7 +327,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
 		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
 		     str_read_write(pmsg->flags & I2C_M_RD),
-		     pmsg->len, pmsg->addr, i + 1, num);)
+		     pmsg->len, pmsg->addr, i + 1, num));
 
 		ret = pcf_doAddress(adap, pmsg);
 
@@ -336,7 +345,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 			}
 			i2c_stop(adap);
 			DEB2(printk(KERN_ERR "i2c-algo-pcf.o: Timeout waiting "
-				    "for PIN(1) in pcf_xfer\n");)
+				    "for PIN(1) in pcf_xfer\n"));
 			i = -EREMOTEIO;
 			goto out;
 		}
@@ -344,13 +353,13 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		/* Check LRB (last rcvd bit - slave ack) */
 		if (status & I2C_PCF_LRB) {
 			i2c_stop(adap);
-			DEB2(printk(KERN_ERR "i2c-algo-pcf.o: No LRB(1) in pcf_xfer\n");)
+			DEB2(printk(KERN_ERR "i2c-algo-pcf.o: No LRB(1) in pcf_xfer\n"));
 			i = -EREMOTEIO;
 			goto out;
 		}
 
 		DEB3(printk(KERN_DEBUG "i2c-algo-pcf.o: Msg %d, addr=0x%x, flags=0x%x, len=%d\n",
-			    i, msgs[i].addr, msgs[i].flags, msgs[i].len);)
+			    i, msgs[i].addr, msgs[i].flags, msgs[i].len));
 
 		if (pmsg->flags & I2C_M_RD) {
 			ret = pcf_readbytes(i2c_adap, pmsg->buf, pmsg->len,
-- 
2.43.0


