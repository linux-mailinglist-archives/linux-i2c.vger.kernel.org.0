Return-Path: <linux-i2c+bounces-7485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E699A5A4F
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 08:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CE4B1C20F41
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 06:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C581CF287;
	Mon, 21 Oct 2024 06:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJmMfLAJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E251F194AEC;
	Mon, 21 Oct 2024 06:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492068; cv=none; b=dA8+RQCxKv27nB2G8GwGPcnzm9v0AkxCh1EuEGj6j81mTOO9bsI0SYMwsFDyp2e7Fv5fFhFyTv7r/MvQjqS3KjJaaayu5dQshSTzo/2eflx2qCvIBrKMx+n56JEFz7G0wT1z5JzEucfZANtIhx8ZQvX/CuBNee/fFTqwxYlmZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492068; c=relaxed/simple;
	bh=XH0Bpt5rg59dfvf3/V7+3t02QN0m79miR/wFz80Nmr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=kDLtEjBDAmi3Ks9WiBuwMZzyduRnAU8qCguW6/3KX2QIqN9c3hi4q3DWBiynDuQrT5vgTaoAuuJh9hCgRGwOlUWTKP/oPIukbmOz9sruqfqcqtY0gy3mweRTS0vQQ4onnBjW2UAqXyLCv52UzrC1TlPqpQhUpLCtMDZC/f68s8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJmMfLAJ; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7180c7a4e02so1973853a34.0;
        Sun, 20 Oct 2024 23:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729492066; x=1730096866; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=TJmMfLAJTP+CETll0qs3o77OWH9/pBc2strOFTxE0S3JzcVtKlzigl8Spo9q7xS6zg
         ATSad3YbMgu/VqrOq+/1qFOwqQvEXI+pudMv5lr3h3UH/aOfNAY9TIuVlRl5bBiCDHDF
         JVGLvMCMShyvroPOT2wVTIn4TyqYAhn/Wowg+vr7CsoQ+xhH9gY1Gevp/zyl5NjHcyFh
         JjRH7QqH62oVMw1LQM26QJWNQRTOc1L58/4F3YsdC2p5wZ6jzEVB26TNT2G4oYyKEUXH
         NsnUIJbVYdjtiuSo1+R1DRtkuJ6lJg6q7PL4U8MEjyQ0B9WiB9o1HrZCWKTfFCtj4PfF
         IepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729492066; x=1730096866;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=sYObndIhszjX666TmJ4HrCa0YQMGqy/KjHk6esGhTSWH9sWZEO2IQ2H9upxPo1k7hU
         ncPTHPXfZkBv/Afp+LZiH8KxcX5IRTH7U9D+6GCtOxpuaM+5tAHifIWp8NX2B2x6w9d0
         +5rOb8CvnNLV57i7PJkpdoFNkCnouEdmX8E/urDH9HfYV2RcoQ/MuhgiDkokwHwSXG+I
         lJ+z7zg27UEpbn09R10zmp3ovmCyW/8DSI776MjyxwQQBFeMBBLJqBYCgIdOM5YNiB/r
         EXG6Dv5ffCDiiuD9d0ypm9+CYqCm74PMEpxBHa53DRzMo/rMjKskMBuBpyfpgj8W3hbK
         ZPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr3yWHk9LfroMWupKFe2ttFa7usrD2cs//yhB7pONhjBTVELlGKz3iPcPSPKXRZhKQVeYBE2SdTWk=@vger.kernel.org, AJvYcCXuZgt+amf27aToVDKoZwYXLq+zW/NbWrMnq0Mimlquw6+j4pvYhQK6wV68TCzmi75JLECGRgMVCe4dkw1Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyBnss2Gp9E1f558HHG9nrp8Kqins/c9zDcfyG3JbxUGiWBPdkp
	6jNsmq4GvfXDReKh8vwJL3EddeU4RjvEfRy4opzCZ77PnMtAiJU=
X-Google-Smtp-Source: AGHT+IHXFpGt4iiRUIlGVH5w+pBnrMBboGpG2Ymd4qdxmuGSF5e5EeGMAmpyycMQlxG1eWqKT1viLA==
X-Received: by 2002:a05:6870:b015:b0:27b:55af:ca2b with SMTP id 586e51a60fabf-2892c2fb8ebmr7399401fac.11.1729492065808;
        Sun, 20 Oct 2024 23:27:45 -0700 (PDT)
Received: from localhost (2001-b400-e38e-c9a7-dd38-775c-4093-c057.emome-ip6.hinet.net. [2001:b400:e38e:c9a7:dd38:775c:4093:c057])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13139a9sm2169152b3a.12.2024.10.20.23.27.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 23:27:45 -0700 (PDT)
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
Subject: [PATCH v7 1/4] i2c: npcm: Modify timeout evaluation mechanism
Date: Mon, 21 Oct 2024 14:27:29 +0800
Message-Id: <20241021062732.5592-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021062732.5592-1-kfting@nuvoton.com>
References: <20241021062732.5592-1-kfting@nuvoton.com>
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


