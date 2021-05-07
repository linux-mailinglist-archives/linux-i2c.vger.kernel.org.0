Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453C9376B95
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 23:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhEGVUj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 17:20:39 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:33499 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhEGVUi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 17:20:38 -0400
Received: by mail-ot1-f44.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so5100372oto.0;
        Fri, 07 May 2021 14:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YpC5Y9ntxdycovl95eo8Nefxaj8tIQRjfe1QWhL3IJc=;
        b=fRU1JIkTH7bTEaTOpb+wxNqJYHkJXF0RUEAiDHEae53E0CcXEW+vV2aWsB5Mc49O1t
         tIJF2UV5AiUJrU3l+pFq9L72zGErKy2rNQX8Pi8k4pbatFZEVnS1XwWxX82fEZzJMDqQ
         3Lhp2M0omJWaokWKtZkC1WHOF7rPwcrs9ZcncS/A7Fvnwkc8lyXrwikae1oVuOtSiuyR
         IwVDtEUp9LXsONzTZjAURvMfIBQhCfCUFlQdIgt8TVSPUOy8PYesnUoCOXBivXq692++
         S7fCsVKkvL9GxFPsNYCp2kfQ2uFM5h6291FBrlyt6D0xVCoxfcNEDogGWktkvK33aBEJ
         IWwA==
X-Gm-Message-State: AOAM531sL4U7Vms9n7GH/KwCCELdW3JCcB/9hj7Rn3Lzgt6ujubOCuN8
        3rMV1lGFoqP3b0uBQmKD6sckozp50g==
X-Google-Smtp-Source: ABdhPJz2LvKwbUN4rajPoBOXWPa2bMhCzQXXERdDf6QsPEKAdmFldkzsjUS1VU0IEA26gQqUrb61Dg==
X-Received: by 2002:a9d:491:: with SMTP id 17mr10053622otm.184.1620422377966;
        Fri, 07 May 2021 14:19:37 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m67sm1396432otm.69.2021.05.07.14.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 14:19:36 -0700 (PDT)
Received: (nullmailer pid 2905952 invoked by uid 1000);
        Fri, 07 May 2021 21:19:36 -0000
Date:   Fri, 7 May 2021 16:19:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Message-ID: <20210507211936.GA2902038@robh.at.kernel.org>
References: <20210506140026.31254-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506140026.31254-1-vigneshr@ti.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 06, 2021 at 07:30:26PM +0530, Vignesh Raghavendra wrote:
> Convert i2c-omap.txt to YAML schema for better checks and documentation.
> 
> Following properties were used in DT but were not documented in txt
> bindings and has been included in YAML schema:
> 1. Include ti,am4372-i2c compatible
> 2. Include dmas property used in few OMAP dts files
> 3. Document clocks property
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> v2:
> Fix issues with make dt_bindings_check
> Add description on usage of ti,hwmods
> 
>  .../devicetree/bindings/i2c/i2c-omap.txt      | 37 ---------
>  .../devicetree/bindings/i2c/ti,omap4-i2c.yaml | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-omap.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml


> diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
> new file mode 100644
> index 000000000000..eb11e3025b37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/ti,omap4-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for I2C controllers on TI's OMAP and K3 SoCs
> +
> +maintainers:
> +  - Vignesh Raghavendra <vigneshr@ti.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,omap2420-i2c
> +      - const: ti,omap2430-i2c
> +      - const: ti,omap3-i2c
> +      - const: ti,omap4-i2c

These 4 can be a single 'enum'.

> +      - items:
> +          - enum:
> +              - ti,am4372-i2c
> +              - ti,am64-i2c
> +              - ti,am654-i2c
> +              - ti,j721e-i2c
> +          - const: ti,omap4-i2c
> +
> +  ti,hwmods:
> +    description:
> +      (DEPRECATED) Must be "i2c<n>", n being the instance number (1-based).

There's a keyword to mark things deprecated. It's 'deprecated'.

> +      This property is applicable only on legacy platforms mainly omap2/3
> +      and ti81xx and should not be used on other platforms.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    items:
> +      - pattern: "^i2c([1-9])$"
> +
> +  dmas:
> +    minItems: 1
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: fck
> +
> +  clock-frequency: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    main_i2c0: i2c@2000000 {
> +            compatible = "ti,j721e-i2c", "ti,omap4-i2c";
> +            reg = <0x2000000 0x100>;
> +            interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +         };
> -- 
> 2.31.1
> 
