Return-Path: <linux-i2c+bounces-12276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E42B2527A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 19:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09C8F625CD5
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1B828B7C7;
	Wed, 13 Aug 2025 17:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="lsWU4LcE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316F228C5A4
	for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 17:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107259; cv=none; b=PFjLkxLHlrY2ZdhqZhmdWStnJmBXHQVa0QUzEOr38eo1+tZBlE8IjXhpzOv7PW81VjZ9FwDtyoCZmGi6Gyhe9k0zJc76i86/cDa6bdnl6I8sztRy+r6Xa+GSvlSg7nD5zTTeK4fULmOyhAtr8H4byOlxfsx4Qp4Pzmsm0ywL/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107259; c=relaxed/simple;
	bh=nisRlxMdlxNBw0kJu7miBzfQrgmKYtOuzeITlICZH2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bItqtVOJunc3rzRDcJTV6gVgC8sBNDeZ7ycUzCT9Mdbqe9Jw46ISO0qPqCTWZFz71nQ0HgoQsQltDExxl/Y4nDxQlMrtgpMZy3EBOVofzaFz/jEhg+4zpPbNh8jxRI1xEKuWC42V6qpIdItrih6xJNpziOFYPD2Njj5DvmbO1QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=lsWU4LcE; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e870666dd4so6609685a.2
        for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 10:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107256; x=1755712056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB7OCoBKq4sEt4VQQvcl3aOmJkQhrsxuhQkNyl7xRNw=;
        b=lsWU4LcE3tyz9SS0aasoM8PuG4+iIDidI4UAAow4D6K8+3iib4hXh/PfQMrkCbMBsx
         +VWHz2piy4F/K8zOyjL4PPSM4PjBH+GjokhrvzXGXAwzKO8L+SYo14Q++jSH2/VRrcj/
         M8JZjQ94RAqmJYpgNa5PM3SJk1T36V/MGjqI6cmX6rW/0c3dpWZdJXILFAxP7xSdf5RR
         ZbusLUke962yAgHFgcn8oMTQN4gJ5znPcja1IwgGVpedcTFKICuk7SyUCrXDKXAbF0yK
         oVEK3IDXKt+mjqBe/V0rUkzY2n/TUkDiYbgjQhUQmYlqX6k1Qm86jIbzW5Y1yNBDgQYr
         ukpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107256; x=1755712056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB7OCoBKq4sEt4VQQvcl3aOmJkQhrsxuhQkNyl7xRNw=;
        b=uLFa2UPNMBox6Vl+xnrW4nY7hBOgH9zubQIXmY4mXMrfDW7LfPbX2FLoV5QWV9hG3H
         ekm2XmkwXSt8RztCihYRGdXL8+i+baFPC6gk+UL1li0tVcSdMTlR8hIujIfzHY/0QnyD
         HGh17g7IiNgemQs59qGOogY4Gkl5vCvGcWm1nzyAwGudfp8ED6CN2yZ3Z9Q6ivk5Q8IY
         3E39t6kFh04v8ebIU8E7HRvtkLFwJ0hJysM0WEIS6OzTl9c8bXh4wgD2UATta8TC7kqW
         tGbP4aKxBqVFsjX/54bYF6rZG/+SJjp5GeSMf2uiuY1zlvD3rc7dEQ+87SKX2TpZwXf0
         GCcw==
X-Forwarded-Encrypted: i=1; AJvYcCXZQVTr6kS+DLkEcoILvLbQI0O6RKktr0srK1uTGT5fCxfOlZwhYlTcf5sy6hvPlBX3WY5B3urHmgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcWO83LfEdkuKND1iSrnpo8V+KVBpQ5pLBe8TkCf/qz/QYc7FS
	rY8OF+8e1C/NRMsBv1nVmHGeEoOM1KNfm2cI44pFbVqiD8mjowPsYhZZw9uaEhvHwoA=
X-Gm-Gg: ASbGncuwaL5rNVexI/X9SdCmAWNBtJZPpe8RSlq2aJSIaoD4mb7llZyOGq3JwGAR/wI
	ZTaWNVHHawtj4FN6FcRuYhR1VCUEWnlepmMrscKbmKhUKWYgzGXWbe2dhbAaPigHq/tF9ICfa8i
	vNhBFs5WvxyusCXZEngnZSxH/nP/VlgHVPKSSasyKxyDPNEVfhqMz1h2eKeTkjhJ8fnhdceCbQG
	EQHZyvA+7ugGliMhGlqQSFWkq0aecrb0uNPUNODhhSL5tey9VvbpcEcl34PZ3158wHA8mUK64Kw
	iJiZ6V+Bm3QpmVsYWwB3K8ltQr0cXmNIQve9uJ1Y0yWcIb/gG7D5x4kKMhwov6F8yx8oWcmOd0U
	ep9kDfYbRzFuUcXRRSglnlyfqj5ey6+xj7bc/qQZvHw==
X-Google-Smtp-Source: AGHT+IEToP13G1zvLikrKvReC+w/kXfMQkt8g35fYQ5sGrJ+PpG+DgIXPbBl9bQ7Qc9/37ctzeq7lQ==
X-Received: by 2002:a05:620a:5e14:b0:7d4:4a26:4065 with SMTP id af79cd13be357-7e870496376mr26868585a.58.1755107255712;
        Wed, 13 Aug 2025 10:47:35 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:35 -0700 (PDT)
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
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 1/9] arm64: Add config for Microchip SoC platforms
Date: Wed, 13 Aug 2025 19:44:37 +0200
Message-ID: <20250813174720.540015-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, Microchip SparX-5 SoC is supported and it has its own symbol.

However, this means that new Microchip platforms that share drivers need
to constantly keep updating depends on various drivers.

So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
could instead depend on.

LAN969x is being worked on and it will be added under ARCH_MICROCHIP.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v9:
* Make ARCH_MICROCHIP hidden symbol that is selected by SparX-5 directly,
this avoids breaking existing configs with ARCH_SPARX5

 arch/arm64/Kconfig.platforms | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a88f5ad9328c..bfea380100a6 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -131,20 +131,6 @@ config ARCH_EXYNOS
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
-config ARCH_SPARX5
-	bool "Microchip Sparx5 SoC family"
-	select PINCTRL
-	select DW_APB_TIMER_OF
-	help
-	  This enables support for the Microchip Sparx5 ARMv8-based
-	  SoC family of TSN-capable gigabit switches.
-
-	  The SparX-5 Ethernet switch family provides a rich set of
-	  switching features such as advanced TCAM-based VLAN and QoS
-	  processing enabling delivery of differentiated services, and
-	  security through TCAM-based frame processing using versatile
-	  content aware processor (VCAP).
-
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select SOC_TI
@@ -186,6 +172,28 @@ config ARCH_MESON
 	  This enables support for the arm64 based Amlogic SoCs
 	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
 
+menu "Microchip SoC support"
+
+config ARCH_MICROCHIP
+	bool
+
+config ARCH_SPARX5
+	bool "Microchip Sparx5 SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	select ARCH_MICROCHIP
+	help
+	  This enables support for the Microchip Sparx5 ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The SparX-5 Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
+endmenu
+
 config ARCH_MMP
 	bool "Marvell MMP SoC Family"
 	select PINCTRL
-- 
2.50.1


