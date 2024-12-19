Return-Path: <linux-i2c+bounces-8625-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B649F7804
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 10:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D69D27A1E63
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 09:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E04222562;
	Thu, 19 Dec 2024 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCVm2fgb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FC8221DA4;
	Thu, 19 Dec 2024 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734599351; cv=none; b=HDMX/4tf0gCOS0ia20e/xa+0/D4V5esFerdnTGI9541zz0/c1MCTc/uT8K/koIwpnQopr9Dez0swFSQOKs+z37c73uQ3E6kMjxrB1hvoffs2Q37Im9dCWNnbibtIv99cxh10lH7WQqU1hxWybKF3Hsqx1OZfClqfJfwequNKWjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734599351; c=relaxed/simple;
	bh=XH0Bpt5rg59dfvf3/V7+3t02QN0m79miR/wFz80Nmr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=UXL/2B/vJrpD0Uy4IhxdfzEfL6nTMwxIzGPbEWCDlF0y3Ynpb+vGO2BpoW9cMEZUhLLlK68y7PsbiKfsagaRP5J11L8ZghjmVxCbzqEegBUAZeiE72R0JtDcJ/ARzA3nFlKrRCZ/BFdSdnE99/djt8EAqIP8kYwFtWNnQ2RXKx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCVm2fgb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2167141dfa1so5021895ad.1;
        Thu, 19 Dec 2024 01:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599349; x=1735204149; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=jCVm2fgbt7fArlXYJKJzzgwMlDQniOEliFnvmcYRR5GPiNk3RtsuR3bQVNYyz/wxIr
         jUQAVb3Xt05mfjLCuM6HsyTjl00+IlxTByUphBbd3ymvE2SExxIJPxLb/m0/WaYbbyaW
         e61iIm47nYiwDo6+ImmbudAWdNn/FpcCIKQxQjOXtH/7tKCrVtJraW1ZvYuHADi+n/8p
         /XG6CEHVfa9Rr7QZPdHX+Blbcge+U1FQvzaiLwlV5pmBfvBwwXeaiiq6eNtH+jfv8VdL
         jMd59IuJhbSaR8RLUe+97SP23zxnFcdO4G5t4goYWm+Wx3PSMF5C89PGil5FN7BD0Lxn
         bD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599349; x=1735204149;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUTvgfGYPu+IPYUs2nFsjwTZ63vlpmHE9eVnRYu8l/s=;
        b=NOE/XI/vWrs7e/C6HftQAFssXbsK0AWdiK1Q9dgDtpiYOuMM5hZO1AjhuX3Cga7K9h
         uxVyfaB9NkJT286m66sqjYfdY3z8CFy49erAsZUcEfetp9xZp9S1gJ0EtuFOVUGpQJCu
         s0o/SCi3wPOkRtbvh4TjvPtwOtbtQDi13VULr7nU9l7+T9ZtFyp+csk0SWiar4Hm28K5
         pE6N4VQPeW/vGt6UTk20N2f4mxxtCE+haXi2cytaftgRvpz2TxescKPZz8ycJPL3hWYK
         qFojgidpWMSFnB7HHTeEwAx3RZLWptu546TImNgp/F7yhdX7xdiP7/C4se+7laGHwyop
         mQKA==
X-Forwarded-Encrypted: i=1; AJvYcCVI9nWI3PmBJdhDk8rPQub/T/HpeIdKPGTEtWPmO6E/+fVkB6ZWjoaFcSD4kQyRCdAbobDPmgL8BAg=@vger.kernel.org, AJvYcCXzBIaSw+/mHJJ3NPCrAjG5X5yQSgEzkjNBYOZSFkM4giPKWzeKDLcPgzdqkeH69A5y5RSrNrD+YPFE4KKY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyanh7900d9csST9HlJPHHBLCfFG2c5SjYWXsliXx2B2zbj1ECj
	4+9ZjjW2AhW/Ous4sL3YiMAnZd/oc05fRxn5YabMPUKIMwARMAc=
X-Gm-Gg: ASbGncuF41Ve1ajn/eb/+VRfzYA2bMgLZC4Z2SKP+tvFhcEMbAf6x9y+fOk2xrctzv2
	ge6+RZN/8RVjrXkiXMbQ06jWwNyH4sTlJhSnIczVEWsKI7a99fbJ1wkUXwif2GdYEZl5P5fLECv
	SfbtTFm1ox4++3SUJ/sMqmJo1cOuD03EK0c1dRJL6Dh+NI1aii0CymjdojuFtjBvzFPQHVBn/45
	bg1QkszJ19ynjTMU2HIHkwurROkjvLgdmIuan1e20oSxrRtxcOLIu2wBY2u++Q0U+UinN85Iup4
	1G25HXR9wdItBSvckrs1lJb0Ns3X3czj5bPaZUcFAv+kECMz
X-Google-Smtp-Source: AGHT+IG3ozXV/JZXCvMKLY0p+P+fsSoQftBArX2wWb9Rq3a6/vq1cDweO1cvd0cvjFNqium7LTNmfA==
X-Received: by 2002:a17:902:ef03:b0:215:58be:334e with SMTP id d9443c01a7336-219da5d67f4mr41922355ad.10.1734599348454;
        Thu, 19 Dec 2024 01:09:08 -0800 (PST)
Received: from localhost (2001-b400-e356-b45b-f574-35d0-91d3-527b.emome-ip6.hinet.net. [2001:b400:e356:b45b:f574:35d0:91d3:527b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0194bsm8086265ad.248.2024.12.19.01.09.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2024 01:09:07 -0800 (PST)
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
Subject: [PATCH v8 1/4] i2c: npcm: Modify timeout evaluation mechanism
Date: Thu, 19 Dec 2024 17:08:56 +0800
Message-Id: <20241219090859.18722-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219090859.18722-1-kfting@nuvoton.com>
References: <20241219090859.18722-1-kfting@nuvoton.com>
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


