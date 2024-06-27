Return-Path: <linux-i2c+bounces-4401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD7991AA27
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E01B7B25498
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 15:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26645195B08;
	Thu, 27 Jun 2024 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="aD7T0S4R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74CE198828
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500520; cv=none; b=Qbsrp+ffSs6hdUArICtCssMV09Sfa1P+6xa/ZdjF8KzfTqkO2Yh83D8FEtnA8M0NIs5A9z+PDg6yVz1S2gkunRRAqA2qDR3gZaFLNyzmJP/eOo6o4aEjkUHQNPgj3VIiEeHgMSrb28lj+VMS0C5h288jra1i3om+KO+uUfptQJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500520; c=relaxed/simple;
	bh=pLhrZ5IemSdTOWROkP7c38cEvRC3LBemwPPuEetKG/I=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oB9iyHY/0fWebZCNzLUsfFHkUFxXz+nvjRUAXiy1dgoHgOyNpTmackjAOrE3nVPP8yKuC/kFCW1UbJYmAdykMDb2o8dPNxXdZXI7bsQCAE8Tgo+DoETHxqLT0r7v3SOUEj3YrAsdPfniQIziTmAVGtXWzSs/t/mPtNG3PUR0Q5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=aD7T0S4R; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d1679ee83so1993707a12.2
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 08:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500517; x=1720105317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/QdVnRUTOEEApM29843GOo6CpoS9PWsW91LmoTv3mk=;
        b=aD7T0S4RKsuGMUeIi3Xl8hLZqltj+vuI5x2n8aREzwPiKJt0qOmC26IkC25p0nXiiq
         jrAuMntwRIp4cOBEJQWCW2mHB0NY7eO6Nis+MjPnnDkh795YbbIiZI6lBoRlHPVuReZp
         m1kIa3zikwlSqkrJItYLKf5gW9xWJb2nBKY8z8uz0kWujm5i+LfuW3wi8f/TW4dY8I5s
         uzRN7ta3kWoxBI0ahiVW0/2e/shJo1yKzKhG1mshYUnk5wixIA0Hz6zZr+u2Wx7hcokq
         qyUJfOdi64dm9upmT5n4Soo98qbw2MHLfjG1wRSGqbpccyaL5WBlVhKJ7OrgZB3lBE7y
         WlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500517; x=1720105317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/QdVnRUTOEEApM29843GOo6CpoS9PWsW91LmoTv3mk=;
        b=GQ+6+QEpu0vuun8fC6pcJB//irdX/OZgl9Zyyx55L5Gyv2ZU4tGBN2PUwBAr0ikDMI
         HBMOhK2YlwZo0lROvwJz46PmOiwsZ1P99KWEhnCf9XkLLW4tJD7Xr15k8JNkhXHG0ILj
         kIAXoxuUBW7Fnw1ReJjeD3Zcb1ISMQjzE1NA4TxvDZzUPQk5dh0nnPtGT4Cn4SjR2Gta
         eRvIJojWiXaUSwVbBmpmzlMKTMscmKyXQY3hKIKf4GRxX/Ca25ZHtsb0TRAGRMzw2zxJ
         H0o+QzI5mbW/rxlURU0q/jUu4y5XsvnIbVqK5rHIgDB6P5u+F/z6H7glsrU4AZGcev2m
         KOww==
X-Forwarded-Encrypted: i=1; AJvYcCVKCrwwCpIpci3vMCCHByI92KAKNYxbMvwbpGcLWYOLh43IdWvpUycjQZO7CgiQoOic2xROPYxoovIRpFZ6kCdSLreU1Vz3J1sQ
X-Gm-Message-State: AOJu0Ywq3vjcD4/FQO2Zt/dq7qpaeuLadL7y55dyDuYXRC8I8S45txYl
	xzg8M/LvVGkQUlXQ17bQhbTn++jyvbVyP3rp0DHl5gCJsqS1DTnFNrtIF+/OmaU=
X-Google-Smtp-Source: AGHT+IEWo8x1/iXINSSRXRjfHX6NuiOJZ+9H3uzsJ+4Q86IVM9o4hb3qxcQgbAHUbFD+wWnFiMHwIQ==
X-Received: by 2002:a17:906:4a12:b0:a6f:d085:9e32 with SMTP id a640c23a62f3a-a716593e3efmr933093866b.76.1719500516992;
        Thu, 27 Jun 2024 08:01:56 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:01:56 -0700 (PDT)
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
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
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
Subject: [Patch v5 02/12] dt-bindings: dma: Add lpc32xx DMA mux binding
Date: Thu, 27 Jun 2024 17:00:20 +0200
Message-Id: <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>
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

LPC32XX SoCs use pl080 dma controller which have few request signals
multiplexed between peripherals. This binding describes how devices can
use the multiplexed request signals.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- Corrected property order
- Added maxItems to properties
- Fixed example
- Removed "N:: from the MAINTAINERS entry
- Added Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com> to LPC32XX maintainers

Changes for v4:
- This patch is new in v4

 .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 49 +++++++++++++++++++
 MAINTAINERS                                   |  9 ++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
new file mode 100644
index 000000000000..32f208744154
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nxp,lpc3220-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DMA multiplexer for LPC32XX SoC (DMA request router)
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dma-router.yaml#
+
+properties:
+  compatible:
+    const: nxp,lpc3220-dmamux
+
+  reg:
+    maxItems: 1
+
+  dma-masters:
+    description: phandle to a dma node compatible with arm,pl080
+    maxItems: 1
+
+  "#dma-cells":
+    const: 3
+    description: |
+      First two cells same as for device pointed in dma-masters.
+      Third cell represents mux value for the request.
+
+required:
+  - compatible
+  - reg
+  - dma-masters
+
+additionalProperties: false
+
+examples:
+  - |
+    dma-router@7c {
+      compatible = "nxp,lpc3220-dmamux";
+      reg = <0x7c 0x8>;
+      dma-masters = <&dma>;
+      #dma-cells = <3>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..79b44addc139 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2384,6 +2384,7 @@ N:	lpc18xx
 
 ARM/LPC32XX SOC SUPPORT
 M:	Vladimir Zapolskiy <vz@mleia.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://github.com/vzapolskiy/linux-lpc32xx.git
@@ -2396,6 +2397,14 @@ F:	drivers/usb/host/ohci-nxp.c
 F:	drivers/watchdog/pnx4008_wdt.c
 N:	lpc32xx
 
+LPC32XX DMAMUX SUPPORT
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
+
 ARM/Marvell Dove/MV78xx0/Orion SOC support
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
-- 
2.25.1


