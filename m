Return-Path: <linux-i2c+bounces-6689-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86067977D17
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBA0CB25452
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B251D935C;
	Fri, 13 Sep 2024 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpo2vmxC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63611D9340;
	Fri, 13 Sep 2024 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726222508; cv=none; b=APlUPsgxGSx74Ba9nIh9RiUG4PMHJHL+TdOwEoKIGV6mSIGgykyRgsN0xqSJGCDS43PpmIufEqKEcgeaWt6uHJyUAKNaul/2QBDAWTtpcBTmB1TJiyDfM7yKj8ks4cumLKlLW6y+MhOp0ERKITshbSk48/il3xwDV55BiLwqm/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726222508; c=relaxed/simple;
	bh=GoH6lcoqXqLCu8GT9wCfFWkRdmwD3E3pTXV84LMArU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=TH5x0xw6cpItbszLM+qhUuyPpF4powA1ijT0k3kUJXXZfoTuQwbEb19qsiIqBDHPN8ovtu90MwSOMBf5fkZbMjLOZz7paWsOTJbCVaSiq0+luiXG3YlB7yx/UV8di6LLwQlZ5KS2il0w3H1PyXNHH7SX5+QwYfbqEP6eR2gK7Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpo2vmxC; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-717911ef035so1331098b3a.3;
        Fri, 13 Sep 2024 03:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222506; x=1726827306; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lNWH+DWa3eDq8AH3LvUTVIxzt2zHamk6bE/zjqY3t4=;
        b=hpo2vmxCxe4E6Gf8tNLuOeyrA3d6cWOsaxLLxtDLOFwDZR9qr4ECnFH+o/YKH6XY6C
         VCYIxEZO49UqlfMZ0xjaXA3uBfS/a6VAC80gEO6sAnVpY6+fWPj4KHuZWKoXXSHGz1gm
         W/RXGl4KBE6QypDNDR0rMLyJDjdnZx/2zrQoV0h2eA9uMQAhe8WDwsiP88IYG7+dX64o
         LnJMPOh+suYRyUPtMiFlKShJwJgyJCLubuP7ukmzsYdQdzxwag+aQ/q7iO0qZ/7qZOQ5
         rofLGA2GMwXxo/R/jVyBjWEzFUIR3CnrSluJ1YGXzOnqP2//NUf9OW/2Jki2qEfoN3B1
         THLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222506; x=1726827306;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lNWH+DWa3eDq8AH3LvUTVIxzt2zHamk6bE/zjqY3t4=;
        b=Xorwrq7gafbm7sL1rqb//vF0dAJPyw70nGg+I06kjuMc+FWHm/L5Y6Mi0FlYZSslpO
         ajLrrEEUSEpvnnjT6bh+6bAz7t7a8W5UT5eeoZvLVwSM5+tzfiXOcBuFSHwLKP0Qi+Gx
         /AsNV9gurlmBZoZZrQgRNI7ay0HrdBag41oHtR/VIjRYiKuVE3P4Qo2sfwOiZzORFYGI
         VbTqW5sv2+VNOlllP4uq0ro4QD9Hv5JUv5DfEsKgTci6V/RNxskQpvVXOKNazZZ0FZ5x
         iszjScYCIIf1UE3yXyyaYGlpLv6dpAUeUIBRm1RJ03Ko5/W//YyV2sLi0zoaWR6Tiub6
         vJxw==
X-Forwarded-Encrypted: i=1; AJvYcCUdI1M93yOiO1xD8i7eDbc2J58zOVxRb8ZyvNQgULxbSuxRLu6ER19AcEFMnhNpEepGCy+pGPr4A/i3log0@vger.kernel.org, AJvYcCXTVU1aEW0eGGdQy9s05Kgjh7MNAHv6Lyehrvy0d6I61vWWZJ6Axk4hDIas4oaD/YQERrL0dB8ZTIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCaBzdAF+O1j6Auy7q7lOYBresThG4ALgADDMHAwQ0bVxX6Y8
	/UR9HqYOP0+TK3Q3BmrxZYRypjD3Sx6xiEDuvdrcHhjUpFMXabQ=
X-Google-Smtp-Source: AGHT+IFkQIjgXHiTd94AxNDF3ip5YtwQx/bfdofzs4R3oG35nn/iGiGqXD6Kv+age9FTZZNr2xySig==
X-Received: by 2002:a05:6a00:139d:b0:714:28eb:ff5d with SMTP id d2e1a72fcca58-7192606bc67mr9246021b3a.8.1726222505742;
        Fri, 13 Sep 2024 03:15:05 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm6008428b3a.93.2024.09.13.03.15.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:15:05 -0700 (PDT)
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
Subject: [PATCH v3 3/6] i2c: npcm: Modify timeout evaluation mechanism
Date: Fri, 13 Sep 2024 18:14:43 +0800
Message-Id: <20240913101445.16513-4-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240913101445.16513-1-kfting@nuvoton.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

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


