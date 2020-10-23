Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85002977AA
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Oct 2020 21:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465670AbgJWTXE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Oct 2020 15:23:04 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39528 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S461363AbgJWTXE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Oct 2020 15:23:04 -0400
Received: by mail-ot1-f66.google.com with SMTP id o14so2347538otj.6;
        Fri, 23 Oct 2020 12:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8YJ2l6dczNyIkotTylAxItLLO1qnlW7NBxj1D4y7/Ec=;
        b=Welt3hpUaZGQA91JgFsL7C5CCjUtRAXFyjeYiJVF/jBdXOwWbuRiOD1rzdT5ZYt5d4
         sAtTsDzyH5BWh9SBoKO1FtCYt19LOhP8jLrrjaEb+b2oQeeZ505MkTveuavLNFtY94J1
         p8rPH8mLY52jmtdZZ6VX9UShmf/jsUG19JTiuXKcS3/MwFIMVJRUKXytbjzJU5kIQtMH
         9AfV6+TdKy4pdTBU+p2cOJPVG/V5lAijkRuZc3mPVn8l342he7lmEv4OqJIQFnfGFgga
         bGNn2q7zhbjslKUBIayKUOhhJpLsJP3TvrZ3dBC9Z59vrwQHIzw0koS9Df81horBlKiG
         R7BA==
X-Gm-Message-State: AOAM531WpufX6qdUWAL6fUkJEmBs05txh0Rg6X89x2mC93kausd2ukCe
        6P3uyK3s8QkUKlYFq/fc3rBQHvDU3g==
X-Google-Smtp-Source: ABdhPJwK7MMtLOorLCJLd0kOX/8JFmk51Ao4098KUK9XXfCbOv6WmF9q8zzJ2QyFrpuSy1/znLqV9A==
X-Received: by 2002:a05:6830:1d9a:: with SMTP id y26mr2690336oti.168.1603480980951;
        Fri, 23 Oct 2020 12:23:00 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id 8sm696083oii.45.2020.10.23.12.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 12:23:00 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-pm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: More whitespace clean-ups in schema files
Date:   Fri, 23 Oct 2020 14:22:58 -0500
Message-Id: <20201023192258.3126047-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Clean-up incorrect indentation, extra spaces, and missing EOF newline in
schema files. Most of the clean-ups are for list indentation which
should always be 2 spaces more than the preceding keyword.

Found with yamllint (now integrated into the checks).

Cc: linux-arm-kernel@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-serial@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../display/bridge/toshiba,tc358775.yaml      |  18 ++--
 .../display/panel/ilitek,ili9881c.yaml        |   5 +-
 .../devicetree/bindings/eeprom/at25.yaml      |   6 +-
 .../bindings/gpio/kontron,sl28cpld-gpio.yaml  |   4 +-
 .../devicetree/bindings/i2c/ingenic,i2c.yaml  |   8 +-
 .../bindings/iio/adc/adi,ad7291.yaml          |   3 +-
 .../bindings/iio/adc/adi,ad7768-1.yaml        |   3 +-
 .../bindings/iio/adc/cosmic,10001-adc.yaml    |   4 +-
 .../bindings/iio/adc/holt,hi8435.yaml         |   2 +-
 .../interrupt-controller/ti,pruss-intc.yaml   |  12 +--
 .../devicetree/bindings/mfd/ene-kb3930.yaml   |   2 +-
 .../devicetree/bindings/mmc/arasan,sdhci.yaml |   8 +-
 .../devicetree/bindings/mmc/sdhci-am654.yaml  |  15 ++-
 .../pci/socionext,uniphier-pcie-ep.yaml       |  18 ++--
 .../phy/socionext,uniphier-ahci-phy.yaml      |   6 +-
 .../devicetree/bindings/phy/ti,omap-usb2.yaml |  20 ++--
 .../pinctrl/actions,s500-pinctrl.yaml         | 102 +++++++++---------
 .../bindings/pinctrl/pinctrl-mt8192.yaml      |   2 +-
 .../pinctrl/qcom,msm8226-pinctrl.yaml         |   6 +-
 .../pinctrl/toshiba,visconti-pinctrl.yaml     |  24 ++---
 .../bindings/power/reset/reboot-mode.yaml     |   6 +-
 .../power/supply/ingenic,battery.yaml         |   8 +-
 .../power/supply/summit,smb347-charger.yaml   |  16 +--
 .../bindings/riscv/sifive-l2-cache.yaml       |   4 +-
 .../devicetree/bindings/rng/imx-rng.yaml      |   6 +-
 .../bindings/serial/fsl-imx-uart.yaml         |  34 +++---
 .../bindings/sound/mchp,spdifrx.yaml          |   4 +-
 .../bindings/sound/mchp,spdiftx.yaml          |   4 +-
 .../bindings/sound/qcom,lpass-cpu.yaml        |  40 +++----
 .../devicetree/bindings/timer/arm,sp804.yaml  |  12 +--
 .../devicetree/bindings/usb/cdns,usb3.yaml    |   4 +-
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml |   2 +-
 .../devicetree/bindings/w1/fsl-imx-owire.yaml |   8 +-
 33 files changed, 210 insertions(+), 206 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
index 31f085d8ab13..526bbd63924b 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Toshiba TC358775 DSI to LVDS bridge bindings
 
 maintainers:
