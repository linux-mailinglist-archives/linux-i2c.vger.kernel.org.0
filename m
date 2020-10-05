Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B829283ECC
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Oct 2020 20:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728836AbgJESit (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 14:38:49 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45882 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbgJESip (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Oct 2020 14:38:45 -0400
Received: by mail-oi1-f193.google.com with SMTP id z26so9693092oih.12;
        Mon, 05 Oct 2020 11:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H1vCx0sy+r9h3QgbihQNe/XTrE/8r1GGdyo9ez/rWec=;
        b=frJdIMKomePlG/3x34lzFeiIA57KBYx4+p6dToMHSoCmchqU5I4YWvZ+yBfy6ugOKv
         Jy9mpTh2QHRDYFAWMd31eGeH1gZcTUKnNmlf6SsNcqRw3U6WOcyxNe+irAYgwWqzWKJL
         vYiz0l4T10eT8UKgPEFmy8+rCYm3VdpzKA1zhF61mHtl00pl5Y7hkVNafHhj0rnfmFet
         0XYRmbIsmXbndXJ81dG+MLChEJGCZAvy3pjhPKRSur5pNMWmTYrVk7wce3NrZdUI5sjt
         YLc+NG8Qcry7oMw/FP5yNYJ5OylmnJqgoHB+J9fk6LQpN8vqEE7NhSayiiKFtUsIUd0I
         vqVQ==
X-Gm-Message-State: AOAM530d0Ec3zNakkaTd4favvZEyj/+ilzXK6axvAnytAlx3cWsrCp63
        rOJvExK/oDEPEee9UUfm+kvYZHETevTv
X-Google-Smtp-Source: ABdhPJyZyqgi1zm9cKcjkKMkLiWagpMnvhgHDHeF2Xt6lK5jltjfgUOPMjuGJPzDlPyMeW00v6zkIw==
X-Received: by 2002:aca:3607:: with SMTP id d7mr84929oia.168.1601923119349;
        Mon, 05 Oct 2020 11:38:39 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id z25sm143140otq.31.2020.10.05.11.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 11:38:38 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: Add missing 'unevaluatedProperties'
Date:   Mon,  5 Oct 2020 13:38:27 -0500
Message-Id: <20201005183830.486085-2-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201005183830.486085-1-robh@kernel.org>
References: <20201005183830.486085-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This doesn't yet do anything in the tools, but make it explicit so we can
check either 'unevaluatedProperties' or 'additionalProperties' is present
in schemas.

'unevaluatedProperties' is appropriate when including another schema (via
'$ref') and all possible properties and/or child nodes are not
explicitly listed in the schema with the '$ref'.

This is in preparation to add a meta-schema to check for missing
'unevaluatedProperties' or 'additionalProperties'. This has been a
constant source of review issues.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/coresight-cti.yaml     | 2 ++
 Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml    | 2 ++
 Documentation/devicetree/bindings/ata/faraday,ftide010.yaml  | 2 ++
 Documentation/devicetree/bindings/bus/renesas,bsc.yaml       | 2 ++
 .../devicetree/bindings/display/panel/tpo,tpg110.yaml        | 2 ++
 Documentation/devicetree/bindings/dma/ingenic,dma.yaml       | 2 ++
 Documentation/devicetree/bindings/dma/st,stm32-dma.yaml      | 2 ++
 Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml   | 2 ++
 Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml     | 2 ++
 Documentation/devicetree/bindings/dma/ti/k3-udma.yaml        | 2 ++
 .../devicetree/bindings/i2c/amlogic,meson6-i2c.yaml          | 2 ++
 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml    | 2 ++
 Documentation/devicetree/bindings/i2c/i2c-gpio.yaml          | 2 ++
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml          | 2 ++
 .../devicetree/bindings/i2c/socionext,uniphier-fi2c.yaml     | 2 ++
 .../devicetree/bindings/i2c/socionext,uniphier-i2c.yaml      | 2 ++
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml      | 2 ++
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml         | 2 ++
 .../devicetree/bindings/iio/accel/adi,adis16240.yaml         | 2 ++
 Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml | 2 ++
 Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml | 2 ++
 Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml    | 2 ++
 Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml    | 2 ++
 Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml    | 2 ++
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml    | 2 ++
 Documentation/devicetree/bindings/iio/adc/adi,ad7923.yaml    | 2 ++
 Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml | 2 ++
 Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml   | 2 ++
 Documentation/devicetree/bindings/iio/frequency/adf4371.yaml | 2 ++
 Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml | 2 ++
 Documentation/devicetree/bindings/iio/imu/adi,adis16475.yaml | 2 ++
 Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml  | 2 ++
 Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml  | 2 ++
 .../devicetree/bindings/input/fsl,mpr121-touchkey.yaml       | 2 ++
 .../bindings/interrupt-controller/loongson,htpic.yaml        | 2 ++
 .../bindings/interrupt-controller/loongson,liointc.yaml      | 2 ++
 .../bindings/memory-controllers/renesas,rpc-if.yaml          | 2 ++
 .../devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml       | 2 ++
 Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml        | 2 ++
 Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml       | 2 ++
 Documentation/devicetree/bindings/mmc/owl-mmc.yaml           | 2 ++
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml  | 2 ++
 Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml         | 2 ++
 .../devicetree/bindings/mmc/socionext,uniphier-sd.yaml       | 2 ++
 Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml  | 2 ++
 Documentation/devicetree/bindings/mtd/denali,nand.yaml       | 2 ++
 Documentation/devicetree/bindings/mtd/ingenic,nand.yaml      | 2 ++
 .../devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml          | 2 ++
 Documentation/devicetree/bindings/net/adi,adin.yaml          | 2 ++
 .../devicetree/bindings/net/amlogic,meson-dwmac.yaml         | 2 ++
 .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml         | 2 ++
 Documentation/devicetree/bindings/net/marvell,mvusb.yaml     | 2 ++
 .../devicetree/bindings/net/mediatek,star-emac.yaml          | 2 ++
 Documentation/devicetree/bindings/net/nxp,tja11xx.yaml       | 2 ++
 Documentation/devicetree/bindings/net/qca,ar71xx.yaml        | 2 ++
 Documentation/devicetree/bindings/net/qca,ar803x.yaml        | 2 ++
 Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml | 2 ++
 Documentation/devicetree/bindings/net/qcom,ipq8064-mdio.yaml | 2 ++
 Documentation/devicetree/bindings/net/renesas,ether.yaml     | 2 ++
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml       | 2 ++
 Documentation/devicetree/bindings/net/ti,davinci-mdio.yaml   | 2 ++
 Documentation/devicetree/bindings/net/ti,dp83867.yaml        | 2 ++
 Documentation/devicetree/bindings/net/ti,dp83869.yaml        | 2 ++
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml       | 2 ++
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml     | 2 ++
 Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml  | 2 ++
 Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml  | 2 ++
 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml  | 2 ++
 Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml | 2 ++
 .../devicetree/bindings/pci/cdns,cdns-pcie-host.yaml         | 2 ++
 Documentation/devicetree/bindings/pci/host-generic-pci.yaml  | 2 ++
 Documentation/devicetree/bindings/pci/loongson.yaml          | 2 ++
 Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml   | 2 ++
 Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml | 2 ++
 Documentation/devicetree/bindings/pci/versatile.yaml         | 2 ++
 Documentation/devicetree/bindings/power/pd-samsung.yaml      | 2 ++
 .../devicetree/bindings/regulator/fixed-regulator.yaml       | 2 ++
 .../bindings/regulator/google,cros-ec-regulator.yaml         | 2 ++
 .../devicetree/bindings/regulator/gpio-regulator.yaml        | 2 ++
 .../devicetree/bindings/regulator/st,stm32-booster.yaml      | 2 ++
 .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml      | 2 ++
 .../bindings/regulator/vqmmc-ipq4019-regulator.yaml          | 2 ++
 Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml       | 2 ++
 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml           | 2 ++
 Documentation/devicetree/bindings/serial/ingenic,uart.yaml   | 5 +++++
 Documentation/devicetree/bindings/serial/renesas,hscif.yaml  | 2 ++
 Documentation/devicetree/bindings/serial/renesas,sci.yaml    | 2 ++
 Documentation/devicetree/bindings/serial/renesas,scif.yaml   | 2 ++
 Documentation/devicetree/bindings/serial/renesas,scifa.yaml  | 2 ++
 Documentation/devicetree/bindings/serial/renesas,scifb.yaml  | 2 ++
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml         | 2 ++
 .../devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml      | 2 ++
 .../devicetree/bindings/spi/amlogic,meson6-spifc.yaml        | 2 ++
 .../devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml          | 2 ++
 Documentation/devicetree/bindings/spi/qca,ar934x-spi.yaml    | 2 ++
 .../devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml          | 2 ++
 Documentation/devicetree/bindings/spi/renesas,hspi.yaml      | 2 ++
 Documentation/devicetree/bindings/spi/renesas,rspi.yaml      | 2 ++
 Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml  | 2 ++
 .../devicetree/bindings/spi/socionext,uniphier-spi.yaml      | 2 ++
 Documentation/devicetree/bindings/spi/spi-gpio.yaml          | 2 ++
 Documentation/devicetree/bindings/spi/spi-mux.yaml           | 2 ++
 Documentation/devicetree/bindings/spi/spi-pl022.yaml         | 2 ++
 Documentation/devicetree/bindings/spi/spi-rockchip.yaml      | 2 ++
 Documentation/devicetree/bindings/spi/spi-sifive.yaml        | 2 ++
 Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml     | 2 ++
 Documentation/devicetree/bindings/spi/st,stm32-spi.yaml      | 2 ++
 .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml | 2 ++
 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml  | 2 ++
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml     | 2 ++
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml  | 2 ++
 .../devicetree/bindings/watchdog/st,stm32-iwdg.yaml          | 2 ++
 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml   | 2 ++
 113 files changed, 229 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/coresight-cti.yaml b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
index e42ff69d8bfb..21e3515491f4 100644
--- a/Documentation/devicetree/bindings/arm/coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
@@ -220,6 +220,8 @@ then:
   required:
     - cpu
 
+unevaluatedProperties: false
+
 examples:
   # minimum CTI definition. DEVID register used to set number of triggers.
   - |
diff --git a/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
index 9f276bc9efa0..8e711bd202fd 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
@@ -50,6 +50,8 @@ required:
   - '#size-cells'
   - dma-ranges
 
+unevaluatedProperties: false
+
 examples:
   - |
     mlahb: ahb@38000000 {
diff --git a/Documentation/devicetree/bindings/ata/faraday,ftide010.yaml b/Documentation/devicetree/bindings/ata/faraday,ftide010.yaml
index 6451928dd2ce..fa16f3767c6a 100644
--- a/Documentation/devicetree/bindings/ata/faraday,ftide010.yaml
+++ b/Documentation/devicetree/bindings/ata/faraday,ftide010.yaml
@@ -64,6 +64,8 @@ allOf:
       required:
         - sata
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
diff --git a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
index 7d10b62a52d5..f53a37785413 100644
--- a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
+++ b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
@@ -44,6 +44,8 @@ properties:
 required:
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
index a51660b73f28..6f1f02044b4b 100644
--- a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
+++ b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
@@ -72,6 +72,8 @@ required:
   - spi-max-frequency
   - port
 
+unevaluatedProperties: false
+
 examples:
   - |+
     spi {
diff --git a/Documentation/devicetree/bindings/dma/ingenic,dma.yaml b/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
index 92794c500589..00f19b3cac31 100644
--- a/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
+++ b/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
@@ -62,6 +62,8 @@ required:
   - interrupts
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/jz4780-cgu.h>
diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
index 71987878e4ae..2a5325f480f6 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
@@ -81,6 +81,8 @@ required:
   - clocks
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
index 915bc4af9568..c8d2b51d8410 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
+++ b/Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
@@ -33,6 +33,8 @@ required:
   - reg
   - dma-masters
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml b/Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml
index c66543d0c267..c30be840be1c 100644
--- a/Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml
+++ b/Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml
@@ -84,6 +84,8 @@ required:
   - clocks
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/dma/ti/k3-udma.yaml b/Documentation/devicetree/bindings/dma/ti/k3-udma.yaml
index dd70ddab4fd1..9a87fd9041eb 100644
--- a/Documentation/devicetree/bindings/dma/ti/k3-udma.yaml
+++ b/Documentation/devicetree/bindings/dma/ti/k3-udma.yaml
@@ -141,6 +141,8 @@ then:
   required:
     - ti,udma-atype
 
+unevaluatedProperties: false
+
 examples:
   - |+
     cbass_main {
diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
index 49cad273c8e5..6ecb0270d88d 100644
--- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
@@ -36,6 +36,8 @@ required:
   - interrupts
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     i2c@c8100500 {
diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
index dc0952f3780f..1ca1cd19bd1d 100644
--- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -44,6 +44,8 @@ required:
   - clocks
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
index 78ffcab2428c..cc3aa2a5e70b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
@@ -70,4 +70,6 @@ required:
   - sda-gpios
   - scl-gpios
 
+unevaluatedProperties: false
+
 ...
diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 790aa7218ee0..7f254d79558c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -117,6 +117,8 @@ then:
   required:
     - rockchip,grf
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/rk3188-cru-common.h>
diff --git a/Documentation/devicetree/bindings/i2c/socionext,uniphier-fi2c.yaml b/Documentation/devicetree/bindings/i2c/socionext,uniphier-fi2c.yaml
index 15abc022968e..c76131902b77 100644
--- a/Documentation/devicetree/bindings/i2c/socionext,uniphier-fi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/socionext,uniphier-fi2c.yaml
@@ -37,6 +37,8 @@ required:
   - interrupts
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     i2c0: i2c@58780000 {
diff --git a/Documentation/devicetree/bindings/i2c/socionext,uniphier-i2c.yaml b/Documentation/devicetree/bindings/i2c/socionext,uniphier-i2c.yaml
index ef998def554e..ddde08636ab0 100644
--- a/Documentation/devicetree/bindings/i2c/socionext,uniphier-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/socionext,uniphier-i2c.yaml
@@ -37,6 +37,8 @@ required:
   - interrupts
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     i2c0: i2c@58400000 {
diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index f2fcbb361180..d747f4990ad8 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -94,6 +94,8 @@ required:
   - resets
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/mfd/stm32f7-rcc.h>
diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index 67c1c84ba3dc..ffb2ed039a5e 100644
--- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
+++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
@@ -36,6 +36,8 @@ required:
   - interrupts
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     axi_iic_0: i2c@40800000 {
diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
index 4147f02b5e3c..8589b722028d 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
@@ -30,6 +30,8 @@ required:
   - reg
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
index fd4eaa3d0ab4..591ca32181b0 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
@@ -40,6 +40,8 @@ required:
   - reg
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
index e7daffec88d3..64f275c8e2d9 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
@@ -30,6 +30,8 @@ required:
   - reg
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
         #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
index deb34deff0e8..d0d2880626c2 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
@@ -108,6 +108,8 @@ patternProperties:
       - reg
       - diff-channels
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi {
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
index d0913034b1d8..ed363a796e50 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
@@ -92,6 +92,8 @@ required:
   - spi-cpol
   - spi-cpha
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi0 {
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
index e1f6d64bdccd..55e973c6449c 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
@@ -63,6 +63,8 @@ patternProperties:
     required:
       - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi {
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index cbb8819d7069..014b020ed0c2 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -102,6 +102,8 @@ required:
   - interrupts
   - adi,conversion-start-gpios
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7923.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7923.yaml
index a11b918e0016..2a17641faed5 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7923.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7923.yaml
@@ -47,6 +47,8 @@ required:
   - compatible
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi {
diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
index f562505f5ecd..181213b862db 100644
--- a/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
@@ -45,6 +45,8 @@ required:
   - vdd-supply
   - vref-supply
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml
index 82424e06be27..faef288b7148 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml
@@ -130,6 +130,8 @@ required:
   - channel@4
   - channel@5
 
+unevaluatedProperties: false
+
 examples:
   - |
         spi {
diff --git a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
index 7ec3ec94356b..11d445f7010e 100644
--- a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
+++ b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
@@ -46,6 +46,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi0 {
diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml b/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
index 0c53009ba7d6..07c8ed4ee0f1 100644
--- a/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
@@ -33,6 +33,8 @@ required:
   - reg
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16475.yaml b/Documentation/devicetree/bindings/iio/imu/adi,adis16475.yaml
index 208faaffa58d..c29385697bbf 100644
--- a/Documentation/devicetree/bindings/iio/imu/adi,adis16475.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16475.yaml
@@ -116,6 +116,8 @@ allOf:
       dependencies:
         adi,sync-mode: [ clocks ]
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
diff --git a/Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml b/Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml
index 33d8e9fd14b7..4f215399c8df 100644
--- a/Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml
@@ -50,6 +50,8 @@ required:
   - compatible
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     // Example for I2C
diff --git a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
index 63bcb73ae309..716731c2b794 100644
--- a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
@@ -40,6 +40,8 @@ required:
   - compatible
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
index 5b37be0be4e9..378a85c09d34 100644
--- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
+++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
@@ -48,6 +48,8 @@ required:
   - vdd-supply
   - linux,keycodes
 
+unevaluatedProperties: false
+
 examples:
   - |
     // Example with interrupts
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml
index c8861cbbb8b5..d1d52d1db2be 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml
@@ -41,6 +41,8 @@ required:
   - interrupt-controller
   - '#interrupt-cells'
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
index 03fc4f5b4b39..f38e0113f360 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
@@ -67,6 +67,8 @@ required:
   - 'loongson,parent_int_map'
 
 
+unevaluatedProperties: false
+
 examples:
   - |
     iointc: interrupt-controller@3ff01400 {
diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
index 7bfe120e14c3..6d6ba608fd22 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -61,6 +61,8 @@ patternProperties:
           - cfi-flash
           - jedec,spi-nor
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/renesas-cpg-mssr.h>
diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
index 0cd74c3116f8..60955acb8e57 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
@@ -50,6 +50,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
index d93f7794a85f..af7442f73881 100644
--- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
@@ -117,6 +117,8 @@ required:
   - interrupts
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     emmc: mmc@5a000000 {
diff --git a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
index 9b63df1c22fb..04ba8b7fc054 100644
--- a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
@@ -56,6 +56,8 @@ required:
   - dmas
   - dma-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/jz4780-cgu.h>
diff --git a/Documentation/devicetree/bindings/mmc/owl-mmc.yaml b/Documentation/devicetree/bindings/mmc/owl-mmc.yaml
index 1380501fb8f0..5cee3a82a712 100644
--- a/Documentation/devicetree/bindings/mmc/owl-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/owl-mmc.yaml
@@ -43,6 +43,8 @@ required:
   - dmas
   - dma-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     mmc0: mmc@e0330000 {
diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index 01316185e771..3762f1c8de96 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -102,6 +102,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/rk3288-cru.h>
diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
index a58715c860b7..aa12480648a5 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
@@ -73,6 +73,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/berlin2.h>
diff --git a/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml b/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml
index 8d6413f48823..56f9ff12742d 100644
--- a/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml
@@ -77,6 +77,8 @@ required:
   - reset-names
   - resets
 
+unevaluatedProperties: false
+
 examples:
   - |
     sd: mmc@5a400000 {
diff --git a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml
index dd2c1b147142..240abb6f102c 100644
--- a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml
@@ -42,6 +42,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     mmc@12200000 {
diff --git a/Documentation/devicetree/bindings/mtd/denali,nand.yaml b/Documentation/devicetree/bindings/mtd/denali,nand.yaml
index c07b91592cbd..1307ed7e7fc6 100644
--- a/Documentation/devicetree/bindings/mtd/denali,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/denali,nand.yaml
@@ -128,6 +128,8 @@ required:
   - clock-names
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     nand-controller@ff900000 {
diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
index 8abb6d463cb6..89aa3ceda592 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
@@ -51,6 +51,8 @@ required:
   - compatible
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/jz4780-cgu.h>
diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
index 28a08ff407db..29c5ef24ac6a 100644
--- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
@@ -94,6 +94,8 @@ required:
   - reg
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/net/adi,adin.yaml b/Documentation/devicetree/bindings/net/adi,adin.yaml
index d95cc691a65f..1129f2b58e98 100644
--- a/Documentation/devicetree/bindings/net/adi,adin.yaml
+++ b/Documentation/devicetree/bindings/net/adi,adin.yaml
@@ -36,6 +36,8 @@ properties:
     enum: [ 4, 8, 12, 16, 20, 24 ]
     default: 8
 
+unevaluatedProperties: false
+
 examples:
   - |
     ethernet {
diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 85fefe3a0444..6b057b117aa0 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -120,6 +120,8 @@ required:
   - clock-names
   - phy-mode
 
+unevaluatedProperties: false
+
 examples:
   - |
     ethmac: ethernet@c9410000 {
diff --git a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
index 71808e78a495..1c88820cbcdf 100644
--- a/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/aspeed,ast2600-mdio.yaml
@@ -30,6 +30,8 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+unevaluatedProperties: false
+
 examples:
   - |
     mdio0: mdio@1e650000 {
diff --git a/Documentation/devicetree/bindings/net/marvell,mvusb.yaml b/Documentation/devicetree/bindings/net/marvell,mvusb.yaml
index 68573762294b..8e288ab38fd7 100644
--- a/Documentation/devicetree/bindings/net/marvell,mvusb.yaml
+++ b/Documentation/devicetree/bindings/net/marvell,mvusb.yaml
@@ -35,6 +35,8 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+unevaluatedProperties: false
+
 examples:
   - |
     /* USB host controller */
diff --git a/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
index aea88e621792..0bbd598704e9 100644
--- a/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
@@ -61,6 +61,8 @@ required:
   - mediatek,pericfg
   - phy-handle
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/net/nxp,tja11xx.yaml b/Documentation/devicetree/bindings/net/nxp,tja11xx.yaml
index 42be0255512b..d51da24f3505 100644
--- a/Documentation/devicetree/bindings/net/nxp,tja11xx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,tja11xx.yaml
@@ -34,6 +34,8 @@ patternProperties:
     required:
       - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     mdio {
diff --git a/Documentation/devicetree/bindings/net/qca,ar71xx.yaml b/Documentation/devicetree/bindings/net/qca,ar71xx.yaml
index f99a5aabe923..f0db22645d73 100644
--- a/Documentation/devicetree/bindings/net/qca,ar71xx.yaml
+++ b/Documentation/devicetree/bindings/net/qca,ar71xx.yaml
@@ -72,6 +72,8 @@ required:
   - resets
   - reset-names
 
+unevaluatedProperties: false
+
 examples:
   # Lager board
   - |
diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
index 1788884b8c28..64b3357ade8a 100644
--- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
@@ -59,6 +59,8 @@ properties:
       regulator to VDDIO.
     $ref: /schemas/regulator/regulator.yaml
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/net/qca-ar803x.h>
diff --git a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
index 13555a89975f..0c973310ada0 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
@@ -31,6 +31,8 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+unevaluatedProperties: false
+
 examples:
   - |
     mdio@90000 {
diff --git a/Documentation/devicetree/bindings/net/qcom,ipq8064-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq8064-mdio.yaml
index 67df3fe861ee..948677ade6d1 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq8064-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq8064-mdio.yaml
@@ -33,6 +33,8 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
diff --git a/Documentation/devicetree/bindings/net/renesas,ether.yaml b/Documentation/devicetree/bindings/net/renesas,ether.yaml
index 08678af5ed93..32281fd1b96d 100644
--- a/Documentation/devicetree/bindings/net/renesas,ether.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,ether.yaml
@@ -85,6 +85,8 @@ required:
   - clocks
   - pinctrl-0
 
+unevaluatedProperties: false
+
 examples:
   # Lager board
   - |
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index e5dff66df481..27eb6066793f 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -88,6 +88,8 @@ required:
   - clock-names
   - st,syscon
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/net/ti,davinci-mdio.yaml b/Documentation/devicetree/bindings/net/ti,davinci-mdio.yaml
index d454c1fab930..5728fe23f530 100644
--- a/Documentation/devicetree/bindings/net/ti,davinci-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/ti,davinci-mdio.yaml
@@ -58,6 +58,8 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+unevaluatedProperties: false
+
 examples:
   - |
     davinci_mdio: mdio@4a101000 {
diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index c6716ac6cbcc..4050a3608658 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -109,6 +109,8 @@ properties:
 required:
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/net/ti-dp83867.h>
diff --git a/Documentation/devicetree/bindings/net/ti,dp83869.yaml b/Documentation/devicetree/bindings/net/ti,dp83869.yaml
index cf40b469c719..c3235f08e326 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83869.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83869.yaml
@@ -79,6 +79,8 @@ properties:
 required:
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/net/ti-dp83869.h>
diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index 5a7284737229..8a43dc1283fe 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -76,6 +76,8 @@ patternProperties:
 
     additionalProperties: false
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/imx6sx-clock.h>
diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 59aca6d22ff9..1a18b6bab35e 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -49,6 +49,8 @@ required:
   - compatible
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc7180.h>
diff --git a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
index 7bbd4e62044e..a835e64bc6f5 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
@@ -66,6 +66,8 @@ patternProperties:
 
     additionalProperties: false
 
+unevaluatedProperties: false
+
 examples:
   - |
       sdam_1: nvram@b000 {
diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
index 3ae00b0b23bc..104dd508565e 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
@@ -51,6 +51,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/rk3288-cru.h>
diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
index c11c99f085d7..0b80ce22a2f8 100644
--- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
@@ -42,6 +42,8 @@ required:
   - compatible
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     efuse@1fff7800 {
diff --git a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
index 50ce5d79d2c7..651eee88989d 100644
--- a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml
@@ -29,6 +29,8 @@ required:
   - reg
   - reg-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     bus {
diff --git a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
index 6d67067843bf..293b8ec318bc 100644
--- a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
@@ -31,6 +31,8 @@ required:
   - reg
   - reg-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     bus {
diff --git a/Documentation/devicetree/bindings/pci/host-generic-pci.yaml b/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
index 47353d0cd394..6bcaa8f2c3cf 100644
--- a/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
+++ b/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
@@ -137,6 +137,8 @@ allOf:
         reg:
           maxItems: 1
 
+unevaluatedProperties: false
+
 examples:
   - |
 
diff --git a/Documentation/devicetree/bindings/pci/loongson.yaml b/Documentation/devicetree/bindings/pci/loongson.yaml
index 30e7cf1aeb87..81bae060cbde 100644
--- a/Documentation/devicetree/bindings/pci/loongson.yaml
+++ b/Documentation/devicetree/bindings/pci/loongson.yaml
@@ -39,6 +39,8 @@ required:
   - reg
   - ranges
 
+unevaluatedProperties: false
+
 examples:
   - |
 
diff --git a/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml b/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
index b3c3d0c3c390..3ae3e1a2d4b0 100644
--- a/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
@@ -63,6 +63,8 @@ required:
   - phys
   - phy-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
diff --git a/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
index 8200ba00bc09..ee7a8eade3f6 100644
--- a/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,j721e-pci-host.yaml
@@ -72,6 +72,8 @@ required:
   - phys
   - phy-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
diff --git a/Documentation/devicetree/bindings/pci/versatile.yaml b/Documentation/devicetree/bindings/pci/versatile.yaml
index 07a48c27db1f..09748ef6b94f 100644
--- a/Documentation/devicetree/bindings/pci/versatile.yaml
+++ b/Documentation/devicetree/bindings/pci/versatile.yaml
@@ -48,6 +48,8 @@ required:
   - interrupt-map
   - interrupt-map-mask
 
+unevaluatedProperties: false
+
 examples:
   - |
     pci@10001000 {
diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 09bdd96c1ec1..9c2c51133457 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -49,6 +49,8 @@ required:
   - "#power-domain-cells"
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     lcd0_pd: power-domain@10023c80 {
diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
index 3dbb9cf86f15..92211f2b3b0c 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
@@ -73,6 +73,8 @@ required:
   - compatible
   - regulator-name
 
+unevaluatedProperties: false
+
 examples:
   - |
     reg_1v8: regulator-1v8 {
diff --git a/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml b/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
index c9453d7ce227..69e5402da761 100644
--- a/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
@@ -28,6 +28,8 @@ required:
   - compatible
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi0 {
diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.yaml b/Documentation/devicetree/bindings/regulator/gpio-regulator.yaml
index 605590384b48..f7e3d8fd3bf3 100644
--- a/Documentation/devicetree/bindings/regulator/gpio-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.yaml
@@ -91,6 +91,8 @@ required:
   - gpios
   - states
 
+unevaluatedProperties: false
+
 examples:
   - |
     gpio-regulator {
diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-booster.yaml b/Documentation/devicetree/bindings/regulator/st,stm32-booster.yaml
index cb336b2c16af..9f1c70381b82 100644
--- a/Documentation/devicetree/bindings/regulator/st,stm32-booster.yaml
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-booster.yaml
@@ -34,6 +34,8 @@ required:
   - st,syscfg
   - vdda-supply
 
+unevaluatedProperties: false
+
 examples:
   - |
     regulator-booster {
diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
index 33cdaeb25aee..3cd4a254e4cb 100644
--- a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
@@ -36,6 +36,8 @@ required:
   - clocks
   - vdda-supply
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/stm32mp1-clks.h>
diff --git a/Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml b/Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
index d1a79d2ffa1e..6f45582c914e 100644
--- a/Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
@@ -28,6 +28,8 @@ required:
   - compatible
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     regulator@1948000 {
diff --git a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
index bc2c7e53a28e..60e93e86ad9d 100644
--- a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
@@ -68,6 +68,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/jz4740-cgu.h>
diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
index 76bbf8b7555b..d51b236939bf 100644
--- a/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
@@ -74,6 +74,8 @@ allOf:
           items:
             - const: rtc
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5420.h>
diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
index dc8349322c83..559213899d73 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -9,6 +9,9 @@ title: Ingenic SoCs UART controller devicetree bindings
 maintainers:
   - Paul Cercueil <paul@crapouillou.net>
 
+allOf:
+  - $ref: /schemas/serial.yaml#
+
 properties:
   $nodename:
     pattern: "^serial@[0-9a-f]+$"
@@ -64,6 +67,8 @@ required:
   - dmas
   - dma-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/jz4780-cgu.h>
diff --git a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
index 6b04c0451d41..2f30dc79b444 100644
--- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
@@ -100,6 +100,8 @@ required:
   - clock-names
   - power-domains
 
+unevaluatedProperties: false
+
 if:
   properties:
     compatible:
diff --git a/Documentation/devicetree/bindings/serial/renesas,sci.yaml b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
index 4183b7311f37..22ed2f0b1dc3 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
@@ -54,6 +54,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     aliases {
diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 570b379f9f19..45042bf20b36 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -149,6 +149,8 @@ then:
   required:
     - resets
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
diff --git a/Documentation/devicetree/bindings/serial/renesas,scifa.yaml b/Documentation/devicetree/bindings/serial/renesas,scifa.yaml
index 78b8e20dd34d..dbffb9534835 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scifa.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scifa.yaml
@@ -75,6 +75,8 @@ required:
   - clock-names
   - power-domains
 
+unevaluatedProperties: false
+
 if:
   properties:
     compatible:
diff --git a/Documentation/devicetree/bindings/serial/renesas,scifb.yaml b/Documentation/devicetree/bindings/serial/renesas,scifb.yaml
index b083970c16a9..147f8a37e02a 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scifb.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scifb.yaml
@@ -75,6 +75,8 @@ required:
   - clock-names
   - power-domains
 
+unevaluatedProperties: false
+
 if:
   properties:
     compatible:
diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index b962f8db4ce9..87ef1e218152 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -101,6 +101,8 @@ required:
   - reg
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
     serial@80230000 {
diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
index 38efb50081e3..667dedefd69f 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
@@ -77,6 +77,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi@c1108d80 {
diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
index 5f33c39d820b..54b6f15eca18 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
@@ -35,6 +35,8 @@ required:
   - reg
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi@c1108c80 {
diff --git a/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml b/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml
index e0c55dd235d8..3fd0a8adfe9a 100644
--- a/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml
@@ -24,6 +24,8 @@ required:
   - compatible
   - reg
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi: spi@1f000000 {
diff --git a/Documentation/devicetree/bindings/spi/qca,ar934x-spi.yaml b/Documentation/devicetree/bindings/spi/qca,ar934x-spi.yaml
index 2aa766759d59..7b19f2c1cb59 100644
--- a/Documentation/devicetree/bindings/spi/qca,ar934x-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/qca,ar934x-spi.yaml
@@ -29,6 +29,8 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/ath79-clk.h>
diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 0178831b0662..ef5698f426b2 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -56,6 +56,8 @@ required:
   - clock-names
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
diff --git a/Documentation/devicetree/bindings/spi/renesas,hspi.yaml b/Documentation/devicetree/bindings/spi/renesas,hspi.yaml
index f492cb9fea12..c0eccf703039 100644
--- a/Documentation/devicetree/bindings/spi/renesas,hspi.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,hspi.yaml
@@ -40,6 +40,8 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7778-clock.h>
diff --git a/Documentation/devicetree/bindings/spi/renesas,rspi.yaml b/Documentation/devicetree/bindings/spi/renesas,rspi.yaml
index c54ac059043f..b56d76ec0364 100644
--- a/Documentation/devicetree/bindings/spi/renesas,rspi.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,rspi.yaml
@@ -123,6 +123,8 @@ allOf:
       required:
         - resets
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
diff --git a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
index 9f7b118adcaf..e8afd26bbeb2 100644
--- a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
@@ -140,6 +140,8 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7791-clock.h>
diff --git a/Documentation/devicetree/bindings/spi/socionext,uniphier-spi.yaml b/Documentation/devicetree/bindings/spi/socionext,uniphier-spi.yaml
index c25409298bdf..597fc4e6b01c 100644
--- a/Documentation/devicetree/bindings/spi/socionext,uniphier-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/socionext,uniphier-spi.yaml
@@ -44,6 +44,8 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi0: spi@54006000 {
diff --git a/Documentation/devicetree/bindings/spi/spi-gpio.yaml b/Documentation/devicetree/bindings/spi/spi-gpio.yaml
index 55c4f1705f07..0d0b6d9dad1c 100644
--- a/Documentation/devicetree/bindings/spi/spi-gpio.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-gpio.yaml
@@ -53,6 +53,8 @@ required:
   - num-chipselects
   - sck-gpios
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi {
diff --git a/Documentation/devicetree/bindings/spi/spi-mux.yaml b/Documentation/devicetree/bindings/spi/spi-mux.yaml
index 3d3fed63409b..6c21a132b51f 100644
--- a/Documentation/devicetree/bindings/spi/spi-mux.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-mux.yaml
@@ -48,6 +48,8 @@ required:
   - spi-max-frequency
   - mux-controls
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/spi/spi-pl022.yaml b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
index 22999024477f..a91d868e40c5 100644
--- a/Documentation/devicetree/bindings/spi/spi-pl022.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
@@ -128,6 +128,8 @@ required:
   - reg
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi@e0100000 {
diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
index 74dc6185eced..1e6cf29e6388 100644
--- a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
@@ -85,6 +85,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/rk3188-cru-common.h>
diff --git a/Documentation/devicetree/bindings/spi/spi-sifive.yaml b/Documentation/devicetree/bindings/spi/spi-sifive.yaml
index 4932205d1cba..56dcf1d35da4 100644
--- a/Documentation/devicetree/bindings/spi/spi-sifive.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sifive.yaml
@@ -66,6 +66,8 @@ required:
   - interrupts
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     spi: spi@10040000 {
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
index 1a342ce1f798..983c4e54c0be 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
@@ -53,6 +53,8 @@ required:
   - clocks
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index e49ecbf715ba..d11806b1ede3 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -76,6 +76,8 @@ required:
   - clocks
   - interrupts
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
index 4ddae6feef3b..c7459cf70e30 100644
--- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -31,6 +31,8 @@ required:
   - reg
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     watchdog@98d0 {
diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
index 8e4c7c69bc1c..e3a1d79574e2 100644
--- a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
@@ -25,6 +25,8 @@ properties:
 required:
   - compatible
 
+unevaluatedProperties: false
+
 examples:
   - |
     watchdog {
diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 0709ddf0b6a5..8e3760a3822b 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -38,6 +38,8 @@ required:
   - reg
   - clocks
 
+unevaluatedProperties: false
+
 examples:
   - |
     watchdog@208a038 {
diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 2fa40d8864b2..76cb9586ee00 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -62,6 +62,8 @@ allOf:
       required:
         - samsung,syscon-phandle
 
+unevaluatedProperties: false
+
 examples:
   - |
     watchdog@101d0000 {
diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
index a27c504e2e4f..3f1ba1d6c6b5 100644
--- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
+++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
@@ -43,6 +43,8 @@ required:
   - clocks
   - clock-names
 
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/stm32mp1-clks.h>
diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
index f0452791c598..c1348db59374 100644
--- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
@@ -46,6 +46,8 @@ required:
   - clocks
   - power-domains
 
+unevaluatedProperties: false
+
 examples:
   - |
     /*
-- 
2.25.1

