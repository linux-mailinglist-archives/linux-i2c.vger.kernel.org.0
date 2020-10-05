Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEA8283E8A
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Oct 2020 20:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbgJESi5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 14:38:57 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41589 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728806AbgJESiw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Oct 2020 14:38:52 -0400
Received: by mail-ot1-f67.google.com with SMTP id q21so9613283ota.8;
        Mon, 05 Oct 2020 11:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vgIboSIrR39t+QJyhTBbSOMhd+0sUioLqfZlbg+GUS0=;
        b=oMurSMHpwPhqDJ3PGKM0iVMyauZgMiD34ubViWn/bq+uePAxMbScqWvfCMDRH7eduD
         sW8SwOUgekk3PB984PZcWbl9+FZKoZ7puwihGD80it7j+5Iz1xOnFtSJUpak6Ka6hXAh
         LkKqo4JNgvWcmWrHfa8NadFRC7+Ioil3zb2VcFM400WgwQEu8RlHfRmQ0NoB+ElNuWif
         5DIkRayzEeripafS8UVYJmBCEblCsoTugBdGvNIOVqWrsHmtqIeENrvWVsJIiIDM9mQt
         GFWY8ifIYEqYPWCvMa0Ahh2OdI/AM+/X4H11yOEf9AA/Z7FDEEk+xc+hBHUtIMBRCESf
         haiQ==
X-Gm-Message-State: AOAM531Na0p4clK/U05pHzKlBi8P1cc77TYDlUMkGpcUaq46IgXP5mWO
        9KoJhgGD9ZnGux3bF5EuwlH3AjqogSWl
