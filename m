Return-Path: <linux-i2c+bounces-10410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 451B6A8B3AE
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A965A3413
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8A423A980;
	Wed, 16 Apr 2025 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvJngSQh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327F923956E;
	Wed, 16 Apr 2025 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791758; cv=none; b=uqnTzXSMXbM2JKe0hXO/YIxc3ebklOyeEdLoe50f8b5kkBI5JAxv0K15BizbI2lyVdG97XUgo4mkAqDRK/HDIoKMv9BFLbjk7ZZ9Q8VTQZxSf8vhTnScGdWYSiuSwSk7kTaQtzbBvClNMHEPAeNznL4pznsDrnrEnBDOp90Eq00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791758; c=relaxed/simple;
	bh=sXBBymomR0aMqR41BnxGJR23ORnc03EabD898mjy8I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HJaHXrsxaLvKPvxYrZ4byt8wELfv7XbTINMwxToERNBMHKztK8W9dglnvnewMn8B2H0fjGukUXMTpTgWeEseWxxpbKJg3VWauBHcjo7TCiJRM/G7bCZS3w8oV84VjfszKdm+uWH097FmhfdIXAP8WZWH+yZgF5IAI+ZFyu8c3sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvJngSQh; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso50235e87.1;
        Wed, 16 Apr 2025 01:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791754; x=1745396554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2St31bPcYlMznkhjWLvtUzdzjZa/jmylV06mo55Op4g=;
        b=AvJngSQhkVXD+rC+TGw3sJ84aogjDUx5fzrnTHztvZkTbJbbv7lr/59x/VrIEPLVdx
         FPG0M50X8jTSaNVCXesJeUwn/ufjapVhSib5ZoFqe8Ayktpp0G9pwMXQdIrc5GT0O2is
         uGHy5H8DJTS4gzVqUcocooR+cEev9PjnrJZfHXZiJ/S+Yh578nfrgvL3a2Zk4gPm5byW
         byGTNjoXUCNyNC4TBNhZTlgRiTsHornCQb5q0nAGb0vMqvnDeZGiZaS3C2F/EsiMpYc4
         Qq0JkxlaPuOCtJvvl3qBvQZkhIRyD3RASjgXBtWHptYgpEgx3ukwJWCSuI4n58Pjewh5
         Cd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791754; x=1745396554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2St31bPcYlMznkhjWLvtUzdzjZa/jmylV06mo55Op4g=;
        b=XpAEMxeOKP2T72u3snAHcxoGzwpRmZUN7SpqwWP59OiD0We52zmtLRxQH025ezbNuh
         qg9krKl/H7MZS7U/efn3WmxpN2/yvteMF2PX1qAXNIghzbMdjX7rNWRBrWWNgvWZ0uVy
         2Vtops4iuI6f5NoJVHipf3353xKIuxMoZeLXcgOD3OUguKZ0UmIvWLvrfXKymw8Z+15r
         Mj2+8RXJZp7oEb5LkJ3LdsflCifwIS1J47kU+Lg6jRDYbHAjaOK08VAX4bHYo78eDfD9
         ALxMS40pmLnQv3QzXN+ROvagnMqR4ZbcwvQgVW6INRmfDPpKwMw97VkA/HdrvkPtts3o
         eImw==
X-Forwarded-Encrypted: i=1; AJvYcCU5qJxNGR7hGgdZjQjxrseYP5OstndHbo5dREhddQEDrHiiAANmRqK0nB5pI2kfPkVkysiyYd1+@vger.kernel.org, AJvYcCUnLwNoaU4Zx7WKnFLS+kOeIjFe5Qt3Vb7b8co7wdlFNEApx6W/FbCKu0YUShf/DMeP2Nl3YhJSVwtq@vger.kernel.org, AJvYcCViXJa8cWqy0z/gtYG6G6vWXkEx2pRoe2S91lvWA/R2G3AYDbbjROb+sPCIVtKrGI68aa5R70cEodgxHutW@vger.kernel.org, AJvYcCVwp/d12fFBSyDEK0TjNoJTaBF8w2eZQhJbXynkHLAsHqw/YYB9KLY6R2t7Jr3SpUZD0RySWBE5Lwg9@vger.kernel.org, AJvYcCVzZz+pqHocjAXJ4y5+3b3DaTbVQ/qJSHnLHrb6C5wXsedCSkm4hVNHFqVgIcTYGdMYgB5bSUjl3VVc@vger.kernel.org, AJvYcCXaav/Vg3C6MoGZSusA/RVdmVyFB89ZIQQiC2tuKIVWIecdnk363xaXFBSh0b1KouSh7kwtr6MjWQhu@vger.kernel.org
X-Gm-Message-State: AOJu0YxbH/IBYl/Z40/GtfzlOCK3RlquUlMzYHS9wCLoqx9au92vdYQn
	RULkL949uG8UFV2BZ0xFRD9yHjywdFOjPl4bKLLpseedoJ9M00ai
