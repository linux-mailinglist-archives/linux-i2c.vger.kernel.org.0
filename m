Return-Path: <linux-i2c+bounces-4399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A45191AA19
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA3E41F2451A
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 15:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB91B197A9B;
	Thu, 27 Jun 2024 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="3dF+MPa8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1C9197A76
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500468; cv=none; b=rh2qbUsSb+wYWxoIejzGDoXdIiRKdb42gbIX+33DghBzJ5BUdn2099fZiAL1Q+y/2m1/8ca1MRka4YNWQTF/T2aM4eRUfYbYlteMpM7mk6qgkZF9YVpPCSw4OjjoaGgGlCI6KTHjOUIs/2nGSGnffpwV+8Hkj2ErjulNqC+8kbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500468; c=relaxed/simple;
	bh=7o3IDq7dMnCJpDffLvbMK0yGcnevSZjTsnurFpsaims=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=AawUj5sySTNjs/qa0pNKcpr4hkgsI9YVecQWxXACza5sEabeHFkeNbk8ctj0pZ3M7Pf3YvcIrGR2x1fy3pNZR/K9yVnvf6kdAD3yNBPpuxfU/2fFUx5FJ1Pa5a3+BkgZuloy2AYTiNjj7hS231Bch+sbA2g2KSm8//Oz8XmFNV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=3dF+MPa8; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57d2fc03740so2004947a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500464; x=1720105264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y7Vm7BbdgByjIx2Tu22DX4H6N9MAc4rl5R9/LnNe7E=;
        b=3dF+MPa8o8dp1x44DeFM3u5DbGVTZoLlgtkPNbFzHMAehyzla7LK5LCtCvnLEuPsAg
         ir9qk/PnebI30+9NRW6qlMNpyHDMDJ/Q3Jv8GwEUvct9gE5P/rSQraN1rNV2I1dtDw/W
         Q5DF3cqJjHxEYh8pzIj+4VSxjxIYxT4EuvOU7EXaFOXWi3M3MyEg9HMG4UojfHpD2lep
         B4hFx1kkPNUNBxCMHG6HeKghLXTIAbuSmmetbp4Qjv33xUBTxd6HSx0oRX2Nw0HuG1zp
         lRfBNcnyhb3TVHqg0C6rkCK+7W0dArGYs8vTPrY0+3jmXPa72mBjQfGwwNEpVjBWeKcn
         4iaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500464; x=1720105264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y7Vm7BbdgByjIx2Tu22DX4H6N9MAc4rl5R9/LnNe7E=;
        b=FRIiIzFBXN1x9tp91QxVMbv8vktCEUxQHlH5ZMbbc2CtLPiAL9NnjAJogsyd8oElNE
         r0Hgd4uwZZkQKFSg2X2+EqhgxRIa8bGFOMKXsC/jvx+Xnd/v/L7czGwG2e4mUHyxcM6D
         JMf9dLll+s9s4TQNfUfRO0ZfMuvsyVH1xAo7WAlwc/st6LbAEhQXCrGNvCW7UAuku6hr
         6dxF8wr9V+DThLrpCgLcFvxrO7adcwB0O9lIGvEsjhag/bUsYQXqQbGw1MkirqCsJeZm
         jhjvYQqnYnixvrt4g/1yuYwkRfuNF+BGzqM8OfZibp1kiTJNwI8z1f5i8rnr39n48KOZ
         IHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXQfWgDb+pGecHCmYex0Fswk9Ozaj24gUZn5+uGZbHe4WcMagFwB43MtgwzR6dXxCwT8dmseZJZSQha4SKXBc87G+aE6POXqUe
X-Gm-Message-State: AOJu0YztcabuecJXNwdwJyhZtCAgDCd2cHOampGVUTlryAWcjQDs4UZC
	H5ZJe0KwtG2RrXjAr1+T3b5v9SX7+DAnR9FtklB0G6wEpbY29xvkUD1DglGAiMg=
X-Google-Smtp-Source: AGHT+IFg9G5Qjr/NcWh7E3bulgGsi4BkD4axF+tIY1ZpcMPEHOlYWD36DNqKEQ2BHT5YOG2H3Pk0zw==
X-Received: by 2002:a17:906:c2d5:b0:a6f:b9d3:343a with SMTP id a640c23a62f3a-a7245df6b0dmr710793766b.71.1719500464181;
        Thu, 27 Jun 2024 08:01:04 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:01:03 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 00/12] Add audio support for LPC32XX CPUs
Date: Thu, 27 Jun 2024 17:00:18 +0200
Message-Id: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This pach set is to bring back audio to machines with a LPC32XX CPU.
The legacy LPC32XX SoC used to have audio spport in linux 2.6.27.
The support was dropped due to lack of interest from mainaeners.

Piotr Wojtaszczyk (12):
  dt-bindings: dma: pl08x: Add dma-cells description
  dt-bindings: dma: Add lpc32xx DMA mux binding
  ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
  ARM: dts: lpc32xx: Use simple-mfd for clock control block
  ARM: dts: lpc32xx: Add missing dma properties
  ARM: dts: lpc32xx: Add missing i2s properties
  clk: lpc32xx: initialize regmap using parent syscon
  dmaengine: Add dma router for pl08x in LPC32XX SoC
  ARM: lpc32xx: Remove pl08x platform data in favor for device tree
  mtd: rawnand: lpx32xx: Request DMA channels using DT entries
  ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
  i2x: pnx: Fix potential deadlock warning from del_timer_sync() call in
    isr

 .../devicetree/bindings/dma/arm-pl08x.yaml    |   7 +
 .../bindings/dma/nxp,lpc3220-dmamux.yaml      |  49 +++
 .../bindings/sound/nxp,lpc3220-i2s.yaml       |  73 ++++
 MAINTAINERS                                   |  20 +
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi        |  53 ++-
 arch/arm/mach-lpc32xx/phy3250.c               |  54 ---
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/nxp/clk-lpc32xx.c                 |  26 +-
 drivers/dma/Kconfig                           |   9 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/lpc32xx-dmamux.c                  | 195 +++++++++
 drivers/i2c/busses/i2c-pnx.c                  |  48 +--
 drivers/mtd/nand/raw/lpc32xx_mlc.c            |  26 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c            |  26 +-
 sound/soc/fsl/Kconfig                         |   7 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/lpc3xxx-i2s.c                   | 375 ++++++++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.h                   |  79 ++++
 sound/soc/fsl/lpc3xxx-pcm.c                   |  72 ++++
 19 files changed, 993 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
 create mode 100644 drivers/dma/lpc32xx-dmamux.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c

-- 
2.25.1