X-Google-Smtp-Source: ABdhPJw6QSielwUqXJZqbCEA4Wfl/YUQk7mG1FkpPVihjPwW4tg04G5AMwdknglk3TxeRBnOMI5A2A==
X-Received: by 2002:a9d:3bb5:: with SMTP id k50mr467625otc.39.1601923127419;
        Mon, 05 Oct 2020 11:38:47 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id z25sm143140otq.31.2020.10.05.11.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 11:38:46 -0700 (PDT)
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
Subject: [PATCH 3/4] dt-bindings: Explicitly allow additional properties in board/SoC schemas
Date:   Mon,  5 Oct 2020 13:38:29 -0500
Message-Id: <20201005183830.486085-4-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201005183830.486085-1-robh@kernel.org>
References: <20201005183830.486085-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In order to add meta-schema checks for additional/unevaluatedProperties
being present, all schema need to make this explicit. As the top-level
board/SoC schemas always have additional properties, add
'additionalProperties: true'.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/actions.yaml             | 2 ++
 Documentation/devicetree/bindings/arm/altera.yaml              | 3 +++
 Documentation/devicetree/bindings/arm/amazon,al.yaml           | 2 ++
 Documentation/devicetree/bindings/arm/amlogic.yaml             | 3 +++
 Documentation/devicetree/bindings/arm/arm,integrator.yaml      | 2 ++
 Documentation/devicetree/bindings/arm/arm,realview.yaml        | 2 ++
 Documentation/devicetree/bindings/arm/arm,versatile.yaml       | 2 ++
 Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml   | 2 ++
 Documentation/devicetree/bindings/arm/atmel-at91.yaml          | 2 ++
 Documentation/devicetree/bindings/arm/axxia.yaml               | 2 ++
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml         | 2 ++
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351.yaml   | 2 ++
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm21664.yaml   | 2 ++
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm23550.yaml   | 2 ++
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml    | 3 +++
 Documentation/devicetree/bindings/arm/bcm/brcm,cygnus.yaml     | 2 ++
 Documentation/devicetree/bindings/arm/bcm/brcm,hr2.yaml        | 2 ++
 Documentation/devicetree/bindings/arm/bcm/brcm,ns2.yaml        | 2 ++
 Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml        | 2 ++
 Documentation/devicetree/bindings/arm/bcm/brcm,stingray.yaml   | 2 ++
 Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml | 2 ++
 Documentation/devicetree/bindings/arm/bitmain.yaml             | 3 +++
 Documentation/devicetree/bindings/arm/calxeda.yaml             | 2 ++
 Documentation/devicetree/bindings/arm/digicolor.yaml           | 2 ++
 Documentation/devicetree/bindings/arm/fsl.yaml                 | 2 ++
 Documentation/devicetree/bindings/arm/hisilicon/hisilicon.yaml | 3 +++
 Documentation/devicetree/bindings/arm/intel,keembay.yaml       | 3 +++
 Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml        | 2 ++
 .../devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml     | 2 ++
 .../devicetree/bindings/arm/marvell/armada-7k-8k.yaml          | 2 ++
 Documentation/devicetree/bindings/arm/mediatek.yaml            | 3 +++
 Documentation/devicetree/bindings/arm/microchip,sparx5.yaml    | 2 ++
 Documentation/devicetree/bindings/arm/moxart.yaml              | 1 +
 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/mstar/mstar.yaml         | 2 ++
 Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml         | 2 ++
 Documentation/devicetree/bindings/arm/qcom.yaml                | 2 ++
 Documentation/devicetree/bindings/arm/rda.yaml                 | 2 ++
 Documentation/devicetree/bindings/arm/realtek.yaml             | 3 +++
 Documentation/devicetree/bindings/arm/renesas.yaml             | 2 ++
 Documentation/devicetree/bindings/arm/rockchip.yaml            | 3 +++
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml        | 2 ++
 Documentation/devicetree/bindings/arm/sirf.yaml                | 3 +++
 Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml  | 3 +++
 Documentation/devicetree/bindings/arm/socionext/uniphier.yaml  | 2 ++
 Documentation/devicetree/bindings/arm/spear.yaml               | 3 +++
 Documentation/devicetree/bindings/arm/sprd/sprd.yaml           | 2 ++
 Documentation/devicetree/bindings/arm/sti.yaml                 | 3 +++
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml         | 3 +++
 Documentation/devicetree/bindings/arm/sunxi.yaml               | 2 ++
 Documentation/devicetree/bindings/arm/tegra.yaml               | 2 ++
 Documentation/devicetree/bindings/arm/ti/nspire.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml       | 3 +++
 Documentation/devicetree/bindings/arm/ux500.yaml               | 2 ++
 Documentation/devicetree/bindings/arm/vt8500.yaml              | 3 +++
 Documentation/devicetree/bindings/arm/xilinx.yaml              | 2 ++
 Documentation/devicetree/bindings/arm/zte.yaml                 | 2 ++
 Documentation/devicetree/bindings/mips/ingenic/devices.yaml    | 3 +++
 Documentation/devicetree/bindings/mips/loongson/devices.yaml   | 3 +++
 Documentation/devicetree/bindings/riscv/sifive.yaml            | 3 +++
 60 files changed, 140 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/actions.yaml b/Documentation/devicetree/bindings/arm/actions.yaml