- - Vinay Simha BN <simhavcs@gmail.com>
+  - Vinay Simha BN <simhavcs@gmail.com>
 
 description: |
  This binding supports DSI to LVDS bridge TC358775
@@ -29,7 +29,7 @@ properties:
 
   vdd-supply:
     maxItems: 1
-    description:  1.2V LVDS Power Supply
+    description: 1.2V LVDS Power Supply
 
   vddio-supply:
     maxItems: 1
@@ -77,13 +77,13 @@ properties:
       - port@1
 
 required:
- - compatible
- - reg
- - vdd-supply
- - vddio-supply
- - stby-gpios
- - reset-gpios
- - ports
+  - compatible
+  - reg
+  - vdd-supply
+  - vddio-supply
+  - stby-gpios
+  - reset-gpios
+  - ports
 
 examples:
  - |
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index c60b3bd74337..b2fcec4f22fd 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -13,9 +13,8 @@ properties:
   compatible:
     items:
       - enum:
-        - bananapi,lhr050h41
-        - feixin,k101-im2byl02
-
+          - bananapi,lhr050h41
+          - feixin,k101-im2byl02
       - const: ilitek,ili9881c
 
   backlight: true
diff --git a/Documentation/devicetree/bindings/eeprom/at25.yaml b/Documentation/devicetree/bindings/eeprom/at25.yaml
index 9810619a2b5c..744973637678 100644
--- a/Documentation/devicetree/bindings/eeprom/at25.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at25.yaml
@@ -81,14 +81,14 @@ properties:
   at25,byte-len:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-       Total eeprom size in bytes. Deprecated, use "size" property instead.
+      Total eeprom size in bytes. Deprecated, use "size" property instead.
     deprecated: true
 
   at25,addr-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-       Addr-mode flags, as defined in include/linux/spi/eeprom.h.
-       Deprecated, use "address-width" property instead.
+      Addr-mode flags, as defined in include/linux/spi/eeprom.h.
+      Deprecated, use "address-width" property instead.
     deprecated: true
 
   at25,page-size:
diff --git a/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml b/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
index e2d2c10e536a..b032471831e7 100644
--- a/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml
@@ -43,8 +43,8 @@ properties:
   gpio-controller: true
 
   gpio-line-names:
-      minItems: 1
-      maxItems: 8
+    minItems: 1
+    maxItems: 8
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
index 0e7b4b8a7e48..e1e65eb4f795 100644
--- a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
@@ -19,11 +19,11 @@ properties:
   compatible:
     oneOf:
       - enum:
-        - ingenic,jz4770-i2c
-        - ingenic,x1000-i2c
+          - ingenic,jz4770-i2c
+          - ingenic,x1000-i2c
       - items:
-        - const: ingenic,jz4780-i2c
-        - const: ingenic,jz4770-i2c
+          - const: ingenic,jz4780-i2c
+          - const: ingenic,jz4770-i2c
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7291.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7291.yaml
index 6feafb7e531e..930f9e3904d7 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7291.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7291.yaml
@@ -43,4 +43,5 @@ examples:
         vref-supply = <&adc_vref>;
       };
     };
-...
\ No newline at end of file
+...
+
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
index d3733ad8785a..8f32800fe5b7 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
@@ -46,7 +46,8 @@ properties:
   spi-max-frequency: true
 
   spi-cpol: true
-  spi-cpha : true
+
+  spi-cpha: true
 
   "#io-channel-cells":
     const: 1
diff --git a/Documentation/devicetree/bindings/iio/adc/cosmic,10001-adc.yaml b/Documentation/devicetree/bindings/iio/adc/cosmic,10001-adc.yaml
index 5d92b477e23f..4e695b97d015 100644
--- a/Documentation/devicetree/bindings/iio/adc/cosmic,10001-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/cosmic,10001-adc.yaml
@@ -22,8 +22,8 @@ properties:
   adc-reserved-channels:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-       Bitmask of reserved channels, i.e. channels that cannot be
-       used by the OS.
+      Bitmask of reserved channels, i.e. channels that cannot be
+      used by the OS.
 
   clocks:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/iio/adc/holt,hi8435.yaml b/Documentation/devicetree/bindings/iio/adc/holt,hi8435.yaml
index 9514c3381c42..52490cbb0af0 100644
--- a/Documentation/devicetree/bindings/iio/adc/holt,hi8435.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/holt,hi8435.yaml
@@ -21,7 +21,7 @@ properties:
 
   gpios:
     description:
-       GPIO used for controlling the reset pin
+      GPIO used for controlling the reset pin
     maxItems: 1
 
   spi-max-frequency: true
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
index bbf79d125675..1c4c009dedd0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
@@ -94,12 +94,12 @@ properties:
               instances.
 
 required:
- - compatible
- - reg
- - interrupts
- - interrupt-names
- - interrupt-controller
- - "#interrupt-cells"
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - interrupt-controller
+  - "#interrupt-cells"
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml b/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
index 074243c40891..08af356f5d27 100644
--- a/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
+++ b/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
@@ -17,7 +17,7 @@ properties:
   compatible:
     items:
       - enum:
-        - dell,wyse-ariel-ec  # Dell Wyse Ariel board (3020)
+          - dell,wyse-ariel-ec  # Dell Wyse Ariel board (3020)
       - const: ene,kb3930
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
index 58fe9d02a781..0753289fba84 100644
--- a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
@@ -32,11 +32,11 @@ allOf:
         clock-output-names:
           oneOf:
             - items:
