Return-Path: <linux-i2c+bounces-11788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F96AF61A8
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810091C28524
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08F531552A;
	Wed,  2 Jul 2025 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Va0YdXqd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A46B31551E
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 18:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481615; cv=none; b=jgpZeMBpb0TLrsT4DnnP/iFek/V9P8uL9cpvwiuuqiAPFM/AEm80d8ARfN8E5jPgi8Jtqb9IefG5VMAYJY3HU957genUs4KsgpI4eYKeFYMEZcm8ePfDoxcCRye6d4iOeGGXkpWihb9E4qixWOcZpqNbZyGZM+p4vdcZZ1yj/mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481615; c=relaxed/simple;
	bh=Cz63RwNeleL0UIjH6azz0oQ3j2RQxKtigND+2Rg8ZE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxKZEuoEyHeeaOMRnebprsD37yom9smMEPB+IHap2B5EP1fbRBr0loeI7jx5WE4vHDHFS5PkcoaKg0zlRDbK/TBxDeiHQohxoPOpwVwqAc/UCwBIab6z4f8D6BOP6zqNhHscq4v0+mXALq4Fshwpu2P6KYyx4DtlBYybQchm/bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Va0YdXqd; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2363616a1a6so43396655ad.3
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jul 2025 11:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481613; x=1752086413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLgkgM2dsMzuH/fyTk3FJbcZgyqMvTqyvvSzdaeBl9c=;
        b=Va0YdXqd7Ix0e8Et2+b4uQKK8bYPewjZFS9B4xkIe/yC8TrKnqu64lE9zRKXq5IS+j
         MJC9Kre+ADc/I1UNLxUxqIwZMYx3ky0BYiQLgzPLxUrxyA1CbSmU0yEgNbjdv8HEYKiA
         UbxcgRny46t1PVx3PhdNzHQOqgLrJLdopipxzgEIadB/AjlHEa1WnOB+JUVLqldlnBnv
         b+eipirIyAbEFfkLAW1iBk75Se+7NHLsHcoXNMupYN8qzDyaMcZxuHJyxX38rmt6ozDl
         8qQFlURzt3vua6+NZNRFnI1WSMw4vAHFtVJI2ZPrUbG+v3+tzT43DxO0j8Kojtir5STe
         VtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481613; x=1752086413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLgkgM2dsMzuH/fyTk3FJbcZgyqMvTqyvvSzdaeBl9c=;
        b=ZW7M977ARHtt99MQ8ClE+JyV+fdj+qmNT3HcWJwR1hdlhA4B2BaaO26qGHWnUMn1br
         rDKWh1bx/5TSkx7OojLEhO+TDC1/atI8HQc/qoiIfR9lueFxCPj2NyYTgtC/uB6JvLKn
         UBaPES0k10VkG4YtXDo91OM5wuBWDgVnPrxgZbqfKVj1WIImxSvedgunQOCtSNjMo/cm
         MQNd6x7Bdw/vrJRJjgWzlW6HnxFcKJfi7KNZzgwvvF1I8WZJ8oipYMM3WuiJK61LNi69
         iLoFKK2prDY6QV0bF1GdA5Fqq/DiAzH5m1EucV+vKyUQVRHdvyHAe0uyEdYmi7PUihk3
         R8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUL9SAbiOKNU5upc5LQKwkttakaHn4JXRdfl5DvDEcQD+k8uhbH7m5Inu6W+7sKHEGURLhu7jBYf0A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyn8z+U0w/QunHdluI0an6sXIKCj4a77Ult7srvEv8q/RUaq6K
	n0aIeMozNfu0iB9bfgkh2F1NXpyQIuXU7sMF2UCdrfp+tebfzA0gWfJszMBCk8yZuQU=
X-Gm-Gg: ASbGncv+8BIuwg9tq8xcE5ep9P/MBpdDA2nwXOLRSF2jhkktGW4pf6uI5o1JR6cuBNO
	GE4A3CfaWfWWOD2QYCke9+vVSWg5aIIgUgUK4Nv5q1uqCJrAZ5ixT2/wqnvnnZgY6XSEGr56mfQ
	dRS6uHPlpK0Tte7B7DjaDd8lhgY4PIR8yIc4HGhb2FEnYflNHR1J/zjM2OPW2KMHBpqL12+P1tm
	5gNPOX/yv28wlA0dq9IsYoooQqzPLY4ycZcqqFyqH5luLSVroAlpTROZgCoMJ6PeBxrw501NAII
	ixd6OOxwVBGX5lBMI3OA/VaD48NJuSb9wyDPjPDAJXbIMrCbbi+LLPWiBKJwwYoRc1xWvJ0ZBTh
	sd5vSg7FVlUA6o1mmTyqD+UA=
X-Google-Smtp-Source: AGHT+IGIKE9F8Co83/dHlUj/BJjldce2wZ+yTKPm0xGwC9EdJvNItuAvUNQ8nezHwuOa2fWnkwRauw==
X-Received: by 2002:a17:902:da88:b0:235:880:cf8a with SMTP id d9443c01a7336-23c6e4ac48emr57113295ad.15.1751481613470;
        Wed, 02 Jul 2025 11:40:13 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:40:12 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@armlinux.org.uk,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 09/10] char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:07 +0200
Message-ID: <20250702183856.1727275-10-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the Atmel HWRNG, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/char/hw_random/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index c85827843447..e316cbc5baa9 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -77,7 +77,7 @@ config HW_RANDOM_AIROHA
 
 config HW_RANDOM_ATMEL
 	tristate "Atmel Random Number Generator support"
-	depends on (ARCH_AT91 || COMPILE_TEST)
+	depends on (ARCH_MICROCHIP || COMPILE_TEST)
 	default HW_RANDOM
 	help
 	  This driver provides kernel-side support for the Random Number
-- 
2.50.0


