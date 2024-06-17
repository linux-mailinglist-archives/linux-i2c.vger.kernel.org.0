Return-Path: <linux-i2c+bounces-4055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F1B90A638
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 08:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9D061F2133F
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 06:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2BB17F36D;
	Mon, 17 Jun 2024 06:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcAlIQ4p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99653186E2A
	for <linux-i2c@vger.kernel.org>; Mon, 17 Jun 2024 06:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718607518; cv=none; b=WaAu9MekZAwTtvMEMBjobWKPJTqKz8ThEDXUSvg+BzwJLgxxjRcvgtZHVQiiHeHtkz6wReo92VHo7ujQtAvnI2/mXTSqBdwcxuYzaAYwySbMZvd8bOMQ3iMxUDsXP5o00FzT42wyjtUR3TVCmmWL8g0m5U6KkPu4m64jyaWcpfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718607518; c=relaxed/simple;
	bh=cEAhUXG/dXxZy79lMsyJc9T7DTfQN0T3idfYHcSGBek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A/0n/MKV6BUIc6VdaSA/sWTjm9S8aZGhCmdNmHHnSIvOxxADGiL4YAgFQQQsmsk+982JRrjbo1McIMJx0xwHkBuV6nXwp8vL1w1guWNaDxE8r5IyAOTWulNwjZttFrFONkda2ChEcwJpVnwyhT5w9AFDmEWoUSv7lWmacy3mRJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OcAlIQ4p; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57cce3bc8c6so1745675a12.3
        for <linux-i2c@vger.kernel.org>; Sun, 16 Jun 2024 23:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718607514; x=1719212314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W15po503BVfHBgpvkhpY0eakZKMvYFfMyE4xKTn5ksc=;
        b=OcAlIQ4ptbvBxAW6NIoOgxFQcrK3BqKIDBjJqMFvdCjaBFKn+bX0u/r4Kk09xy6RlH
         oB8ba/PYtZqJ2dfolDeptLWCs23kzlwMRmBr3bMiTVYwzYA8XlQ9/twXDpzEA5GhXC0s
         Wiq/T/h2WPlres3Q2Z7/fnjGzrsrYcnuIaY1/bdbwN8mN/Eswb3GCeHoHXJmu57qew+9
         NUAZy7oJM1MbwOcj+/iT2/T8MQ4F6wQxQ52vLI6t2st3aw4eJJftcnMEApg+mpUiiKnd
         KupVmVvUh3xrRFPBrczN80iEHEVhoR2Xv7978ei/u5dGLCiIQua7Ayy8SkfObXcqoSy7
         6y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718607514; x=1719212314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W15po503BVfHBgpvkhpY0eakZKMvYFfMyE4xKTn5ksc=;
        b=WT1TwQxiUByMw7ld4iV24bgmxDKp6hCI8T1Cc6HIokPo543v9cseiDd0dQv7NrPTDt
         +YSP5yATr5jMfEoh4R/BEG73XNnf44S71fBsxFrFcAu2s/LmZiXISvRjxxEJPIzFGxLc
         BAZY9A3yZhl1DkcUdnsBomkMrfk2Alk7Pgr87ISIFRlbRnfGMCgA+afNxQaLPz/6xVso
         RPRpLdP0qJZrWH0BhFqL/VcLULgTwv2wce+AQOkJANd3mDBaTLuQsrZG5kbDpGVIvU4V
         RHcfWLFrJB2MlpZs7IJRpNjqsAvdZAn8UaXIn2qlLZ+av6TtEcZinEJfVUGMlMw8JOBp
         e1sg==
X-Forwarded-Encrypted: i=1; AJvYcCWGqFBUmMHGqM6/dUXWcfUn9gufPZu4ndtff6xq20GPER/hmq/0p72YmYAkV/27i0xvReLEVhQOMal4OQfDHIVVmJsF7syiSiQZ
X-Gm-Message-State: AOJu0YyEhdMB4nC2hDUvdpeEGFdXWEx8UUMOjfn9UFdNww4jYHk4gfgX
	vy/iHQ3C/SNCGzBUqecxdllgG+CblG4wWQN9FLP6pyF1xJvwIMuy+kJVAtVE9h0=
