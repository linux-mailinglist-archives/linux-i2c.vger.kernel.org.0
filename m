Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCCC1CE89C
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 00:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgEKW6o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 18:58:44 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46758 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgEKW6o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 18:58:44 -0400
Received: by mail-ot1-f68.google.com with SMTP id z25so8975832otq.13;
        Mon, 11 May 2020 15:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rrzNRH0uSWvioiFA8ipqkq3GpJZMvPktQNs+srV9scY=;
        b=laLutiYswO7oo8WRjjTGO9a6M0cs8FRkoumH8OX7Gy125N87nIFzTO9dUpQm+7bsfC
         ACTfFzwTN6P6MUBJIc/7j1Ct3BzjLYVyuvkQxZfqvo39cFFab5okBCTkNmzCjHRBM9d2
         NA7xZnUIFu3eiSUSLMXv0eqfmDbedsKqC8zxEAGLe+Zmz+b3aOcVGpVzLAFdxeNYyDSV
         BBU1Ks+6/J4KvhWatqI9+0VOnQrodpmM16Dge6KTCOWo82yfVfJZOh7NA2EeHfl8EbIJ
         SNmhMLiA5Vuz75mgeinX8HNSxkXlpoJ8E/XSdd/HQwAht6QWXY11EPb8I6yq1XS5DPRa
         9xKA==
X-Gm-Message-State: AGi0PuY9mw84o5/bvTTc6mv8SjCte3wnKZgq7emq58Vr0gXJHW62PfO/
        0KGICKXjqrnIzVcJvUpONQ==
X-Google-Smtp-Source: APiQypKwzM2WDv3O2Z/UvW7ZohbJlHJk1r0PETLR0iG+Nn823uYMaUaGQmmQom1Rrlysc2iBt31mHQ==
X-Received: by 2002:a05:6830:1449:: with SMTP id w9mr10582312otp.230.1589237921107;
        Mon, 11 May 2020 15:58:41 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t26sm2971740otl.71.2020.05.11.15.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 15:58:40 -0700 (PDT)
Received: (nullmailer pid 8142 invoked by uid 1000);
        Mon, 11 May 2020 22:58:39 -0000
Date:   Mon, 11 May 2020 17:58:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: mtd: Convert ingenic,jz4780-nand.txt to
 YAML
