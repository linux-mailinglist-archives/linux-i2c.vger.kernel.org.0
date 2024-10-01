Return-Path: <linux-i2c+bounces-7119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A954898B466
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6003D1F225A6
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 06:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0B01BDA80;
	Tue,  1 Oct 2024 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnl1Btz6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3371E1BD510;
	Tue,  1 Oct 2024 06:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727764192; cv=none; b=icrsauHlh0bOrDzy53wsrYDJyWVOmUPPUpaRbrE4yfVFQ45gjJtuHynbZ9c/ebCfIaYHYmmMVJHceEIiYDLoXdgY95SBzqUi+/Dc7q5zwlBB4unJ/EiCKq2tyclkOT8UvC+q+28wAfWs8Mvidtg/DkRPi5VJbtVGkCIqmL7mXxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727764192; c=relaxed/simple;
	bh=JK4cHd2S+muHXVItg6eODd/tPfPm+RDywU9zUcKcoic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=EGNS+FLBy7m+ojeh++pKChIC3SP50pzytXisft/11hFvFxyOU/i8p6N9qltp7MSZXZZ6cfx3eKxJSSBtE2ZIR0LjvEA3j+hUwWD2Hj5OIrQAhqKIhc4JGdItWHNhtj62y5Kt6Pme8DZgwwTM6j37h/71fKfLWvAmZ+eW5qzu/do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnl1Btz6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20b90ab6c19so16470445ad.0;
        Mon, 30 Sep 2024 23:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764190; x=1728368990; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sVINhRisx7tHA2uWGJZ1rYfyR16go1Qbe2bSN3dCkJs=;
        b=mnl1Btz6pi5diPkolecnEAeldoAxJWZfBxXjkCrCsF6pqq4NI4SjRC50/cPgIySMtb
         +ZO4bpF+JSiwLqtURAXnAkoosaU1vwvRT56WIhT+vkoLc4UM9DiyLqMJrF0axKLAhny1
         zhK+zWF17pUA53LYFoqL2TrdA8XCxkQgnjnt7A9XXsSKuQoYwXt3Yl01qqP4wzu+P4qg
         S+v+iZqDuxigbzIrdPteH8qKJJO29+c+FkV0LcECyw+LASrdpjFqqeL/DU7XO8w+emdv
         ITEZf4AE3c9mxt+f4ZjBVRTJowc0uzyHvK74Q7DqgqSd39eEQlDpekT1TCG6WxQy+3uv
         f1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764190; x=1728368990;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVINhRisx7tHA2uWGJZ1rYfyR16go1Qbe2bSN3dCkJs=;
        b=TL5V2KxhW//KxCEQXrvlYhpLsCuM+eJMSFOL7GPemLfsljg53avgKbdabgvYu4eOhJ
         kOkU1kosQEBdyEO5ueFk8W+TFz0Ncwuo9KCgFATL46n0Yh/chD0hMy62Ak6K4FXyR04F
         QJjJn75yObJw5lq1CoHk0rshzkYB6JxpB1aDva47OO5EsoPvj24GZsCFglxQ4fLOAJNZ
         utRqIRYrY5utvCzrmje5mPVnaPjgZV89g0fSY01Du/7w34Nv0uH4UjyaC/LKVIGtiy25
         msCc9raTkihCifeBuR9J5hJpFXtD9a43x7/KTNI9up0hD692iuSwJ/gGsj8eUTnP9+HK
         nkyg==
X-Forwarded-Encrypted: i=1; AJvYcCUl66y9xCCU5Rkvgbkt93UGRhjrokvT27M1M/WEE/VkNJAon7S0Hm+kKem36lB8Jk67nnp+k7ur+Tc=@vger.kernel.org, AJvYcCXiv+Rke0wk7Qls7+IXeGf0zyU74LfJVZPaXQbytUypMkKHFyKcilFPJdhN58RNEB7X2DoWXryc8ADl/M4R@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAdRZii5/iWaaxr91kuTZ4LtYfJgyGOWa1l3tNYB2I2SV73VI
	pIv1613g2cU0vP/MowLDd+B6SF5cvuDyzbjLj1AVv3rMmLsr/s5ctp9dCC4=
X-Google-Smtp-Source: AGHT+IGCkLE3x8E2oi3I+0hAAwg49dV46n8uUHwJq3wdp083muDYwMdqM2bQc6gqMV0beAmdPRwTBA==
X-Received: by 2002:a17:903:2305:b0:20b:84cc:5937 with SMTP id d9443c01a7336-20b84cc5f89mr89980095ad.31.1727764190444;
        Mon, 30 Sep 2024 23:29:50 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e5de0asm63596585ad.265.2024.09.30.23.29.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:50 -0700 (PDT)
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
Subject: [PATCH v5 4/6] i2c: npcm: Modify the client address assignment
Date: Tue,  1 Oct 2024 14:28:53 +0800
Message-Id: <20241001062855.6928-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Store the client address earlier since it might get called in
the i2c_recover_bus() logic flow at the early stage of
npcm_i2c_master_xfer().

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 03d6c8702ecf..0ee77e1fbc08 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,19 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Previously, the address was stored w/o left-shift by one bit and
+	 * with that shift in the following call to npcm_i2c_master_start_xmit().
+	 *
+	 * Since there are cases that the i2c_recover_bus() gets called at the
+	 * early stage of npcm_i2c_master_xfer(), the address is stored with
+	 * the shift and used in the i2c_recover_bus().
+	 *
+	 * The address is stored from bit 1 to bit 7 in the register for
+	 * sending the i2c address later so it's left-shifted by 1 bit.
+	 */
+	bus->dest_addr = slave_addr << 1;
+
 	/*
 	 * Check the BER (bus error) state, when ber_state is true, it means that the module
 	 * detects the bus error which is caused by some factor like that the electricity
@@ -2172,7 +2185,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1


