Return-Path: <linux-i2c+bounces-12768-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C130CB48BE5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 13:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFFBB1B270A0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 11:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CB3302CA5;
	Mon,  8 Sep 2025 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGe4rHX6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41B2FB086;
	Mon,  8 Sep 2025 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757330077; cv=none; b=UPhsDaElRFVT/FZU3CBIirCngA2dO0cZFobRxdH4/HwGzaY8lW0ztkYYAnUX+bF7MS+BG3Ber2afaEimm+4Z0CpUZgqxMPaAxL93FXY3r/eUw8fKmcltHIjlN8p3qBA8cm9xl+j6BQ1/Gy9PufbFOeto0/Ae+93Awe6yMOOg9VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757330077; c=relaxed/simple;
	bh=zwJ8JDEORxaEloNkd2011Tl41jMGzKOxBviSW5BKmUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOOeTkMfuVdAxWv+w6m063lLyRnAtk4E8I+KIupxzcmwltp6Y2pisGFTtjSPK0CDMv2GpoWCgAUsYAVZEVDlqfRBG1eb7XQqnVlxUQrivYUZrF+uFOQKtZGWkafcXuq3LZ0XUnJjyepF5fUeVA/U5Mu4dAEnhwzb2KWvD+8RNVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGe4rHX6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b0428b537e5so692967966b.3;
        Mon, 08 Sep 2025 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757330074; x=1757934874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdek4x6pVHM+wAcANZi2JUDszGyqCUsdSgJyjHlowQw=;
        b=FGe4rHX6EbiOeoxjFlKkpjDiv9tJR1RTBPuBsvp4/NGzJnfHEQJSu33M7AvHoyKCde
         Darr/8sYeZEZLVe0o2TMtJP3rfnaZXG8rqG3IJMXKcqmLlu6bBjaAP0nx4SpmUMITWez
         p3+O3qraSU9t+Fi8Z9DWUEhY4xXao9x3qf0nnNjLyVezox/w4TL7tuszuS1wSuZaK56r
         ssIMM0Tq3d4viEKFnbZsV14mGqP1g03HNRo0vo2/0mKSAMjfiZuhS3FtSPQqh72ZP+nU
         cCNA0QMb7obK4MmMRXRsBAmOG/TTRHoct+heb/Cu94uD9XTaO0X0Mxe47yYdH6okkXRK
         po1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757330074; x=1757934874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdek4x6pVHM+wAcANZi2JUDszGyqCUsdSgJyjHlowQw=;
        b=Mr109SgX/o5F+wtSC0xv86eJMRP913vRCbP+hNKB9ueQLgOIQJ47XFziKwG46I2Fsw
         VgO1kk7cSPceq8EJGOLVAEUwrc34M4yYjvRudNzJSbiFuOdo0rdF/8ZRU7qw2vBcA0Yb
         UC4c24dDmMnipiFCVkri4PactuionMyFSwOTzDO3N19+3Xldxeo7AKdeEJH/tRNeUm1R
         dT/fK3cla97xfToreHCH4wswjqc7Hw28ReOZpJdNRI090xNdNkOr9K5I3xejlbSmeMj9
         JZpRiKgEy+2+uc8LfhWiclvSR60d+xVmQ+kVXKtWwcHI1NEMnjUIM9fX+GEKybajZGLN
         dvUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWropMKkaLN16NaFEuo7uyzsANhlxjojUSxpXx9gfWLi7XBzfDxlnmpJDYitX+SOMAy0vcgOz/HGZzSc8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx21fY6OYqqMdzc5Gcgw/E4ydSQx444mKQwJe8lj7mot8h0qDqM
	zwYYcoQOuO3TzVNZTQxntvytXBW+Y8xtPLTob4YLeTtnrH6WTesdqcqn
X-Gm-Gg: ASbGncsc8s2KxyotA9d+wZOIhr/GWjldJ3EPgwRs2xFZzJ0uWYS0/0bwNS+eyl8qFoX
	VLBiUpEYhS0OQtdplRyxgoFcJv1SM96kZgHLrBQVtQx7Rnj2kM4xULGuVGcI3VUu7ikGTggyTSE
	3lv55yiHEKg8Vx35IP5AgB0GBRcNOVmV6jHpbEr+PxXlfLpFGFWmYpLminozW9GBBqLyqbHj1ip
	l4wcEzBgZKG8Cduxde7QbLGIBXmKC8I4wMB2vdYNmOEk17O5HNK7LiVwXGVh0vYHF0m5d8iiYbC
	YKxDy1ekA+GMdlq58Vu0K03FplnnH0FUF7OIOPfoQJqAscOhHyEStPMI/kJkA3PBAADMGk+XST5
	GuPlkBfsveSNncON69U38+F32l3JWci+750l4Z5as
X-Google-Smtp-Source: AGHT+IHi+tpNbXt9zkMG3Oh7LI3UtY4qbqzf0/c4YuJoJ6HywSF4OLWjuxs2AwUAb0EpClbwCz9nYw==
X-Received: by 2002:a17:907:3f94:b0:afe:63ec:6938 with SMTP id a640c23a62f3a-b04b13cc99dmr759164066b.7.1757330073868;
        Mon, 08 Sep 2025 04:14:33 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0470f11088sm1211333966b.111.2025.09.08.04.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 04:14:33 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH 1/3] i2c : pcf8584 : Fix debug macros defines of if statements
Date: Mon,  8 Sep 2025 14:13:53 +0300
Message-ID: <20250908111355.79222-2-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908111355.79222-1-chiru.cezar.89@gmail.com>
References: <adb7d136-eba4-4ed2-b893-4f7c43f8d678@web.de>
 <20250908111355.79222-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The issue was that macros starting with 'if' should be enclosed by
do - while loop. Revealed by checkpatch.pl.
The patch fixes this and is necessary because by enclosure possible
if/else logic defects are avoided . Also fixed inconsistent macro
usage ending ';', which caused build error with the macro defines
enclosure in some cases.

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


