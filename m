Return-Path: <linux-i2c+bounces-10409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AD5A8B3A7
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3F9E5A1941
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DB5238D3B;
	Wed, 16 Apr 2025 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h402Z1mg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EFF238D22;
	Wed, 16 Apr 2025 08:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791754; cv=none; b=OeC6bDrPdpv4Dt+x/cNw/tOG+Bk2gSdxut5otMVUb6Bnw9DZfGqERuZNurclF5hUzQs0J+kpO+M4znWIeA4jiDdK7u+2Y5xMJwfGkuKDVlDo/aM0+NvGZ0qvLKGejkms3Eb+VYqxCZnSoK9PNZItMGaFVzxR4HGh7l+gmVDhgVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791754; c=relaxed/simple;
	bh=BmJUD5nwuKvbGTiRZP1tJM+KAwHk7jBLkGQf5lDJmTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uE1OLe9xgqgGxnUtcaEv0mlbxwpxd+da+2eG8qTxcIWxw3RKAyGSm6WmSSJ5VXrB6rsh8OX/bH9eKLPUYUp+vKoe4EUwzIq4m7EmqFWoDTWAddo8Yvfe0a6LmGmepcCGUsBQhER/guPsKgShY5h0AbyWPmYmi/uXAG5Xw4EOUiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h402Z1mg; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54996d30bfbso5786646e87.2;
        Wed, 16 Apr 2025 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791750; x=1745396550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAQfuUf83ZQ1MK8Cm8aM+n8tf7t8e38c8JTgiG4heGM=;
        b=h402Z1mghE6rwGF27acZgYjSQezkuYxkTuoCDnkLym9LZYzlkFYAWVQ8/OxUbsfGI9
         Hfv7SbEfSE3yXfr3hC5TaZ6Govlcima+WHB74iVEp8OX7lDctZZN9SDslEMVuOMz3rCQ
         kPwCfxFBk2E8J6q0278YK8/l/IWpkUiucLDY9WUIs7VhhplGeFErt81eHCKHkoS9IEkl
         QNqfFmF0bY1m7386Bu7690Gp7jfFSlclhsuurIwlVkMI+obr7lxpKItVQdlI9jgYrhnE
         53/3iX7dPUJn2reNDgFEa1PvTR0haHu5kWuFHWsbluZ8DfEeakuXg/U7meSttCvWKGhy
         aRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791750; x=1745396550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAQfuUf83ZQ1MK8Cm8aM+n8tf7t8e38c8JTgiG4heGM=;
        b=Z/aUjKt8Ap7bHh2HpBMlWhDwryZx97yY0A6itAUrjxMYL9OdxyiUPsinJdOEHuMglC
         ExO7DbeH0f6cVqmmiqAhRRqlkOrwSz5d7E+O9rMETh4+IsRLU/ySBAZNoLowsY0PUA+3
         KmJJUpG/V0uDF3gWFL/IYnetb6+xJK+82yuohaqYZT8LtQd+pRLInPoRbMpdHd/jjtSS
         C0rXDyRz8c2xlUOhF23AADFZHhvtmSWUfIvAz+wvg/mbY7Zmj4iNfi+BLFv1jiPxuoe7
         3pkXwzqmOpCRjEel5B6MPMEjbsOyIU/rDr7QDevbrXcP52jNJPcSeHrtvCtpIkahHt7c
         YUsg==
X-Forwarded-Encrypted: i=1; AJvYcCV9Fjeo3MxmagCs0qZVsKVBq76q0baBRCwz2J6cKCAHLsm5G4vDrfGDWd49s4vwKcbTh1qfAlTQoIjY@vger.kernel.org, AJvYcCWMLLLSK3zVaaw0RR1mAHMFCCFVbGhpsEDEd3+YdsRsfljMpW7NnAGh571lnPcBYHc6IpSm27kgb7vj@vger.kernel.org, AJvYcCWUehb+6r8zI0wm4XZ4pLN+y1mlvQ0Lc/wo0HFRUIEVrvurpvTM20tEULlkLQDZMLllDqnK2Br9Q81S@vger.kernel.org, AJvYcCXP85PgKU9GSBO3UlS1zfrbVAoKaGJ+IF+HGD7yyH6xqgWo7+lcBSzBOFyC5YACY6nS1uxkcpQ6@vger.kernel.org, AJvYcCXTVtkCSkBW6rDHxNBTmXkKwz2fTqphQeuGTSOgJUSUk8RnpFA4igB1LQciHjeSBm3RGZc19Pd6X2GXPABY@vger.kernel.org, AJvYcCXhvYMbwjg84WuqvdEzuuZu9ss3tIyKGAQrxPlTCViv02NTMWjVu8QD7MelYl2eRr1qC6xC3ETqTX8X@vger.kernel.org
X-Gm-Message-State: AOJu0YwXWkAMWE4VXGC2p1Kh1EHIi/PHjGQe8lkUQR8Ofl1oZRDrbx+B
	h6VkWJG301ceqb47rbjbQ3fZ3Rya3yTftD+mSe50pFIw54/Wkm9R
