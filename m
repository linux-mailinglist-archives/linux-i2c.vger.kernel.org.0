Return-Path: <linux-i2c+bounces-10412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9732A8B3A3
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2F7E444F32
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BAD23C393;
	Wed, 16 Apr 2025 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZP6pCCw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F73023BCEB;
	Wed, 16 Apr 2025 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791766; cv=none; b=X1Zdeujm0foANeGcV4jji4P5c4/YXBh2FPpoU/TApGuIj0j546O0UuAKaC7BjlbGWuFvHlgPLd0OU9UV2sVnjNgT3wZ+EUNN45/C1vOHIyNzuNFH3wxD4vX9/RH3DIIr1XNA4IYzGkREybWrexUdiKjIO3VyxNxMwajMthhHxE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791766; c=relaxed/simple;
	bh=TZ3ytEYMytA7e0tV+PnpKqiq4sZdXQ+N8pRmsK98hNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwYgVNM64QSYegXydTMeqQ77RiRdvthNTVrBEl46lKKCGgh/n6n+CsTbWsjO8w5AnXV6JfZQx04DJA+SbsxlRkq7MesWGvFGXfTV7r+zgLI9cXtdX5Rae3qkXZfsgSpV0zTyOntUkso8fCs5FAEay/2GBr55J/9aXjADs+azEA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZP6pCCw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so6545545e87.1;
        Wed, 16 Apr 2025 01:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791763; x=1745396563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FS5uPP+ij9oewaAABDY8TZe9TR0+Gp5xre9Bn462Ac4=;
        b=AZP6pCCw608VcuupntZMrFeu620sGWbnUg7v5HVq7T+2gNosVG0ALNGKNl8GzP09e3
         TsczxOkihFjCH2BecGMCrF4sMvFcc6tGPbExo8ue0NrWBvilZ6uXFoGmokiXNClfHslG
         N07et+gyG/t2APum60aF8qIRo8zmCzvlUCv6yogFfV43ttE8cNoy/Ci6QTCW9zEunZP0
         wGDMxq9TreMemg0feABEz7NQyiVZP6TSNtbGorsKff8hz/yIZhOFQTi/XqYNqEc3BnWd
         K2F7qXtvWKrhq+fRKfMJG6QOklYKCg/yoDsc02EbuSJvbfRdvPy64ONLc8tDo8WnFklO
         cCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791763; x=1745396563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS5uPP+ij9oewaAABDY8TZe9TR0+Gp5xre9Bn462Ac4=;
        b=swJE6v7+IHq0duGA+d373+bLq/f/JZpkK68ZUciaU19mvZTHBT1fwlzd/u29HCleQz
         OxxQPcvBANAnJ3vc25iJPs6hCJOgclsNU1MKd1qIJuYiMS8QjkLfQD+H7TdWNIlUrxxn
         4eCDu1VRCM6FLfaxd+qAWEA6Ic7WpsgT7dEZDDceO5aqcaAM97bKJzN4pmMo1ACZn3sg
         htbrF+XNMiP9K48sDTKMU5KHNWEk38Ip/vsexqUbKvXt9pNVXlrv6JBA2VujGiNqsqm3
         3Po/ayJUuSQ2IaeP8+xGJSHh5jfLHUgn35X+QLSnQVKoQJY9zeHQGtCkeIztT94RRMbq
         rYhw==
X-Forwarded-Encrypted: i=1; AJvYcCU78qXdONCJ2BpADIF+TQJ/Ia6XbfkT76wBDnMV1TePYLR8kZ16qOMj0bed9rlBehTLAhTjfLLylUGvTwHs@vger.kernel.org, AJvYcCVaq5jBmqbB1yf6TvNpLSi1/Yvi1sg026sO9DRUIrs9K+cJFtVqzBVk0ztYBZTDQXzUHzG6cDRzJ4/B@vger.kernel.org, AJvYcCVxzsA6/6iAieEaHcXunZNQ7vquxGm3gzT+FPyc/5UkJvQkNU6ZSPYen4fq0ZH5LO+RK3/q8bfS8J/b@vger.kernel.org, AJvYcCWTv8EXgzU+okXLNJGxmyh8D1cnVL3DzxVyhlQ310Bzy2z5QHQeyOoAz8LGqWjdxEA6BHqdvMs0@vger.kernel.org, AJvYcCWU+h35N/BSqn9w8Qt/tTxfASzNVoC6tbkdJPRBtkKeLUoG3l15SzFoJBFBaX7FGLn2LrZcxa8zXr1a@vger.kernel.org, AJvYcCWbrNs2iumouTiV0gV5L4QfNzqEoW1kDxZICC/Ro/Q+/uH0KdI9jgA1PusYpSf2cWsmAVXQUAm0XbUk@vger.kernel.org
X-Gm-Message-State: AOJu0YxHeJKt69DlOfhgQ4HA+aM1smVI6Zbp7qV3JU6r277KprTCZ8+O
	wyF9kiFh3W2atfvIbuL3iohpnLx8l42rtObqzEXHwtv5/MFyPQQu