-              - const: clk_out_sd0
-              - const: clk_in_sd0
+                - const: clk_out_sd0
+                - const: clk_in_sd0
             - items:
-              - const: clk_out_sd1
-              - const: clk_in_sd1
+                - const: clk_out_sd1
+                - const: clk_in_sd1
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
index ac79f3adf20b..2cd859066462 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
@@ -3,7 +3,7 @@
 %YAML 1.2
 ---
 $id: "http://devicetree.org/schemas/mmc/sdhci-am654.yaml#"
-$schema : "http://devicetree.org/meta-schemas/core.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: TI AM654 MMC Controller
 
@@ -163,13 +163,12 @@ properties:
   ti,driver-strength-ohm:
     description: DLL drive strength in ohms
     $ref: "/schemas/types.yaml#/definitions/uint32"
-    oneOf:
-      - enum:
-        - 33
-        - 40
-        - 50
-        - 66
-        - 100
+    enum:
+      - 33
+      - 40
+      - 50
+      - 66
+      - 100
 
   ti,strobe-sel:
     description: strobe select delay for HS400 speed mode.
diff --git a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
index f4292d2c54e3..d6cf8a560ef0 100644
--- a/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.yaml
@@ -29,16 +29,16 @@ properties:
   reg-names:
     oneOf:
       - items:
-        - const: dbi
-        - const: dbi2
-        - const: link
-        - const: addr_space
+          - const: dbi
+          - const: dbi2
+          - const: link
+          - const: addr_space
       - items:
-        - const: dbi
-        - const: dbi2
-        - const: link
-        - const: addr_space
-        - const: atu
+          - const: dbi
+          - const: dbi2
+          - const: link
+          - const: addr_space
+          - const: atu
 
   clocks:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/phy/socionext,uniphier-ahci-phy.yaml b/Documentation/devicetree/bindings/phy/socionext,uniphier-ahci-phy.yaml
index bab2ff4d9dc9..34756347a14e 100644
--- a/Documentation/devicetree/bindings/phy/socionext,uniphier-ahci-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/socionext,uniphier-ahci-phy.yaml
@@ -31,10 +31,10 @@ properties:
   clock-names:
     oneOf:
       - items:          # for PXs2
-        - const: link
+          - const: link
       - items:          # for others
-        - const: link
-        - const: phy
+          - const: link
+          - const: phy
 
   resets:
     maxItems: 2
diff --git a/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml b/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
index 15207ca9548f..ab77a65c5c55 100644
--- a/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
@@ -7,23 +7,23 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: OMAP USB2 PHY
 
 maintainers:
- - Kishon Vijay Abraham I <kishon@ti.com>
- - Roger Quadros <rogerq@ti.com>
+  - Kishon Vijay Abraham I <kishon@ti.com>
+  - Roger Quadros <rogerq@ti.com>
 
 properties:
   compatible:
     oneOf:
       - items:
-        - enum:
-          - ti,dra7x-usb2
-          - ti,dra7x-usb2-phy2
-          - ti,am654-usb2
-        - enum:
-          - ti,omap-usb2
+          - enum:
+              - ti,dra7x-usb2
+              - ti,dra7x-usb2-phy2
+              - ti,am654-usb2
+          - enum:
+              - ti,omap-usb2
       - items:
-        - const: ti,am437x-usb2
+          - const: ti,am437x-usb2
       - items:
-        - const: ti,omap-usb2
+          - const: ti,omap-usb2
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
index 33391d30c00c..ccdd9e3820d7 100644
--- a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
@@ -76,22 +76,22 @@ patternProperties:
             items:
               oneOf:
                 - enum: [lcd0_d18_mfp, rmii_crs_dv_mfp, rmii_txd0_mfp,
-                    rmii_txd1_mfp, rmii_txen_mfp, rmii_rxen_mfp, rmii_rxd1_mfp,
-                    rmii_rxd0_mfp, rmii_ref_clk_mfp, i2s_d0_mfp, i2s_pcm1_mfp,
-                    i2s0_pcm0_mfp, i2s1_pcm0_mfp, i2s_d1_mfp, ks_in2_mfp,
-                    ks_in1_mfp, ks_in0_mfp, ks_in3_mfp, ks_out0_mfp,
-                    ks_out1_mfp, ks_out2_mfp, lvds_o_pn_mfp, dsi_dn0_mfp,
-                    dsi_dp2_mfp, lcd0_d17_mfp, dsi_dp3_mfp, dsi_dn3_mfp,
-                    dsi_dp0_mfp, lvds_ee_pn_mfp, spi0_i2c_pcm_mfp,
-                    spi0_i2s_pcm_mfp, dsi_dnp1_cp_mfp, lvds_e_pn_mfp,
-                    dsi_dn2_mfp, uart2_rtsb_mfp, uart2_ctsb_mfp, uart3_rtsb_mfp,
-                    uart3_ctsb_mfp, sd0_d0_mfp, sd0_d1_mfp, sd0_d2_d3_mfp,
-                    sd1_d0_d3_mfp, sd0_cmd_mfp, sd0_clk_mfp, sd1_cmd_mfp,
-                    uart0_rx_mfp, clko_25m_mfp, csi_cn_cp_mfp, sens0_ckout_mfp,
-                    uart0_tx_mfp, i2c0_mfp, csi_dn_dp_mfp, sen0_pclk_mfp,
-                    pcm1_in_mfp, pcm1_clk_mfp, pcm1_sync_mfp, pcm1_out_mfp,
-                    dnand_data_wr_mfp, dnand_acle_ce0_mfp, nand_ceb2_mfp,
-                    nand_ceb3_mfp]
+                         rmii_txd1_mfp, rmii_txen_mfp, rmii_rxen_mfp, rmii_rxd1_mfp,
+                         rmii_rxd0_mfp, rmii_ref_clk_mfp, i2s_d0_mfp, i2s_pcm1_mfp,
+                         i2s0_pcm0_mfp, i2s1_pcm0_mfp, i2s_d1_mfp, ks_in2_mfp,
+                         ks_in1_mfp, ks_in0_mfp, ks_in3_mfp, ks_out0_mfp,
+                         ks_out1_mfp, ks_out2_mfp, lvds_o_pn_mfp, dsi_dn0_mfp,
+                         dsi_dp2_mfp, lcd0_d17_mfp, dsi_dp3_mfp, dsi_dn3_mfp,
+                         dsi_dp0_mfp, lvds_ee_pn_mfp, spi0_i2c_pcm_mfp,
+                         spi0_i2s_pcm_mfp, dsi_dnp1_cp_mfp, lvds_e_pn_mfp,
+                         dsi_dn2_mfp, uart2_rtsb_mfp, uart2_ctsb_mfp, uart3_rtsb_mfp,
+                         uart3_ctsb_mfp, sd0_d0_mfp, sd0_d1_mfp, sd0_d2_d3_mfp,
+                         sd1_d0_d3_mfp, sd0_cmd_mfp, sd0_clk_mfp, sd1_cmd_mfp,
+                         uart0_rx_mfp, clko_25m_mfp, csi_cn_cp_mfp, sens0_ckout_mfp,
+                         uart0_tx_mfp, i2c0_mfp, csi_dn_dp_mfp, sen0_pclk_mfp,
+                         pcm1_in_mfp, pcm1_clk_mfp, pcm1_sync_mfp, pcm1_out_mfp,
+                         dnand_data_wr_mfp, dnand_acle_ce0_mfp, nand_ceb2_mfp,
+                         nand_ceb3_mfp]
             minItems: 1
             maxItems: 32
 
@@ -100,10 +100,10 @@ patternProperties:
               Specify the alternative function to be configured for the
               given gpio pin groups.
             enum: [nor, eth_rmii, eth_smii, spi0, spi1, spi2, spi3, sens0,
-              sens1, uart0, uart1, uart2, uart3, uart4, uart5, uart6, i2s0,
-              i2s1, pcm1, pcm0, ks, jtag, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5,
-              p0, sd0, sd1, sd2, i2c0, i2c1, i2c3, dsi, lvds, usb30, clko_25m,
-              mipi_csi, nand, spdif, ts, lcd0]
+                   sens1, uart0, uart1, uart2, uart3, uart4, uart5, uart6, i2s0,
+                   i2s1, pcm1, pcm0, ks, jtag, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5,
+                   p0, sd0, sd1, sd2, i2c0, i2c1, i2c3, dsi, lvds, usb30, clko_25m,
+                   mipi_csi, nand, spdif, ts, lcd0]
 
         required:
           - groups
@@ -126,14 +126,14 @@ patternProperties:
             items:
               oneOf:
                 - enum: [sirq_drv, rmii_txd01_txen_drv, rmii_rxer_drv,
-                    rmii_crs_drv, rmii_rxd10_drv, rmii_ref_clk_drv,
-                    smi_mdc_mdio_drv, i2s_d0_drv, i2s_bclk0_drv, i2s3_drv,
-                    i2s13_drv, pcm1_drv, ks_in_drv, ks_out_drv, lvds_all_drv,
-                    lcd_dsi_drv, dsi_drv, sd0_d0_d3_drv, sd1_d0_d3_drv,
-                    sd0_cmd_drv, sd0_clk_drv, sd1_cmd_drv, sd1_clk_drv,
-                    spi0_all_drv, uart0_rx_drv, uart0_tx_drv, uart2_all_drv,
-                    i2c0_all_drv, i2c12_all_drv, sens0_pclk_drv,
-                    sens0_ckout_drv, uart3_all_drv]
+                         rmii_crs_drv, rmii_rxd10_drv, rmii_ref_clk_drv,
+                         smi_mdc_mdio_drv, i2s_d0_drv, i2s_bclk0_drv, i2s3_drv,
+                         i2s13_drv, pcm1_drv, ks_in_drv, ks_out_drv, lvds_all_drv,
+                         lcd_dsi_drv, dsi_drv, sd0_d0_d3_drv, sd1_d0_d3_drv,
+                         sd0_cmd_drv, sd0_clk_drv, sd1_cmd_drv, sd1_clk_drv,
+                         spi0_all_drv, uart0_rx_drv, uart0_tx_drv, uart2_all_drv,
+                         i2c0_all_drv, i2c12_all_drv, sens0_pclk_drv,
+                         sens0_ckout_drv, uart3_all_drv]
             minItems: 1
             maxItems: 32
 
