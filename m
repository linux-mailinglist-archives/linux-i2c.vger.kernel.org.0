Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28719389A46
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 02:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhETACz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 20:02:55 -0400
Received: from mail-oo1-f41.google.com ([209.85.161.41]:44922 "EHLO
        mail-oo1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhETACz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 20:02:55 -0400
Received: by mail-oo1-f41.google.com with SMTP id s24-20020a4aead80000b02901fec6deb28aso3393407ooh.11;
        Wed, 19 May 2021 17:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2U0DOJOGr7PoXGKnZ0Spg2cVP5PlFJxyFrW88+PvagA=;
        b=Cf12aPrtPElUGrkitM0fVu1aegksUw7DZuWDT1qHaalHvlgM3hJQto5sOrE9UntAa2
         /yMS6lvC1+Y6IqEsqGm/RqbpH+bRGwmAr2SZJgaC/1mJKQPzPxknP4OWK5Cl0pswEq67
         GuxCNBVBT97dGo8GUaSI69QHKpEA5/YoJcIE+VdgpO20CEwHLFUsoGhRkBjMxLi/SiTU
         E8I6O6bLGiNrAaIg1Wx3wZRcqyeHty14Ooy4q1RuSF7rAYSk6T5IlQFH8Rp/Fk+Do/ce
         ZJORjDySfENdClvcv0HxgfseE6pi9BNGWqXIfAWLil2bUASNVTeRB2Rmk8JvPu90TFYV
         9vtw==
X-Gm-Message-State: AOAM533ZbjFRs3s5rFjczyHQAHTquSsja1kH+HR13WGmGwvyJ0o6neaF
        8+1D2R/Jed6U49SAHa0INQ==
X-Google-Smtp-Source: ABdhPJyQF5l4eHcp4L7RXu6jr6/fpAFevlq2eho73arvZOu/0DaVFPj7KYJmgNi/dXV6RHYxVKAVUQ==
X-Received: by 2002:a05:6820:100a:: with SMTP id v10mr1520942oor.55.1621468894345;
        Wed, 19 May 2021 17:01:34 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x65sm287790otb.59.2021.05.19.17.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 17:01:33 -0700 (PDT)
Received: (nullmailer pid 3920159 invoked by uid 1000);
        Thu, 20 May 2021 00:01:32 -0000
Date:   Wed, 19 May 2021 19:01:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        mkorpershoek@baylibre.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: i2c-mt65xx: convert doc to yaml
 schema format
Message-ID: <20210520000132.GA3914592@robh.at.kernel.org>
References: <20210518145522.2420135-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518145522.2420135-1-fparent@baylibre.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 18, 2021 at 04:55:20PM +0200, Fabien Parent wrote:
> Convert the binding documentation for i2c-mt65xx driver to the
> YAML schema format.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    | 49 ----------
>  .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 97 +++++++++++++++++++
>  2 files changed, 97 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> deleted file mode 100644
> index 7f0194fdd0cc..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
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
> -      "mediatek,mt8173-i2c": for MediaTek MT8173
> -      "mediatek,mt8183-i2c": for MediaTek MT8183
> -      "mediatek,mt8192-i2c": for MediaTek MT8192
> -      "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
> -  - reg: physical base address of the controller and dma base, length of memory
> -    mapped region.
> -  - interrupts: interrupt number to the cpu.
> -  - clock-div: the fixed value for frequency divider of clock source in i2c
> -    module. Each IC may be different.
> -  - clocks: clock name from clock manager
> -  - clock-names: Must include "main" and "dma", "arb" is for multi-master that
> -    one bus has more than two i2c controllers, if enable have-pmic need include
> -    "pmic" extra.
> -
> -Optional properties:
> -  - clock-frequency: Frequency in Hz of the bus when transfer, the default value
> -    is 100000.
> -  - mediatek,have-pmic: platform can control i2c form special pmic side.
> -    Only mt6589 and mt8135 support this feature.
> -  - mediatek,use-push-pull: IO config use push-pull mode.
> -
> -Example:
> -
> -	i2c0: i2c@1100d000 {
> -			compatible = "mediatek,mt6577-i2c";
> -			reg = <0x1100d000 0x70>,
> -			      <0x11000300 0x80>;
> -			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
> -			clock-frequency = <400000>;
> -			mediatek,have-pmic;
> -			clock-div = <16>;
> -			clocks = <&i2c0_ck>, <&ap_dma_ck>;
> -			clock-names = "main", "dma";
> -	};
> -
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> new file mode 100644
> index 000000000000..0f445d2ab727
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MediaTek I2C Controller
> +
> +maintainers:
> +  - Qii Wang <qii.wang@mediatek.com>
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^i2c[0-9]*@[0-9a-f]+$"

Drop '[0-9]*'. The base name should be just 'i2c'. 

> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt2712-i2c
> +          - mediatek,mt6577-i2c
> +          - mediatek,mt6589-i2c
> +          - mediatek,mt7622-i2c
> +          - mediatek,mt8173-i2c
> +          - mediatek,mt8183-i2c
> +          - mediatek,mt8192-i2c
> +      - items:
> +          - const: mediatek,mt2701-i2c
> +          - const: mediatek,mt6577-i2c
> +      - items:
> +          - const: mediatek,mt6797-i2c
> +          - const: mediatek,mt6577-i2c
> +      - items:
> +          - const: mediatek,mt7623-i2c
> +          - const: mediatek,mt6577-i2c
> +      - items:
> +          - const: mediatek,mt7629-i2c
> +          - const: mediatek,mt2712-i2c
> +      - items:
> +          - const: mediatek,mt8516-i2c
> +          - const: mediatek,mt2712-i2c

This can be simplified a bit like the other binding.

> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - description: Controller clock
> +      - description: DMA clock
> +      - description: ARB clock for multi-master when a bus has more than
> +          one i2c controllers
> +      - description: PMIC clock. Only when mediatek,have-pmic is set.
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - const: main
> +      - const: dma
> +      - const: arb
> +      - const: pmic
> +
> +  mediatek,have-pmic:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Platform can control I2C from the PMIC
> +
> +  mediatek,use-push-pull:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: IO config use push-pull mode.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - clock-div
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c0: i2c@1100d000 {
> +            compatible = "mediatek,mt6577-i2c";
> +            reg = <0x1100d000 0x70>,
> +                  <0x11000300 0x80>;
> +            interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
> +            clock-frequency = <400000>;
> +            mediatek,have-pmic;
> +            clock-div = <16>;
> +            clocks = <&i2c0_ck>, <&ap_dma_ck>;
> +            clock-names = "main", "dma";
> +    };
> -- 
> 2.31.1
> 
