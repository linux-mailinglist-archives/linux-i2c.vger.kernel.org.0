Return-Path: <linux-i2c+bounces-4402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A7E91AA2B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95C9EB256FA
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 15:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB328197A95;
	Thu, 27 Jun 2024 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="CxIiYDOQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A710197556
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500541; cv=none; b=AIqh/uw+ytsIq3wtheEezTsk9lCb1O1La6TAJ5S5r/HHVrL9ZFGrIsvVuxS5MvYZpgwCguai70nGonu1XZxc5MxLNIsNLev6GMNPQZdQJue2aLBUu7Zl/zSbhdD3jxl2mWGIU4ISSCuYM5DjvpBW0hBNxnvGsy+M7jpjor1sHZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500541; c=relaxed/simple;
	bh=BLOQubT6+WDGMXLbalL2gtus5F0xeE3IKPVA5IYu2Zs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WcyWuuwhMHNsYSNuanwh2McKgFkrME7dFc4BL1uxuvjmTAT+2hz2/5FdgKpBsz46AOEOgPQPoaFk1gQgD0LFHwNSAUvZAwI/mPHaRnIaK7ku/5i0cJ3CLzPFS4XQBJUFDN3nye+WMps4dvb3d4a6h8H57tXk7aVZ73KudfEauPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=CxIiYDOQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a729da840a8so117831566b.1
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 08:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500538; x=1720105338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILtq9+4c141AHxBgbXMa+RP0emWEvg+/fmgpWsAX5kw=;
        b=CxIiYDOQ7V2PxKziJuZ64gyv5+XDJI1rxdIo8k+99KJ8uRYQdqzW2clKU9+x3AXY1x
         dYmhfOyt8N1bo0ZyJqjuvcfUkpEqwgr7X3RGZqLy+00enJ8TQNJ5pvfB/ZXHxsTjsXbK
         Lz3RkYY/LSBqAT7EfGGXkgYoUnWsUKWUwRr63QAwuwsz5L7S+gK+Y3oDELL7/6su69IX
         AHMhF9wVE6gMmiZHnWsgXC10js4CPF3tgzyzoY6sx3OJTgenGPTfgBtT6OYUni9J2D3f
         tMMhYldDvp4lXXR3rOWpwmET/tGTUOQhGCcbMcmxZJcmUuxPIMRT2U6s6tfS8F9cMobl
         4p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500538; x=1720105338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILtq9+4c141AHxBgbXMa+RP0emWEvg+/fmgpWsAX5kw=;
        b=OT803qHJHTRxrCUjYatQNn9h7eVkklK5Hy2ogc7bFJ+vFNY2O88dIQ5DaRzwNkwuT5
         GvFC+ChWL9uej34mey6yVI0Pr3lgrZ/ii0AT0kG3PXu6EhvWqg+Id3VYj6PLGUZAVpm6
         S0VG1lq/mwpFB3CFohhzjBPi8qMaW4dQOlTIMcIHaIwo0lL7iuN8tr0W6n9AR2SyOOcC
         V7M3C38pOuV39wChglPsLbv/bEZMtmwuWmm0HxaSVlp3v08BEFvPCQAXybCFZNR0ahzO
         f8QUiahPmgYVOtnnN9x8iGv0k994uJQdmcHQ7Z/sIIQ5p1TPLQZeRYfb7m+uLyZeKH6a
         mOrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqJtFUmxNwhY0p59sPxQdZ8mosnVXjggjaDwsBJfP3Xk6qGj12xWF6SfPDDejzzb1ZWN/zgflofagss3qpYYHZdRsBq/rLnnAa
X-Gm-Message-State: AOJu0YwFloCQX49GwXP3MeSfN8afhPll5Qk7r1hjR4E+k7AbuViL65W+
	tOB0o9Yrm5ZicMhKvIJCatAndW3moExjRAjBdgaWX1pviLmLsvnSYzU/QKMJKnE=
X-Google-Smtp-Source: AGHT+IGhzRCqP2RV73RAfCGRkGAsHtE5znhuHD+qNGBvgcJ+PHUmpdeZlb/WN59v+vhaTirBRQcRFg==
X-Received: by 2002:a17:906:dfc7:b0:a6e:f869:d718 with SMTP id a640c23a62f3a-a7296f808e2mr189909566b.21.1719500537821;
        Thu, 27 Jun 2024 08:02:17 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:02:17 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Patch v5 03/12] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
Date: Thu, 27 Jun 2024 17:00:21 +0200
Message-Id: <20240627150046.258795-4-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nxp,lpc3220-i2s DT binding documentation.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes for v5:
- Removed "N:" from the MAINTAINERS entry

Changes for v4:
- Custom dma-vc-names property with standard dmas and dma-names
- Added to MAINTAINERS

Changes for v3:
- Added '$ref: dai-common.yaml#' and '#sound-dai-cells'
- Dropped all clock-names, references
- Dropped status property from the example
- Added interrupts property
- 'make dt_binding_check' pass

Changes for v2:
- Added maintainers field
- Dropped clock-names
- Dropped unused unneded interrupts field

 .../bindings/sound/nxp,lpc3220-i2s.yaml       | 73 +++++++++++++++++++
 MAINTAINERS                                   |  9 +++
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
new file mode 100644
index 000000000000..40a0877a8aba
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,lpc3220-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32XX I2S Controller
+
+description:
+  The I2S controller in LPC32XX SoCs, ASoC DAI.
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input clock of the peripheral.
+
+  dmas:
+    items:
+      - description: RX DMA Channel
+      - description: TX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - dmas
+  - dma-names
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2s@20094000 {
+      compatible = "nxp,lpc3220-i2s";
+      reg = <0x20094000 0x1000>;
+      interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk LPC32XX_CLK_I2S0>;
+      dmas = <&dma 0 1>, <&dma 13 1>;
+      dma-names = "rx", "tx";
+      #sound-dai-cells = <0>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 79b44addc139..ceec359c68fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8918,6 +8918,15 @@ S:	Maintained
 F:	sound/soc/fsl/fsl*
 F:	sound/soc/fsl/imx*
 
+FREESCALE SOC LPC32XX SOUND DRIVERS
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
+
 FREESCALE SOC SOUND QMC DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.25.1


