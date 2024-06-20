Return-Path: <linux-i2c+bounces-4139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4C6910FC7
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 19:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B46591F22F78
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 17:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52311BA87F;
	Thu, 20 Jun 2024 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="Ef2yOdoP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5A61BA87E
	for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 17:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906239; cv=none; b=rqILXrNj9G1Ts2UjOCJmk688KjiRLfI+kdTnELf5JS8n1IK07YnA4a5QRTs2v7V7952mNMVAjrK2xaYnktHLUa5edJ/N6FEwkIsDxAsbx2MI/XvNMOwCYpqpaZpd4YBCfS4fjfMjvXXcHh8p1qK8kCKPb3U2nAIpYMq5VXXY2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906239; c=relaxed/simple;
	bh=lL5HxCJiZymjowcOr7xVA2M7Te/xs6i3j2oxZgMh+rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ANyvid0NGBAmWb2DudSZkfRdjUeC0uHtJ1a2qoe8AhihvPo52Obh9ZRO84xy2xzrfMIGEqR3xpEt+UAB9UOkSqk1fNOGEyYSsVDsUx4nh1x/7sxhcogixigjRVa4aiOiv5/99A97ss8g1/77Qmxz77yf0JyBPusgV6LhX03FUxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=Ef2yOdoP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f13dddf7eso146021966b.0
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906235; x=1719511035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UP/GNN9hhxz4nMUGrLaNfWrPk3mVaVMWtBi9huNJxPk=;
        b=Ef2yOdoPvdrdIdPhr5LQiCJ0I9SLxjRSKaL/OqYMX5sqAZCEuTYZ7p/dgSstRd9dBo
         453/Yyxx0wzRqZnwLXEhOVZlIMMOGUCt9mtMNngn1z/AFwrxtSyZeZigZvfq7nDB88xV
         bfv/JdkfvxqG+JcOdNlu83TuBlMu8F15agYsQp6cQBRiayP82/3wP2Zfym+grexo+RbH
         33uSmqeotVnrH7QfBwkcsJPqVTYCS6ltvJkZVCpj529Q28XwqxMs+LKs1pdi2dvKdODM
         dBTtra4ZW7mcWHzmYzVTyIVE19mJcpcSI3bWWiS5kWd408yqD4I5puVMvo6ZbWc9XIqN
         69lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906235; x=1719511035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UP/GNN9hhxz4nMUGrLaNfWrPk3mVaVMWtBi9huNJxPk=;
        b=MeKdx83i34udlC3dnmcPSxvpcPExnh4DmpyhuROnGRhkcqV6+b7H+uINtTLdpJqY/z
         2JHeejS83VIrfXrYwfCb3tQJPOv4mWYCqvcGX/BNbNclU9uwhPMKHRzsGIFP8x9/4ZNF
         UzA5wQtTZKFkjZDj8NdgipEVTowax3UgBH8DC9+E4AG1SuGvzhhww7fTiNO6mN1a59l3
         pUCXebajDRnqBNn6a+bkr7YEuRxcYoXL0hvtEK9zkxAC6e2AafOh6DpwQzLX7YQEgFl9
         jhqCUEktgOkIbW7hjR9oChZQlF+DY2p6fTV0kRMIUJQhwZO79xEpqawOz4ImzDtVcBmu
         rIcg==
X-Forwarded-Encrypted: i=1; AJvYcCXXqSLAfRksVXsy/TJ+vTuImV4mKARk5ubQUCNoRj6FELHNy1BrkgOI+2llmKbST7oDIwJt0iOu6GmiDpA4+C61OoLMYpRVUhrx
X-Gm-Message-State: AOJu0YzvXdDoIgeg554GYgip24vNmxGPj+ss9c8vkaLAr/yLVnm9BKRM
	QTKM/jGMGFTLwMnpRIgCWhji433orbgugCRwCsvjHqCm3jlg53uj6G8NxK2J7Ms=
X-Google-Smtp-Source: AGHT+IHwzCxasTWecNI2BQg/1Mqv76qvz0pqMMUj9hgHTBodTuDhBkY00q2aX9YgUG43J9U17WwHFQ==
X-Received: by 2002:a17:906:a09:b0:a6e:f7bf:712e with SMTP id a640c23a62f3a-a6fab618973mr379689666b.27.1718906235388;
        Thu, 20 Jun 2024 10:57:15 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:57:14 -0700 (PDT)
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
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
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
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 00/10] Add audio support for LPC32XX CPUs
Date: Thu, 20 Jun 2024 19:56:31 +0200
Message-Id: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
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

Piotr Wojtaszczyk (10):
  dt-bindings: dma: pl08x: Add dma-cells description
  dt-bindings: dma: Add lpc32xx DMA mux binding
  ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
  ARM: dts: lpc32xx: Add missing dma and i2s properties
  clk: lpc32xx: initialize regmap using parent syscon
  dmaengine: Add dma router for pl08x in LPC32XX SoC
  ARM: lpc32xx: Remove pl08x platform data in favor for device tree
  mtd: rawnand: lpx32xx: Request DMA channels using DT entries
  ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
  i2x: pnx: Use threaded irq to fix warning from del_timer_sync()

 .../devicetree/bindings/dma/arm-pl08x.yaml    |   7 +
 .../bindings/dma/nxp,lpc3220-dmamux.yaml      |  56 +++
 .../bindings/sound/nxp,lpc3220-i2s.yaml       |  73 ++++
 MAINTAINERS                                   |  21 +
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi        |  53 ++-
 arch/arm/mach-lpc32xx/phy3250.c               |  54 ---
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/nxp/clk-lpc32xx.c                 |  10 +-
 drivers/dma/Kconfig                           |   9 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/lpc32xx-dmamux.c                  | 195 +++++++++
 drivers/i2c/busses/i2c-pnx.c                  |   4 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c            |  10 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c            |  10 +-
 sound/soc/fsl/Kconfig                         |   7 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/lpc3xxx-i2s.c                   | 376 ++++++++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.h                   |  79 ++++
 sound/soc/fsl/lpc3xxx-pcm.c                   |  73 ++++
 19 files changed, 954 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
 create mode 100644 drivers/dma/lpc32xx-dmamux.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c

-- 
2.25.1


