Return-Path: <linux-i2c+bounces-12627-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE28B43E0C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BEFC188BF78
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22542306D26;
	Thu,  4 Sep 2025 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxQvHPqh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60994163;
	Thu,  4 Sep 2025 14:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994836; cv=none; b=BAMAaFn8O3XZB8TRksjluyrLU1TykylBlLfGTGxgi/JZKpx22g0h0A+U0XR7IHsdMFprx7i0k1GhOz/Orz7dZQjEHS75rZ//06wuWI9cOdNeJLRj3yhV8r4Dt8mfV7EPYOp6tku9PL+Zm3LELm/Gg+Ik8o0xh0x2a8mP4KxiFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994836; c=relaxed/simple;
	bh=ly5NeSE539nxeXkPhgKBaDj4r7GvtHEHx5sOROseuOI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PHCSh+INEJmny63Pvnbafsq9ENngCtQpabpg51j/ob91IfOTouiekX6NRMCKKdbmswg87zkzgynZ5xIQVhXyHLWdLGuj8DOZZoz1EjEirbx+Pp/LgwpwZPI8H6iGDNES78DJLwauXhU7WeVBmHz7IsaastgRvcSkqvk4MiRHMy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxQvHPqh; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7f74b42ec59so72341585a.2;
        Thu, 04 Sep 2025 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756994834; x=1757599634; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eihtZU8OHYKgtMximmIrUFJ856exD8VD53vOuodUiTU=;
        b=RxQvHPqhaUWfVgs2fdW7u9hdu5II8asXVgiIRylLJM6dvzxNSXfsTe1cvKmOxC4uYU
         IkDZWEP0p+i9rcCGfezhN1/ab/MwbnKiLnomvPmGS1r1j+aMi0Pt8SDTupKzCVmthlCG
         arAjcegwBMjVRIYagmbvGSsZIun8kiraDJSX8rI5Bq+0XIHqM8Z/CgcxiaH7Z/dMLE8H
         kVRAPKngtbrgiNPr9y1WZVqZxqm+ipnIyGDg57pYa3f/uwcYw+7fx0WvADFK8aaUSyz0
         wf+4SYDGIr4+PUp+y1opU+bukJi1ueeTY4bTtFWciZKYApME0D32IZJ3iHoHwy7pTGi2
         Ynsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994834; x=1757599634;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eihtZU8OHYKgtMximmIrUFJ856exD8VD53vOuodUiTU=;
        b=m5rgGBScYV8lB+TXwnRJYHiy/y5+BaMACKPRSpZzsjteWd0Q/gDyVt9JD7SVFKD/yV
         HUn/S1f0U9XnADb2laIwzI7WP4Bh9Cwy63Z09SijUYSuAzJSfI10deKWkByEguAtM6tD
         hLcFYoGaLYVwBSn2uV/ctlbf6cv/KF7ywySIYMwWLIOc/2MqgI43jpMfokflcQWSKjjq
         8AQQQNHtJTWpJiMERXenHU11RRS84CMCKDKYq24pwcImW8tiOO8rR24SLXsBol3zJeRH
         5uRcKJ0yqlthp8UcOfURjaiZ9goY+PR8po1Fixx7ko/LQthiy0Mj55XeKs4oglIkMKND
         dB7w==
X-Forwarded-Encrypted: i=1; AJvYcCUrtBnBs/AjofAQ57hIhI7POM1yjpWLPGKphlkY84Mi7Gq/DV5T46GoImtIxBPAe5UsKjutnXA7SQdv@vger.kernel.org, AJvYcCUuxrx2LXFrFY5LTzH9HGXEjR6AzaN4x1ABmmWCb0kv/nktUDe+yRb2e9RkrE0WSHc4D0z5Sgxvwbr+0O8K@vger.kernel.org, AJvYcCWS4X4zD2JUksCfnTUyDSdupI/cAyM26tfttYTIEwwYLUBr/W52o9pWVQrFthRXMTEegmyVl7T9fM0J@vger.kernel.org, AJvYcCXVFqaxqUCBHH3l+P5dUI31VRCaqzFb2zqLLOnavwqnohbtc6sv2nu5yDa4pZRckqzDw+32gniEU0Cq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyim9HJUKlBfugFFvoxBFbyXMAHulYIcA6eug3t13mU6P6NjXWK
	rlSgzNOIEFyhjxo5dZhWPoyFeJZwu8gnSxYgGfQf6ci0cDnlhn+f3Uv5u3uFYAl5
