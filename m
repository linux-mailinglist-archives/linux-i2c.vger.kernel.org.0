Return-Path: <linux-i2c+bounces-7118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C40B98B463
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 074051F209B4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 06:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995301BD4F1;
	Tue,  1 Oct 2024 06:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLigGwt5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0903A1BCA0D;
	Tue,  1 Oct 2024 06:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727764189; cv=none; b=Fx0xrQN0+oXP5RvrXxe/HzHJJ25MqP1I/wfDSJcKk8IrRYI4ecAIDosNBYPzTISPImYMjB+MnmEtm41VS4Aieik3PB5RbFTUvT3/9477i7mXs3d/TpnnlkqlgLb9FQ9GgNeNtZpol6eK3E4spXKAkdtPQc2G00gyQ6hW7bHFnKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727764189; c=relaxed/simple;
	bh=1AUI4uXXdSOLC8A2cHZJloUv1kubbaJnCumBXJIF0qY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ZDZNjx8YX4gxneG26tQ9GRjqvD+/EuSinWMOOwNnOHJ+1kUkG5+23RTh4OZHa6pmaBymYLSq4wA7nPFWO7JMdxXKd/UZmBmaOzsANMQZ6s/4c9ghHeB6BSNgx2g4jngLMi298iB2cSw65W+DkGfFt6ft/IO4IJvw+r059KsBqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLigGwt5; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e06fade5eeso3909510a91.2;
        Mon, 30 Sep 2024 23:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764187; x=1728368987; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oZTR7VWZlUhx2yQtNiZmirEwYuAooSCpN3CWuoP2Uac=;
        b=aLigGwt571PcVvgNsqvbT02+6b2U0dhU2F9DiTDKPyIekFV02Lo3jna/SfVuExHxzN
         2Zat266J+QU4mkyb+nfAlwOM+ipIBmSNhNyCUrHXhOyTHafQuwQxgGD3R2gYimx2D7C5
         7MjXgodfrdk8FYOKoOhWR/yvBpCm49CrVJq4ayHSG1UIGyY6MXaOJzq/WRu3s4+Xw9Oh
         rc5ZezPN2wfzjZ91nvxM6UgtRLYsIcbrR7V1egJe9y1pXivzy/9j6aZQyfq38YZsJVlA
         7xpd+Mwbz2UzBVHDNy+oKk7QnyTJ/ZPdq/B1HMdRw+NRsvWOfEDrXPxUZFWhMQzPKkgG
         fBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764187; x=1728368987;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZTR7VWZlUhx2yQtNiZmirEwYuAooSCpN3CWuoP2Uac=;
        b=k+ed57oa8RZizr6mpAiE9TFh+9owAAudbR2M78hlLdoPAo9Bq5hzIxod3jce0LUSts
         U3G4ROIEsPdLzdnFbCf1P5H0Juj1SNMweui4Z8MWxfhPvvK/w0B7XW3sDmPK/c/PatlO
         60hFQEwLLAWtf67tQhjYMruOX5/di8WbUG0qs10Po2K5kBhTiXAiytlNI/fO0pjJoylC
         Jod3hF4savSRZDZvNmekqJdypnOsac3pq21pUdMcDG9q0btI4XhctpMLMROF4bE7krgB
         3u1clPyrWoZR+7BkexC+qPMWh7cbQEUOSjpUOQL4tiY4Tk58oWqGBULZ1yk9YiAGOYRm
         jGWg==
X-Forwarded-Encrypted: i=1; AJvYcCUK+OOWJUAfoZdtZGpR9Nu4T6XCcwo/4EPCvllOoFibEu9jhHYlSIe07kD0CGMeIc+ayZTzDgTQpFI=@vger.kernel.org, AJvYcCUSkXqmifkaMhCn90Z/LMrURhD2suufIVoyIAPOrFrU7aoDI61ubX24vc50Uywj8w46mz2bip2TWDogXMAU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx95elY8tH8hKqoZaOyxOsNa1gNWcR779DxG8qbfBLsRIzgxjQ6
	GiFHmDDezU/1jk5Y4gGl5ZEcle0sh3Kh7Z8M8OlOVpNOTvU76aM=
X-Google-Smtp-Source: AGHT+IEfyPM2bsYwU45GdSmrXMiZ6q9HsEacf6Me68JtTyniOZIOco8TVIapaymb385TIN8YRuKDAw==
X-Received: by 2002:a17:90a:8c18:b0:2d8:c17b:5018 with SMTP id 98e67ed59e1d1-2e0b89f0613mr17616802a91.11.1727764187176;
        Mon, 30 Sep 2024 23:29:47 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6e29081sm9228277a91.53.2024.09.30.23.29.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:46 -0700 (PDT)
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
Subject: [PATCH v5 3/6] i2c: npcm: Modify timeout evaluation mechanism
Date: Tue,  1 Oct 2024 14:28:52 +0800
Message-Id: <20241001062855.6928-4-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
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
 drivers/i2c/busses/i2c-npcm7xx.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 7620bdcdc235..03d6c8702ecf 100644
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


