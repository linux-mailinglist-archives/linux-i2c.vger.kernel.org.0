Return-Path: <linux-i2c+bounces-6687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 851F0977D09
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9B1B281652
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0511B1D6C7F;
	Fri, 13 Sep 2024 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMlfbXcw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D471D7E42;
	Fri, 13 Sep 2024 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726222500; cv=none; b=kyyCBIJztkaYSuisW0MqL0Ivl8ihPo45FYP6ky8To2hEP/KUwS1T7VRpJEZwH+Ja/LKVoOVbZNgseSqhAR/OCcYg6ilvCr41ZONen9/t7Uw9AtQqGLnPPuqJ6eVMborS1Zpc9KMUBjAQGd+12TaW9a9WwSZiLLXXuh+SJUIW3aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726222500; c=relaxed/simple;
	bh=Z0EgJkSV+YBVAMFiQyi04yGgkhMhHKzXytf1IQwWUic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Uf9/fSBDP37zJ8Vz7dU24kFvCGfrmlnGOtu2qxm6GdoEr2/MQjkS6gxIevDe3NSeS4RNjV9qk3/aCHlOGCrrwbV4N/xZIoA/lhDTMbcGeuetCJ81IW5nsIgv8i0BWlHdIFMsAckKOrxb3Dm5EHBDvdovYsElVTqmPPvazB3LgTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMlfbXcw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2054feabfc3so16835255ad.1;
        Fri, 13 Sep 2024 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222499; x=1726827299; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mgfOidgW6QQd83F5+t8/o7O3J5kWPZhDUGZrc2VOvL0=;
        b=dMlfbXcwTakYIweL8j5JcYsdxT2E5eBc4I4yMAnY/rh80e8AwIXBG8bgcPJZRtnpqh
         9ZZ33Mhx72tuM7NAnPItyuCXFbCCdh+ah56O7zPYpyi39PuZUNdUp9kDAwJp+J/uwxlC
         e/RcepS8ziZnLMusLER3N1eqgmh1YEzMLBPu1fSHJIPgoKsJJmseipHeOksWERcPjZTO
         29R/83DO8ZZhAgWlNqzDJUvZXi8ergfdAHKwwhZvnV2hgi0ydEOHQf7jBx8idl0gnmNM
         vUduS1KGNfCmxS/4kGI87af0c+bT/DY9RiShrdMeWurYolpkInRdIjLOJ8x2eDRBxFRo
         RIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222499; x=1726827299;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgfOidgW6QQd83F5+t8/o7O3J5kWPZhDUGZrc2VOvL0=;
        b=KvdA0nGAN2rh3TPKDZFvlb0T5s0AsZAKyzfSCfuREzZYMpMzV8nFESCUrvlAQRjDu6
         1Iphfhk0SrcB5F210sQflkayFXUrYVSakMiH9yK0MbyC8ilQfAz5c3T7UiG9IxhbkM59
         Q9iIh+LCOQ/T50M58An7DzYAjdvbzT/RvZLHz5mZaVPVwmrd7vQhN8KThf2HpOphN2sv
         X+xpDLjc4x2ytxluonyhKp4asDvVCMbXV2MzM259f9qUu89yXyuVzoA0M7aaZkQWleo9
         XVsjesxGO50nFv75O8vXj6PKYPoH5CQ2zxluD+PvGKfRKMBAm73mORIdXBasx+j9qsvC
         pbKA==
X-Forwarded-Encrypted: i=1; AJvYcCWu7t63LqgF6ebbphjDv3uXarh0ohYhoMAyoNRu3tvopH+XQZ22u2swQlq4xD+RpyWjayPssOgY/fLrQqGf@vger.kernel.org, AJvYcCX8E6dndrwzV7iume3Ryd5XC9+0TUS7gv4m2z5H1Sgq2q3sIljKIkCssmWznwu351fOz4ji1fvbTkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXNWApdrvVrP5TaewGdh1udxfKx5iUn/QOoipKJTco/a6zoHop
	y6r5QCDFChZk6eX3mXBRYb2CPGIzcVeVE6V/Pa2+gAPv215+G0w=
X-Google-Smtp-Source: AGHT+IGYenqOVhVnCvgeCN41uV0ql81wR0Eu1V6J2NcQ2jh3zcbTj94rIYBZr8B6KrzAZyPWuGrRcA==
X-Received: by 2002:a17:90b:b83:b0:2d8:7307:3f73 with SMTP id 98e67ed59e1d1-2dba008231dmr6286966a91.39.1726222498365;
        Fri, 13 Sep 2024 03:14:58 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9c4a253sm1347026a91.4.2024.09.13.03.14.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:14:57 -0700 (PDT)
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
Subject: [PATCH v3 1/6] i2c: npcm: correct the read/write operation procedure
Date: Fri, 13 Sep 2024 18:14:41 +0800
Message-Id: <20240913101445.16513-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240913101445.16513-1-kfting@nuvoton.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Originally the driver uses the XMIT bit in SMBnST register to decide
the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
write operation. If it's 0, then a read operation will be executed.

In slave mode the XMIT bit can simply be used directly to set the state.
XMIT bit can be used as an indication to the current state of the state
machine during slave operation. (meaning XMIT = 1 during writing and
XMIT = 0 during reading).

In master operation XMIT is valid only if there are no bus errors.
For example: in a multi master where the same module is switching from
master to slave at runtime, and there are collisions, the XMIT bit
cannot be trusted.

However the maser already "knows" what the bus state is, so this bit
is not needed and the driver can just track what it is currently doing.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index bbcb4d6668ce..2b76dbfba438 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1628,13 +1628,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
 			npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
 	/* SDA interrupt, after start\restart */
 	} else {
-		if (NPCM_I2CST_XMIT & i2cst) {
-			bus->operation = I2C_WRITE_OPER;
+		if (bus->operation == I2C_WRITE_OPER)
 			npcm_i2c_irq_master_handler_write(bus);
-		} else {
-			bus->operation = I2C_READ_OPER;
+		else if (bus->operation == I2C_READ_OPER)
 			npcm_i2c_irq_master_handler_read(bus);
-		}
 	}
 }
 
-- 
2.34.1


