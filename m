Return-Path: <linux-i2c+bounces-10411-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C43A8B3B1
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 871045A4EDA
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A8D23BCE0;
	Wed, 16 Apr 2025 08:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqgxexMr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F59222B8CC;
	Wed, 16 Apr 2025 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791762; cv=none; b=tBpmxDn4BoAq3/14hNKy/pdYrbvkHMhucQv7Y+jeqAvj6Zy2Wjc98lDW8QYJ/ICyK86eMCWMXbFCF9Tqw+EqJrHcqRzPJovYyQVHIFPUxWp2ZKC+KXuZ5RanJlc+HAZG4PUi1lSweafFQ0+kcPU9tjs3NOD2+gIYkHi+yEvtuxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791762; c=relaxed/simple;
	bh=FAOknd5/teloNUV93bWzTFvFaFt+Ny9oXh5ASvg22yU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bKPu1Ps7MGwwnulRM15cyYbSXzxYM+x7M57wHOPZ7ygyAzkZJVCgX7oMbrX/41Jnfw0ith5gvy/AlYHYwq7WuQ9ZsBGp3cHYVE7KzpCuAy5Iwzb78GBgl2jska9mMRgeheeWHVw5Mv4+QBTXfXp1diNqgKz9Wa++tj4GmgOwe34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqgxexMr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54af20849bbso7999037e87.0;
        Wed, 16 Apr 2025 01:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791759; x=1745396559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rN3T808R3XeniltkqTvP/grwdD/ekkru3ZTmvy+YPmo=;
        b=MqgxexMrsi0oTqAbd9bBqCBvfBqPYvqM2j6EsRjTjI/Je/fpr0W+6f5JqxAOkjL9ys
         nb3mcn+waED+SimAoW8zkO7ddz/HTaBd1TzeJriz+bKiD/yLwypnznp4OobJbMDudqgZ
         AERcIVtG/2DIPAk+cj4Aq90OH4LJ889E90KIC11qxIQPCjS4OrsuJqC4fhV8LGTZ6WM4
         WMj8l785CsBTdDNe8+44Pw7zkq7a9FSHY6uYQY4eHWie8QiJF6Zu/SFhivf1RO9zB7x4
         TFWdz4e/0jJoroxgaOrtA9Ek5mO/NDmmqvGycS4xKQQolYwlSnuMc8ehAb9H7Aj58tM1
         VilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791759; x=1745396559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rN3T808R3XeniltkqTvP/grwdD/ekkru3ZTmvy+YPmo=;
        b=RGSnm746aaJEpMkna4Xz4G5hZk7RI740d3ulcJRg1OAaEmrWyIcq+zHEF+KCs8q/Q5
         S7WoG+eOFWMnKuSCO0KaO7WP5Q7QJbTkr+CFYwaBkiStQ+WrWNG5kmOFybi0lMgezIgF
         bejI716n02sI2l3jm9KYw8oyFdxDU1z5ckijci7CkxVwJaKWELC4Bpx9qvuABrtkJn00
         wYXqQe0LedpbgJVOL6uuKOgdcUcn8cBrikXG72DPi1ygwxYW9Y2JB+PwjryYSiokUWNJ
         wOBAt3d6YG/ckB5Epd5J7UMtbFCLn/m7wFSKr5+pfq53FN2XaACb8ClufnK9R2cs36N3
         HIrw==
