Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82B444AC609
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 17:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239321AbiBGQhH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 11:37:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381968AbiBGQZe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 11:25:34 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3775BC0401CE;
        Mon,  7 Feb 2022 08:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1644251133; x=1675787133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UgAsg9TlIrDzEqjVIYSY7g9vpEQeRY9RvW+oM1/ooF0=;
  b=Li8lWxKOgYsYSr/18YuGQ02YKB7FQPWGJ7sPSo/5Uk0R9g2T0ezaXu1+
   9/jLoTxOQbGob6SMr3pjMt8Y3rF1Ea0+K4/bue/vIYsEQGiEKeM188TnS
   lo8lGvphP48gbty+idDAqSO6VHsoKgjxxahQmuYZ8cyiwkOl3RVGAeQHc
   giL1EYbga6PUMMICUKzsI9rtEBiaXsBxBAgXJ9cyZXadBYVUoYs8EfZEQ
   i0SRvbylx7kMnrsZual9BD4U+yTZ+95wqRxxNy9BJ1KFROBSoFpLeYcQ+
   0SsQlN22A4evncYp504TtzHOYNmuMcHN7nQ64WuLXTWaZQuda8P3vcjoz
   g==;
IronPort-SDR: a5kwyl98BaeJDDdVDl5yUbw7rcuwyz/E9FtbOJijPgB9dt43zfaMptiY3NIHux370393lzmFLU
 lzWz2ZEqSQH/HZ1VfAY8nqH5lXPP3+LCjLuzIWQQUnOq+LbNCiLbIAbjkkHMrJqOt9joT9Unk7
 YJ/bfwhQjZXo5sAEDz5hJSqdcwZCClNOiHqx0yaQMyGtVaVpTfLWLhw8eh0GvO+h5Qu/4xJCB/
 I5TYpZlnOnLtZf15L/GmvsWalzfssFDfTE3+P7MBfH0yoj71s2cawwSQ6ZpxD+DOhQDRcD07g/
 MR2ujyQQJQOB9peCG1uyptaR
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="145140011"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Feb 2022 09:24:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Feb 2022 09:24:22 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 7 Feb 2022 09:24:17 -0700
From:   <conor.dooley@microchip.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
        <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
        <krzysztof.kozlowski@canonical.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC:     <bin.meng@windriver.com>, <heiko@sntech.de>,
        <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
        <atishp@rivosinc.com>, Rob Herring <robh@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6 06/12] dt-bindings: pwm: add microchip corepwm binding
Date:   Mon, 7 Feb 2022 16:26:32 +0000
Message-ID: <20220207162637.1658677-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207162637.1658677-1-conor.dooley@microchip.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the Microchip fpga fabric based "core" PWM
controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../bindings/pwm/microchip,corepwm.yaml       | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
new file mode 100644
index 000000000000..30ec70ac5c44
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/microchip,corepwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip IP corePWM controller bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  corePWM is an 16 channel pulse width modulator FPGA IP
+
+  https://www.microsemi.com/existing-parts/parts/152118
+
+properties:
+  compatible:
+    items:
+      - const: microchip,corepwm-rtl-v4
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+
+  microchip,sync-update-mask:
+    description: |
+      Depending on how the IP is instantiated, there are two modes of operation.
+      In synchronous mode, all channels are updated at the beginning of the PWM period,
+      and in asynchronous mode updates happen as the control registers are written.
+      A 16 bit wide "SHADOW_REG_EN" parameter of the IP core controls whether synchronous
+      mode is possible for each channel, and is set by the bitstream programmed to the
+      FPGA. If the IP core is instantiated with SHADOW_REG_ENx=1, both registers that
+      control the duty cycle for channel x have a second "shadow"/buffer reg synthesised.
+      At runtime a bit wide register exposed to APB can be used to toggle on/off
+      synchronised mode for all channels it has been synthesised for.
+      Each bit of "microchip,sync-update-mask" corresponds to a PWM channel & represents
+      whether synchronous mode is possible for the PWM channel.
+
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+  microchip,dac-mode-mask:
+    description: |
+      Optional, per-channel Low Ripple DAC mode is possible on this IP core. It creates
+      a minimum period pulse train whose High/Low average is that of the chosen duty
+      cycle. This "DAC" will have far better bandwidth and ripple performance than the
+      standard PWM algorithm can achieve. A 16 bit DAC_MODE module parameter of the IP
+      core, set at instantiation and by the bitstream programmed to the FPGA, determines
+      whether a given channel operates in regular PWM or DAC mode.
+      Each bit corresponds to a PWM channel & represents whether DAC mode is enabled
+      for that channel.
+
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm@41000000 {
+      compatible = "microchip,corepwm-rtl-v4";
+      microchip,sync-update-mask = /bits/ 32 <0>;
+      clocks = <&clkcfg 30>;
+      reg = <0x41000000 0xF0>;
+      #pwm-cells = <2>;
+    };
-- 
2.35.1