X-Gm-Gg: ASbGncvV4A5nETCDDOHSjNmljKcZuHgkjx/OC7fajVmOARJIASSHUPfJowmVTSJBuY4
	0vkOl/Gv1k8YNaHTdAWvnkt8ynKxaW4O3LvB1WMWDA70PLOTYDLjZK2vpXgSSglPyaPiYo4MG+8
	7iayIse+IFRnF6yYohe7npoA5DJGtUIK9W0TlCfCJV4qD/SJoxp0OFaSAKDCoOiojCk48XVBP7y
	Wz9qtLbgEh8p+uQ6pQm46EPB5gdTZPPd0J1D+m8EC9Sj8qIqw48IuKAl2RvruHQj+p3C/QGf9Q4
	u7ZpseIepZv8P3YvALeCo0PwHtbfX7pA2iYltbMif+gg1scAvArP
X-Google-Smtp-Source: AGHT+IHPeVBmX5Vqd+spNUAWjSoBPV5YuATnfOQvkQdVvOGLDQQOmBTgQaBeDe7nS2HMTs/0Pcb2LA==
X-Received: by 2002:a05:651c:158d:b0:30b:f924:3554 with SMTP id 38308e7fff4ca-3107f6ceb59mr3528241fa.21.1744791762861;
        Wed, 16 Apr 2025 01:22:42 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:42 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:37 +0400
Subject: [PATCH 12/13] ARM: dts: vt8500: Add VIA APC Rock/Paper board
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-12-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=2596;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=TZ3ytEYMytA7e0tV+PnpKqiq4sZdXQ+N8pRmsK98hNw=;
 b=HD3p/YZ1dwkru1Tiqb4TUgeiFPeP70kS2kSj0M4pn2zzpXtTY9j+s8Xw5YZ08y2qcMhKeKIXl
 Lq+cku1FuBYCfdxA5yTGL410gTy4b/dKbiVUfRlvJFNi0ZVjNnpVXHq
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

APC Rock is a development board based on WonderMedia WM8590 released
around 2013. Paper is the same board, but with VGA port unpopulated
and shipped with a recycled cardboard case

Its hardware includes:
* Single-core Cortex-A9 CPU at 800 MHz
* 512MB DDR3 RAM
* 4GB NAND flash
* 8MB SPI NOR flash
* ARM Mali-400 GPU
* HDMI output (type A) capable of 1080p output
* VGA output (on Rock, but not on Paper)
* 2x USB 2.0 type A
* 1x USB 2.0 OTG (microUSB connector)
* microSD slot
* 10/100M Ethernet
* Combined headphones/mic via 3.5mm jack connector
* Half-height miniPCIe slot (with only USB 2.0 signals)

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/Makefile            |  3 ++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi         | 11 +++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vt8500/Makefile b/arch/arm/boot/dts/vt8500/Makefile
index 255f4403af91c1d6a22416ab694b8eab44bf98a2..c5a2e57d53af4babe40fe2d79b2f8d9c1ae1b8db 100644
--- a/arch/arm/boot/dts/vt8500/Makefile
+++ b/arch/arm/boot/dts/vt8500/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_VT8500) += \
 	wm8505-ref.dtb \
 	wm8650-mid.dtb \
 	wm8750-apc8750.dtb \
-	wm8850-w70v2.dtb
+	wm8850-w70v2.dtb \
+	wm8950a-apc-rock.dtb
diff --git a/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
new file mode 100644
index 0000000000000000000000000000000000000000..58b3c8deb4f20ae072bf1381f1dfa5e5adeb414a
--- /dev/null
+++ b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Alexey Charkov <alchark@gmail.com>
+ */
+
+/dts-v1/;
+/include/ "wm8950.dtsi"
+
+/ {
+	model = "VIA APC Rock";
+	compatible = "via,apc-rock", "wm,wm8950";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/vt8500/wm8950.dtsi b/arch/arm/boot/dts/vt8500/wm8950.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..31fba05d3c3e70b21a64d08b5cdf645102a1faf3
--- /dev/null
+++ b/arch/arm/boot/dts/vt8500/wm8950.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Alexey Charkov <alchark@gmail.com>
+ */
+
+/* No differences have been discovered vs. WM8850, but chip markings differ */
+/include/ "wm8850.dtsi"
+
+/ {
+	compatible = "wm,wm8950";
+};

-- 
2.49.0


