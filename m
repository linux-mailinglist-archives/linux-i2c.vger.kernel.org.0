Return-Path: <linux-i2c+bounces-12725-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 575B8B48049
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 23:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E99D189E4C2
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 21:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838B8264A97;
	Sun,  7 Sep 2025 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ps4NRlwZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7513315D34;
	Sun,  7 Sep 2025 21:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757280855; cv=none; b=TUEFaL8xAx2QLtoNuaVCK2rMj/YbJVB0cr/+9ZBqnTUmr8tGK3p0+ZPSl7tdKjSz2/jPHh+EC96uW73ozIPWGXaU5bX+376h/kuyGlRkGshfD6PVc4Cr6L76zUYRFJzGG511+e0VmNjCPN3GTMBfmVlpZjCzO4XwK02gRzcA9B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757280855; c=relaxed/simple;
	bh=qjSX1+MoG33BAIPxSwZgmmm9PAPIWHsGmHS5ZkL4/AI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nxEixvjCJOlSiSD/MihJ09DcV+3EiugIWMwCOdNT+0KsX/mjtMd6GMVDwO9E07f1MEmiq1VWVUg6p8ZxHjPY2ewPWt6mwIOUPeKIc+Iy9GBpFvHer4uPEeD3QWYbaCiOuQy41Ga3IwnkhRsEh4RvT160Bwur6pCymgK+QH8Qnns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ps4NRlwZ; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-7222f8f2b44so34003046d6.2;
        Sun, 07 Sep 2025 14:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757280851; x=1757885651; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAYcMOHgP8dzrRCqSWqHz21ZqOya4M26f6YLrK42GGU=;
        b=Ps4NRlwZhcHko9lxf8PZjOLGPaKyCMzhLDsRBpdffiDSz0+FDGUEhxxOqDL+PggIjl
         DJzO5KmYcPuYiGb52c+GYU/55wOsI5ls5U4hi0v3r+K7vOVFdFq5eh7FT5G9W5iqu2ZZ
         VjK2tTbNllN6pXrWrmK+nK53lCRlsy7upgMwHYd53VcHy8LW2CzCt2EQZQzt6xbiXEjB
         n59/ZlV4P+ZurSsMRJTzyhY5bpLeMXN0hRQ5hAuvmBbc6+26VPQPDdc88rOwPE1wlLFf
         StJS4dPoWRkKKrQ4Vs3UWauOBcAl3/C8F48ownNby28LwKs5e7E8fqcDN/iJyWCy+IK7
         sSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757280851; x=1757885651;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAYcMOHgP8dzrRCqSWqHz21ZqOya4M26f6YLrK42GGU=;
        b=R9gSw6QO+Z6+e9DZcshxZ4GljHpod78haKcsnWxoCNw/bdhlFu7IS39T8ScEEXC5HM
         ijzcWpBAMnUvNTgLBrEFJvRcPA08qwZ0jP9VDfVP0n3IoVAnkSSMUbRqty9ChIwCCoav
         ElL0BhgZqxcv3fHODiroK5kV6UPoLN6VIjV8E5UfEv+vR9LYriV2BvoP2Lp0D19gVHPt
         37W5+38HQNPy2R6u7HeD9s2wVduP0VC7P3Siu8XsdlZ3XIM+m8K+71SmM5/bvCrzUH8A
         iSqXdGoiWX1CVz6/pfyhwyiCQFfFc1qRPlofHEKdYwTIqxBORONKynUIQZr193USal6o
         bwdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnE9nspIF22lsw/yxNZ+xQaKycchC3xHG8iCwm36QXOCwZwV/FjOVmie8AFqstCFE6qKu31XTMTWnXbHB7Ewj6JE0=@vger.kernel.org, AJvYcCW6jxfd0oaPqofNH3EN6a2teLmZ/DvlFVy1qsmEFIKfGqWuTBx2BqouQ8/4AIT5AkmTNUUxjBaAK6mKs9xz@vger.kernel.org, AJvYcCWU/xbwRBll7L1W5h+IW4e5kaOWl2cW1cIQkDQn/kHIEQgzIahJ25r0eYPRkogYJps6LTlXnzi1EwOk9ypO@vger.kernel.org, AJvYcCXROEM729xPCnq3EUzXIF6Zws6yPDo2iJA7dMcwQp1qr5b6B0pvnYxi1f10jckB3icysGorg57saTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWrZK5Roy4vAi0OwNWl5sIgtCPtS6onPaVumcBR2ZxdTAK8iSK
	cueEqrGeIQ6uIYJbkbQ0RVwpwNZHVFF3o7BFrLLkfi3aupVLol/vx7i8XECgFpJE