@@ -144,29 +144,29 @@ patternProperties:
             items:
               oneOf:
                 - enum: [dnand_dqs, dnand_dqsn, eth_txd0, eth_txd1, eth_txen,
-                    eth_rxer, eth_crs_dv, eth_rxd1, eth_rxd0, eth_ref_clk,
-                    eth_mdc, eth_mdio, sirq0, sirq1, sirq2, i2s_d0, i2s_bclk0,
-                    i2s_lrclk0, i2s_mclk0, i2s_d1, i2s_bclk1, i2s_lrclk1,
-                    i2s_mclk1, ks_in0, ks_in1, ks_in2, ks_in3, ks_out0, ks_out1,
-                    ks_out2, lvds_oep, lvds_oen, lvds_odp, lvds_odn, lvds_ocp,
-                    lvds_ocn, lvds_obp, lvds_obn, lvds_oap, lvds_oan, lvds_eep,
-                    lvds_een, lvds_edp, lvds_edn, lvds_ecp, lvds_ecn, lvds_ebp,
-                    lvds_ebn, lvds_eap, lvds_ean, lcd0_d18, lcd0_d17, dsi_dp3,
-                    dsi_dn3, dsi_dp1, dsi_dn1, dsi_cp, dsi_cn, dsi_dp0, dsi_dn0,
-                    dsi_dp2, dsi_dn2, sd0_d0, sd0_d1, sd0_d2, sd0_d3, sd1_d0,
-                    sd1_d1, sd1_d2, sd1_d3, sd0_cmd, sd0_clk, sd1_cmd, sd1_clk,
-                    spi0_sclk, spi0_ss, spi0_miso, spi0_mosi, uart0_rx,
-                    uart0_tx, i2c0_sclk, i2c0_sdata, sensor0_pclk,
-                    sensor0_ckout, dnand_ale, dnand_cle, dnand_ceb0, dnand_ceb1,
-                    dnand_ceb2, dnand_ceb3, uart2_rx, uart2_tx, uart2_rtsb,
-                    uart2_ctsb, uart3_rx, uart3_tx, uart3_rtsb, uart3_ctsb,
-                    pcm1_in, pcm1_clk, pcm1_sync, pcm1_out, i2c1_sclk,
-                    i2c1_sdata, i2c2_sclk, i2c2_sdata, csi_dn0, csi_dp0,
-                    csi_dn1, csi_dp1, csi_dn2, csi_dp2, csi_dn3, csi_dp3,
-                    csi_cn, csi_cp, dnand_d0, dnand_d1, dnand_d2, dnand_d3,
-                    dnand_d4, dnand_d5, dnand_d6, dnand_d7, dnand_rb, dnand_rdb,
-                    dnand_rdbn, dnand_wrb, porb, clko_25m, bsel, pkg0, pkg1,
-                    pkg2, pkg3]
+                         eth_rxer, eth_crs_dv, eth_rxd1, eth_rxd0, eth_ref_clk,
+                         eth_mdc, eth_mdio, sirq0, sirq1, sirq2, i2s_d0, i2s_bclk0,
+                         i2s_lrclk0, i2s_mclk0, i2s_d1, i2s_bclk1, i2s_lrclk1,
+                         i2s_mclk1, ks_in0, ks_in1, ks_in2, ks_in3, ks_out0, ks_out1,
+                         ks_out2, lvds_oep, lvds_oen, lvds_odp, lvds_odn, lvds_ocp,
+                         lvds_ocn, lvds_obp, lvds_obn, lvds_oap, lvds_oan, lvds_eep,
+                         lvds_een, lvds_edp, lvds_edn, lvds_ecp, lvds_ecn, lvds_ebp,
+                         lvds_ebn, lvds_eap, lvds_ean, lcd0_d18, lcd0_d17, dsi_dp3,
+                         dsi_dn3, dsi_dp1, dsi_dn1, dsi_cp, dsi_cn, dsi_dp0, dsi_dn0,
+                         dsi_dp2, dsi_dn2, sd0_d0, sd0_d1, sd0_d2, sd0_d3, sd1_d0,
+                         sd1_d1, sd1_d2, sd1_d3, sd0_cmd, sd0_clk, sd1_cmd, sd1_clk,
+                         spi0_sclk, spi0_ss, spi0_miso, spi0_mosi, uart0_rx,
+                         uart0_tx, i2c0_sclk, i2c0_sdata, sensor0_pclk,
+                         sensor0_ckout, dnand_ale, dnand_cle, dnand_ceb0, dnand_ceb1,
+                         dnand_ceb2, dnand_ceb3, uart2_rx, uart2_tx, uart2_rtsb,
+                         uart2_ctsb, uart3_rx, uart3_tx, uart3_rtsb, uart3_ctsb,
+                         pcm1_in, pcm1_clk, pcm1_sync, pcm1_out, i2c1_sclk,
+                         i2c1_sdata, i2c2_sclk, i2c2_sdata, csi_dn0, csi_dp0,
+                         csi_dn1, csi_dp1, csi_dn2, csi_dp2, csi_dn3, csi_dp3,
+                         csi_cn, csi_cp, dnand_d0, dnand_d1, dnand_d2, dnand_d3,
+                         dnand_d4, dnand_d5, dnand_d6, dnand_d7, dnand_rb, dnand_rdb,
+                         dnand_rdbn, dnand_wrb, porb, clko_25m, bsel, pkg0, pkg1,
+                         pkg2, pkg3]
             minItems: 1
             maxItems: 64
 
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
index 5556def6b99b..c4c071211611 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
@@ -106,7 +106,7 @@ patternProperties:
     required:
       - pinmux
 