index 14023f0a8552..9d12984691e4 100644
--- a/Documentation/devicetree/bindings/arm/actions.yaml
+++ b/Documentation/devicetree/bindings/arm/actions.yaml
@@ -38,3 +38,5 @@ properties:
           - enum:
               - ucrobotics,bubblegum-96 # uCRobotics Bubblegum-96
           - const: actions,s900
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 0bc5020b7539..c15c92fdf2ed 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -19,4 +19,7 @@ properties:
           - altr,socfpga-arria5
           - altr,socfpga-arria10
       - const: altr,socfpga
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/amazon,al.yaml b/Documentation/devicetree/bindings/arm/amazon,al.yaml
index a3a4d710bd02..0f03135d91b6 100644
--- a/Documentation/devicetree/bindings/arm/amazon,al.yaml
+++ b/Documentation/devicetree/bindings/arm/amazon,al.yaml
@@ -30,4 +30,6 @@ properties:
               - amazon,al-alpine-v3-evp
           - const: amazon,al-alpine-v3
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 5eba9f48823e..51dea8844569 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -171,4 +171,7 @@ properties:
           - enum:
               - amlogic,ad401
           - const: amlogic,a1
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/arm,integrator.yaml b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
index f0daf990e077..528eee64290a 100644
--- a/Documentation/devicetree/bindings/arm/arm,integrator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,integrator.yaml
@@ -83,4 +83,6 @@ required:
   - compatible
   - core-module@10000000
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/arm,realview.yaml b/Documentation/devicetree/bindings/arm/arm,realview.yaml
index 1d0b4e2bc7d2..4f9b21f49e84 100644
--- a/Documentation/devicetree/bindings/arm/arm,realview.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,realview.yaml
@@ -120,4 +120,6 @@ required:
   - compatible
   - soc
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/arm,versatile.yaml b/Documentation/devicetree/bindings/arm/arm,versatile.yaml
index 06efd2a075c9..34b437c72751 100644
--- a/Documentation/devicetree/bindings/arm/arm,versatile.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,versatile.yaml
@@ -68,4 +68,6 @@ required:
   - compatible
   - core-module@10000000
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
index 26829a803fda..55ef656d1192 100644
--- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -216,4 +216,6 @@ allOf:
       required:
         - arm,hbi
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 31b0c54fa2cf..df95d1068030 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -183,4 +183,6 @@ properties:
           - const: atmel,samv71
           - const: atmel,samv7
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/axxia.yaml b/Documentation/devicetree/bindings/arm/axxia.yaml
index 3ea5f2fdcd96..e0d2bb71cf50 100644
--- a/Documentation/devicetree/bindings/arm/axxia.yaml
+++ b/Documentation/devicetree/bindings/arm/axxia.yaml
@@ -18,4 +18,6 @@ properties:
       - const: lsi,axm5516-amarillo
       - const: lsi,axm5516
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index dd52e29b0642..812ae8cc5959 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -51,4 +51,6 @@ properties:
               - raspberrypi,3-compute-module-lite
           - const: brcm,bcm2837
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351.yaml
index 497600a2ffb9..c60324357435 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm11351.yaml
@@ -18,4 +18,6 @@ properties:
           - brcm,bcm28155-ap
       - const: brcm,bcm11351
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm21664.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm21664.yaml
index e0ee931723dc..b3020757380f 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm21664.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm21664.yaml
@@ -18,4 +18,6 @@ properties:
           - brcm,bcm21664-garnet
       - const: brcm,bcm21664
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm23550.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm23550.yaml
index 40d12ea56e54..37f3a6fcde76 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm23550.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm23550.yaml
@@ -18,4 +18,6 @@ properties:
           - brcm,bcm23550-sparrow
       - const: brcm,bcm23550
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
index d48313c7ae45..86a1fe885387 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
@@ -85,4 +85,7 @@ properties:
               - brcm,bcm953012k
           - const: brcm,brcm53012
           - const: brcm,bcm4708
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,cygnus.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,cygnus.yaml
index 9ba7b16e1fc4..432ccf990f9e 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,cygnus.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,cygnus.yaml
@@ -26,4 +26,6 @@ properties:
           - brcm,bcm58305
       - const: brcm,cygnus
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.yaml
index ae614b6722c2..294948399f82 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.yaml
@@ -25,4 +25,6 @@ properties:
       - const: brcm,bcm53342
       - const: brcm,hr2
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.yaml
index 0749adf94c28..c4847abbecd8 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.yaml
@@ -20,4 +20,6 @@ properties:
           - brcm,ns2-xmc
       - const: brcm,ns2
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
index 8c2cacb2bb4f..476bc23a7f75 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
@@ -33,4 +33,6 @@ properties:
           - brcm,bcm88312
       - const: brcm,nsp
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,stingray.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,stingray.yaml
index c13cb96545a2..c638e04ebae0 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,stingray.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,stingray.yaml
@@ -21,4 +21,6 @@ properties:
           - brcm,bcm958802a802x
       - const: brcm,stingray
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml
index ccdf9f99cb2b..4eba182abd53 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml
@@ -19,4 +19,6 @@ properties:
           - cavium,thunderx2-cn9900
       - const: brcm,vulcan-soc
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/bitmain.yaml b/Documentation/devicetree/bindings/arm/bitmain.yaml
index 5880083ab8d0..90ba02be48ce 100644
--- a/Documentation/devicetree/bindings/arm/bitmain.yaml
+++ b/Documentation/devicetree/bindings/arm/bitmain.yaml
@@ -17,4 +17,7 @@ properties:
       - enum:
           - bitmain,sophon-edge
       - const: bitmain,bm1880
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/calxeda.yaml b/Documentation/devicetree/bindings/arm/calxeda.yaml
index aa5571d23c39..46f78addebb0 100644
--- a/Documentation/devicetree/bindings/arm/calxeda.yaml
+++ b/Documentation/devicetree/bindings/arm/calxeda.yaml
@@ -20,3 +20,5 @@ properties:
       - enum:
           - calxeda,highbank
           - calxeda,ecx-2000
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/digicolor.yaml b/Documentation/devicetree/bindings/arm/digicolor.yaml
index 849e20518339..a35de3c9e284 100644
--- a/Documentation/devicetree/bindings/arm/digicolor.yaml
+++ b/Documentation/devicetree/bindings/arm/digicolor.yaml
@@ -15,4 +15,6 @@ properties:
   compatible:
     const: cnxt,cx92755
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6da9d734cdb7..43adf7241d79 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -526,4 +526,6 @@ properties:
               - fsl,s32v234-evb           # S32V234-EVB2 Customer Evaluation Board
           - const: fsl,s32v234
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.yaml b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.yaml
index 43b8ce2227aa..b38458022946 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.yaml
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.yaml
@@ -64,4 +64,7 @@ properties:
         items:
           - const: H836ASDJ
           - const: hisilicon,sd5203
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/intel,keembay.yaml b/Documentation/devicetree/bindings/arm/intel,keembay.yaml
index 06a7b05f435f..69cd30872928 100644
--- a/Documentation/devicetree/bindings/arm/intel,keembay.yaml
+++ b/Documentation/devicetree/bindings/arm/intel,keembay.yaml
@@ -16,4 +16,7 @@ properties:
       - enum:
           - intel,keembay-evm
       - const: intel,keembay
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
index f18302efb90e..d72e92bdf7c1 100644
--- a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
+++ b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
@@ -22,3 +22,5 @@ properties:
           - enum:
               - gateworks,gw2358
           - const: intel,ixp43x
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml
index 7597bc93a55f..5cbcacaeb441 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,k3-sci-common.yaml
@@ -42,3 +42,5 @@ properties:
       - description: TI-SCI processor id for the remote processor device
       - description: TI-SCI host id to which processor control ownership
                      should be transferred to
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index a9828c50c0fb..e9bf3054529f 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -59,3 +59,5 @@ properties:
           - const: marvell,cn9130
           - const: marvell,armada-ap807-quad
           - const: marvell,armada-ap807
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 30908963ae26..f736e8c859fa 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -119,4 +119,7 @@ properties:
           - const: google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