X-Gm-Gg: ASbGnctaT9005H4EcqZt2to5SQ/11dVjoE9tzRvo97IcxNw6HQkGHns8g5nA+bVXX1P
	LeKgJ4XYpTwwM72LpryfDk1UyL1wvYYgmBWyHY+hY7kACS17YuGl80+yEtk3od0XuRGQv49oJ3A
	/uNoAk1y1HzDP61BxPSj3Wo+eiqZfxK5+0chs/0VGSoV/lLcYS9gEjuwnFY+E3keUOyt+QLAskq
	5taP0hCLNaktRnkupUB1UjuJlqDVeuk6lpZxGt9OwsWJajYnm/h55QxCIlL+cPE59IruwO+m6ib
	2CaiKohR0056KL4R+pI8gCKlTR8ZoAfi5IKQIR4l0KR4HcCgE04L
X-Google-Smtp-Source: AGHT+IHptCVJ3TcfVK+g8FtWiw6bqjgdng7HMYdACiNudswsAqCBHy7UbnLsHd9iDozfeXymfzbCSw==
X-Received: by 2002:a05:6512:108d:b0:545:2fa9:8cf5 with SMTP id 2adb3069b0e04-54d64af4268mr299099e87.49.1744791749775;
        Wed, 16 Apr 2025 01:22:29 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:29 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:34 +0400
Subject: [PATCH 09/13] ARM: dts: vt8500: Move memory nodes to board dts and
 fix addr/size
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-9-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=5773;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=BmJUD5nwuKvbGTiRZP1tJM+KAwHk7jBLkGQf5lDJmTw=;
 b=B2fRvaOMftmj6JqZFXsv8NqfER23Z4+7JRZ0onR49K8P7sVtgran7RY1mUTl9T4YzngyYido/
 kkWuByJssLDCrVaUq082RnJYMgWkWQmC0+kspWxYA7p5fGHYZ/SlhTT
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoCs don't have on-chip memory, so their memory
nodes are better placed in per-board dts rather than per-SoC dtsi.

Move them accordingly, and also add correct node addresses and
sizes for each of the boards. Some boards were also available with
more memory than included in this commit - those would need a
separate DT or an appropriate kernel cmdline argument to reflect it,
as the bootloader on these devices doesn't handle DT at all nor does
it any runtime discovery of available memory size.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500-bv07.dts    | 5 +++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8505-ref.dts     | 5 +++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8650-mid.dts     | 5 +++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8750-apc8750.dts | 5 +++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi        | 5 -----
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts   | 5 +++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi        | 5 -----
 10 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500-bv07.dts b/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
index 38a2da5e2c5d64477f04e1da9d98cb97be0d95e4..c8c07c2b4acf92e977704437de88550391c8679f 100644
--- a/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
+++ b/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
@@ -10,6 +10,11 @@
 
 / {
 	model = "Benign BV07 Netbook";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 1138940ce16cb8603d196b6e935d54df53b9a229..143daf983d1d926c2c837c43002d1a86cff3866a 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
 	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8505-ref.dts b/arch/arm/boot/dts/vt8500/wm8505-ref.dts
index 8ce9e2ef0a81097e7143a5392ee5b42bf8028ec1..d4ff99c700120fbf3401335168ed88b190335005 100644
--- a/arch/arm/boot/dts/vt8500/wm8505-ref.dts
+++ b/arch/arm/boot/dts/vt8500/wm8505-ref.dts
@@ -10,6 +10,11 @@
 
 / {
 	model = "Wondermedia WM8505 Netbook";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index fa76df2830c79a695753c85397d4e916592f6a51..69d2351a81dbc816efd19ffe3ba5ef80eaa4e9dc 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
  	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8650-mid.dts b/arch/arm/boot/dts/vt8500/wm8650-mid.dts
index 7977b6c1e8ebf215df210dee703e470b9159d329..bfc570e80073d5e6907978dfc5d2413e1ceb2983 100644
--- a/arch/arm/boot/dts/vt8500/wm8650-mid.dts
+++ b/arch/arm/boot/dts/vt8500/wm8650-mid.dts
@@ -10,6 +10,11 @@
 
 / {
 	model = "Wondermedia WM8650-MID Tablet";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x10000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 5b6affda3b6b8d8be9f3100b36cb303d015f19b5..deebe9b933876bc1eb188f82ce8c1c17098d04a2 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
  	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts b/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
index 136e812bc1e498d48c7fc61154bc66a48888b117..72d633bedff04401c40f4d3772fbcfe45e1c0e31 100644
--- a/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
+++ b/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
@@ -11,6 +11,11 @@
 
 / {
 	model = "VIA APC8750";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
+	};
 };
 
 &pinctrl {
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 14e1d4f7c093a8ae9cce5acfeba3755f6df93a24..bde825b59074eb74af4ab296895a3968e992aefe 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
 	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
diff --git a/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts b/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
index 5d409323b10cb94a5694722de1e31cff5be390ce..eb16991a2cccf35da23c4a0a8ac2ad02665b2109 100644
--- a/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
+++ b/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
@@ -22,6 +22,11 @@ backlight {
 		brightness-levels = <0 40 60 80 100 130 190 255>;
 		default-brightness-level = <5>;
 	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
+	};
 };
 
 &fb {
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 3f4a514d65e2ac7658b73cc9c4f3cae1407265bc..e8385c03e04bf5644c86a85aeb41e1cc1eedb202 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -21,11 +21,6 @@ cpu@0 {
 		};
 	};
 
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x0>;
-	};
-
 	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;

-- 
2.49.0


