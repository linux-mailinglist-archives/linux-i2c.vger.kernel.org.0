Return-Path: <linux-i2c+bounces-6895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5597D426
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 12:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F2571F25257
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 10:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ACC14EC64;
	Fri, 20 Sep 2024 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdPzlCBL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E2214E2E1;
	Fri, 20 Sep 2024 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726827532; cv=none; b=GPTC7wsZUPHuuQcIwlcPh3gtNv4A1Ssw0aKtOP6j3F2fP9N2+HMFu8oCYzQKUBA/SaD3hJ1f/WzRVsSwWI278VtTMsmBpg2Dp2Tb2dY8Lk45Dgypju2xA6jgqxtJIc3LB4ySJ4E+UuT5foy/CSuj598te4JUThgAGxIPBba3+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726827532; c=relaxed/simple;
	bh=7kive0qkjdyFwez2JrdykzAXBDAI298fkcuv8OPhE64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=K7XrvJZj/CUXjHZWmni3NahjwyP07dBW5QdVwZKedpG9nDaRY1ruB6/kHxq6sBFE6quW5NE1YND21zNhc5POVZGtnn+QUL3NcTn4ieWPcwWt/6fs6TfhbzlCUlMRB7oK7XdsMb9v5vgevE1ckgcnHMLhdUnVhIJkdOsrn21uLkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdPzlCBL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-70b2421471aso1204162a12.0;
        Fri, 20 Sep 2024 03:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827531; x=1727432331; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0BORBW6QOc0S5wwx7/xMWlE8WZqalSOuRW0pFDdCkk=;
        b=GdPzlCBLm/xvDGjgiymjmvc1dxv7+MTnQDOYzGcNa6AnbXWwE8er82sN+DJ2XbuvQA
         QdRkopaXZ9JgDvqOb7cFJfAya6h5al6tzPZaBdBNtmZuf9c+Jrz1PHYSJl/s4NKPfYte
         EFyS2IWcEjsZGMeXSicWJzAQwVnfvfFvUKPD3fRmbfhQporeHIbovnfGHISdGS5MeekN
         3irAmh7QAH8ZlQvnIR5KTQ1SDgoDCeQx1iaLyOMdaIJUtBX/kBh8SuZka2JdZEO4ZY4f
         Bh41Haw3qF71yVmumAIBYXaU4nq1tS9luQDmpThG17sBLpqE1W4kM32hKTPf60xE7wtU
         fgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827531; x=1727432331;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0BORBW6QOc0S5wwx7/xMWlE8WZqalSOuRW0pFDdCkk=;
        b=R/WObPoL8NvkZSskjO9A32vOFQlD92CftO3q5bfGqLK30+6isRAcKIkIhdgq1bTYce
         1VOMm3ZMURn3WDP51Uw2ujJjxo6xPmWCBTDUxtXyGB2cYyVWvZTnLTWSJUaLMoFIPPbi
         swjHwZubOccGS3fil/Z3Wcn8Y/Zy96HGAP+AzN4lhJ+52YkQXTuNfAHZ0mdLvzuj4/gc
         FDux7nTZE0UFdyKlo8sh/Z+FRLAaEG4G8UQjZmli0tpNpNPlAxGiPe8P/IcxIt9fbwuQ
         YGG+Vgu6XVeDPDzNMT894azaLsy8kArcT4LmpVLL5D8irTuECUJeRom3RY2U/ffZcMgL
         2wAw==
X-Forwarded-Encrypted: i=1; AJvYcCUmWfpWPaB1VEdboJavNPoi46CAR06P/M/4XXff/iGsKI6AV/fmwVDEPlCb5QjKf4kBdJM7sXx34e6J0sSb@vger.kernel.org, AJvYcCVlTCFuuvOTIPQBKKhAOtw9MNBVbqti9NH34gDhIoz6y9GjToBcC9C4aJgbilKsD5DQpQQTlcEScls=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlIOQ9VURdUyNM0c4rBJ2J/hVEkXx1UwuaCeZxygUuPBQp2NW0
	3j1kxFK9LHPLoNNjGjyBFaGgKg+81YP/z5+sazkrUsyGp/hxhN4=
X-Google-Smtp-Source: AGHT+IG4FpRxofnrPdGJ9W7cgP0YW7D7iB+Tp3jNOdzdQP8ud98xgyHONsXPA7bEu1klbUawA9o4yQ==
X-Received: by 2002:a05:6a21:30cc:b0:1d0:7df2:cf39 with SMTP id adf61e73a8af0-1d30a8bbfa8mr3321659637.7.1726827530660;
        Fri, 20 Sep 2024 03:18:50 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b9a144sm9846698b3a.178.2024.09.20.03.18.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:49 -0700 (PDT)
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
Subject: [PATCH v4 4/6] i2c: npcm: Modify the client address assignment
Date: Fri, 20 Sep 2024 18:18:18 +0800
Message-Id: <20240920101820.44850-5-kfting@nuvoton.com>
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

Store the client address earlier since it might get called in
the i2c_recover_bus logic flow at the early stage of the func()
npcm_i2c_master_xfer.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 68f3d47323ab..248835220c86 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,18 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Previously, the address was stored w/o left-shift by one bit and
+	 * with that shift in the following call to npcm_i2c_master_start_xmit.
+	 *
+	 * Since there are cases that the i2c_recover_bus gets called at the
+	 * early stage of the func() npcm_i2c_master_xfer, the address is
+	 * stored with the shift and used in the i2c_recover_bus call.
+	 *
+	 * The address is stored from bit 1 to bit 7 in the register for
+	 * sending the i2c address later so it's left-shifted by 1 bit.
+	 */
+	bus->dest_addr = slave_addr << 1;
 	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
@@ -2163,7 +2175,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1