index ecf6fa12e6ad..6193388c6318 100644
--- a/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
+++ b/Documentation/devicetree/bindings/arm/microchip,sparx5.yaml
@@ -62,4 +62,6 @@ required:
   - compatible
   - axi@600000000
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/moxart.yaml b/Documentation/devicetree/bindings/arm/moxart.yaml
index c068df59fad2..670d24ce8ec5 100644
--- a/Documentation/devicetree/bindings/arm/moxart.yaml
+++ b/Documentation/devicetree/bindings/arm/moxart.yaml
@@ -16,4 +16,5 @@ properties:
       - const: moxa,moxart-uc-7112-lx
       - const: moxa,moxart
 
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
index 3235ec9e9bad..d58116136154 100644
--- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
+++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
@@ -35,4 +35,7 @@ properties:
           - enum:
               - dell,wyse-ariel
           - const: marvell,mmp3
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
index c2f980b00b06..7c787405bb2f 100644
--- a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
+++ b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
@@ -31,3 +31,5 @@ properties:
           - enum:
               - 70mai,midrived08 # 70mai midrive d08
           - const: mstar,mercury5
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
index f7f024910e71..214c97bc3063 100644
--- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
+++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
@@ -21,4 +21,6 @@ properties:
               - ea,ea3250
               - phytec,phy3250
           - const: nxp,lpc3250