X-Gm-Gg: ASbGncvnDloP5I0RNJXXNRH00PzJhmH8qk4CDMzP9C02LiCnSm7lqE1Cor4nGZU1NSA
	MClywE05dvZaA1DomBedL6Sod/Op6SVWn27wrbO1q4290CwyPO3Kpiv5ZqW2KlDK4Y/g5Ct3JJs
	nNFZ8DcRh7WTB0MD+9n6MhvK2yXHAwfGe4N9jUsMvM1+whm7kPZxTmv+ydei4/CqayFKNiW4hRB
	UmMg7p/NPwD+Q8mwnWlJuZwPVbgQaQ5IfwT0kSqNIXnEclN6Xchv0kkVZOZPCiXq8M/WmriTo5B
	OoEe/g8G0/0svdpH/54Q5RPZwK9Qz55iP5jPnXseSgst76UbPNFjPHBEHMB+8tk8WkhpIQQXbeb
	TjIlPOsMCjHIuaAqcwy7lUgA9Kfi3jAgiHrNHjl7wJw==
X-Google-Smtp-Source: AGHT+IGuZkEOOo9P/4LuWTMMM8+83KFMkIZI+a8A8P22ll3sk7nlM2ZrZnCuedhaJdnefckXJka6DA==
X-Received: by 2002:a05:6214:19ca:b0:70d:f76c:b218 with SMTP id 6a1803df08f44-7393950f865mr73376806d6.31.1757280851300;
        Sun, 07 Sep 2025 14:34:11 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b46660e5sm108637486d6.45.2025.09.07.14.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 14:34:10 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH 0/8] arm64: dts: exynos990: Add PERIC0/1 USI, UART and
 HSI2C support
Date: Sun, 07 Sep 2025 21:33:56 +0000
Message-Id: <20250907-perics-add-usinodes-v1-0-ae7600491a7f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAET6vWgC/x2MwQqAIBAFfyX23IJZEvUr0SHyVXuxcCkC8d+Tj
 gMzk0gRBUpjlSjiEZUzFGjqitZjCTtYfGGyxjozmJ6v4q/Ki/d8q4TTQ9kB1g2d6Rq0VMorYpP
 3v05zzh/8QpkmZQAAAA==
X-Change-ID: 20250907-perics-add-usinodes-5ee2594041e3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757280850; l=1485;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=qjSX1+MoG33BAIPxSwZgmmm9PAPIWHsGmHS5ZkL4/AI=;
 b=FPmZCdmoS60rMwEKqLRYEvGn5axehswCuPXciOqsCp1swUWAOnYvUlk+fYTFsloLDowoOiMbW
 Z4gcQYdsiKfDVZzrY8kvukSiaRpUFrHUsFqhTYgOSuuMP9/9ufpbGcG
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Hi,

This series adds device tree support for PERIC0/1 blocks:

- Add sysreg nodes required for peripheral configuration
- Add USI, UART and HSI2C controller nodes
- Update bindings with Exynos990 compatibles

These changes enable serial communication interfaces
(I2C, UART) for Exynos990 SoC.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (8):
      dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
      arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1
      dt-bindings: soc: samsung: Add Exynos990 USI compatible
      arm64: dts: exynos990: Add USI nodes for PERIC0 and PERIC1
      dt-bindings: serial: samsung: Add Exynos990 UART compatible
      arm64: dts: exynos990: Add UART nodes for PERIC0/1
      dt-bindings: i2c: exynos5: Add exynos990-hsi2c compatible
      arm64: dts: exynos990: Add HSI2C nodes for PERIC0/1

 .../devicetree/bindings/i2c/i2c-exynos5.yaml       |    1 +
 .../devicetree/bindings/serial/samsung_uart.yaml   |    1 +
 .../bindings/soc/samsung/exynos-usi.yaml           |    1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |    4 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 1423 ++++++++++++++++++++
 5 files changed, 1430 insertions(+)
---
base-commit: 98ee0e036cfedf543c4728a604fd7870d0000efd
change-id: 20250907-perics-add-usinodes-5ee2594041e3

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>