X-Gm-Gg: ASbGncv0/XEGQbFsPjMFOjKuOz99jgGfX0GUND9s9GwV23Xg5U8ERaZ++3ekksrFQcm
	9cEFWkn6EOKhGt/jJQJyAWcRYF+BWm7PgWwFJ/PvzE60nyeT5mevL3renNUppZyQ/SV6q9KVzPU
	YlxHszNeon4v1NLo899JtrmVJeT81S0FmHVOxL88MOtrWtGv9m9/Rvh52o8r+sHfpbctv45gJdP
	ia2iWGeRP/PpIb4j815+NUCeuA/1SQQc8lcqorD6r9DKhp2HfxvR+7UrYRiwsBIBx2We96dA477
	vJehWHP7uISXsA2DQRGHf4taWC3qo6TQKCiGAWNDJ81GsYup4SGlGAc3QvKMYw2L/O6QUfDzITy
	4XiqCC1EEodOphkWqKEdzJDNUiPu0
X-Google-Smtp-Source: AGHT+IFAmc0wnCtcOEvRgXDrQ6IUkfol6ZeLbzKo/Il17bCwAzz4m4TitxyZWAzjU/KhfhX5q02NmA==
X-Received: by 2002:a05:620a:394f:b0:806:522a:25ae with SMTP id af79cd13be357-806522a2b71mr1163297885a.36.1756994833844;
        Thu, 04 Sep 2025 07:07:13 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.194])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80bdedfeaedsm212280285a.70.2025.09.04.07.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:07:13 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 0/4] Add PERIC0/1 support for Exynos 990 and hsi2c
 compatible
Date: Thu, 04 Sep 2025 14:07:10 +0000
Message-Id: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6duWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC2ND3QKg+uRi3dLiTF1DI0tTYyPDVFPT5CQloIaCotS0zAqwYdGxtbU
 ANmCpbFwAAAA=
X-Change-ID: 20250831-perics-usi-1295321e55cb
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756994833; l=1287;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=ly5NeSE539nxeXkPhgKBaDj4r7GvtHEHx5sOROseuOI=;
 b=x5fRiKxuNl7/HyAUuv2TiCNfWDovKgGZuKvCrCwKms3j7fN31H08qUfze44YgZlEusYLZ0AnJ
 RgL9/06hOEIBF6BxPXba4/LTG3kFYYYN4WKqsB2MOZ/NMszO+WUFfjB
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Hi,

This patch series enables the PERIC0/1 (Peripheral Connectivity)
and compatible hsi2c for Exynos990:

- PERIC0/1 feeds HSI2C, SPI and UART

Changes in v2:
- Remove other unnecessary patches not related to mainline style

Changes in v3:
- Fix compatible string ordering in bindings (alphabetical)
- Reorder device tree nodes by address as requested

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (4):
      dt-bindings: clock: exynos990: Add PERIC0 and PERIC1 clock units
      dt-bindings: i2c: exynos5: Add exynos990-hsi2c compatible
      clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support
      arm64: dts: exynos990: Enable PERIC0 and PERIC1 clock controllers

 .../bindings/clock/samsung,exynos990-clock.yaml    |   24 +
 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |    1 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |   22 +
 drivers/clk/samsung/clk-exynos990.c                | 1152 ++++++++++++++++++++
 include/dt-bindings/clock/samsung,exynos990.h      |  176 +++
 5 files changed, 1375 insertions(+)
---
base-commit: 1b15d1010a693feaf99fe3e08271cfc72be0f9f2
change-id: 20250831-perics-usi-1295321e55cb

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>


