Return-Path: <linux-i2c+bounces-6894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2517997D423
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 12:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73F4FB238B0
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 10:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B8D13D529;
	Fri, 20 Sep 2024 10:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+CzXtAW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D527A13B2B0;
	Fri, 20 Sep 2024 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726827528; cv=none; b=git7WPP1FUIjNc5Iu2wZ7P65EicDb7bpHU+T0D5YnCvgmUwMpxknR9jTSmlGLgFEhOETCj3IXym97iZtkxVdBllBM8HfG6njTCgEGswD7Md+unXn84SEWaffiu5y2NYDOII9jH62NLvRqWUMf/ux9WrA4zEpB5Ai/ecehvMre7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726827528; c=relaxed/simple;
	bh=Ul6x+Spxm/J5BUMskh67v9HqKC0N3fbB+m5zysgr4d4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=QHL18iniixvL7rxqfQBcvjlHAffmnTfMATxnK1iDK7SsYgi3dy5vaL2uE07U12LOLcH3YHOh8Vj0+ddUZUACxOq+BU95XQFoucCkpbJQACPRVSVNgqdjAucZCPpkcj+z86+j/ShYh2AZiLaihZdSz3DwDJcNHBC9XMKKcyeBlqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+CzXtAW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-718e2855479so1366642b3a.1;
        Fri, 20 Sep 2024 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827526; x=1727432326; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZSv8oOEI8/EIuYdQcnCnzx+K0Uspaq3vNp+9LNmgdQ=;
        b=a+CzXtAWr+axL4JqUso53a7T3jujFF3hyFpTQOfMeUXqbGd6ktC4H0kHI+OTxT4xo7
         Fo9zHvcP0jLvdg7fub1zFAJPaaHyYte4g//GeRgi/Q4lvlX3LRNEcB96ufsANDxPQoEz
         SKBmqI6b+v154ZMqWTV6fZaqkhW7RK+WSwNxd65EH5x6iTTFxTsJKE26q6XWrg0Ut0Ep
         rTEUt/iLd9oEmGHtzT1Uh6o97cQsVWi4EN3cLq9rLeb0IXUbc0NZOpuA1yJVdbc2tA0w
         aMWk79PtWcNNjCgQIJb9mUQqgSFdDIU3Z23olIpL5fI6TxGvK6mW3h88gmRSmavMIcJI
         HY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827526; x=1727432326;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZSv8oOEI8/EIuYdQcnCnzx+K0Uspaq3vNp+9LNmgdQ=;
        b=LCGy3g2otV7YwjCv1Z8b/4Muw3e5Mor77ow9bT2aHb2Lg6580SkEjUAgQAmAGoqRtu
         L8O9lY6ksOqwfjxyZ379qiyXeVKWwO3hksIikswBkGXA82PtN9oLDnNfXSvjxzMPzqQB
         zC2hP4Wu6uWQk2uxhaxHktUijMaCvma2K3TBp/zCEA9l2N/OGrHSZQeW/Ws0fDDcxpmU
         a4h1EDjzMptqFtB7Cs7kROoSmPuJ2niNVUATN/vMvB6PSM+6H+ux5S4KUgwO9XlRlu50
         nuYDpV3S7SdMtbgUUbQTW0UmGJwXXvz/j8s+PMG9B3cuzmINkMtYTuuJGfWOT7UsJg8O
         9Byw==
X-Forwarded-Encrypted: i=1; AJvYcCULOtT7t084lvot5zZHUboeP+ea6bz94hMHn8hmwY1lt+D8Uf2lT9WCnTomoiPBDtpmsvwt/LWYuE3e4xV5@vger.kernel.org, AJvYcCV4cDS2zI6msMTVu41bXSo7jAnCCejk5WwvtrQa2pz+TLGd+F73LcXa05A64u/aUcs/pF7YsCN7fqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAbHHQJArCUhn7NcH0aNRO9l3+/O4AsR7Iy/4mROwK8EcE7Y33
	1aof+KvHMsQN2jp4+G//RzHjcqc6yDsGqpsFfit528YUzpTtXSU=
X-Google-Smtp-Source: AGHT+IHSDCa/ky7wcHHV42EjmxrVc3NqFczZgvBBAeriIPMSqpxv8ezg6gAsrGgsDVcTzPcy7dQWKg==
X-Received: by 2002:a05:6a00:1956:b0:719:7475:f07e with SMTP id d2e1a72fcca58-7199cd7abe1mr3335249b3a.4.1726827525919;
        Fri, 20 Sep 2024 03:18:45 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944ab50cbsm9550284b3a.53.2024.09.20.03.18.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:45 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] i2c: npcm: Modify timeout evaluation mechanism
Date: Fri, 20 Sep 2024 18:18:17 +0800
Message-Id: <20240920101820.44850-4-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240920101820.44850-1-kfting@nuvoton.com>
References: <20240920101820.44850-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

From: Tyrone Ting <kfting@nuvoton.com>

The users want to connect a lot of masters on the same bus.
This timeout is used to determine the time it takes to take bus ownership.
The transactions are very long, so waiting 35ms is not enough.

Increase the timeout and treat it as the total timeout, including retries.
The total timeout is 2 seconds now.

The i2c core layer will have chances to retry to call the i2c driver
transfer function if the i2c driver reports that the bus is busy and
returns EAGAIN.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2d034503d8bc..68f3d47323ab 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2132,19 +2132,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
@@ -2183,6 +2176,14 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
 
@@ -2308,7 +2309,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
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