-    additionalProperties:  false
+    additionalProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index 1f0f5757f9e1..040d2ada3669 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -71,9 +71,9 @@ patternProperties:
           Specify the alternative function to be configured for the specified
           pins. Functions are only valid for gpio pins.
         enum: [ gpio, cci_i2c0, blsp_uim1, blsp_uim2, blsp_uim3, blsp_uim5,
-          blsp_i2c1, blsp_i2c2, blsp_i2c3, blsp_i2c5, blsp_spi1,
-          blsp_spi2, blsp_spi3, blsp_spi5, blsp_uart1, blsp_uart2,
-          blsp_uart3, blsp_uart5, cam_mclk0, cam_mclk1, wlan ]
+                blsp_i2c1, blsp_i2c2, blsp_i2c3, blsp_i2c5, blsp_spi1,
+                blsp_spi2, blsp_spi3, blsp_spi5, blsp_uart1, blsp_uart2,
+                blsp_uart3, blsp_uart5, cam_mclk0, cam_mclk1, wlan ]
 
       drive-strength:
         enum: [2, 4, 6, 8, 10, 12, 14, 16]
diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
index d0d1a01140ea..9f1dab0c2430 100644
--- a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
@@ -40,24 +40,24 @@ patternProperties:
           Function to mux.
         $ref: "/schemas/types.yaml#/definitions/string"
         enum: [i2c0, i2c1, i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c8,
-          spi0, spi1, spi2, spi3, spi4, spi5, spi6,
-          uart0, uart1, uart2, uart3, pwm, pcmif_out, pcmif_in]
+               spi0, spi1, spi2, spi3, spi4, spi5, spi6,
+               uart0, uart1, uart2, uart3, pwm, pcmif_out, pcmif_in]
 
       groups:
         description:
           Name of the pin group to use for the functions.
         $ref: "/schemas/types.yaml#/definitions/string"
         enum: [i2c0_grp, i2c1_grp, i2c2_grp, i2c3_grp, i2c4_grp,
-          i2c5_grp, i2c6_grp, i2c7_grp, i2c8_grp,
-          spi0_grp, spi0_cs0_grp, spi0_cs1_grp, spi0_cs2_grp,
-          spi1_grp, spi2_grp, spi3_grp, spi4_grp, spi5_grp, spi6_grp,
-          uart0_grp, uart1_grp, uart2_grp, uart3_grp,
-          pwm0_gpio4_grp, pwm0_gpio8_grp, pwm0_gpio12_grp,
-          pwm0_gpio16_grp, pwm1_gpio5_grp, pwm1_gpio9_grp,
-          pwm1_gpio13_grp, pwm1_gpio17_grp, pwm2_gpio6_grp,
-          pwm2_gpio10_grp, pwm2_gpio14_grp, pwm2_gpio18_grp,
-          pwm3_gpio7_grp, pwm3_gpio11_grp, pwm3_gpio15_grp,
-          pwm3_gpio19_grp, pcmif_out_grp, pcmif_in_grp]
+               i2c5_grp, i2c6_grp, i2c7_grp, i2c8_grp,
+               spi0_grp, spi0_cs0_grp, spi0_cs1_grp, spi0_cs2_grp,
+               spi1_grp, spi2_grp, spi3_grp, spi4_grp, spi5_grp, spi6_grp,
+               uart0_grp, uart1_grp, uart2_grp, uart3_grp,
+               pwm0_gpio4_grp, pwm0_gpio8_grp, pwm0_gpio12_grp,
+               pwm0_gpio16_grp, pwm1_gpio5_grp, pwm1_gpio9_grp,
+               pwm1_gpio13_grp, pwm1_gpio17_grp, pwm2_gpio6_grp,
+               pwm2_gpio10_grp, pwm2_gpio14_grp, pwm2_gpio18_grp,
+               pwm3_gpio7_grp, pwm3_gpio11_grp, pwm3_gpio15_grp,
+               pwm3_gpio19_grp, pcmif_out_grp, pcmif_in_grp]
 
       drive-strength:
         enum: [2, 4, 6, 8, 16, 24, 32]
diff --git a/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
index a6c91026d4cc..a2dca38577f7 100644
--- a/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
+++ b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
@@ -28,9 +28,9 @@ description: |
 
 properties:
   mode-normal:
-      $ref: /schemas/types.yaml#/definitions/uint32
-      description: |
-        Default value to set on a reboot if no command was provided.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Default value to set on a reboot if no command was provided.
 
 patternProperties:
   "^mode-.*$":
diff --git a/Documentation/devicetree/bindings/power/supply/ingenic,battery.yaml b/Documentation/devicetree/bindings/power/supply/ingenic,battery.yaml
index 867e3e6b7e80..76c227a7cd5c 100644
--- a/Documentation/devicetree/bindings/power/supply/ingenic,battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/ingenic,battery.yaml
@@ -15,10 +15,10 @@ properties:
     oneOf:
       - const: ingenic,jz4740-battery
       - items:
-        - enum:
-          - ingenic,jz4725b-battery
-          - ingenic,jz4770-battery
-        - const: ingenic,jz4740-battery
+          - enum:
+              - ingenic,jz4725b-battery
+              - ingenic,jz4770-battery
+          - const: ingenic,jz4740-battery
 
   io-channels:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/power/supply/summit,smb347-charger.yaml b/Documentation/devicetree/bindings/power/supply/summit,smb347-charger.yaml
index 193a23af2007..983fc215c1e5 100644
--- a/Documentation/devicetree/bindings/power/supply/summit,smb347-charger.yaml
+++ b/Documentation/devicetree/bindings/power/supply/summit,smb347-charger.yaml
@@ -84,12 +84,12 @@ allOf:
     then:
       properties:
         summit,mains-current-limit-microamp:
-          enum: [ 300000,  500000,  700000, 1000000,
-                 1500000, 1800000, 2000000]
+          enum: [ 300000, 500000, 700000, 1000000,
+                  1500000, 1800000, 2000000]
 
         summit,usb-current-limit-microamp:
-          enum: [ 300000,  500000,  700000, 1000000,
-                 1500000, 1800000, 2000000]
+          enum: [ 300000, 500000, 700000, 1000000,
+                  1500000, 1800000, 2000000]
 
         summit,charge-current-compensation-microamp:
           enum: [200000, 450000, 600000, 900000]
@@ -97,12 +97,12 @@ allOf:
     else:
       properties:
         summit,mains-current-limit-microamp:
-          enum: [ 300000,  500000,  700000,  900000, 1200000,
-                 1500000, 1800000, 2000000, 2200000, 2500000]
+          enum: [ 300000, 500000, 700000, 900000, 1200000,
+                  1500000, 1800000, 2000000, 2200000, 2500000]
 
         summit,usb-current-limit-microamp:
-          enum: [ 300000,  500000,  700000,  900000, 1200000,
-                 1500000, 1800000, 2000000, 2200000, 2500000]
+          enum: [ 300000, 500000, 700000, 900000, 1200000,
+                  1500000, 1800000, 2000000, 2200000, 2500000]
 
         summit,charge-current-compensation-microamp:
           enum: [250000, 700000, 900000, 1200000]
diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
index 3f4a1939554d..efc0198eeb74 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
@@ -25,8 +25,8 @@ select:
   properties:
     compatible:
       items:
-       - enum:
-          - sifive,fu540-c000-ccache
+        - enum:
+            - sifive,fu540-c000-ccache
 
   required:
     - compatible
diff --git a/Documentation/devicetree/bindings/rng/imx-rng.yaml b/Documentation/devicetree/bindings/rng/imx-rng.yaml
index 4ad1e456a801..07f6ff89bcc1 100644
--- a/Documentation/devicetree/bindings/rng/imx-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/imx-rng.yaml
@@ -19,9 +19,9 @@ properties:
           - const: fsl,imx21-rnga
       - items:
           - enum:
-            - fsl,imx6sl-rngb
-            - fsl,imx6sll-rngb
-            - fsl,imx6ull-rngb
+              - fsl,imx6sl-rngb
+              - fsl,imx6sll-rngb
+              - fsl,imx6ull-rngb
           - const: fsl,imx25-rngb
       - const: fsl,imx35-rngc
 
diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
index 9ff85bc6859c..9702c07a6b6c 100644
--- a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
@@ -20,30 +20,30 @@ properties:
       - const: fsl,imx21-uart
       - items:
           - enum:
-            - fsl,imx25-uart
-            - fsl,imx27-uart
-            - fsl,imx31-uart
-            - fsl,imx35-uart
-            - fsl,imx50-uart
-            - fsl,imx51-uart
-            - fsl,imx53-uart
-            - fsl,imx6q-uart
+              - fsl,imx25-uart
+              - fsl,imx27-uart
+              - fsl,imx31-uart
+              - fsl,imx35-uart
+              - fsl,imx50-uart
+              - fsl,imx51-uart
+              - fsl,imx53-uart
+              - fsl,imx6q-uart
           - const: fsl,imx21-uart
       - items:
           - enum:
-            - fsl,imx6sl-uart
-            - fsl,imx6sll-uart
-            - fsl,imx6sx-uart
+              - fsl,imx6sl-uart
+              - fsl,imx6sll-uart
+              - fsl,imx6sx-uart
           - const: fsl,imx6q-uart
           - const: fsl,imx21-uart
       - items:
           - enum:
-            - fsl,imx6ul-uart
-            - fsl,imx7d-uart
-            - fsl,imx8mm-uart
-            - fsl,imx8mn-uart
-            - fsl,imx8mp-uart
-            - fsl,imx8mq-uart
+              - fsl,imx6ul-uart
+              - fsl,imx7d-uart
+              - fsl,imx8mm-uart
+              - fsl,imx8mn-uart
+              - fsl,imx8mp-uart
+              - fsl,imx8mq-uart
           - const: fsl,imx6q-uart
 
   reg:
diff --git a/Documentation/devicetree/bindings/sound/mchp,spdifrx.yaml b/Documentation/devicetree/bindings/sound/mchp,spdifrx.yaml
index 7d8bd4e14434..4a2129005c0f 100644
--- a/Documentation/devicetree/bindings/sound/mchp,spdifrx.yaml
+++ b/Documentation/devicetree/bindings/sound/mchp,spdifrx.yaml
@@ -10,8 +10,8 @@ maintainers:
   - Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
 
 description:
