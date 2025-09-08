Return-Path: <linux-i2c+bounces-12785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D9CB497C1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 20:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B0603415AE
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 18:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB16314A86;
	Mon,  8 Sep 2025 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zykdy6IS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458FC31329D;
	Mon,  8 Sep 2025 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757354404; cv=none; b=g8oaSVms/ejJfmYE8h4F759+HYJpc9xWYIG6B4BZVbTa9qq5Ey1rEiZA+LIIPlTm+VbKXOqkVnKbWk1OLFtVjaK49xIIwQfiFaJvurX8S3N3FWU9EE1zmWoSyg6tkYKRChoo0aG6gmxH3loPhzIMzKYwppDr8FBjlbeg8tqjaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757354404; c=relaxed/simple;
	bh=kLmU7PnySJjlrWYEOK9K0Vd041chXOxcwIRGUOfFjxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTiW27Krznt9p994QZiDonkBy3/uF0B6ktqfeV7oC66xMEwxq2o551tAUSvoZaf2w1/Efxm9z9CtmnKef2qTMivpzSBqrvM07Co9ufHlSQv+AWMB9VdnDl5VK6Atz4ydCzWMclxezJFfPqEu809nuSoUNCXXgus3YEU8jRCTVrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zykdy6IS; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-628caee5ba2so2262134a12.1;
        Mon, 08 Sep 2025 11:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757354400; x=1757959200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bB0gmaGzRVK2a/rhpRBhMoWc+VsLO+KbeDGysRyoDig=;
        b=Zykdy6ISOehHxSNCcfLXNHgE9uAJJ6dpBJnzv80Qdthxdn3rGCqavHn7UUqiJ+2wjG
         E4Y59NDQYI0AS5d/SjqOtn0//t644TY3q6N/ZP3xsawJls70FWOHWiHY6kuuHJlhWSP9
         pYLvnPwJ1U/wKF0ESVoj7WQs9b/5qvQF0Rm8bWS9X9M0BqC0Fa3RezlWv04Krbe+7piC
         5C5tfq0iPw2eEJPrukSZ7MgqVE0G2G8WKZyqz4pqO7kQQcl8YpxhxQ5Rs+1vA1LKQzdX
         haFNwP9d81OdHte7Q4MxKDmCcIGXXRXue+9P0BDLjbKtun0ujnH1cM1nOAtP+gFit647
         2lrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757354400; x=1757959200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bB0gmaGzRVK2a/rhpRBhMoWc+VsLO+KbeDGysRyoDig=;
        b=PjNx6hj5OLQhWEJ3Hl77Q3GI5alkx4Np3K13pKzf4tMoSUVFWHu1lJIwGH04bLCl/O
         ZnNH8hZkhg6DWWEf8FHdtWnUNr7/h/SJufv+zSwYw5utahcbfQrQz3GYveZEpVKKCGhy
         UC1P4qMbSh/jpjo8NuaFln+kGMTNr/MU2x9R1uGls91mdcCSo0d1q5Q8PgHM/F643D7E
         ScLosDHcjSWlnyUa9T5adzvVbV/33Fp+r0Ds1SxAcvwVsW9JR+knyfCB+QCsxOYdPDP8
         5ChrvEY9P5M4tg7BI1+2kIBfs85Bm5PVEAEKA0ilxUrFhhXyFwDMM3Qx6LUTj+eA3PQp
         fQEw==
X-Forwarded-Encrypted: i=1; AJvYcCUnZNxWUjVReOSt+g7P0H6WqGVW0MJ59BJwQjQNQKerPq9bp/f80tpO9yJsmGUDOKKpq5hyAOgr49dvbx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP2XYaoq/urkKDJHtBb5X6E+ISVazGIvpi2CkAJtjYEHfO/mDp
	ZLoQK2MNim+bWEiHEI0Ub9Aucpwa+TAglbNF6IyAnzJP1MpMENJY/r/Q0IA8EA==
X-Gm-Gg: ASbGnctSdkId8I5ZZbt9LyNgZWrlG4nzkbbQrk16jwFxsMig4rTYDyCYc2Jp+luBB6l
	PotozgCRjAhFJ6/llfueMviG1C4fuF+KpN8tL9WccBOWDlLAjXM8u1soOB5Ez+6BzMpDiwYqB4u
	dhUoEJjrr+BdUSoiJWKGKdWzrSPlVWD2uVr4of8aY5XW8jUlL5EwGCyGcUq2gvPosZ7AakXg5O+
	iz1QJ41xo1RXiYZ0T4K3yATdgWtl4+SrXKg5vQrbv+a8GUOYDrc7jUmph1xfdFR13UgOf5FUcbx
	bgfaueoToX88QqeDgUyfmf2wfgMQWr6A8j4sIRsTEgQ6dZYEsOpzYuQWiWf6OydudRDO6cPUQUC
	JcUPO5gh9obYmUR7NtuTnYcaINBl30Q==
X-Google-Smtp-Source: AGHT+IEH4Qm9AP7+NHeYfdWtK9pBuj2LSPpwn+4k06/SOhpZ+3A1susz/ZhLEwfvy25zFmLYpWXAmA==
X-Received: by 2002:a17:907:1c15:b0:b04:2214:9499 with SMTP id a640c23a62f3a-b04b1dfa8fcmr883911766b.8.1757354400301;
        Mon, 08 Sep 2025 11:00:00 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041565ca98sm2158185966b.86.2025.09.08.10.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:59:59 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v3 1/3] i2c: PCF8584: Fix debug macros defines of if statements
Date: Mon,  8 Sep 2025 20:59:00 +0300
Message-ID: <20250908175902.214066-2-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908175902.214066-1-chiru.cezar.89@gmail.com>
References: <207f485f-df06-43a6-b91d-8153b8922089@web.de>
 <20250908175902.214066-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

macros: Enclose 'if' statements debug macros defines in do - while loops.
Fix inconsistent macro usage ending ';', which caused build errors in some
cases.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>

---

v1->v2: - Removed space between [subsystem] and ':' in subject line.
        - Attempted to change commit message to imperative mood but I
        didn't understood how.
v2->v3: - Formulated again the commit message to be at imperative mood.
        - Wrapped commit message to 75 columns per line.

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