+
+additionalProperties: true
 ...
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae6284be9fef..8604f1f9266b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -167,4 +167,6 @@ properties:
               - qcom,ipq6018-cp01-c1
           - const: qcom,ipq6018
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/rda.yaml b/Documentation/devicetree/bindings/arm/rda.yaml
index 9672aa0c760d..a5c0444aa2b4 100644
--- a/Documentation/devicetree/bindings/arm/rda.yaml
+++ b/Documentation/devicetree/bindings/arm/rda.yaml
@@ -19,4 +19,6 @@ properties:
           - xunlong,orangepi-i96        # Orange Pi i96
       - const: rda,8810pl
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/realtek.yaml b/Documentation/devicetree/bindings/arm/realtek.yaml
index 845f9c76d6f7..9fb0297fe1ce 100644
--- a/Documentation/devicetree/bindings/arm/realtek.yaml
+++ b/Documentation/devicetree/bindings/arm/realtek.yaml
@@ -54,4 +54,7 @@ properties:
           - enum:
               - realtek,mjolnir # Realtek Mjolnir EVB
           - const: realtek,rtd1619
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 0d4dabb4a164..dfb31ad0061e 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -287,4 +287,6 @@ properties:
               - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
           - const: renesas,r9a06g032
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index db2e35796795..8d5933a1cb16 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -555,4 +555,7 @@ properties:
         items:
           - const: tronsmart,orion-r68-meta
           - const: rockchip,rk3368
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index eb92f9eefaba..272508010b02 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -180,3 +180,5 @@ properties:
 
 required:
   - compatible
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/sirf.yaml b/Documentation/devicetree/bindings/arm/sirf.yaml
index 0b597032c923..b25eb35d1b66 100644
--- a/Documentation/devicetree/bindings/arm/sirf.yaml
+++ b/Documentation/devicetree/bindings/arm/sirf.yaml
@@ -24,4 +24,7 @@ properties:
       - items:
           - const: sirf,prima2-cb
           - const: sirf,prima2
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
index 2bd519d2e855..aa1d4afbc510 100644
--- a/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
@@ -19,4 +19,7 @@ properties:
           - enum:
               - socionext,milbeaut-m10v-evb
           - const: socionext,sc2000a
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
index 6caf1f9be390..8c0e91658474 100644
--- a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
@@ -60,3 +60,5 @@ properties:
           - enum:
               - socionext,uniphier-pxs3-ref
           - const: socionext,uniphier-pxs3
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/spear.yaml b/Documentation/devicetree/bindings/arm/spear.yaml
index f6ec731c9531..605ad3f882ef 100644
--- a/Documentation/devicetree/bindings/arm/spear.yaml
+++ b/Documentation/devicetree/bindings/arm/spear.yaml
@@ -22,4 +22,7 @@ properties:
           - st,spear320
           - st,spear1310
           - st,spear1340
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/sprd/sprd.yaml b/Documentation/devicetree/bindings/arm/sprd/sprd.yaml
index 0258a96bfbde..7b6ae3070396 100644
--- a/Documentation/devicetree/bindings/arm/sprd/sprd.yaml
+++ b/Documentation/devicetree/bindings/arm/sprd/sprd.yaml
@@ -30,4 +30,6 @@ properties:
               - sprd,sp9863a-1h10
           - const: sprd,sc9863a
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/sti.yaml b/Documentation/devicetree/bindings/arm/sti.yaml
index 47f9b8eebaa0..b1f28d16d3fb 100644
--- a/Documentation/devicetree/bindings/arm/sti.yaml
+++ b/Documentation/devicetree/bindings/arm/sti.yaml
@@ -20,4 +20,7 @@ properties:
           - st,stih407
           - st,stih410
           - st,stih418
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 696a0101ebcc..6c3e7a9587a2 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -52,4 +52,7 @@ properties:
           - const: st,stm32mp157c-ev1
           - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index efc9118233b4..e1f21a051ded 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -883,3 +883,5 @@ properties:
         items:
           - const: xunlong,orangepi-zero-plus2-h3
           - const: allwinner,sun8i-h3
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index b4d53290c5f0..0340d3f956a1 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -121,3 +121,5 @@ properties:
         items:
           - const: nvidia,p3509-0000+p3668-0000
           - const: nvidia,tegra194
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/ti/nspire.yaml b/Documentation/devicetree/bindings/arm/ti/nspire.yaml
index e372b43da62f..cc2023bb7fa6 100644
--- a/Documentation/devicetree/bindings/arm/ti/nspire.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/nspire.yaml
@@ -21,4 +21,7 @@ properties:
           - ti,nspire-tp
           # Clickpad models
           - ti,nspire-clp
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml b/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
index a8765ba29476..c022d325fc08 100644
--- a/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
@@ -23,4 +23,7 @@ properties:
           - enbw,cmc        # EnBW AM1808 based CMC board
           - lego,ev3        # LEGO MINDSTORMS EV3 (AM1808 based)
       - const: ti,da850
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/ux500.yaml b/Documentation/devicetree/bindings/arm/ux500.yaml
index accaee906050..5db7cfba81a4 100644
--- a/Documentation/devicetree/bindings/arm/ux500.yaml
+++ b/Documentation/devicetree/bindings/arm/ux500.yaml
@@ -34,3 +34,5 @@ properties:
         items:
           - const: samsung,golden
           - const: st-ericsson,u8500
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
index 7b25b6fa34e9..29ff399551ca 100644
--- a/Documentation/devicetree/bindings/arm/vt8500.yaml
+++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
@@ -21,3 +21,6 @@ properties:
           - wm,wm8650
           - wm,wm8750
           - wm,wm8850
