Return-Path: <linux-i2c+bounces-5942-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF49655EF
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 05:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AF9DB24137
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 03:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D8214E2E9;
	Fri, 30 Aug 2024 03:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQEEquZO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C2414D711;
	Fri, 30 Aug 2024 03:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724989747; cv=none; b=kXL/K99i7zL/aUOLMy4ONSqSjEhJb7E0Cn8r74ZZVQVOig5M29/CuPzOZjfkha8W76yWUHrurC+wrNH2fPL7N5RnDX73qvHNl9K8JApusb+2SxoJvcuMEC+1fq81H6DXsVSnCLCVu67bRq4lD0Qx2C92Yxfcjl2FZlQiou82KqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724989747; c=relaxed/simple;
	bh=1krQh6juKTSEM5ZGVFLEfF8mqP1GdyPTCQ0oYCoLepg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=V4Sllhis9OT8P0MLSeEaX4RiQjJMxgnrlqZQ+mYEuCADr8YB1Js+z5gttJtEaYl9FmiEV2esPx/7D+wS+B9unDAm0Vc5VjNPZ+FML0mRYDcdpe41FN8+xOzj7+pJ25J5OjuLXB/mol6+Qr1rxowK943Jv0FUkyWwHkIuFk+ephU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQEEquZO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-714186ce2f2so1208488b3a.0;
        Thu, 29 Aug 2024 20:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989745; x=1725594545; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cFFhN9HcVpSrQjxOStAWMyvSooZCtuwnj1m4QBUIlEc=;
        b=ZQEEquZO+uRovFaZ+EnG0S+MdsvvQgVFm8opg9g84CUH0uBkziNAxc8PwA51Zwt6kX
         yDlgj7dbWNjbS8C01P7b2dm7Rlsgj4ABmtXD8atygMsjkE3BgH8YdbXVvIq8qQOJ87i/
         MdXMg0qmguxSLqI4wQMi1nHS8KN2MQOWONsll4mB8Gft0zeTRp6GqrunziCXj2tI/6Fi
         vpoWk+X17qJmLqYsebgdOrmsPkKYmA03sJg2LUM7EIn2s+4sXAzHyBouZg85wFLio+k2
         0zOksBvOJ/+HOTyNoHOV2JHMHtElffFNjC5rb1gabh5zkD2MLLUGuF+RE4Rb4ierbcLM
         LXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989745; x=1725594545;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFFhN9HcVpSrQjxOStAWMyvSooZCtuwnj1m4QBUIlEc=;
        b=OepuOjvfpry1PsEI0LZh+nC4FZo/LHn8J/XKUzASdP5FNuD3NNJ5Nzyi9ivsHdV4s0
         4gagSLCrwz24pfcu2XgKmYw8bNSj0L7mWjYI8AEY8JoiE97xufZr4KPNwhFeFs2exL0/
         9XpjGTvlMdXJiH3paj8xDDGGPJWcwZnQxc2KdYPqLSnEdKqD53C5WIrKzWQeUkr6r5l5
         NF/VW2INhm+BPpJdFJ3cmsEW0ZXuQa2fHYAoNWLNet6+vFn1FA/kgGySKui54hIPyTIM
         MZJbw9fg344YqemnUehuVK8IPUcb81lTqo2XWxnB52IYMi3zj3Gz2qEso368qoluL9Sz
         v3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGhFihb5U7Ps64sKtunyUna+YeMukPgtBvJtqJqpUSR9HTPZTqY1MggdleMAfSHVSwEPn0adSrSGE=@vger.kernel.org, AJvYcCXtdzAzvTL1K3vtHg+y5wgvI0Bi8YarNep310rgQNmxPmf3aGwJD4sOhobXqPdj2I7PJDHCZO9Uzi4W9Y/o@vger.kernel.org
X-Gm-Message-State: AOJu0YyfT1WJB/o4hNEhQ8zBCbpVipzZ+iB1Oom567ff5NNHrEB9+uQk
	ZaqTdhMYbthsd/09pH+iO6p+3ZzIour3WtzwtAbNgR7awIEznmo=
X-Google-Smtp-Source: AGHT+IHEpVXKGjF2LZ1pVuYVBlpa86aRvwDx4kouHAiEOcK2KSzv5yMkj9qgS93kkIrDko4JqIg0wA==
X-Received: by 2002:a05:6a20:d046:b0:1c4:944c:41c5 with SMTP id adf61e73a8af0-1cce0fe9b8cmr5467725637.8.1724989745036;
        Thu, 29 Aug 2024 20:49:05 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515544c78sm18342555ad.201.2024.08.29.20.49.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:49:04 -0700 (PDT)
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
Subject: [PATCH v2 4/7] i2c: npcm: Modify timeout evaluation mechanism
Date: Fri, 30 Aug 2024 11:46:37 +0800
Message-Id: <20240830034640.7049-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

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


