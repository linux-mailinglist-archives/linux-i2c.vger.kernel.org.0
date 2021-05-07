Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979F63760B5
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 08:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbhEGG4A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 02:56:00 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33892 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232974AbhEGG4A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 02:56:00 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1476sq6p096425;
        Fri, 7 May 2021 01:54:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620370492;
        bh=VAN1Vd/sK3NjIpKhnp9GxcBNEoE+IcjghrLeUIAM22M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NI6H9pIWmfofQTdit3zQxH910Cyw1ZRmneucEaGOiUWpOuMCoO9ns1WCQ6XmHlh5A
         4K5ZVlhwVOGzx3ykPZPvYGMFode1bZhxPYoUNfd3gqhwvtGPxQ+ECGlOCgiQuA20N4
         hLV/xiKx5Wo6jafGUH4IRhlhbKOQyFhVria6B1PA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1476sqP1098397
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 7 May 2021 01:54:52 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 7 May
 2021 01:54:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 7 May 2021 01:54:51 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1476smS2045388;
        Fri, 7 May 2021 01:54:49 -0500
Subject: Re: [PATCH v2] dt-bindings: i2c: Move i2c-omap.txt to YAML format
To:     Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
References: <20210506140026.31254-1-vigneshr@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <f7570cb4-8c21-2fa5-bd26-1388f2a4bd6b@ti.com>
Date:   Fri, 7 May 2021 09:54:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210506140026.31254-1-vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 06/05/2021 17:00, Vignesh Raghavendra wrote:
> Convert i2c-omap.txt to YAML schema for better checks and documentation.
> 
> Following properties were used in DT but were not documented in txt
> bindings and has been included in YAML schema:
> 1. Include ti,am4372-i2c compatible
> 2. Include dmas property used in few OMAP dts files

The DMA is not supported by i2c-omap driver, so wouldn't be better to just drop dmas from DTBs to avoid confusions?
It can be added later.

> 3. Document clocks property
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> v2:
> Fix issues with make dt_bindings_check
> Add description on usage of ti,hwmods
> 
>   .../devicetree/bindings/i2c/i2c-omap.txt      | 37 ---------
>   .../devicetree/bindings/i2c/ti,omap4-i2c.yaml | 80 +++++++++++++++++++
>   2 files changed, 80 insertions(+), 37 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-omap.txt
>   create mode 100644 Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
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
> 

-- 
Best regards,
grygorii