+          
+additionalProperties: true
+
diff --git a/Documentation/devicetree/bindings/arm/xilinx.yaml b/Documentation/devicetree/bindings/arm/xilinx.yaml
index c73b1f5c7f49..e0c6787f6e94 100644
--- a/Documentation/devicetree/bindings/arm/xilinx.yaml
+++ b/Documentation/devicetree/bindings/arm/xilinx.yaml
@@ -111,4 +111,6 @@ properties:
           - const: xlnx,zynqmp-zcu111
           - const: xlnx,zynqmp
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
index 2d3fefdccdff..672f8129cd31 100644
--- a/Documentation/devicetree/bindings/arm/zte.yaml
+++ b/Documentation/devicetree/bindings/arm/zte.yaml
@@ -23,4 +23,6 @@ properties:
               - zte,zx296718-evb
           - const: zte,zx296718
 
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
index 83c86cbe4716..bd5fbc973cca 100644
--- a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
+++ b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
@@ -47,4 +47,7 @@ properties:
         items:
           - const: yna,cu1830-neo
           - const: ingenic,x1830
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
index d25e80aa8b2a..9fee6708e6f5 100644
--- a/Documentation/devicetree/bindings/mips/loongson/devices.yaml
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -36,4 +36,7 @@ properties:
       - description: Virtual Loongson64 Quad Core + VirtIO
         items:
           - const: loongson,loongson64v-4core-virtio
+
+additionalProperties: true
+
 ...
diff --git a/Documentation/devicetree/bindings/riscv/sifive.yaml b/Documentation/devicetree/bindings/riscv/sifive.yaml
index 3ab532713dc1..3a8647d1da4c 100644
--- a/Documentation/devicetree/bindings/riscv/sifive.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive.yaml
@@ -22,4 +22,7 @@ properties:
           - sifive,hifive-unleashed-a00
       - const: sifive,fu540-c000
       - const: sifive,fu540
+
+additionalProperties: true
+
 ...
-- 
2.25.1

