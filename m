Return-Path: <linux-i2c+bounces-2118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 052BE86F263
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 21:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EC11B226D5
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 20:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7241CA93;
	Sat,  2 Mar 2024 20:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kusxYcjq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F689883D
	for <linux-i2c@vger.kernel.org>; Sat,  2 Mar 2024 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709411958; cv=none; b=thfaopa4NHtowPSfdAq5SKIi52u/7n/zFptLzswmk/LwAwU1Nv4iT3+zoy7H4D+7qt9C7IaLsCfTzfb2EpLOG6FagVK3TSvUMepY/JtzJc5xXo+zfDLCYUX2/mDw9KL0TSAb3bsk0kxBRTJzLH8gRR/EB/i39v1DekoWFzu1lqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709411958; c=relaxed/simple;
	bh=DVet7lsAUzkCUWLP+BBolM+eIo94DssErwgVXhr7wYI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=kxTWUhixmdnP/9rXE+DpP8AyfEJLiMTBaEPBnj4P3YPOqdJt1bPYaQQP9kN3ENWVpzI3GMUPq+nPG0NeiB4jfQ2Wkk6ZBPPRBQF+bK/RJLqI+y7ljNX3F76ey90ZG4t1kLKkphGsX5c5GD7uGmDWQ110rVer5UDZzbxihcgREQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kusxYcjq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412dcaf55eeso1087125e9.2
        for <linux-i2c@vger.kernel.org>; Sat, 02 Mar 2024 12:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709411955; x=1710016755; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZ/Wp9mdplMat9NwdZ4dUYgTdUuyNLsw6i1pWTgjJgE=;
        b=kusxYcjqLnDwikuZZkf849/Dq4x25DweFQTGJ6cDM1pxZ4WkB+i+6Wp2aCjbTtlXR+
         URaHYkUv4J/DR0P2VjYzErp34O0P8xOuKXlofTfC6v7LgQ+tcEmtoK49XSJC7Cqei+mH
         cN1vVO+iQOetWX8bid2HLp8wcPtsntPbkWLIniWFEY+PwxhCFvx/ZZeB3UxwDuxDaBOq
         advs8lQOolduacR3mad3LECyqn9U/MdYV+jxG9ItSJVZi3Z0QvZuFHfUqq1qWSyDA4um
         ovcpjZO2SOG8FRyJDnPzp2dRg89Fg7eNPYQ5l9uvkSkP78pmxluh1Nt/OnQwr4pEIK2K
         FwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709411955; x=1710016755;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZ/Wp9mdplMat9NwdZ4dUYgTdUuyNLsw6i1pWTgjJgE=;
        b=V111xKsV6mCeXDmm0gQgLNoLagMCYF56XeZ508iQX5WV0q1gneHD4ZuxCRJAdZeY/y
         NMMGGR5hI5gD1fycppSvN05Gj6sPNOGhIJX9XxZ93luRn/XkSON77SpGmTstW5cG0rT1
         3zsvW7c0BLf3kFSm30c9jaC9lZyHtHvsJG46nFz4E5P8SIez1vsNKr15lh8lQX3EgejH
         PG8pdG9+HoEXFsylDqJRGsIOh/MUNTvDq52/lSCvYReU6eRt/K1RwJa7y7pjSHd50rhG
         pjuilcgdb2/s3dG9mxBUVzyv5Xl2IwslqYwP9uB1HKY459kRAdQwJKHBrIk7uDKeh1ql
         D3Bw==
X-Gm-Message-State: AOJu0YyHHxOpnaS7AD6XZTylAUEosMXd5YLO0wUioWPJFZeQykXa27wC
	CS/kt+4MhHW9ye+UHmesjlktWBAKtPjZeb+B4xEXD+LsldRTH3bl
X-Google-Smtp-Source: AGHT+IEROtvLdAHudClB5bEnP6jkUD7TFLWhxitak6vkqGyqdnw/DkyOsH1eFeo4GXiiZjrfsz1CVQ==
X-Received: by 2002:a05:600c:4705:b0:412:bfa1:fc0 with SMTP id v5-20020a05600c470500b00412bfa10fc0mr4528927wmo.8.1709411954352;
        Sat, 02 Mar 2024 12:39:14 -0800 (PST)
Received: from ?IPV6:2a01:c23:bcce:a400:2519:2036:7f0:6005? (dynamic-2a01-0c23-bcce-a400-2519-2036-07f0-6005.c23.pool.telefonica.de. [2a01:c23:bcce:a400:2519:2036:7f0:6005])
        by smtp.googlemail.com with ESMTPSA id fl9-20020a05600c0b8900b00412dd2102b5sm341832wmb.12.2024.03.02.12.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 12:39:14 -0800 (PST)
Message-ID: <d0b4aa2e-8b5d-4c27-8aab-164a089d95bd@gmail.com>
Date: Sat, 2 Mar 2024 21:39:13 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] i2c: smbus: Prepare i2c_register_spd for usage on muxed
 segments
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If this is an adapter on a muxed bus segment, assume that each segment
is connected to a subset of the (> 8) overall memory slots. In this
case let's probe the maximum of 8 slots, however stop if the number
of overall populated slots is reached.

If we're not on a muxed segment and the total number of slots is > 8,
then warn because then not all SPD eeproms can be addressed.
Presumably the bus is muxed, but the mux config is missing.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- Make comments / messages more descriptive
- Remove second patch of the series to ask for testing on lkml
- change dev_err to dev_warn
---
 drivers/i2c/i2c-smbus.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 74807c6db..c45d09782 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -351,13 +351,20 @@ void i2c_register_spd(struct i2c_adapter *adap)
 	if (!dimm_count)
 		return;
 
-	dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
-		 dimm_count, slot_count);
-
-	if (slot_count > 8) {
-		dev_warn(&adap->dev,
-			 "Systems with more than 8 memory slots not supported yet, not instantiating SPD\n");
-		return;
+	/*
+	 * If we're a child adapter on a muxed segment, then limit slots to 8,
+	 * as this is the max number of SPD EEPROMs that can be addressed per bus.
+	 */
+	if (i2c_parent_is_i2c_adapter(adap)) {
+		slot_count = 8;
+	} else {
+		if (slot_count > 8) {
+			dev_warn(&adap->dev,
+				 "More than 8 memory slots on a single bus, contact i801 maintainer to add missing mux config\n");
+			return;
+		}
+		dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
+			 dimm_count, slot_count);
 	}
 
 	/*
-- 
2.44.0

