Return-Path: <linux-i2c+bounces-1287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF5982CC7A
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 12:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4EE01C214D4
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 11:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B1720DF0;
	Sat, 13 Jan 2024 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDO0X+7s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BFE20DEA
	for <linux-i2c@vger.kernel.org>; Sat, 13 Jan 2024 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a28f66dc7ffso1513323766b.0
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jan 2024 03:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705145105; x=1705749905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ygcx92JfSybpIpuBhe77iUnEJaCJ+kNzKK948sWnpeo=;
        b=lDO0X+7sSo4MDt+SD5RM31UHEMauA4HSOhcT2zAv/yqV74ulCqb0BR5E1TmVO+FP4h
         a4xDQEUZgAilLuXv5eAj/cxnv+JXGkpeLhrcGeagwqviXsi20Q8lHTzA8Gx5HX+n4nVa
         NSdhAmt9fcG5afCUYKXFl+hW5BKj6RhOgKmN6LelTxuYa95aCwwAYRHJ+89nHudDZqwA
         6uIAv7q4Jmk1gGvychnxb/6Mh/06dW2yd/uat/vz9NpcDTwK3PSYjXJZkRYW19MqMv4u
         uxe+QvJrIDF9RY+m6bRe1Kspo6XJnkKeC2HkfjrCJvhabqfjOdRbjMxYLMeOxU746bc5
         ux/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705145105; x=1705749905;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ygcx92JfSybpIpuBhe77iUnEJaCJ+kNzKK948sWnpeo=;
        b=Phns9RwB7PY+Q4XysmCfnK2lqFA/QrMUgcJKPZ++P3N+pwRNKZnp6ThDqsj2erHv+r
         e7InArDOQgz7yhF0DEEyp4MVwyEqVSzeLU2za4cwVW6MQfLlXFLps7pubGG24thWIznj
         dFATkVcgzlmpvVPz2bjjG29jEaHFD8Ir2vLGcQEg4o16i+e8yDm5GmvKY5cECBYs2UMG
         lmqRoYqISvSo1OvOzOJodlR9qsJMC/x3AA0EDNAkTagm/rRwPdiqHjLgRNudWaMFIiZG
         /N3iEfaGwEJAaIaVz5bSRwk6hVTSzy/QLKxyfWUoLBpfmLPj8JGxZ5+7cp5+p60pyV/N
         f4ww==
X-Gm-Message-State: AOJu0YwkxetCYYkh2SkvfI3Z6OnQ+1LQNWwgQwJfA/MVz6mVEheImhZ8
	ppeuVQl1RO2u3i/e+oRDaj4=
X-Google-Smtp-Source: AGHT+IGMuO4ZvOkuJACksnNkAWbqUX2ErPZvT1cB2QxnkfR7jHPPY0YkoUWx69yk+YGCacb1WbmYxA==
X-Received: by 2002:a17:906:6802:b0:a28:e980:8984 with SMTP id k2-20020a170906680200b00a28e9808984mr2593128ejr.18.1705145104951;
        Sat, 13 Jan 2024 03:25:04 -0800 (PST)
Received: from ?IPV6:2a01:c22:6f53:1400:a4e3:d977:260a:1bdd? (dynamic-2a01-0c22-6f53-1400-a4e3-d977-260a-1bdd.c22.pool.telefonica.de. [2a01:c22:6f53:1400:a4e3:d977:260a:1bdd])
        by smtp.googlemail.com with ESMTPSA id d26-20020a1709067f1a00b00a27a7fa8691sm2777351ejr.137.2024.01.13.03.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 03:25:04 -0800 (PST)
Message-ID: <9d256562-3f81-4906-b514-1a90f91c46ae@gmail.com>
Date: Sat, 13 Jan 2024 12:25:05 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/4] i2c: smbus: Prepare i2c_register_spd for usage on
 muxed segments
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
 Peter Korsgaard <peter.korsgaard@barco.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If this is an adapter on a muxed bus segment, assume that each segment
is connected to a subset of the (> 8) overall memory slots. In this
case let's probe the maximum of 8 slots, however stop if the number
of overall populated slots is reached.

If we're not on a muxed segment and the total number of slots is > 8,
report an error, because then not all SPD eeproms can be addressed.
Presumably the bus is muxed, but the mux config is missing.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove now obsolete comment
---
 drivers/i2c/i2c-smbus.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 74807c6db..44331c5e2 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -309,7 +309,6 @@ EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
  * Restrictions to automatic SPD instantiation:
  *  - Only works if all filled slots have the same memory type
  *  - Only works for DDR, DDR2, DDR3 and DDR4 for now
- *  - Only works on systems with 1 to 8 memory slots
  */
 #if IS_ENABLED(CONFIG_DMI)
 void i2c_register_spd(struct i2c_adapter *adap)
@@ -351,13 +350,18 @@ void i2c_register_spd(struct i2c_adapter *adap)
 	if (!dimm_count)
 		return;
 
-	dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
-		 dimm_count, slot_count);
-
-	if (slot_count > 8) {
-		dev_warn(&adap->dev,
-			 "Systems with more than 8 memory slots not supported yet, not instantiating SPD\n");
-		return;
+	/* Check whether we're a child adapter on a muxed segment */
+	if (i2c_parent_is_i2c_adapter(adap)) {
+		if (slot_count > 8)
+			slot_count = 8;
+	} else {
+		dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
+			 dimm_count, slot_count);
+		if (slot_count > 8) {
+			dev_err(&adap->dev,
+				"More than 8 memory slots on a single bus, mux config missing?\n");
+			return;
+		}
 	}
 
 	/*
-- 
2.43.0