-        The Microchip Sony/Philips Digital Interface Receiver is a
-        serial port compliant with the IEC-60958 standard.
+  The Microchip Sony/Philips Digital Interface Receiver is a serial port 
+  compliant with the IEC-60958 standard.
 
 properties:
   "#sound-dai-cells":
diff --git a/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml b/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
index a03b0b871fc9..bdfb63387c53 100644
--- a/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
+++ b/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
@@ -10,8 +10,8 @@ maintainers:
   - Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
 
 description:
-        The Microchip Sony/Philips Digital Interface Transmitter is a
-        serial port compliant with the IEC-60958 standard.
+  The Microchip Sony/Philips Digital Interface Transmitter is a serial port 
+  compliant with the IEC-60958 standard.
 
 properties:
   "#sound-dai-cells":
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index f6f9fb49f385..1e23c0e20bc1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -26,8 +26,10 @@ properties:
   reg:
     maxItems: 2
     description: LPAIF core registers
+
   reg-names:
-     maxItems: 2
+    maxItems: 2
+
   clocks:
     minItems: 3
     maxItems: 6
@@ -39,8 +41,10 @@ properties:
   interrupts:
     maxItems: 2
     description: LPAIF DMA buffer interrupt
+
   interrupt-names:
     maxItems: 2
+
   qcom,adsp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Phandle for the audio DSP node
@@ -141,31 +145,31 @@ allOf:
       properties:
         clock-names:
           oneOf:
-           - items:   #for I2S
-              - const: pcnoc-sway-clk
-              - const: audio-core
-              - const: mclk0
-              - const: pcnoc-mport-clk
-              - const: mi2s-bit-clk0
-              - const: mi2s-bit-clk1
-           - items:   #for HDMI
-              - const: pcnoc-sway-clk
-              - const: audio-core
-              - const: pcnoc-mport-clk
+            - items:   #for I2S
+                - const: pcnoc-sway-clk
+                - const: audio-core
+                - const: mclk0
+                - const: pcnoc-mport-clk
+                - const: mi2s-bit-clk0
+                - const: mi2s-bit-clk1
+            - items:   #for HDMI
+                - const: pcnoc-sway-clk
+                - const: audio-core
+                - const: pcnoc-mport-clk
         reg-names:
           anyOf:
             - items:   #for I2S
-              - const: lpass-lpaif
+                - const: lpass-lpaif
             - items:   #for I2S and HDMI
-              - const: lpass-hdmiif
-              - const: lpass-lpaif
+                - const: lpass-hdmiif
+                - const: lpass-lpaif
         interrupt-names:
           anyOf:
             - items:   #for I2S
-              - const: lpass-irq-lpaif
+                - const: lpass-irq-lpaif
             - items:   #for I2S and HDMI
-              - const: lpass-irq-lpaif
-              - const: lpass-irq-hdmi
+                - const: lpass-irq-lpaif
+                - const: lpass-irq-hdmi
       required:
         - iommus
         - power-domains
diff --git a/Documentation/devicetree/bindings/timer/arm,sp804.yaml b/Documentation/devicetree/bindings/timer/arm,sp804.yaml
index e35d3053250a..960e2bd66a97 100644
--- a/Documentation/devicetree/bindings/timer/arm,sp804.yaml
+++ b/Documentation/devicetree/bindings/timer/arm,sp804.yaml
@@ -33,8 +33,8 @@ properties:
   compatible:
     items:
       - enum:
-        - arm,sp804
-        - hisilicon,sp804
+          - arm,sp804
+          - hisilicon,sp804
       - const: arm,primecell
 
   interrupts:
@@ -58,11 +58,11 @@ properties:
       clock is used for all clock inputs.
     oneOf:
       - items:
-        - description: clock for timer 1
-        - description: clock for timer 2
-        - description: bus clock
+          - description: clock for timer 1
+          - description: clock for timer 2
+          - description: bus clock
       - items:
-        - description: unified clock for both timers and the bus
+          - description: unified clock for both timers and the bus
 
   clock-names: true
     # The original binding did not specify any clock names, and there is no
diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index ac20b98e9910..d6af2794d444 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -44,8 +44,8 @@ properties:
     enum: [super-speed, high-speed, full-speed]
 
   phys:
-   minItems: 1
-   maxItems: 2
+    minItems: 1
+    maxItems: 2
 
   phy-names:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
index 5fe9e6211ba2..52ceb07294a3 100644
--- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
@@ -17,7 +17,7 @@ description: |-
 
 properties:
   compatible:
-   const: ti,hd3ss3220
+    const: ti,hd3ss3220
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml b/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml
index 1aaf3e768c81..55adea827c34 100644
--- a/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml
+++ b/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml
@@ -15,10 +15,10 @@ properties:
       - const: fsl,imx21-owire
       - items:
           - enum:
-            - fsl,imx27-owire
-            - fsl,imx50-owire
-            - fsl,imx51-owire
-            - fsl,imx53-owire
+              - fsl,imx27-owire
+              - fsl,imx50-owire
+              - fsl,imx51-owire
+              - fsl,imx53-owire
           - const: fsl,imx21-owire
 
   reg:
-- 
2.25.1

