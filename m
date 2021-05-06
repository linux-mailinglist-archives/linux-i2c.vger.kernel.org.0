Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9FF375A7B
	for <lists+linux-i2c@lfdr.de>; Thu,  6 May 2021 20:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234348AbhEFS47 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 14:56:59 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50358 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234197AbhEFS47 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 May 2021 14:56:59 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 146Itnjs073304;
        Thu, 6 May 2021 13:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620327349;
        bh=7Gz18IXKB49QFlXhVvzpSmlfs0uOkF0YDrveyZ+TKQU=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=HaqlB54nxXL+SCfPvJXkcD0rdIGtCPZgCuyLOe26taareEGxR2Nr0Ozu+52zyk1Ks
         dfWwzyXy+5SY2CHGo+Sgjhy7Xzd2uLw6z6bWpl3RQ/OnTdvplJeswaUb8ly2x87eu1
         1QWzNGGSH0oY+a4Dttf97Hr0wLok+2Zn7JbkmCkU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 146ItnfO070760
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 May 2021 13:55:49 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 6 May
 2021 13:55:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 6 May 2021 13:55:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 146ItniE073388;
        Thu, 6 May 2021 13:55:49 -0500
Date:   Thu, 6 May 2021 13:55:49 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Vignesh Raghavendra <vigneshr@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Message-ID: <20210506185549.cape4jef74hiojsp@tigress>
References: <20210506140026.31254-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210506140026.31254-1-vigneshr@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19:30-20210506, Vignesh Raghavendra wrote:
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
please add a link to V1 to be nice to folks like me coming in for a
review at the point on v2 patch ;)


https://lore.kernel.org/linux-arm-kernel/?q=i2c-omap was'nt too helpful
either :(
>  .../devicetree/bindings/i2c/i2c-omap.txt      | 37 ---------
>  .../devicetree/bindings/i2c/ti,omap4-i2c.yaml | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-omap.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-omap.txt b/Documentation/devicetree/bindings/i2c/i2c-omap.txt
> deleted file mode 100644
> index a425b91af48f..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-omap.txt
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -I2C for OMAP platforms
> -
> -Required properties :
> -- compatible : Must be
> -	"ti,omap2420-i2c" for OMAP2420 SoCs
> -	"ti,omap2430-i2c" for OMAP2430 SoCs
> -	"ti,omap3-i2c" for OMAP3 SoCs
> -	"ti,omap4-i2c" for OMAP4+ SoCs
> -	"ti,am654-i2c", "ti,omap4-i2c" for AM654 SoCs
> -	"ti,j721e-i2c", "ti,omap4-i2c" for J721E SoCs
> -	"ti,am64-i2c", "ti,omap4-i2c" for AM64 SoCs
> -- ti,hwmods : Must be "i2c<n>", n being the instance number (1-based)

> -- #address-cells = <1>;
> -- #size-cells = <0>;
> -
> -Recommended properties :
> -- clock-frequency : Desired I2C bus clock frequency in Hz. Otherwise
> -  the default 100 kHz frequency will be used.
> -
> -Optional properties:
> -- Child nodes conforming to i2c bus binding
> -
> -Note: Current implementation will fetch base address, irq and dma
> -from omap hwmod data base during device registration.
> -Future plan is to migrate hwmod data base contents into device tree
> -blob so that, all the required data will be used from device tree dts
> -file.
> -
> -Examples :
> -
> -i2c1: i2c@0 {
> -    compatible = "ti,omap3-i2c";
> -    #address-cells = <1>;
> -    #size-cells = <0>;
> -    ti,hwmods = "i2c1";
> -    clock-frequency = <400000>;
> -};
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
> +      This property is applicable only on legacy platforms mainly omap2/3
> +      and ti81xx and should not be used on other platforms.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    items:
> +      - pattern: "^i2c([1-9])$"

https://lore.kernel.org/linux-devicetree/YJJGsGXBz56Nhe8z@atomide.com/
Can we control it with if?

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

I wonder if we should go with additionalProperties: false instead of
unevaluatedProperties..

For example:
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
If I add a ridiculous property system-controller; -> no problems what so
	ever..
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +         };
> -- 
> 2.31.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