X-Gm-Gg: ASbGncuW4ASEnNl8HT9OEIKWX627T+r4LfVsp2AxiGrV2357v3UzQdgeqIHtgI+B3pI
	cttLNBOeb0k3FileSixcw20H3h6V1Qe327Utd58jzGMWuvNNt/WCAjlTrCX5XBSSUBnpS8hWPFk
	zxK78WMjcChqpzJGI6vrx0V/VHLUdi3PxiS+EMRUFEaBHGV2viP9tAj0cMZ+sEd9E/4SQMoUKrV
	HHWWnnJKz7+YDQFNPXO45ce0JuQiXuMNNJv/eendvjKensENqsCe3LHCmcT/I9uPsHs8qSCJF7R
	CTwXG0H/cU5hAOz4vLzSVSbc7Y74bhAjnkqteji9JbnGnIfT8TltZQH5Lsu0UOU=
X-Google-Smtp-Source: AGHT+IFb5qX0XvmZ5ZsVgPWiDomLFb6aepfbcplxh8QI9Sk/uDZL++otj+xKzMeCKeaOxLywh0T8Vw==
X-Received: by 2002:a05:6512:118a:b0:54c:348d:19b7 with SMTP id 2adb3069b0e04-54d64af007dmr288077e87.46.1744791754143;
        Wed, 16 Apr 2025 01:22:34 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:33 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:35 +0400
Subject: [PATCH 10/13] ARM: dts: vt8500: Use generic compatibles for EHCI
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-10-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3187;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=sXBBymomR0aMqR41BnxGJR23ORnc03EabD898mjy8I0=;
 b=phH1l+ArqkItHllKUYxgujxVUZbixuP6/yDZMbVo9thwv4ACvTy/s4XPnDaRM2uzyQ2ho1VOr
 OXL6RgN4A0pCh6kidlqxTrKQumUKlP/GZBHpsmQSZaHYW1WUQC+iEBE
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoCs don't have anything special about their EHCI
controllers: in fact, vendor provided kernels just use the
generic PCI driver by emulating a virtual PCI bus with fixed MMIO
mappings just to bind the existing driver as-is. So switch to the
generic compatible to save further additions to bindings.

Note that these devices have only ever supported appended-DTB boot,
so changing the compatible should not affect any existing users.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 143daf983d1d926c2c837c43002d1a86cff3866a..b848fc33aa13796c098a511c26b4c2280ff453db 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -106,7 +106,7 @@ timer@d8130100 {
 		};
 
 		usb@d8007900 {
-			compatible = "via,vt8500-ehci";
+			compatible = "generic-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <43>;
 		};
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 69d2351a81dbc816efd19ffe3ba5ef80eaa4e9dc..1b9a18f498613d649d4f8bf87ade32d1f7edd9e4 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -204,7 +204,7 @@ timer@d8130100 {
 		};
 
 		usb@d8007100 {
-			compatible = "via,vt8500-ehci";
+			compatible = "generic-ehci";
 			reg = <0xd8007100 0x200>;
 			interrupts = <1>;
 		};
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index deebe9b933876bc1eb188f82ce8c1c17098d04a2..34378a49ec2017fe2771a38033788fd753dee875 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -176,7 +176,7 @@ timer@d8130100 {
 		};
 
 		usb@d8007900 {
-			compatible = "via,vt8500-ehci";
+			compatible = "generic-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <43>;
 		};
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index bde825b59074eb74af4ab296895a3968e992aefe..1b7a02834ac14fcd51389a6a809b5f0960d63312 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -248,7 +248,7 @@ timer@d8130100 {
 		};
 
 		usb@d8007900 {
-			compatible = "via,vt8500-ehci";
+			compatible = "generic-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <26>;
 		};
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index e8385c03e04bf5644c86a85aeb41e1cc1eedb202..76337244a8e051732e9ce3432eee36ccca9ed463 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -234,7 +234,7 @@ timer@d8130100 {
 		};
 
 		usb@d8007900 {
-			compatible = "via,vt8500-ehci";
+			compatible = "generic-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <26>;
 		};

-- 
2.49.0


