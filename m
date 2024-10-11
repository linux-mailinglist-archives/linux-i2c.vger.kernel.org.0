Return-Path: <linux-i2c+bounces-7329-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 977BA999C49
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 07:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42F871F24284
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 05:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC4B1F4705;
	Fri, 11 Oct 2024 05:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOFxFTv2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D7F1EABA2;
	Fri, 11 Oct 2024 05:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728625965; cv=none; b=X9PCRHVDDAVTPQvRv5tn7G514ChHA735eP/e04SZ8PyGePigr58L82wAdhAcjrDk6AVuYSRCfxgFBukZkyIEbT/LziNTv6xB7f5zbbEtceEzHT8IuChHvCxJ8xFX37MxD4PoD6fcnJVszSN6lnfGgPoAc0eRqyv+NIhtoHQvXXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728625965; c=relaxed/simple;
	bh=XH0Bpt5rg59dfvf3/V7+3t02QN0m79miR/wFz80Nmr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ya1nD6DntgkNU4QDyhn6Kj9VEdxqYC5iG8mOp/m0xfjJhZhGyV5XEVIRS0Ow7pf7tUeHNH8Aps2o+UDqlnA/gUB8HPiPBFdm+TMKwwjZEJP7KcnytwFJFUXLzrUYfqMw1vVLLVBeCdXPSeEFFyaJK7FEwDwzZeDOcx0LETKta6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOFxFTv2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so53973b3a.0;
        Thu, 10 Oct 2024 22:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728625963; x=1729230763; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=iOFxFTv2+FnLsdKxca7oQGW/8P4DZBJrk10j/vydvQ2z9kSg1ZHBz+/G05EQsiOxb1
         4Ew2M4p1FaCH7bNqy/+6BmyVZhjvdtqwEVucL4pFMH3dDfyxtJ9EmWSDO0hrQ1dwVrEG
         mdr/F4e3XlZza/6m5roWq8fgcjhO0XxyU0Iaq0KXC//CK5dcBu57lfvFPxVaZmzIMkbf
         48zCYLJNXMEVm3H4MeIsZgXNVPUO9ylTarg1SvUdrfBeArc4IguXo/b2FcMIdBcN0ZTC
         K/kXFjuXVD7tqC6OP1fW5kIm9fmwbM6p7HcdoO4ug7MYgF8Kcamf1OmaG6J5sSRjjJU7
         4ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728625963; x=1729230763;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=c2+RGOLtqN3dTvl1yL7HzjSDoRgS/uSqHeVoyq6yRYE9VhaaCYTKgYHTsX7buiLe7r
         ayWa2fKDzAjZSZpvEuVM/b5fhAbuNNvhKXy042GLw8tZDzeAwuo0CxPn4N0fdej4xr5x
         KxpEItGvKeY8kas7ppfaYnmDAU3Xhs4rAY6IRRKfRUPIq1pV7kKO9SI9KE4aOf9Z8sKR
         HunizlFd22OkQcfR2pjKQXAyfOYDWrlE15VeS5SCo7+kQP1CbAPh6rPOFwGHVSYXx/tT
         Kz0NRGcnYJZ1X5Yh+C2WeL9lXD97ROM5/gbevsh+MKozJgDl6g8uzLwxSao9PmDciyCO
         3slw==
X-Forwarded-Encrypted: i=1; AJvYcCVv6mMsoGRlWx+CRPvKZr35UKFBvPnjbN703KuTlBEfwzwIsNqoeLhwj80ijO7v85Zu9Fwl4upSEbQ=@vger.kernel.org, AJvYcCX1F+5rx6KdXa0c3sSNxcgIezSNk6So83xEmUJdL22FzINSwJ/Yx2J80nXIinygjuD1hBtlzNf246MR2sOi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtr0oWaYfRGGeC/cJtMmY1BCQz3a9NiDbe+9nwaNBjXICdhjGA
	p5lY6c31ZIWMdJuyU3yzrK4490RbfC8WcDyzJFMORxEvwBpi7/4=
X-Google-Smtp-Source: AGHT+IFUResKRCt/Fii5kWLbwdloA/fVaIaBv1jKqdZe/ZzANW3Qrd8tnYf+Z9klWGEAE9MrDIuY4w==
X-Received: by 2002:a05:6a00:13a6:b0:71e:5de:ad6d with SMTP id d2e1a72fcca58-71e38095deamr2504286b3a.24.1728625963465;
        Thu, 10 Oct 2024 22:52:43 -0700 (PDT)
Received: from localhost (2001-b400-e38a-6880-f424-8486-7476-9f9d.emome-ip6.hinet.net. [2001:b400:e38a:6880:f424:8486:7476:9f9d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2aa93876sm1946980b3a.114.2024.10.10.22.52.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 22:52:43 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
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
Subject: [PATCH v6 1/4] i2c: npcm: Modify timeout evaluation mechanism
Date: Fri, 11 Oct 2024 13:52:28 +0800
Message-Id: <20241011055231.9826-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241011055231.9826-1-kfting@nuvoton.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
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
returns -EAGAIN.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 482a0074d448..c96a25d37c14 100644
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
@@ -2192,6 +2185,14 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
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
 
@@ -2317,7 +2318,12 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	adap = &bus->adap;
 	adap->owner = THIS_MODULE;
 	adap->retries = 3;
-	adap->timeout = msecs_to_jiffies(35);
+	/*
+	 * The users want to connect a lot of masters on the same bus.
+	 * This timeout is used to determine the time it takes to take bus ownership.
+	 * The transactions are very long, so waiting 35ms is not enough.
+	 */
+	adap->timeout = 2 * HZ;
 	adap->algo = &npcm_i2c_algo;
 	adap->quirks = &npcm_i2c_quirks;
 	adap->algo_data = bus;
-- 
2.34.1


