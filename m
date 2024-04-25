Return-Path: <linux-i2c+bounces-3158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E128B2A3A
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 22:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DA391F23E91
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 20:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15244153BD7;
	Thu, 25 Apr 2024 20:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPPh+HiV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379C715219C;
	Thu, 25 Apr 2024 20:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714078645; cv=none; b=Q7ciWxDS/j8B07IL4E1OLiHBuGXfyAmBpMFa3CAKfzjeCbiq4CYaK6nO+JaURXtgQyXRmhrlG9EAaUBJG/0A/AD14nQjBrKcCsapnXh/WZdSTDx749TJFXeuhZbDWUqyWHUI9pRSoEuyn0zH6IQCXeBWoyInUV0kSgRLaRLbIU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714078645; c=relaxed/simple;
	bh=WPYlnE+hNg5P4S2iXmkttwM76EGDTD4Hfo0AwPdBXBA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=H3RvayXCzol01eknc4G295O4BRbaQP9L/USCMGUORUv3pW/nhJrdfYa89O5Uz2qCeksaJudz3pKZV2kXqEU+0NzHzmZVem3HMD7yBO+LhY4NI/oX1jhTxzAZdFCxUR6/inP87tZOciOOorMX3U6rqkAzmS8X55XI8oxjccZSBWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPPh+HiV; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2a54fb929c8so1060846a91.3;
        Thu, 25 Apr 2024 13:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714078643; x=1714683443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=49/edVYlCH6Tuf6dpDy9NI6ApUHrS0u2RGrhfRekKmY=;
        b=TPPh+HiV0eQzielAcu6jBpqKHLjdcR5fVe58bZgXJ8rybhscqtUxINRaFd1Ev6fcme
         odeWnUhQGeT/+iSSMtpZ8PDB4Vjn/Dny8mCTD96gF+4tSDPluEg/uhNACxHj4BCGi8px
         G2eHGPlfPaFg1fH3dIRVPMbS2Vvqh9gMwr3LgUzr3ZbNqD4iWRgpw6QzoGoO5FcpGpkr
         Q+BUVs0LOt/fFHlQKlZqTZo0NR/8dOofnnIEXUdVmTdLp0ScQozgx/RzWGjq5LsBiwSG
         j/MYylhcYYtOEaRUCitwhbQ4oUtE3K3KoL6x9cWcJDKrHy7O7k5q7tTCQ3yJWakIKGaB
         yHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714078643; x=1714683443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49/edVYlCH6Tuf6dpDy9NI6ApUHrS0u2RGrhfRekKmY=;
        b=pruiSZOi4MLkte8+MaOXRc4UzwlPCilY4VF8n0kTjnnTynikakjtpjg1Kq8u0VZB3L
         46055W2XmkvYbT3HNpWkOidMCCFc+WtDpIZRoajEx4LRpMu3Upmw0dgmfOKFqhs/uSta
         gdgeCAUB88YO4pyYeVi3P3A4E9TsQspSWpST9lWHWwybcF/6unVW+vf8wu3w4hEqQr/l
         3QhbMgJ4v8buj1BefZ1geywawmWWp532ZQoghEARZfu/u3oVWbP0temiViJbmxoBed4W
         xaWZmHvRpO1pi+FjRKmWAMrIUceKWWztGtomYw5tWenPDnvNSH/5kdcSJCP4ltmsgNVC
         x22Q==
X-Forwarded-Encrypted: i=1; AJvYcCWc7Njb8rX9SXBA/n4o7PrutJ4sEex93E1s5yMYXAolFunscQWz7uyMxm2rP4WkMMPn5CzT/9JASjm9zxqvt0yGYOVrpaZbu2Ghls0b
X-Gm-Message-State: AOJu0YzDr/PyYM9AnmUpu54nhuE04l1SroLjQ05krttZX731tr0OxpgM
	BjU5uQXIpszSEC3+KG0/cm7aNKm2XvQVFi4jd8LKAF1NLYi62eWm6MQ94Q==
X-Google-Smtp-Source: AGHT+IF/2VEYOo3TrERlDS31BzFeuJQwjxoq/wNO4pp4h6iAmPh8pQJxw3YVsGJDktw1/TZn9QRXzw==
X-Received: by 2002:a17:90b:1988:b0:2ad:f257:a678 with SMTP id mv8-20020a17090b198800b002adf257a678mr796417pjb.33.1714078642764;
        Thu, 25 Apr 2024 13:57:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090ad35200b002a54222e694sm84837pjx.51.2024.04.25.13.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 13:57:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-i2c@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] MAINTAINERS: Drop entry for PCA9541 bus master selector
Date: Thu, 25 Apr 2024 13:57:19 -0700
Message-Id: <20240425205719.2536971-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I no longer have access to PCA9541 hardware, and I am no longer involved
in related development. Listing me as PCA9541 maintainer does not make
sense anymore. Remove PCA9541 from MAINTAINERS to let its support default
to the generic I2C multiplexer entry.

Cc: Peter Rosin <peda@axentia.se>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ebf03f5f0619..652cce499273 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16799,12 +16799,6 @@ S:	Maintained
 F:	drivers/leds/leds-pca9532.c
 F:	include/linux/leds-pca9532.h
 
-PCA9541 I2C BUS MASTER SELECTOR DRIVER
-M:	Guenter Roeck <linux@roeck-us.net>
-L:	linux-i2c@vger.kernel.org
-S:	Maintained
-F:	drivers/i2c/muxes/i2c-mux-pca9541.c
-
 PCI DRIVER FOR AARDVARK (Marvell Armada 3700)
 M:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 M:	Pali Rohár <pali@kernel.org>
-- 
2.39.2


