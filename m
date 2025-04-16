Return-Path: <linux-i2c+bounces-10400-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F805A8B35D
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E45663AACA9
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB99B22D7BC;
	Wed, 16 Apr 2025 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHJEPI2j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2726158520;
	Wed, 16 Apr 2025 08:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791715; cv=none; b=u9KoRSzIB3r8tnMb6BrbkDUNR1GcMU3sAuoZSJ7FWJDJDfGRkE2/YSKNSurE5o8N6AaCY57rK9KYWRnGRfFtJxnnAJX+q4LqjxCV1zGOsWHK1V40emzquo16hzpcN7tJ6sG49mWg4zbkzBmzUiKY2I39OYrMqW//PonWq6ktu68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791715; c=relaxed/simple;
	bh=VWW+FjoSMr2BVYRu/X2g0WXpS/3nXWF7DuGik59WEqM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hUDJBfAw3GilSrFZ8GT73Q5cf0LoF1p8Q8hHK8Yxb9+upJ1LSxCE8jYERgd6ohY44Xb4pfLEZzqvqkOhcim/cNVkw74Q8lRcnn6rhr5FavymNdgtZX3BtV9wJ3ypHOsv10pOrz4uuy7ZojaG6Q2aXdgZeDbF/uy5kw0dW5ZVeFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHJEPI2j; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso34213671fa.2;
        Wed, 16 Apr 2025 01:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791711; x=1745396511; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSn8ywScBr2S49CSRan+oKzZUY5sWQo+CXS/MBhnnS8=;
        b=YHJEPI2jpEGnXGKs3WKdJVTs9+qUCkJ+DeUJbJR71TRFQbTTiP/myzYk3wqINlXZeT
         YhoF5rUeIyqYMbrr4MfUp+16qTU6EBYxVnRhlF/Ts3np3DI2/b17n/IaYOPZcrDT4t+L
         Mz9i4sV0RJuCtsKLBVeS2ocxoONyrfV1GhRgrWoTd5p5mvV0WWgyGlZS2JYjZequoKeE
         7qXsVLrl+ZTFwI6QofHHcK7+W0hmCDouL63K/Yh7k7SNpX1F8UP800YBHnARV1HKsXIb
         G6INo7F3G5kDZhyw3Emfa0IFE4rEqc0ctztSCJ7Jv+2/ZwmLSeVsL7UIlsZbzaOW+eZy
         bPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791711; x=1745396511;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSn8ywScBr2S49CSRan+oKzZUY5sWQo+CXS/MBhnnS8=;
        b=OEwAp4uq4eCv5qL2fwgWE4x63mnHTzNzRnrH77C8gRflDLst4Emxto8Mi3mMdaoVBV
         66nmzTwGKhsmccmdPJtDSj544ruI+OeG8BK3W4/vlhlrx8AqZ7IF2ejUvg63CRele6+R
         Za1OM3fsaU1rfkX9By7QA6C5gJrAjRcYUnMnt2kC0l8MeSaOg2/6ijgpTSboz2J7HXUs
         sJWSnWRA96SkUQU41RHBlY4rgG/fK9W4huOz1NqXHypWqqt56g782xyKW/haeQyuUROr
         TTRuYg3CgLiFVt6b9swSYTebx7rjsunST2SRpJW5i+P/ZpLSyOpPCCN8nvKXeOhuIe4Z
         Mvcg==
X-Forwarded-Encrypted: i=1; AJvYcCUTxHzXGYLDKkeINdPrrggMFczDzBpaUdqzhmQuNys+RzkrtHk7/LySc+Vj3VQj/xG7ePNyaYnS@vger.kernel.org, AJvYcCVVJz6ZGRjEeU8LFVbNSiUard0dTjnLtui/5llJllk/9lefOclgEdq4Rv4ElDCNn5/hi33HbpER4vODW+mV@vger.kernel.org, AJvYcCW4Ns0c7TK4IcNYy3RyEZikJAbWspEQOie6fzjLA70bPKoHwKjG5LmZdljjxZmxSP/uSuP4MrOcxdYc@vger.kernel.org, AJvYcCW6Kl+6QojfNHkcgWyoTUOnA0A1+6k74YGxjruiUz/1YMeE9ENLDKU5Rm0fK0bq29aW9IGU4ManHeAg@vger.kernel.org, AJvYcCW88VFWmEDZB3buERNox57NSO88rdEEfmSynXGhZwCI5tP//hp515EcwXsWNqwc/3o+1DAVacD7vQJ8@vger.kernel.org, AJvYcCXv01/HEfkFgQ9Szw677HWSzYXHU+oUMhhcvDX8KFj15G/0DpHUb+MpNe61nOPNQzkNvRl10wH4BjY1@vger.kernel.org
X-Gm-Message-State: AOJu0YylZriNctxEJd+YeJ8L0/V2CTxigrWUTThYOVk64LZAualfNvkS
	6F5NIn4Z7n7DxW8QUddOG95mxweWwSn9MFbF80ESrw+SlyMFdwPW