X-Forwarded-Encrypted: i=1; AJvYcCUPECyvv8yFUnhgyR9Fi1f3L/q9u4dnDrUlG8b7+s2cH0lMl/Goz0ut48k+e+aZRKx3t6U8jxRn@vger.kernel.org, AJvYcCUYQTRkvJOOTgp2ORcdEDTawbfZo0OKUiCtabzfnHgsa2tML5Pz0anAfpcWcJ6SvgCFYnpHrpAwjz/o@vger.kernel.org, AJvYcCUqtgpBlQx3lljvE/c2ZoWWAyERPv/Scj0gKrZxX6hSC33R5+Uw+Fk63RIwF3y59/yxhhx7evVne2lH@vger.kernel.org, AJvYcCVtYb9uzRxJPYPbnxhQZA4bErjrYOuBXINupf8Sx44I/qC6RUBWKIzX6AQ01Zug8MbSpVlE3ZpzcHJ7@vger.kernel.org, AJvYcCWw44yg4BN/rfQpf+rBRohA/jm9+FaePpM8U7gUJfxvKnQMt6AEt9tQE405PUeKtg86KvxdBg/MYtqv@vger.kernel.org, AJvYcCX2fhmj5PSlq8eNSHyZQmPf/RGv4X3CPGMXyp7Fw2gYIj1n1Bfr3Ty5RnnSrG30HsSmKhbglL+Sr2mvbLWY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wstAq3RbUiMJpMdCoESMgDgv53QeKiScb41RXS2mJ+zvcz2q
	BxpBMM36xS4Vqu5XNK4IbIfJP1DKVq8RyzuLepbIelYdDtG2gt9a
X-Gm-Gg: ASbGncuGMaMGF9Xs6MzEJSwntZ9Va/Jow8OjRBHNNgo6obkrA++YAzzQIysmWNocfkF
	gNcwjxEMRhNEzkO6TQMAMZz5APwT2LkbgLxvEtCdNZZ1MmZl8ptkNETBrLGZeUZsYlvLcs1MEZU
	lGOm9dXdSAex6Cq2GFndk9XGT5dg1h70I1StI3fzW5dYOcvInbdNhx49jA3NCJnxJf6IIYpDFl9
	LCID2M815fFMVIW1IR/zNBnkWAqZaSovhH89qqaeuHRq40WLntvhGvHuTj6SH3jQ/1igSqEgwBp
	mcjYQq26Q4mClteupvre5Abc2J07//8mEPQu6a269rLFMfwGE0uQ
X-Google-Smtp-Source: AGHT+IHLnzhAfUmS07LQuEAg0BM6zGBKpHgV7Xn52yUhaC1Tl7AKbKAALF0drT2m1wxPOraEhGXkVw==
X-Received: by 2002:a05:651c:512:b0:308:e54d:61b1 with SMTP id 38308e7fff4ca-3107f73b104mr2702101fa.34.1744791758498;
        Wed, 16 Apr 2025 01:22:38 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:38 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:36 +0400
Subject: [PATCH 11/13] ARM: dts: vt8500: Use generic node name for the
 SD/MMC controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-11-f9af689cdfc2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=2298;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=FAOknd5/teloNUV93bWzTFvFaFt+Ny9oXh5ASvg22yU=;
 b=yNnCqyrdqnzkXsOrIil79eRxohcRBpFCYcHpQzQIW4YbtsecxwKAhq9mOXcV1BEY67kfFvzDN
 Pp47FfqQTBjDEozLzPnn/iGSaCJh/OvNh0JrDJ/7ki0H9gNvnKNYTiY
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Current guidelines recommend mmc@ node names, so use that instead.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 1b9a18f498613d649d4f8bf87ade32d1f7edd9e4..f39632d3f96130dde1696509ddcff4dd8ac177b5 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -279,7 +279,7 @@ rtc@d8100000 {
 			interrupts = <48>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x400>;
 			interrupts = <20>, <21>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 34378a49ec2017fe2771a38033788fd753dee875..3990a6b3de96f5fa1f63aeac306fdb252b1509ea 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -187,7 +187,7 @@ usb@d8007b00 {
 			interrupts = <43>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x400>;
 			interrupts = <20>, <21>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 1b7a02834ac14fcd51389a6a809b5f0960d63312..081bc5bb5a697c849fc6bccde2ce5fb91c110a32 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -319,7 +319,7 @@ rtc@d8100000 {
 			interrupts = <48>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x1000>;
 			interrupts = <20 21>;
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 76337244a8e051732e9ce3432eee36ccca9ed463..55de8d439688c5710d1e9a37890bbd274895be42 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -289,7 +289,7 @@ rtc@d8100000 {
 			interrupts = <48>;
 		};
 
-		sdhc@d800a000 {
+		mmc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
 			reg = <0xd800a000 0x1000>;
 			interrupts = <20 21>;

-- 
2.49.0