X-Google-Smtp-Source: AGHT+IHP0MoHttwuvIfQUctzbZpQuc+CM/ZNmo2n+Zj527Dh21zLiZysCADfQAVNNhcQOCsoGKdAcg==
X-Received: by 2002:a17:906:af08:b0:a6e:46ab:9a9b with SMTP id a640c23a62f3a-a6f60d1e0e8mr626530266b.31.1718607513498;
        Sun, 16 Jun 2024 23:58:33 -0700 (PDT)
Received: from krzk-bin.. ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f86dfdb22sm107917866b.77.2024.06.16.23.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 23:58:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] dt-bindings: drop stale Anson Huang from maintainers
Date: Mon, 17 Jun 2024 08:58:28 +0200
Message-ID: <20240617065828.9531-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Emails to Anson Huang bounce:

  Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access denied.

Add IMX platform maintainers for bindings which would become orphaned.

Acked-by: Uwe Kleine-König <ukleinek@kernel.org>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add acks/Rbs.
2. Change clock maintainers to Abel Vesa and Peng Fan.
3. Change iio/magnetometer maintainer to Jonathan.
---
 .../devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.yaml    | 4 +++-
 Documentation/devicetree/bindings/clock/imx6q-clock.yaml      | 3 ++-
 Documentation/devicetree/bindings/clock/imx6sl-clock.yaml     | 3 ++-
 Documentation/devicetree/bindings/clock/imx6sll-clock.yaml    | 3 ++-
 Documentation/devicetree/bindings/clock/imx6sx-clock.yaml     | 3 ++-
 Documentation/devicetree/bindings/clock/imx6ul-clock.yaml     | 3 ++-
 Documentation/devicetree/bindings/clock/imx7d-clock.yaml      | 1 -
 Documentation/devicetree/bindings/clock/imx8m-clock.yaml      | 3 ++-
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml      | 4 +++-
 Documentation/devicetree/bindings/gpio/gpio-mxs.yaml          | 1 -
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml      | 4 +++-
 .../devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml     | 2 +-
 .../devicetree/bindings/memory-controllers/fsl/mmdc.yaml      | 4 +++-
 Documentation/devicetree/bindings/nvmem/imx-iim.yaml          | 4 +++-
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml        | 4 +++-
 Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml        | 4 +++-
 Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml        | 4 +++-
 Documentation/devicetree/bindings/pwm/mxs-pwm.yaml            | 1 -
 Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml      | 4 +++-
 Documentation/devicetree/bindings/thermal/imx-thermal.yaml    | 1 -
 Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml | 4 +++-
 Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml  | 4 +++-
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml   | 4 +++-
 .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 +++-
 24 files changed, 52 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.yaml
index 526f508cb98d..bd39cf107f3e 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.yaml
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-sim.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX7ULP System Integration Module
 
 maintainers:
-  - Anson Huang <anson.huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   The system integration module (SIM) provides system control and chip configuration
diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
index bae4fcb3aacc..cd3c04c883df 100644
--- a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX6 Quad Clock Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Abel Vesa <abelvesa@kernel.org>
+  - Peng Fan <peng.fan@nxp.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml b/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml
index c85ff6ea3d24..6713bbb14f30 100644
--- a/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6sl-clock.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX6 SoloLite Clock Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Abel Vesa <abelvesa@kernel.org>
+  - Peng Fan <peng.fan@nxp.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml b/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml
index 6b549ed1493c..6d64cf9463c9 100644
--- a/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6sll-clock.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX6 SLL Clock Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Abel Vesa <abelvesa@kernel.org>
+  - Peng Fan <peng.fan@nxp.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml b/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml
index 55dcad18b7c6..77afa4b81cf7 100644
--- a/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6sx-clock.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX6 SoloX Clock Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Abel Vesa <abelvesa@kernel.org>
+  - Peng Fan <peng.fan@nxp.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
index be54d4df5afa..d57e18a210cc 100644
--- a/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6ul-clock.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX6 UltraLite Clock Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Abel Vesa <abelvesa@kernel.org>
+  - Peng Fan <peng.fan@nxp.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/clock/imx7d-clock.yaml b/Documentation/devicetree/bindings/clock/imx7d-clock.yaml
index e7d8427e4957..880d602d09f4 100644
--- a/Documentation/devicetree/bindings/clock/imx7d-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx7d-clock.yaml
@@ -8,7 +8,6 @@ title: Freescale i.MX7 Dual Clock Controller
 
 maintainers:
   - Frank Li <Frank.Li@nxp.com>
