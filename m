Return-Path: <linux-i2c+bounces-2182-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2BC870BB7
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 21:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A1381F22A8B
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 20:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F85947F;
	Mon,  4 Mar 2024 20:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QR/Gzy3R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B41979DD
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 20:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585062; cv=none; b=rd51Fvaa8VZzUY4R2Akz5C25uCMKAumYHIio9V2tuPiOnv3TFxNIdzF0h0saXtbMmHwjoLjVm9YQCdM4ErtZyBujDAzih1lo+o4QuGFnfAgOgKvjRWog/wMjDtoPJJMIxTZ8YcmAF2CsOBzWUk7PD3c8+4MGVg+ypV9EMRu0Sl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585062; c=relaxed/simple;
	bh=GrB6pXjngdsj/Gx8HQpyEs7W96X9FXI8uNKOIgf037E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=s4V9TVFBxOzfJ6SXSO9/Ku9Pjl8/FfPpMH5uuygupgFl9xbx4j8sYiz+gIpxwqBHf4htL+Dg4hNh/P3r5k7GX6e/SMEPLEYU90LVtpUkHldm+xfsgQIsW2yYDkflhi3eD1l8p/frKo5wUlquUKw2t7udJrJ9F7mDBeZFCN1izis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QR/Gzy3R; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so6419072a12.0
        for <linux-i2c@vger.kernel.org>; Mon, 04 Mar 2024 12:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709585059; x=1710189859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uum4DSkKjYDaFPvn+WTNXj6cxf3/eIpuiOXbvtULG6Y=;
        b=QR/Gzy3RvMITbX6IiLbCAIct5M6B3iYuGUC1b8qFr844iA+oFaC+OThdaW8BnWv+ys
         SQ2w60UrgIiEt7efe/eb8ZWBnODqR0CYxtZ27kMfQmPMg1OVKVfcZytLvVWYLIo0R7l+
         SDWCv9kmKmhC3VTp9J/orR73Qqq6fbD/s8rZX+UJmY+fRLeuLYIAvzmCjEmCDmOdUVFf
         T9RRei9Alx1bSXMGrM8mO7qBo3kmawRB8KDjvFRMcd5YmKi0OGujBIMsRBq+QzysMxkr
         DkUStJRg1zAqgXvYPPpIicclVFXp47Nu6E6lJgFO49cYesBZnj/pot8ncioIQ63rNNqj
         jM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709585059; x=1710189859;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uum4DSkKjYDaFPvn+WTNXj6cxf3/eIpuiOXbvtULG6Y=;
        b=DadDNCC5hHqBslfyfKXmh6Xa6mW3bVXtG/7kMC3/2PYhwjWo6REXhmsRw3DxTc1FJ2
         Eye5EgENteRKokX91bZYFUlQNo46Dc9Xz3d1HxUZLfjb6jk+N0PjrS6iTQtLMQ/mCxBo
         2+yuzP/OYM8CFDVjEZfzCAXAaUXBe9aKfiA3IhFNmZVtzi32F15NH3N/gVr6OHdIdzTF
         K+8T74KC+xI3cnILZsRc8aK6xBycH0b9/+0vXSZklySz/3OMHg8VFl85QOshds2J4a4D
         ERhf70f/zSEa80xA5n4IsbwBw4/ayGOyh92hBJu5R7LyHqjyVZfUfeybotJdcMbj2h3h
         FhMw==
X-Gm-Message-State: AOJu0Yy8IoDcSjIaeVFHudu3eqWs7vkeHwMY+/qAk2dbj2Iz6teCGQ1H
	+Rf8NTnjkoEpjq+1+PdcfBjzU20AXDXGWiPexcnhNDxwqio6CZVd8wwtcGqV
X-Google-Smtp-Source: AGHT+IHqAlyLo79FVLFcfvAa5er9Avlu5S+dydnyE6N2nclDWIFGlL1OktY7mt2T3FOWVhIpg/be6A==
X-Received: by 2002:a05:6402:1a58:b0:565:b456:435d with SMTP id bf24-20020a0564021a5800b00565b456435dmr7306947edb.17.1709585058276;
        Mon, 04 Mar 2024 12:44:18 -0800 (PST)
Received: from ?IPV6:2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64? (dynamic-2a01-0c23-c411-1a00-49f1-9fda-4d1e-4f64.c23.pool.telefonica.de. [2a01:c23:c411:1a00:49f1:9fda:4d1e:4f64])
        by smtp.googlemail.com with ESMTPSA id er8-20020a056402448800b00566d7e27dccsm3877563edb.0.2024.03.04.12.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 12:44:17 -0800 (PST)
Message-ID: <d013d57f-bd75-4c79-b829-e19740fa3848@gmail.com>
Date: Mon, 4 Mar 2024 21:44:21 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] Documentation: i2c: Document that client auto-detection is a
 legacy mechanism
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Wolfram Sang <wsa@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Class-based client auto-detection has been considered a legacy mechanism
for 10 yrs now. See following change:
0c176170089c ("i2c: add deprecation warning for class based instantiation")
Change the documentation of how to write an i2c client accordingly.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 Documentation/i2c/writing-clients.rst | 32 ++++-----------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index 41ddc10f1..ad4247414 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -48,10 +48,6 @@ driver model device node, and its I2C address.
 	.id_table	= foo_idtable,
 	.probe		= foo_probe,
 	.remove		= foo_remove,
-	/* if device autodetection is needed: */
-	.class		= I2C_CLASS_SOMETHING,
-	.detect		= foo_detect,
-	.address_list	= normal_i2c,
 
 	.shutdown	= foo_shutdown,	/* optional */
 	.command	= foo_command,	/* optional, deprecated */
@@ -203,27 +199,8 @@ reference for later use.
 Device Detection
 ----------------
 
-Sometimes you do not know in advance which I2C devices are connected to
-a given I2C bus.  This is for example the case of hardware monitoring
-devices on a PC's SMBus.  In that case, you may want to let your driver
-detect supported devices automatically.  This is how the legacy model
-was working, and is now available as an extension to the standard
-driver model.
-
-You simply have to define a detect callback which will attempt to
-identify supported devices (returning 0 for supported ones and -ENODEV
-for unsupported ones), a list of addresses to probe, and a device type
-(or class) so that only I2C buses which may have that type of device
-connected (and not otherwise enumerated) will be probed.  For example,
-a driver for a hardware monitoring chip for which auto-detection is
-needed would set its class to I2C_CLASS_HWMON, and only I2C adapters
-with a class including I2C_CLASS_HWMON would be probed by this driver.
-Note that the absence of matching classes does not prevent the use of
-a device of that type on the given I2C adapter.  All it prevents is
-auto-detection; explicit instantiation of devices is still possible.
-
-Note that this mechanism is purely optional and not suitable for all
-devices.  You need some reliable way to identify the supported devices
+The device detection mechanism comes with a number of disadvantages.
+You need some reliable way to identify the supported devices
 (typically using device-specific, dedicated identification registers),
 otherwise misdetections are likely to occur and things can get wrong
 quickly.  Keep in mind that the I2C protocol doesn't include any
@@ -231,9 +208,8 @@ standard way to detect the presence of a chip at a given address, let
 alone a standard way to identify devices.  Even worse is the lack of
 semantics associated to bus transfers, which means that the same
 transfer can be seen as a read operation by a chip and as a write
-operation by another chip.  For these reasons, explicit device
-instantiation should always be preferred to auto-detection where
-possible.
+operation by another chip.  For these reasons, device detection is
+considered a legacy mechanism and shouldn't be used in new code.
 
 
 Device Deletion
-- 
2.44.0


