Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F116375C7A
	for <lists+linux-i2c@lfdr.de>; Thu,  6 May 2021 22:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhEFU5L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 May 2021 16:57:11 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:33763 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhEFU5L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 May 2021 16:57:11 -0400
Received: by mail-oi1-f175.google.com with SMTP id b25so1512380oic.0;
        Thu, 06 May 2021 13:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vRR1Gt4cCuefI3usKufYoSarvz7AndsbNTBtWGojyZI=;
        b=kZHflU6w9J8AfNvYaYTQjym/ILzSIY2vZKJRqLNOladiQ6rHK/lYUI190bXVoJ1406
         GEV1tX7c50dxEIQ/7VceEYi1ctAkaWtUINELzMA0PINVlLLY6/FBlQ8Tnx+WZfgacUkm
         YNkfwePbouwLdndS80/TJlZ0D+rxW5XLj8nfxsvtOfJcsfDBgs33sybVHdnO/TJbT1Zz
         rJlfsCHIzlqmLeHL8w3ecnHqczceHVegrRXKr0wnb9qo/C3qs1XD5Ok+R21gvlm6HPbR
         9HLRgfgICu+bibwR6LgxQEWs4ulX1EA0kpBNr/Zm71iFhID5ZETNJxHa1ROZ0klXhp3a
         fmoA==
X-Gm-Message-State: AOAM531mWNktnAtjhvQqUFG1WG5/xMy0vhBnOyKvl4JeTyjz2DGXwGf7
        aHp4Oo0U7XA484n1s/7adw==
X-Google-Smtp-Source: ABdhPJy4Svus1nWvT7WtNv0ddm9sUoWtZKj7gxUbRB/259EOAOfOy3A6kVuD5CS+7E/19rBPQ+dd9A==
X-Received: by 2002:a05:6808:ab9:: with SMTP id r25mr12534110oij.114.1620334572580;
        Thu, 06 May 2021 13:56:12 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p65sm617269oia.46.2021.05.06.13.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:56:12 -0700 (PDT)
Received: (nullmailer pid 787440 invoked by uid 1000);
        Thu, 06 May 2021 20:56:11 -0000
Date:   Thu, 6 May 2021 15:56:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: i2c: renesas,riic: Convert to
 json-schema
Message-ID: <20210506205611.GA785508@robh.at.kernel.org>
References: <cover.1620138454.git.geert+renesas@glider.be>
 <e1bb5790675b6f4a518c6a9cbc22eb7452a2f78c.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1bb5790675b6f4a518c6a9cbc22eb7452a2f78c.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 04, 2021 at 04:51:12PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas RZ/A I2C Bus Interface (RIIC) Device Tree binding
> documentation to json-schema.
> 
> Document missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/i2c/renesas,riic.txt  | 32 -------
>  .../devicetree/bindings/i2c/renesas,riic.yaml | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 84 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,riic.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.txt b/Documentation/devicetree/bindings/i2c/renesas,riic.txt
> deleted file mode 100644
> index e26fe3ad86a9509f..0000000000000000
> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.txt
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Device tree configuration for Renesas RIIC driver
> -
> -Required properties:
> -- compatible      :
> -	"renesas,riic-r7s72100" if the device is a part of a R7S72100 SoC.
> -	"renesas,riic-r7s9210" if the device is a part of a R7S9210 SoC.
> -	"renesas,riic-rz" for a generic RZ/A compatible device.
> -- reg             : address start and address range size of device
> -- interrupts      : 8 interrupts (TEI, RI, TI, SPI, STI, NAKI, ALI, TMOI)
> -- clock-frequency : frequency of bus clock in Hz
> -- #address-cells  : should be <1>
> -- #size-cells     : should be <0>
> -
> -Pinctrl properties might be needed, too. See there.
> -
> -Example:
> -
> -	i2c0: i2c@fcfee000 {
> -		compatible = "renesas,riic-r7s72100", "renesas,riic-rz";
> -		reg = <0xfcfee000 0x44>;
> -		interrupts = <0 157 IRQ_TYPE_LEVEL_HIGH>,
> -			     <0 158 IRQ_TYPE_EDGE_RISING>,
> -			     <0 159 IRQ_TYPE_EDGE_RISING>,
> -			     <0 160 IRQ_TYPE_LEVEL_HIGH>,
> -			     <0 161 IRQ_TYPE_LEVEL_HIGH>,
> -			     <0 162 IRQ_TYPE_LEVEL_HIGH>,
> -			     <0 163 IRQ_TYPE_LEVEL_HIGH>,
> -			     <0 164 IRQ_TYPE_LEVEL_HIGH>;
> -		clock-frequency = <100000>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> new file mode 100644
> index 0000000000000000..e6951bf451d95cff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/A I2C Bus Interface (RIIC)
> +
> +maintainers:
> +  - Chris Brandt <chris.brandt@renesas.com>
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Don't need oneOf here with only 1 entry. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +          - enum:
> +              - renesas,riic-r7s72100 # RZ/A1H
> +              - renesas,riic-r7s9210  # RZ/A2M
> +          - const: renesas,riic-rz    # RZ/A
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Transmit End Interrupt (TEI)
> +      - description: Receive Data Full Interrupt (RI)
> +      - description: Transmit Data Empty Interrupt (TI)
> +      - description: Stop Condition Detection Interrupt (SPI)
> +      - description: Start Condition Detection Interrupt (STI)
> +      - description: NACK Reception Interrupt (NAKI)
> +      - description: Arbitration-Lost Interrupt (ALI)
> +      - description: Timeout Interrupt (TMOI)
> +
> +  clock-frequency:
> +    description:
> +      Desired I2C bus clock frequency in Hz. The absence of this property
> +      indicates the default frequency 100 kHz.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-frequency
> +  - power-domains
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r7s72100-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i2c0: i2c@fcfee000 {
> +            compatible = "renesas,riic-r7s72100", "renesas,riic-rz";
> +            reg = <0xfcfee000 0x44>;
> +            interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&mstp9_clks R7S72100_CLK_I2C0>;
> +            clock-frequency = <100000>;
> +            power-domains = <&cpg_clocks>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c8834d7a1aac0efd..ea519a8ffc6a9356 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15469,7 +15469,7 @@ F:	drivers/thermal/rcar_thermal.c
>  RENESAS RIIC DRIVER
>  M:	Chris Brandt <chris.brandt@renesas.com>
>  S:	Supported
> -F:	Documentation/devicetree/bindings/i2c/renesas,riic.txt
> +F:	Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>  F:	drivers/i2c/busses/i2c-riic.c
>  
>  RENESAS USB PHY DRIVER
> -- 
> 2.25.1
> 
