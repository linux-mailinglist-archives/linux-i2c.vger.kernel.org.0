Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5934F6E7F
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Apr 2022 01:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235373AbiDFX0L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 19:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233489AbiDFX0K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 19:26:10 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D336D13DDB;
        Wed,  6 Apr 2022 16:24:07 -0700 (PDT)
X-UUID: 7bc4d3761fed4986a9988a2c389047e2-20220407
X-UUID: 7bc4d3761fed4986a9988a2c389047e2-20220407
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1460989857; Thu, 07 Apr 2022 07:24:02 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 7 Apr 2022 07:24:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 07:24:00 +0800
From:   Miles Chen <miles.chen@mediatek.com>
To:     <angelogioacchino.delregno@collabora.com>
CC:     <devicetree@vger.kernel.org>, <hsinyi@chromium.org>,
        <kewei.xu@mediatek.com>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
        <qii.wang@mediatek.com>, <robh+dt@kernel.org>, <wsa@kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: convert i2c-mt65xx to json-schema
Date:   Thu, 7 Apr 2022 07:24:00 +0800
Message-ID: <20220406232400.2788-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220406152940.140224-1-angelogioacchino.delregno@collabora.com>
References: <20220406152940.140224-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi AngeloGioacchino,

> Convert I2C binding for MediaTek SoCs to Devicetree schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  53 --------
>  .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 118 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 119 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> deleted file mode 100644
> index 026985b8f61a..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -* MediaTek's I2C controller
> -
> -The MediaTek's I2C controller is used to interface with I2C devices.
> -
> -Required properties:
> -  - compatible: value should be either of the following.
> -      "mediatek,mt2701-i2c", "mediatek,mt6577-i2c": for MediaTek MT2701
> -      "mediatek,mt2712-i2c": for MediaTek MT2712
> -      "mediatek,mt6577-i2c": for MediaTek MT6577
> -      "mediatek,mt6589-i2c": for MediaTek MT6589
> -      "mediatek,mt6797-i2c", "mediatek,mt6577-i2c": for MediaTek MT6797
> -      "mediatek,mt7622-i2c": for MediaTek MT7622
> -      "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek MT7623
> -      "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
> -      "mediatek,mt8168-i2c": for MediaTek MT8168
> -      "mediatek,mt8173-i2c": for MediaTek MT8173
> -      "mediatek,mt8183-i2c": for MediaTek MT8183
> -      "mediatek,mt8186-i2c": for MediaTek MT8186
> -      "mediatek,mt8192-i2c": for MediaTek MT8192
> -      "mediatek,mt8195-i2c", "mediatek,mt8192-i2c": for MediaTek MT8195
> -      "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
> -  - reg: physical base address of the controller and dma base, length of memory
> -    mapped region.
> -  - interrupts: interrupt number to the cpu.
> -  - clock-div: the fixed value for frequency divider of clock source in i2c
> -    module. Each IC may be different.
> -  - clocks: clock name from clock manager
>-  - clock-names: Must include "main" and "dma", "arb" is for multi-master that
>-    one bus has more than two i2c controllers, if enable have-pmic need include
>-    "pmic" extra.

snip

>+properties:
>+  compatible:
>+    oneOf:
>+      - const: mediatek,mt2712-i2c
>+      - const: mediatek,mt6577-i2c
>+      - const: mediatek,mt6589-i2c
>+      - const: mediatek,mt7622-i2c
>+      - const: mediatek,mt8168-i2c
>+      - const: mediatek,mt8173-i2c
>+      - const: mediatek,mt8183-i2c
>+      - const: mediatek,mt8186-i2c
>+      - const: mediatek,mt8192-i2c
>+      - items:
>+          - enum:
>+              - mediatek,mt7629-i2c
>+              - mediatek,mt8516-i2c
>+          - const: mediatek,mt2712-i2c
>+      - items:
>+          - enum:
>+              - mediatek,mt2701-i2c
>+              - mediatek,mt6797-i2c
>+              - mediatek,mt7623-i2c
>+          - const: mediatek,mt6577-i2c
>+      - items:
>+          - enum:
>+              - mediatek,mt8195-i2c
>+          - const: mediatek,mt8192-i2c
>+
>+  reg:
>+    items:
>+      - description: Physical base address
>+      - description: DMA base address
>+
>+  interrupts:
>+    maxItems: 1
>+
>+  clocks:
>+    minItems: 1
>+    items:
>+      - description: Main clock for I2C bus
>+      - description: Clock for I2C via DMA
>+      - description: Bus arbitrator clock
>+      - description: Clock for I2C from PMIC
>+
>+  clock-names:
>+    minItems: 1
>+    items:
>+      - const: main
>+      - const: dma
>+      - const: arb
>+      - const: pmic

I read "clock-names: Must include "main" and "dma"" from i2c-mt65xx.txt.
Does it means that we should have at least 2 clock-names (minItems: 2)?

Thanks,
Miles

>+
>+  clock-div:
>+    $ref: /schemas/types.yaml#/definitions/uint32
>+    description: Frequency divider of clock source in I2C module
>+
>+  clock-frequency:
>+    default: 100000
>+    description:
>+      SCL frequency to use (in Hz). If omitted, 100kHz is used.
>+
>+  mediatek,have-pmic:
>+    description: Platform controls I2C from PMIC side
>+    type: boolean
>+
>+  mediatek,use-push-pull:
>+    description: Use push-pull mode I/O config
>+    type: boolean
>+
>+  vbus-supply:
>+    description: Phandle to the regulator providing power to SCL/SDA
>+
>+required:
>+  - compatible
>+  - reg
>+  - clocks
>+  - clock-names
>+  - clock-div
>+  - interrupts
>+
>+unevaluatedProperties: false
>+
>+examples:
>+  - |
>+    #include <dt-bindings/interrupt-controller/arm-gic.h>
>+    #include <dt-bindings/interrupt-controller/irq.h>
>+
>+    i2c0: i2c@1100d000 {
>+      compatible = "mediatek,mt6577-i2c";
>+      reg = <0x1100d000 0x70>, <0x11000300 0x80>;
>+      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
>+      clocks = <&i2c0_ck>, <&ap_dma_ck>;
>+      clock-names = "main", "dma";
>+      clock-div = <16>;
>+      clock-frequency = <400000>;
>+      mediatek,have-pmic;
>+
>+      #address-cells = <1>;
>+      #size-cells = <0>;
>+    };
>diff --git a/MAINTAINERS b/MAINTAINERS
>index ee0b5a70aff1..28a17d4c8d12 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -12361,7 +12361,7 @@ MEDIATEK I2C CONTROLLER DRIVER
> M:	Qii Wang <qii.wang@mediatek.com>
> L:	linux-i2c@vger.kernel.org
> S:	Maintained
>-F:	Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>+F:	Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> F:	drivers/i2c/busses/i2c-mt65xx.c
> 
> MEDIATEK IOMMU DRIVER
>-- 
>2.35.1
>
>