Message-ID: <20200511225839.GA3153@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-5-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Apr 26, 2020 at 08:58:53PM +0200, Paul Cercueil wrote:
> Convert the ingenic,jz4780-nand.txt doc file to ingenic,nand.yaml.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/mtd/ingenic,jz4780-nand.txt      |  92 ------------
>  .../devicetree/bindings/mtd/ingenic,nand.yaml | 133 ++++++++++++++++++
>  2 files changed, 133 insertions(+), 92 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> deleted file mode 100644
> index c02259353327..000000000000
> --- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -* Ingenic JZ4780 NAND/ECC
> -
> -This file documents the device tree bindings for NAND flash devices on the
> -JZ4780. NAND devices are connected to the NEMC controller (described in
> -memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
> -be children of the NEMC node.
> -
> -Required NAND controller device properties:
> -- compatible: Should be one of:
> -  * ingenic,jz4740-nand
> -  * ingenic,jz4725b-nand
> -  * ingenic,jz4780-nand
> -- reg: For each bank with a NAND chip attached, should specify a bank number,
> -  an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
> -
> -Optional NAND controller device properties:
> -- ecc-engine: To make use of the hardware ECC controller, this
> -  property must contain a phandle for the ECC controller node. The required
> -  properties for this node are described below. If this is not specified,
> -  software ECC will be used instead.
> -
> -Optional children nodes:
> -- Individual NAND chips are children of the NAND controller node.
> -
> -Required children node properties:
> -- reg: An integer ranging from 1 to 6 representing the CS line to use.
> -
> -Optional children node properties:
> -- nand-ecc-step-size: ECC block size in bytes.
> -- nand-ecc-strength: ECC strength (max number of correctable bits).
> -- nand-ecc-mode: String, operation mode of the NAND ecc mode. "hw" by default
> -- nand-on-flash-bbt: boolean to enable on flash bbt option, if not present false
> -- rb-gpios: GPIO specifier for the busy pin.
> -- wp-gpios: GPIO specifier for the write protect pin.
> -
> -Optional child node of NAND chip nodes:
> -- partitions: see Documentation/devicetree/bindings/mtd/partition.txt
> -
> -Example:
> -
> -nemc: nemc@13410000 {
> -	...
> -
> -	nandc: nand-controller@1 {
> -		compatible = "ingenic,jz4780-nand";
> -		reg = <1 0 0x1000000>;	/* Bank 1 */
> -
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		ecc-engine = <&bch>;
> -
> -		nand@1 {
> -			reg = <1>;
> -
> -			nand-ecc-step-size = <1024>;
> -			nand-ecc-strength = <24>;
> -			nand-ecc-mode = "hw";
> -			nand-on-flash-bbt;
> -
> -			rb-gpios = <&gpa 20 GPIO_ACTIVE_LOW>;
> -			wp-gpios = <&gpf 22 GPIO_ACTIVE_LOW>;
> -
> -			partitions {
> -				#address-cells = <2>;
> -				#size-cells = <2>;
> -				...
> -			}
> -		};
> -	};
> -};
> -
> -The ECC controller is a separate SoC component used for error correction on
> -NAND devices. The following is a description of the device properties for a
> -ECC controller.
> -
> -Required ECC properties:
> -- compatible: Should be one of:
> -  * ingenic,jz4740-ecc
> -  * ingenic,jz4725b-bch
> -  * ingenic,jz4780-bch
> -- reg: Should specify the ECC controller registers location and length.
> -- clocks: Clock for the ECC controller.
> -
> -Example:
> -
> -bch: bch@134d0000 {
> -	compatible = "ingenic,jz4780-bch";
> -	reg = <0x134d0000 0x10000>;
> -
> -	clocks = <&cgu JZ4780_CLK_BCH>;
> -};
> diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
> new file mode 100644
> index 000000000000..0e4cb1b55385
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/ingenic,nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs NAND controller devicetree bindings
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +allOf:
> +  - $ref: ../memory-controllers/ingenic,nemc-client.yaml#

You don't need this here because the schema is already applied with the 
parent's schema.

> +  - $ref: nand-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ingenic,jz4740-nand
> +      - ingenic,jz4725b-nand
> +      - ingenic,jz4780-nand
> +
> +  reg:
> +    items:
> +      - description: Bank number, offset and size of first attached NAND chip
> +      - description: Bank number, offset and size of second attached NAND chip
> +      - description: Bank number, offset and size of third attached NAND chip
> +      - description: Bank number, offset and size of fourth attached NAND chip
> +    minItems: 1
> +
> +  ecc-engine: true
> +
> +patternProperties:
> +  "^nand@[a-f0-9]$":
> +    type: object
> +    properties:
> +      rb-gpios:
> +        description: GPIO specifier for the busy pin.
> +        maxItems: 1
> +
> +      wp-gpios:
> +        description: GPIO specifier for the write-protect pin.
> +        maxItems: 1
> +
> +  "^partitions$":

This is at the wrong level. It should be under 'nand@...' node.

It is also not a pattern.

> +    type: object
> +    description:
> +      Node containing description of fixed partitions.
> +      See Documentation/devicetree/bindings/mtd/partition.txt
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +    nemc: memory-controller@13410000 {
> +      compatible = "ingenic,jz4780-nemc";
> +      reg = <0x13410000 0x10000>;
> +      #address-cells = <2>;
> +      #size-cells = <1>;
> +      ranges = <1 0 0x1b000000 0x1000000>,
> +         <2 0 0x1a000000 0x1000000>,
> +         <3 0 0x19000000 0x1000000>,
> +         <4 0 0x18000000 0x1000000>,
> +         <5 0 0x17000000 0x1000000>,
> +         <6 0 0x16000000 0x1000000>;
> +
> +      clocks = <&cgu JZ4780_CLK_NEMC>;
> +
> +      nand-controller@1 {
> +        compatible = "ingenic,jz4780-nand";
> +        reg = <1 0 0x1000000>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ecc-engine = <&bch>;
> +
> +        ingenic,nemc-tAS = <10>;
> +        ingenic,nemc-tAH = <5>;
> +        ingenic,nemc-tBP = <10>;
> +        ingenic,nemc-tAW = <15>;
> +        ingenic,nemc-tSTRV = <100>;
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pins_nemc>;
> +
> +        nand@1 {
> +          reg = <1>;
> +
> +          nand-ecc-step-size = <1024>;
> +          nand-ecc-strength = <24>;
> +          nand-ecc-mode = "hw";
> +          nand-on-flash-bbt;
> +
> +          pinctrl-names = "default";
> +          pinctrl-0 = <&pins_nemc_cs1>;
> +
> +          partitions {
> +            compatible = "fixed-partitions";
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +
> +            partition@0 {
> +              label = "u-boot-spl";
> +              reg = <0x0 0x0 0x0 0x800000>;
> +            };
> +
> +            partition@800000 {
> +              label = "u-boot";
> +              reg = <0x0 0x800000 0x0 0x200000>;
> +            };
> +
> +            partition@a00000 {
> +              label = "u-boot-env";
> +              reg = <0x0 0xa00000 0x0 0x200000>;
> +            };
> +
> +            partition@c00000 {
> +              label = "boot";
> +              reg = <0x0 0xc00000 0x0 0x4000000>;
> +            };
> +
> +            partition@4c00000 {
> +              label = "system";
> +              reg = <0x0 0x4c00000 0x1 0xfb400000>;
> +            };
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.26.2
> 
