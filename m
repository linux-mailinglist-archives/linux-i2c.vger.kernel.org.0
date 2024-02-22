Return-Path: <linux-i2c+bounces-1932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECAF860597
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 23:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E028A1F24E04
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 22:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D806973F37;
	Thu, 22 Feb 2024 22:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMat+FeE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A213790F
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708640693; cv=none; b=thCxyd22MkQNVgzK7sN+4zDsqM5ykxBsXJqBI28OvbtgRzxRKU2Tb3HEv8Bupr6wObZtnOIgZmlzUaSeVwgAanVRZrHsiZ4x6woR7K2vr3qZg5bTyJKS1pghppajdOaUREi88A3k8UDzNXWL2Lqx2MZv664GQtzmO8B85vtS9x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708640693; c=relaxed/simple;
	bh=L/UpZpzmsf/zTpRhlNqbCh2Lk+jVeODICudMdlZhrCM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IWqaeVPko2MQ1DFxuiUTUEIccVKYLX0WU+Xv4ddYZHfbzH+xBKT83xLBiKZn7hds/vcLEJRYuAfBVP2Oe9sYNJv7MWpoigY6t1vHRj3RrwH/KBIX51dhVvZzOMBbo8E5H4vzwgLMQ/0CwjUq5jG/sSGX4hhqTn/AyA3AosjQ7s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMat+FeE; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3e85a76fa8so20531766b.1
        for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 14:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708640690; x=1709245490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HW7v6AAbiLpmy3glMGwYHj0KJ14T6oQjhroJyGEYo0A=;
        b=CMat+FeEQ2+E0aB4auV9OA6hx11+fgCbElhQtgdc6xsXkeTQqNp0qHV9/aZ88XwFfj
         8LIvHwHb8RFIobCm7lYfNpcto6TDv64R09uZVKpBGlpEvtv4eUGwJCxWm6I6fi8DfibW
         +mUdBq2a6iB4LK6yKWZzphzcr5P2+MFNakpnVvunVwFnWFhr9p2JFI2XByez49HzN+/A
         8ZeKbrDwf+Z+bF76p0nQk4vY6EjjBoX7MMRuGzjfLdmU9EB5R8sNaDe29VE8FrheHVq8
         4wSYUTUlgRmyLkaSntJ6LWsWYwfM5gCBaGWaRrVWfLGB0IK4J2JeJRLxo7TJYKe8nYbG
         d4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708640690; x=1709245490;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HW7v6AAbiLpmy3glMGwYHj0KJ14T6oQjhroJyGEYo0A=;
        b=lMT+FSPW5nzXRVxipkT71I+dGPZH1eqZttptzu/QumnnqJdcfmBMqNq1K+ruGVuAqm
         5zWCh9FGExA9jOuIfQxDcK3eCBi8u/Um17ZsC2+2ny4X+U2T856bABJUau/7FDzHLWXM
         wXeDQ3s6nQRih8hNgpRRB6zct0ECebLQ1qJ58xwH8gpZkBp5CrEO115t8UHyMZbe+c2N
         pls5s+xh8MkiAciNEsvJa1yFoWlg9LbroAPqAYULV75YwMPuTZgrmq5oBvkIxp4oxS9D
         /rGSuJUoi1UXFwU3AaYxRknGO+0e4EM1GtnbPdIen1ciXaSFKMCV1XsRCDE8LC8KL9Y2
         Z4TQ==
X-Gm-Message-State: AOJu0YzRu6XYnMB9Pwm6NL23Or+QFzk2jQfBHlBXWpsCK7BQ5UNGnKCG
	w6Nzuh8qYnZIhM5er072UkEFP2kATcmEO8LLNT4/8oZtXJJ6ycoGbQ7JJFyA
X-Google-Smtp-Source: AGHT+IF8DWjzMsR1BuiXDmeaXHk0xWOw2vQIj9b4V82m3PAeJkR4bwgoD3XahvEy32Bxajxo5q11rg==
X-Received: by 2002:a17:906:f847:b0:a3e:bc98:7243 with SMTP id ks7-20020a170906f84700b00a3ebc987243mr95868ejb.71.1708640690019;
        Thu, 22 Feb 2024 14:24:50 -0800 (PST)
Received: from ?IPV6:2a01:c22:7266:d800:30f8:c84f:4a91:c419? (dynamic-2a01-0c22-7266-d800-30f8-c84f-4a91-c419.c22.pool.telefonica.de. [2a01:c22:7266:d800:30f8:c84f:4a91:c419])
        by smtp.googlemail.com with ESMTPSA id vi11-20020a170907d40b00b00a3fb9f1f10csm145712ejc.161.2024.02.22.14.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 14:24:49 -0800 (PST)
Message-ID: <db378364-018e-4e6b-8e41-8cdd21ce2afd@gmail.com>
Date: Thu, 22 Feb 2024 23:24:52 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RFC 1/2] i2c: smbus: Prepare i2c_register_spd for usage on
 muxed segments
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
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
 drivers/i2c/i2c-smbus.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 74807c6db..ad7ea0215 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -351,13 +351,17 @@ void i2c_register_spd(struct i2c_adapter *adap)
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
+		slot_count = 8;
+	} else {
+		if (slot_count > 8) {
+			dev_err(&adap->dev,
+				"More than 8 memory slots on a single bus, mux config missing?\n");
+			return;
+		}
+		dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
+			 dimm_count, slot_count);
 	}
 
 	/*
-- 
2.43.2