X-Gm-Gg: ASbGncs2s1eOq84mBGZuepupi+YPw2ycfTNzFD6iPNjbnm1wFVdJxqlCHF2DE62uxiY
	jtVvIRtVf3SEdApuockyvsx/JIpy7xz5YnakKaPk/6pN64hhAM6HzIRPJb2u7uf5cjdolCYbuFD
	ev0HhN/f/bYR0qRMvRTlUt77/jv1sjQJ9Y0CN4IbqU03hL2UUO3TNcC/tHG055NmeJ04tfm6dZp
	0Xqhqbk4VremRXHRwJSreo9wnQrIjnPlHQLoj94NdYPjuSI9qimtZ4fBn3B9suTVsesyob8HGFU
	pfXz5bdrwPKaR8ikY5XF/vn6tLswZAVhDsqtJgIAipP/GYIxoh5K
X-Google-Smtp-Source: AGHT+IHs8w/edsjtM3rOM3Yclg32oaNqFZGls9C6H68akxr8+2plKYYeBm64f3z6Q4QArp+Lekmm2g==
X-Received: by 2002:a2e:8404:0:b0:30c:aae:6d4a with SMTP id 38308e7fff4ca-3107f718b7bmr2182291fa.26.1744791710377;
        Wed, 16 Apr 2025 01:21:50 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:21:49 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 00/13] ARM: vt8500: DT bindings and dts updates
Date: Wed, 16 Apr 2025 12:21:25 +0400
Message-Id: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVo/2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNL3fLcEt3SgpTEktRiXVMLQ4NkM1NDI9NUEyWgjoKi1LTMCrBp0bG
 1tQD/e5EXXQAAAA==
X-Change-ID: 20250409-wmt-updates-5810c65125e4
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=3242;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=VWW+FjoSMr2BVYRu/X2g0WXpS/3nXWF7DuGik59WEqM=;
 b=OE98dlaCoHtAdZilXLnTnuUMVF49Z4hZHmnAalJtuuKjjULVM27W5tpvrpJQD1KM7AV/MZCRX
 fNJJtvtC0pHDBujTVpynkLYIbwLLeVLKIXeMo4GnDqOoMsFzt4LL7uX
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Convert some more VT8500 related textual DT binding descriptions to
YAML schema, do minor dts correctness fixes, and add a DT for the
board I'm actually testing those on (VIA APC Rock).

While at that, also describe the PL310 L2 cache controller present on
WM8850/WM8950.

Note that this series is based upon Krzysztof's linux-dt/for-next

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (13):
      dt-bindings: i2c: i2c-wmt: Convert to YAML
      dt-bindings: interrupt-controller: via,vt8500-intc: Convert to YAML
      dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
      dt-bindings: net: via-rhine: Convert to YAML
      dt-bindings: pwm: vt8500-pwm: Convert to YAML
      dt-bindings: timer: via,vt8500-timer: Convert to YAML
      dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      ARM: dts: vt8500: Add node address and reg in CPU nodes
      ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
      ARM: dts: vt8500: Use generic compatibles for EHCI
      ARM: dts: vt8500: Use generic node name for the SD/MMC controller
      ARM: dts: vt8500: Add VIA APC Rock/Paper board
      ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950

 Documentation/devicetree/bindings/arm/vt8500.yaml  | 19 ++++---
 Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 ---------
 .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 +++++++++++++++++
 .../interrupt-controller/via,vt8500-intc.txt       | 16 ------
 .../interrupt-controller/via,vt8500-intc.yaml      | 47 +++++++++++++++++
 .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
 .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++++++++++
 .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 +++++++++++++++
 .../devicetree/bindings/net/via-rhine.txt          | 17 ------
 .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 +++++++++++++++
 .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 -------
 .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ------
 .../bindings/timer/via,vt8500-timer.yaml           | 36 +++++++++++++
 MAINTAINERS                                        |  7 ++-
 arch/arm/boot/dts/vt8500/Makefile                  |  3 +-
 arch/arm/boot/dts/vt8500/vt8500-bv07.dts           |  5 ++
 arch/arm/boot/dts/vt8500/vt8500.dtsi               | 12 ++---
 arch/arm/boot/dts/vt8500/wm8505-ref.dts            |  5 ++
 arch/arm/boot/dts/vt8500/wm8505.dtsi               | 14 ++---
 arch/arm/boot/dts/vt8500/wm8650-mid.dts            |  5 ++
 arch/arm/boot/dts/vt8500/wm8650.dtsi               | 14 ++---
 arch/arm/boot/dts/vt8500/wm8750-apc8750.dts        |  5 ++
 arch/arm/boot/dts/vt8500/wm8750.dtsi               | 14 ++---
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts          |  5 ++
 arch/arm/boot/dts/vt8500/wm8850.dtsi               | 23 +++++---
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts       | 21 ++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi               | 11 ++++
 27 files changed, 386 insertions(+), 165 deletions(-)
---
base-commit: 62db22c2af6ce306943df5de6f5198ea9bd3d47b
change-id: 20250409-wmt-updates-5810c65125e4

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