-  - Anson Huang <Anson.Huang@nxp.com>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index 80539f88bc27..c643d4a81478 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP i.MX8M Family Clock Control Module
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Abel Vesa <abelvesa@kernel.org>
+  - Peng Fan <peng.fan@nxp.com>
 
 description: |
   NXP i.MX8M Mini/Nano/Plus/Quad clock control module is an integrated clock
diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index 918776d16ef3..e1fc8bb6d379 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX/MXC GPIO controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
index dfa1133f8c5e..8ff54369d16c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
@@ -8,7 +8,6 @@ title: Freescale MXS GPIO controller
 
 maintainers:
   - Shawn Guo <shawnguo@kernel.org>
-  - Anson Huang <Anson.Huang@nxp.com>
 
 description: |
   The Freescale MXS GPIO controller is part of MXS PIN controller.
diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index 54d500be6aaa..1dcb9c78de3b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale Low Power Inter IC (LPI2C) for i.MX
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
diff --git a/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml b/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml
index 6b54d32323fc..fbe8c2eb0857 100644
--- a/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml
+++ b/Documentation/devicetree/bindings/iio/magnetometer/fsl,mag3110.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale MAG3110 magnetometer sensor
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Jonathan Cameron <jic23@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.yaml
index 71547eee9919..5447f1dddedf 100644
--- a/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale Multi Mode DDR controller (MMDC)
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
index e9d9d8df4811..bb37d72c9eaa 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX IC Identification Module (IIM)
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   This binding represents the IC Identification Module (IIM) found on
diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index be1314454bec..e21c06e9a741 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX On-Chip OTP Controller (OCOTP)
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   This binding represents the on-chip eFuse OTP controller found on
diff --git a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
index d9287be89877..95121dd6311c 100644
--- a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: On-Chip OTP Memory for Freescale i.MX23/i.MX28
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 allOf:
   - $ref: nvmem.yaml#
diff --git a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
index 8bef9dfeba9a..ac0a35bf8648 100644
--- a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX TPM PWM controller
 
 maintainers:
-  - Anson Huang <anson.huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   The TPM counter and period counter are shared between multiple
diff --git a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
index 8f50e23ca8c9..a9d3a41ac5b9 100644
--- a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
@@ -8,7 +8,6 @@ title: Freescale MXS PWM controller
 
 maintainers:
   - Shawn Guo <shawnguo@kernel.org>
-  - Anson Huang <anson.huang@nxp.com>
 
 allOf:
   - $ref: pwm.yaml#
diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
index 2ff174244795..ed1d4aa41b8c 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale Low Power SPI (LPSPI) for i.MX
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 allOf:
   - $ref: /schemas/spi/spi-controller.yaml#
diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
index 808d987bd8d1..337560562337 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -8,7 +8,6 @@ title: NXP i.MX Thermal
 
 maintainers:
   - Shawn Guo <shawnguo@kernel.org>
-  - Anson Huang <Anson.Huang@nxp.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
index d2c1e4573c32..42e2317a00f5 100644
--- a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP i.MX8M Mini Thermal
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   i.MX8MM has TMU IP to allow temperature measurement, there are
diff --git a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
index d155d6799da6..66c4972d5072 100644
--- a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Thermal Monitoring Unit (TMU) on Freescale QorIQ SoCs
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 181f0cc5b5bd..36b836d0620c 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX Watchdog Timer (WDT) Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
index 9c50766bf690..a09686b3030d 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale i.MX7ULP Watchdog Timer (WDT) Controller
 
 maintainers:
-  - Anson Huang <Anson.Huang@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+  - Fabio Estevam <festevam@gmail.com>
 
 allOf:
   - $ref: watchdog.yaml#
-- 
2.43.0


