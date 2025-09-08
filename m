Return-Path: <linux-i2c+bounces-12775-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A109BB48FC8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 15:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0B711B27D70
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 13:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BFC30B533;
	Mon,  8 Sep 2025 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9y2f+O7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C6E30ACE5;
	Mon,  8 Sep 2025 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757338611; cv=none; b=KDeEtrU1xJHAVoVliAC6YLCfa7IWqaVQr+aaFRso2p5fQCWYNltiWk4gwmnqU+U9lv5F9LkT1NCNC20xXodSj+1wz2wWCEEgN06QwMhD8+GOuVdD3JwsIsIAGV9AnlzGe41TXn020qZSGXAqM2Ni9qJNohUlsOFlYydNpwXQ8ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757338611; c=relaxed/simple;
	bh=5+Tj31I7CHyvgBd8b4bwMUs/tx80sb8VEEdbmFZozUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdX53WeqF7I2zotGVwmGY7/0dR41eLiBvhS3BgUn1FqciwsDfy/0CsRCghM1MukSVqfABjcwynh4MwAlpyKcAgxM8XzKxYG9zzzg8yA5NYHpmS/AK4U/0lp8UVOxuFQ37IO9SPUBad1ZLTgJ1GQBDjzwMeGHadFEye9FwF7DdLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9y2f+O7; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7ae31caso742147766b.3;
        Mon, 08 Sep 2025 06:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757338605; x=1757943405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0HmVCVn9V29v2Ln0dAyk3yPNM86NBiR4xR58nKnGNU=;
        b=B9y2f+O778e51cNqhpff6bAoETbO4I6rp0Oydzy2qQW/0s9f2EYxNcihlVXUhFcs/G
         aCIgnPisFw98riY7tRfLff/3R4inP2XtCvpc1PNz8yGcC7x1eX+zk2/s9gUQAgHUkhGI
         qRHL+u2NFXV3tL376CZAG1qkzp6qwxDIsuebF5kENQRUHNpz6rloP88RigqhllOSCbAW
         DV9AYlfzML6nPlqNIC8xN/Fr2EvDYXyaMRH1BaQO/dBCLkFfsqX/cvRKz5d+xuraO1wo
         nYZdRnfIb139Xp8gsBskEnLn6YFYW5Xoao6Irf1u14Is4aMiG6KTFucpFkbcwSQT/Kiz
         uLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757338605; x=1757943405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0HmVCVn9V29v2Ln0dAyk3yPNM86NBiR4xR58nKnGNU=;
        b=Yn+E3V+8LVLRZtrSHbxPPANTRurVLA1jBMVRGJsvgQzccckhLLRrrldz4+zATBWHR6
         5dGCmDvPuS92POANOXn2rCEMu0sBT/6+z3CT16ZrgjTeccAoS+L0aEVasy3bpBxpmzeC
         PrLZI7eRxWlrWQ7sKZXoefFg1vEfGe6/1yP/+KWafw3kbzLGuCKArMc8lx/q93hVgpCs
         zaPAsvx038DSLVstecyL/UTGomS8oKhqSSB02wxX6jF7zZAtGl4KhzlL4+3DB67Mb+Pi
         waoei6jetQeKwcqz3+N18Mc85d22x+i90uZlaEnmkuvBosb2W7qeVECEDeNaxC377/yf
         NVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnilU2hvoc69/767tpmR9P+497/iTKL3kcr0LYAXVzrORzcn4yEclB2Qs82H6nXidlnayIE2iGzcVz9ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM+lTMn6QrbwvXgxZEzzCfh6BXvpw1qJIJ0SvR8MfV1HPJo3y2
	NSLf0AzNq64X/xBvFv3qYznRVGJGMq2oVL1LoZm44eRVVLsNOYJ2GGE4
X-Gm-Gg: ASbGncuR00SzADQ/ckwHApHbxtkOgaJLkWXObXTdsBxNMumJQdL/jUXGXofbBW7geNT
	qzVAnSZCEY1p3ybk2k5SQrTnw+2Z0Y+MBuG4dhugeLgghF5m6AGXqY2gIndKEiSlnU0h1rrEjQc
	0j9fe52Fge/MRgqzoom3cpOknRQU4/FGQY+lCevLB8w8mNWobopM92GHGmV3G5HQrJAHMwn+n/k
	JeTw2wJcUiiUDST1591fxkyzsHpuDf7E+qRn4Um3RtKZ8xAt67SaP6p72ZbHpDMDWp9dvC2o0jJ
	GtufNdbmnlysV2m+Kr1XVYwTS2MHsjv6PVDsx+WKzxJ6XV7mOVKiUB2zNFM+3aSIK6VMqACtO5f
	IIBIlJFh6l8pknlbmxNkwUw971DFF0IKuLAEvDDVTeIoKix96ai4=
X-Google-Smtp-Source: AGHT+IGQ8hen1Lg5jQ8VCeAZNaqkt650k+E2QqotMH+eeEWBWts67IHBeVRk8X57984gEyxiBNAn7w==
X-Received: by 2002:a17:906:6a0e:b0:b04:2ee1:8ea with SMTP id a640c23a62f3a-b04b1407e95mr834671966b.14.1757338605186;
        Mon, 08 Sep 2025 06:36:45 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040a410817sm2177352266b.101.2025.09.08.06.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:36:44 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v2 1/3] i2c: PCF8584: Fix debug macros defines of if statements
Date: Mon,  8 Sep 2025 16:36:06 +0300
Message-ID: <20250908133608.45773-2-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908133608.45773-1-chiru.cezar.89@gmail.com>
References: <7e155481-b1b7-48db-af64-6a313ade1bbf@web.de>
 <20250908133608.45773-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Macros starting with 'if' should be enclosed by do - while loop.
Revealed by checkpatch.pl.
Change is necessary because by enclosure possible if/else logic
defects are avoided . Also fixed inconsistent macro usage ending
';', which caused build error with the macro defines
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


