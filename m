Return-Path: <linux-i2c+bounces-7117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2204098B45F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D10E62842E5
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 06:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A292F1BC08D;
	Tue,  1 Oct 2024 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUKRVfxy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8A21BC070;
	Tue,  1 Oct 2024 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727764185; cv=none; b=g+ynOXPd67yjfWc4fkQ9M8JqIOBEoUjDvUQk7UHgBjZRLKqkvgoZ8N6KQGZ9fDWfUBuqEnvWDXE1YsTlbuFbxr6883qL0PR9PykXCQh0dKwRHq3+tY5x0shkNqjWKrBYSlvjomlpWa/1iF4xShnnK1OB+A60of6+711R6GZoK/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727764185; c=relaxed/simple;
	bh=OkYg7NWlOVU9VKRfqHFVtlKyNBN/7BNgGLNzYJzYJeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=bJYKXnczKsJ9YYL6+F79YiW+e99HGGceiW1jMxCiGlD8bEOOGbYD0jSOPfk52tE4c90A4/2wbIpBsZ4a0WFQsgrZu1TZ06bjZaMi26nu0tpu8kzt25CkLcVCGF0yVZy+L6RlEy6w5aToWYP7TNsd4RhJt8/M4hIZtaKivF8Dvsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUKRVfxy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b93887decso13824765ad.3;
        Mon, 30 Sep 2024 23:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764183; x=1728368983; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WxtrrtK7dkUabLTe2HlhaHOfop29J15CnaNw+gioQGM=;
        b=iUKRVfxyFJOg03lchRtPmkqK4VYuZBF7NWRCBA0MoKk9/RXgLN9fmFchsWo+yxrJAu
         8kgYK7G5Zygf5EmVpECWoZsrdm+OBthlczjL2/5CKvjoqiNyMP//V2Huk3oUhXTKOBGo
         RxGfaAG/ikdDc7gpc/AAxKDWOOxhY0FcoP0O6rfdZZwssG2xTU9PWWvy/Vkw8QOGWOW9
         /HhSDmHT2E6SsGpj/dY2hfIMNjWbi1TYFmhnUa6Psx3n66sdpxyQ4M8Dm7ggMLqJlqY+
         zfBo/Ifr9T7O5oI7Tq/bD8tA2L9qvnt4ox0npQSBxp0OOX/oqSBFKBPvllwLV0r3pN/i
         VZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764183; x=1728368983;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxtrrtK7dkUabLTe2HlhaHOfop29J15CnaNw+gioQGM=;
        b=fTRKn7tsBM+RGHBvA/Y28ZBOwixlTBnKSom6FzEe/rkzcZ82x16Ih6OSPLk/yXrmoM
         CEyFBBVBUhPFtvpYblp3Vl74K3C7Yt88HpapgJLlZ44+ogcsaqtjsVjLaLFNbjpZrmmJ
         e/WW//MICIim5DdNZqCezv7SHKNTmfhy125DN0gW+ZL4eZjEbDYh4HBtzzN8WsED+6pZ
         L5a6nMEdiHhZ2SWfvrNRwq+ASsgb0vsDOgnIwMQDJUJGgVfg+Idf8ICtWLSytieU5jhq
         3UpQg8siZLKk3JlQos+N/u1L18tH7STNFO2XL60DRrjI9VOuvofn8T3xJUe7QmnMSRs1
         AvBA==
X-Forwarded-Encrypted: i=1; AJvYcCU05UkCBd5bmFzlr/L0mNt3ooV6lS+vuQQ2k7IK0tBhVbCOT2X5cU+bA8Oz/8FX+SSF/drF8e6A6nA=@vger.kernel.org, AJvYcCW20Ob92f9nwjRBOjj7zdXUpjRRWh3Mxi8bfaxuIa88Ai/gCkGJV0QxBjc+NntqNuNIe5pAo7vIjHhEzETm@vger.kernel.org
X-Gm-Message-State: AOJu0YxOrpZvnal+TyOjnfL7ldsZg/yALS7qSfyp+t22gyZ7GhUMghSJ
	0nOHhN7P4JFrqJswV/Yifvb5U181lcVatfCiXWhL2bhy70EL82s=
X-Google-Smtp-Source: AGHT+IE37FEF80rldr/cNKepWtQJ5ahhtOq33h6U28/y3zagN8dDe1+p1X3DN/bUulyLUI9t1XyGBw==
X-Received: by 2002:a17:902:ce12:b0:205:8275:768 with SMTP id d9443c01a7336-20b36aee9edmr213250335ad.21.1727764183341;
        Mon, 30 Sep 2024 23:29:43 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e65a48sm63454465ad.297.2024.09.30.23.29.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:42 -0700 (PDT)
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
Subject: [PATCH v5 2/6] i2c: npcm: use a software flag to indicate a BER condition
Date: Tue,  1 Oct 2024 14:28:51 +0800
Message-Id: <20241001062855.6928-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

If not clearing the BB (bus busy) condition in the BER (bus error)
interrupt, the driver causes a timeout and hence the i2c core
doesn't do the i2c transfer retry but returns the driver's return
value to the upper layer instead.

Clear the BB condition in the BER interrupt and a software flag is
used. The driver does an i2c recovery without causing the timeout
if the flag is set.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2b76dbfba438..7620bdcdc235 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -334,6 +334,7 @@ struct npcm_i2c {
 	u64 nack_cnt;
 	u64 timeout_cnt;
 	u64 tx_complete_cnt;
+	bool ber_state; /* Indicate the bus error state */
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -1521,6 +1522,7 @@ static void npcm_i2c_irq_handle_ber(struct npcm_i2c *bus)
 	if (npcm_i2c_is_master(bus)) {
 		npcm_i2c_master_abort(bus);
 	} else {
+		bus->ber_state = true;
 		npcm_i2c_clear_master_status(bus);
 
 		/* Clear BB (BUS BUSY) bit */
@@ -1699,6 +1701,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not stuck",
 			bus->num, bus->dest_addr);
 		npcm_i2c_reset(bus);
+		bus->ber_state = false;
 		return 0;
 	}
 
@@ -1763,6 +1766,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		if (bus->rec_succ_cnt < ULLONG_MAX)
 			bus->rec_succ_cnt++;
 	}
+	bus->ber_state = false;
 	return status;
 }
 
@@ -2158,7 +2162,16 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
-	if (bus_busy) {
+	/*
+	 * Check the BER (bus error) state, when ber_state is true, it means that the module
+	 * detects the bus error which is caused by some factor like that the electricity
+	 * noise occurs on the bus. Under this condition, the module is reset and the bus
+	 * gets recovered.
+	 *
+	 * While ber_state is false, the module reset and bus recovery also get done as the
+	 * bus is busy.
+	 */
+	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
 		i2c_recover_bus(adap);
-- 
2.34.1


