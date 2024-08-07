Return-Path: <linux-i2c+bounces-5188-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7159294A4F2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 12:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29C2D282DC9
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 10:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DE21D4148;
	Wed,  7 Aug 2024 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaA/Tnjz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61DE1D365E;
	Wed,  7 Aug 2024 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723025026; cv=none; b=cL5X+o/TX+40Dx+pSP10SWqJHOVdAlnT2/6az/HUMc+Tzip2/X4EX1WrHQ31WBMX6I8kF9elNKM085LZOviyXyqkmVF2f03LoyrKp0dv9oKVcduCor91lpu/okEqD+Oq8Y4NeFcBM3G1cteZuyMQsHZEWdfwC4hw9VpuVia8HDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723025026; c=relaxed/simple;
	bh=iY/c4Ethd5toEVwL3BUbaVVQNdMIq41Fgn2Lm0ke8dI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cY80T6Nx0nfshXmkyMoIJ4EKwypgLhNbvGudzZw8IG3LKir9psTyUxtCfrvHs67Km0UNf9AdBMF4Xi2d0MtorCxTtyQTCJZUWbxpYzH4ucjrurGfdNk0fOlrbaO/4amorjPl8vR90RdXp93MzMt21680YCg1Ozdz+H0GSb3aGpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaA/Tnjz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fd65aaac27so5155875ad.1;
        Wed, 07 Aug 2024 03:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723025024; x=1723629824; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=65hWRo84ajW0lRVkSWXUeq2TzEhPxVKIyrTffKYFoGM=;
        b=HaA/TnjzQS9KiKxAbMsNLVsiE9l2CqQnEuW8KVpbbKs4iUlVKhb9V16eC1aQwqwIVG
         2Cg1Bl+8II+s1Co2EHFuQo+5CGWAx3wKRkyDqMBZC+0KZdCOLnMYVA2tMwjFgIUKmdF3
         b3pwWBHntyH5nJwhP4WwIsMmYYYGazej0iqde7QwSCfuDqkDBdNAumWHqOiRc2K4zQ0D
         9StD1bak9zLB2qQheelCiHot+WZrH4VSNeRHgTfeCb6XZ77X9nXExelpnQnMYD/L4R4j
         r9XFpyipsfufs6/spwGaXzU4QhGOgavkGOH41J0Hseek4qkgK9o3XfdpuVBRlPl4qYrQ
         hEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723025024; x=1723629824;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65hWRo84ajW0lRVkSWXUeq2TzEhPxVKIyrTffKYFoGM=;
        b=A++sAKCuHsvxyDONLdik4+td2mlNFCWRexkwA7Jv2LNHj4RevAscWb50OUO+Z7boFq
         7J52WIqimtVE//49VhrZvDbhevJKhXrUTULECkwTQmGK7iFUdugXTEe+OhKEZXqHRZV6
         0vv5Svo598LVRPOR3OIObRBJiC96aMbB2nEzu7lHCEWg2rXQeyL5uvKZgynUZI/QxaDM
         As1cZXTZthDYrwHqembLJW23AWbT9ia5bPToh+3puJ8MC5AZyh5G4rliH25ajWcck+/O
         LIV3vMXmdYCa87VmqSR6whCoC2jslRJ3Fp8Hn0raHpyLhmWPa3yEC5ytFeKOlbRFloK+
         s/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXnM2NbIWXX7iOUHw4czC7LY9L7+YKKZRhzu/WaeW5YiUzaw72KstJGfDVrb6DZaOD/pgpT0F1Z8t1rG5RbGzKGTsOgyAUQgYqoHqQV
X-Gm-Message-State: AOJu0Yybhj1IyX5tRPNcw5gUMNwikRZX2Oo3MVWyEncWmI70qpdQlXS4
	MefhbHYUlZv9dy8urDhFdG14Ks2N9CYByQjjXl6WOCwi6XCqMeQ=
X-Google-Smtp-Source: AGHT+IFUAvPzPEGgfDcOWxF5s64WDqDfWyHHIPJ5yd/HojF5g7uCqnKGmgzEpjnXwTeU7xoKYdeSfg==
X-Received: by 2002:a17:902:f64f:b0:1fb:7654:4a40 with SMTP id d9443c01a7336-20085492a0cmr22836605ad.14.1723025023921;
        Wed, 07 Aug 2024 03:03:43 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59053847sm103141165ad.170.2024.08.07.03.03.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:03:43 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com,
	kwliu@nuvoton.com,
	jjliu0@nuvoton.com,
	kfting@nuvoton.com,
	warp5tw@gmail.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1 4/7] i2c: npcm: Modify the client address assignment
Date: Wed,  7 Aug 2024 18:02:41 +0800
Message-Id: <20240807100244.16872-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807100244.16872-1-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Store the client address earlier since it's used in the i2c_recover_bus
logic flow.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index d115ac659900..c6f72c0e3464 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2153,6 +2153,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	bus->dest_addr = slave_addr << 1;
 	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
@@ -2161,7 +2162,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1


