Return-Path: <linux-i2c+bounces-1491-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D639683EDDA
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 16:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AC3C1F22569
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 15:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262C52941C;
	Sat, 27 Jan 2024 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWx+kQ1A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599FA2940B;
	Sat, 27 Jan 2024 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706368741; cv=none; b=IyMmaiH4DtBNWwdZ2QdMMk4q9TPKqfTklvL5GtwngEL4nGqvItwjCsxC+R37BeYLC/Vk6wAhCK4Wn7G5R8prq7m+AWHYNU9aF1cfZiRZZkqemC5SlsS6NqfhYIO3kgblfn6+7iKDEst+NnSJv8cS6cnQbvAHdGT9RnLfgPxinpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706368741; c=relaxed/simple;
	bh=5wPEFK0CxHY3q/dCTpMejHe6YWhijKHvBiUmZrL8Bdw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Bm8E2vXvrjhJFhqTsi/OTdq0fG5S7hlbbdiDkyVVHQhMiHXKRKn5wVhQsddk2zgZzrU3X2xrkosUrnZYOdllpgv5Pt3NYJU2tkJnhTcb6eVSEVGFQFLz/S0ojsB3MTotkIMI4lAtF9VIs8dGl2lzIwibP6UaEq9PEteJJ+E50IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWx+kQ1A; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40eccf4a91dso19770255e9.2;
        Sat, 27 Jan 2024 07:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706368738; x=1706973538; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAgyI6vig4nqRVmwI4UuDTp6BL8Z9iCwpc9ivHQVaLY=;
        b=HWx+kQ1AIQWyH/FW/XB7VZoP0RSnRBHujYcsaSsil5vCExDysCIZyxCVzbmeX5eLLa
         rNq/SiNAb65/H+5TsyLg4bOzaiTmWSUUUfe5r2Br5uEwhz1MBa99ggc6Hw9LaQgOx0xG
         RWdOwm4T6ms2Cd82j2/u98THf2TCz5HZ8KSHh6G665XCdAYzfJXo+j3PE3iT48Hy7ed8
         EGnE7qsQ6xeWDCKeLNzhyVbtjmuY4J0omxF+W6YkeCqp4lNolPTjPUbcEnsH8HZ4ghkv
         MqWQlbLnVEdGxY0H8NYy8j69KsvjBURbEsfNaCToUzTZvG7tPjAnMvDJY1rrG5mzvCCo
         X/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706368738; x=1706973538;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAgyI6vig4nqRVmwI4UuDTp6BL8Z9iCwpc9ivHQVaLY=;
        b=cBoJyXn9pB6vNCdrqH0mfxG/aCNmD/6UX7wc2PXzk83XYrRCfQXMAZG2HE0bTl93+/
         n6dgnLCze1QjX5fMp1uhT4nfx846tC9Tqtp5aERekfOwpzHav4Dx6ZxO44DHoXlvOhOF
         0TfA5l2F24tG7CVb3bHGsRpaBo4BO2P9v/N+BpsaLXf5m3tl+rnXbkxpT73Kg6VAii08
         iPA7HyWMMcr0EWb0+Zu4+AR1pLcl24K9uiUa3ANPFJSQxnB6STcpEsIYZzlaw9jQZPzi
         Ujk/JPTJ54yBHYWyy7UdtKmNLDhVP2xJvoMAwX5igL+hmApeW5Dv45tcxmnaHGsX1LM6
         sEPQ==
X-Gm-Message-State: AOJu0YyZwbuOAzwrltIwyO/ERZWr3SvqaDkpxy9X4R20va7MLOo07MTv
	nesRFTASzjAuLvSDHaPtqryMZbEPuidK/kjA3kV7lqb4qWvGDEIBI2cZckji
X-Google-Smtp-Source: AGHT+IHhnNJSCmQvw15SUNpQudu+lRYcuuPlfmgGfILzHK4sO2W/a8QZlM/cJzSiI9QvpLIGQbMieQ==
X-Received: by 2002:adf:f24a:0:b0:33a:e3cb:9c19 with SMTP id b10-20020adff24a000000b0033ae3cb9c19mr855087wrp.43.1706368738355;
        Sat, 27 Jan 2024 07:18:58 -0800 (PST)
Received: from ?IPV6:2a01:c23:b938:5400:11ba:857c:4df8:38b0? (dynamic-2a01-0c23-b938-5400-11ba-857c-4df8-38b0.c23.pool.telefonica.de. [2a01:c23:b938:5400:11ba:857c:4df8:38b0])
        by smtp.googlemail.com with ESMTPSA id m28-20020a05600c3b1c00b0040ecea3c4dbsm8668437wms.46.2024.01.27.07.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 07:18:58 -0800 (PST)
Message-ID: <011ac933-2a45-4a63-895d-d45bfcb8576e@gmail.com>
Date: Sat, 27 Jan 2024 16:18:57 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] Input: bma150: remove I2C_CLASS_HWMON from drivers w/o detect
 and address_list
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Class-based I2C probing requires detect() and address_list to be
set in the I2C client driver, see checks in i2c_detect().
It's misleading to declare I2C_CLASS_HWMON support if this
precondition isn't met.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/input/misc/bma150.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/bma150.c b/drivers/input/misc/bma150.c
index 0fb4cc628..22feaa8c1 100644
--- a/drivers/input/misc/bma150.c
+++ b/drivers/input/misc/bma150.c
@@ -549,7 +549,6 @@ static struct i2c_driver bma150_driver = {
 		.name	= BMA150_DRIVER,
 		.pm	= &bma150_pm,
 	},
-	.class		= I2C_CLASS_HWMON,
 	.id_table	= bma150_id,
 	.probe		= bma150_probe,
 	.remove		= bma150_remove,
-- 
2.43.0


