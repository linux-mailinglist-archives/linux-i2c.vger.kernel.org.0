Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD9A38BC43
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 04:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238295AbhEUCH2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 22:07:28 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:39736 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbhEUCH1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 22:07:27 -0400
Received: by mail-oi1-f177.google.com with SMTP id y76so9026640oia.6;
        Thu, 20 May 2021 19:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0H2GF3uZl9zixyhg0W0KnFuUJPM2Rk1J1IN+ADFK40U=;
        b=UzFUzb5kpMDjqT/Y8QpHp5Hw4lOkQMv25nVKSZBMDV0ys2j3oCdXfxbPGIprEoK0MF
         ks7HVnlR7aFK7lKZ9F4Eveyt1yGKOXFiveM72qFkiKKG2cY/HTcx5jhTXzKodD/GwM+m
         Y74bz/cRAGNd3cUEA4o7CUxbw6FA1jfkwZjKcWEGjR9VmnaaeMKAoyahREfLAc68h+sD
         /Yt1lcdJAgjzvnNBFNH391XCjO0VbvV6rzSlOv26YG5P29V3pCxltv4r9r/Gw1urAsrw
         KLKVtXVkg3mFmIm+JTZpJ+/N/109JpN2v7d9xk2UXewyHOzQ/cWx3CpKrcK2R7TyXU3W
         FaIQ==
X-Gm-Message-State: AOAM530nEDhj1wh2OT4nIs7wnAEzw2np3fRmNRJ2JKZxINEnDKkcg+Gx
        R8yTXVWleW2FOVtOTk3ZMQ==
X-Google-Smtp-Source: ABdhPJz+5f1gkMvE4v4jEv06iH0gUMgzqhdrEaSOKD8ncFB0zOV9GqCmIQY/fouffssoUw73lkgECQ==
X-Received: by 2002:aca:df55:: with SMTP id w82mr346256oig.25.1621562763584;
        Thu, 20 May 2021 19:06:03 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 19sm870524oiy.11.2021.05.20.19.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 19:06:02 -0700 (PDT)
Received: (nullmailer pid 2510861 invoked by uid 1000);
        Fri, 21 May 2021 02:06:01 -0000
Date:   Thu, 20 May 2021 21:06:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        mkorpershoek@baylibre.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: i2c-mt65xx: convert doc to yaml
 schema format
Message-ID: <20210521020601.GA2507824@robh.at.kernel.org>
References: <20210520112106.77190-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520112106.77190-1-fparent@baylibre.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 20, 2021 at 01:21:02PM +0200, Fabien Parent wrote:
> Convert the binding documentation for i2c-mt65xx driver to the
> YAML schema format.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> v2:
> 	* write compatibles in a more compact way
> 	* set the node pattern to be "^i2c@[0-9a-f]+$" instead of
> 		"^i2c[0-9]*@[0-9a-f]+"$
> 
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    | 49 ----------
>  .../devicetree/bindings/i2c/i2c-mt65xx.yaml   | 93 +++++++++++++++++++
>  2 files changed, 93 insertions(+), 49 deletions(-)
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
> index 000000000000..41cedb4930de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -0,0 +1,93 @@
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
> +    pattern: "^i2c@[0-9a-f]+$"
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
> +          - enum:
> +              - mediatek,mt2701-i2c
> +              - mediatek,mt6797-i2c
> +              - mediatek,mt7623-i2c
> +          - const: mediatek,mt6577-i2c
> +      - items:
> +          - enum:
> +              - mediatek,mt7629-i2c
> +              - mediatek,mt8516-i2c
> +          - const: mediatek,mt2712-i2c
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

This isn't documented.

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
