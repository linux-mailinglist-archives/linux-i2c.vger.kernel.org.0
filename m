Return-Path: <linux-i2c+bounces-5187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B2094A4F0
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 12:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4195F282D7E
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 10:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501441D2F4E;
	Wed,  7 Aug 2024 10:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkJ/nDJM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6CA1D1738;
	Wed,  7 Aug 2024 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723025022; cv=none; b=XYeY0k5i3PJ7UhyWBR8d1uvGrb2GPWWxlA4iJLgqtdTkAUpfbvSlSw6tjd8xRWMkSvsmHoqYMzJYn7cznvxzij76AG7fBVLhqjw87dT9+6IqOw7L4GUvykDhiNrLquaxLpKGbhSeYLzIvF4ND/3gnwz7nVZI8MET8SNoaffQAB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723025022; c=relaxed/simple;
	bh=pZxnysnWKRpNTQwY7+U2EXm4FHifuk92eXMm13+bTF4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=UCiXy6nny1kxi15iY9nml9L3gm17Q8ZYvG+mFlezrfyEQ2mmYgwcKOE8opgUxF5yhGfhptI5r/QLCcDAWYtPVX97Ay5fPrGkpFD7ZDBRXg0lRcM+1byBfV5wsCoeVFnvkwtzIIz1diTw4cxrXuWdSdy90wldDdDiqqnG6eH4P8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkJ/nDJM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fda7fa60a9so14116615ad.3;
        Wed, 07 Aug 2024 03:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723025020; x=1723629820; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L6yyg1kIMG7SVeWDWABjZdm83++6QaBLVs76T+TLdz8=;
        b=kkJ/nDJM4tt+2sCbe7feM+h9s6AymkRXYZDKvtsa0rd7WjVb/Db9DAh2AvLbiEyHmP
         kNgnLiTgFJkXsHM3Mw8K+1gvPKhFikzDbg1vXtzpK0/UN8wv5d/bKxZ6cyenB08F1mUV
         ZRMxnUg9895d7gsptS6juRFOcli59ZrAPgJFBWBUApmJZqXj0LqG5whxXlndF205mq/C
         29LS3B44DDopmOeRo3LAoqVDTXtz2KKbr+jMbi+LOm3gUFuSfbRcV10wxjxf9dvYDOv+
         97TnwLXUBBilMfgnp9bbfo6hvsV9dbQRdmIo2PZWLcMfrRx3Y93RrMu4pKTV5IZ1gNph
         tQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723025020; x=1723629820;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6yyg1kIMG7SVeWDWABjZdm83++6QaBLVs76T+TLdz8=;
        b=Ji6PesMdsF+yXC58x/X99aBuP/5CHyUuTPnZF5iCJlceYGaG+//dRUCgSJfo5+JOxp
         yeKTz1A0h3UnRdOg+rWUsHdtgyssrldn43JhGRxrsVOP05AhJmDXy0DU3vw2oZgqx9IM
         KOQs3Dbxv9LM+xtsa4lKUJWesMysMvCWEBUlj/4MM/r2EiBFEzVtEC5/RUHdmLttMtbr
         7HZnfEaux8qW48wW8tqyNMvD7LdJu4pWFW+rrsN5C66lsAF3hKYev2QyLRSU9O4VW1eJ
         472IGQj+nESaJLCaKBKvk83zoygs/KHLTzonyXsrnDs8RosN682sVEDR+MM9ruAoz5bo
         LS3A==
X-Forwarded-Encrypted: i=1; AJvYcCUpZXHLULK8MarQ1j9/9qmwn7kGICo4IA6FAitPT+qJMb6vqbcYwr9Tgk9o8azufY0iLZJRNK5j93vfiklES9GtnelFsqgzjNGOVpXF
X-Gm-Message-State: AOJu0YxioGXD+iYafLoaFtuQVwfxGouEEwPQOPbyPczEWTQkfNtuVffd
	kJFgA8O7R7u6o/0xpZH5QEgwI+sl1vsuo4a8pbzsffbkCcakMlY=
X-Google-Smtp-Source: AGHT+IFE859a4z6aYQ+kKCDEwzwC899q7prVUXzLyaJijagUlplWhlLfQPtUbWQOx/7W4elpJ2Cpww==
X-Received: by 2002:a17:902:dac1:b0:1fc:2ee3:d46f with SMTP id d9443c01a7336-1ff5725106amr236748365ad.11.1723025019906;
        Wed, 07 Aug 2024 03:03:39 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff591750fesm102297885ad.191.2024.08.07.03.03.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:03:39 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com,
	kwliu@nuvoton.com,
	jjliu0@nuvoton.com,
	kfting@nuvoton.com,
	warp5tw@gmail.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1 3/7] i2c: npcm: Modify timeout evaluation mechanism
Date: Wed,  7 Aug 2024 18:02:40 +0800
Message-Id: <20240807100244.16872-4-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807100244.16872-1-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Increase the timeout and treat it as the total timeout, including retries.
The total timeout is 2 seconds now.

The i2c core layer will have chances to retry to call the i2c driver
transfer function if the i2c driver reports that the bus is busy and
returns EAGAIN.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index bd444ff83a8c..d115ac659900 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2130,19 +2130,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	/*
-	 * Adaptive TimeOut: estimated time in usec + 100% margin:
-	 * 2: double the timeout for clock stretching case
-	 * 9: bits per transaction (including the ack/nack)
-	 */
-	timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
-	timeout = max_t(unsigned long, bus->adap.timeout, usecs_to_jiffies(timeout_usec));
 	if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
 		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
 		return -EINVAL;
 	}
 
-	time_left = jiffies + timeout + 1;
+	time_left = jiffies + bus->adap.timeout / bus->adap.retries + 1;
 	do {
 		/*
 		 * we must clear slave address immediately when the bus is not
@@ -2181,6 +2174,14 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
 				       write_data, read_data, read_PEC,
 				       read_block)) {
+		/*
+		 * Adaptive TimeOut: estimated time in usec + 100% margin:
+		 * 2: double the timeout for clock stretching case
+		 * 9: bits per transaction (including the ack/nack)
+		 */
+		timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
+		timeout = max_t(unsigned long, bus->adap.timeout / bus->adap.retries,
+				usecs_to_jiffies(timeout_usec));
 		time_left = wait_for_completion_timeout(&bus->cmd_complete,
 							timeout);
 
@@ -2306,7 +2307,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	adap = &bus->adap;
 	adap->owner = THIS_MODULE;
 	adap->retries = 3;
-	adap->timeout = msecs_to_jiffies(35);
+	adap->timeout = 2 * HZ;
 	adap->algo = &npcm_i2c_algo;
 	adap->quirks = &npcm_i2c_quirks;
 	adap->algo_data = bus;
-- 
2.34.1


