Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB72B1CE868
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 00:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgEKWru (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 18:47:50 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39031 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgEKWru (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 18:47:50 -0400
Received: by mail-ot1-f68.google.com with SMTP id m13so8978083otf.6;
        Mon, 11 May 2020 15:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FBCSWYQOACSW+NmV5Hv5SV07fxhPe1QJYaBtFG5Lk6o=;
        b=BF0ByYOQju8nWhJ9vLKq5udmMqQCKhsoMm7nKGK8u+ITfSAX1b60zlbef9c1u5iyp/
         /HiitDEyYXYBYlvqJhtytysfparDVtvQ3TrQfRL1NWyMgm1KqyWUNNy9B5sYVd5+J2ma
         xTqFtdG101Y2umEuAnOAViTh2PJAsnS6HdkONBdGG86xD2CStPOxQPD30JrmDOTGGua/
         B3FUBRJriClaxoCJxs4Cn5ni7ng6Lt8XwolLBxE3ysUwSqzEZpdXKAr9BdPEavOPdxoQ
         ryIn7JeenQAh5tdfeKwFjObcPPDAsnyTLrJy2oYYf4VCfsLxMASukoNqFp2q7MkXmE0B
         /wDQ==
X-Gm-Message-State: AGi0PuaV3gbjCRPlRItX6aB9KcxqDANacaJNpM0j1Rsi7kENAhReL8Le
        7WnNZWcaOyWBpTcb/tGGww==
X-Google-Smtp-Source: APiQypL4PYdJeBWPhWWPxR3FdrQJgI8lMTdi7bTlT0Jg8FJD1NabXquhyKLcISJV9QlkiKoQlJ6zUQ==
X-Received: by 2002:a05:6830:1d0:: with SMTP id r16mr15655881ota.4.1589237268644;
        Mon, 11 May 2020 15:47:48 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y10sm3170211ooq.2.2020.05.11.15.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 15:47:48 -0700 (PDT)
Received: (nullmailer pid 24853 invoked by uid 1000);
        Mon, 11 May 2020 22:47:47 -0000
Date:   Mon, 11 May 2020 17:47:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: pinctrl: Convert ingenic,pinctrl.txt to
 YAML
Message-ID: <20200511224747.GA19685@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Apr 26, 2020 at 08:58:51PM +0200, Paul Cercueil wrote:
> Convert the ingenic,pinctrl.txt doc file to ingenic,pinctrl.yaml.
> 
> In the process, some compatible strings now require a fallback, as the
> corresponding SoCs are pin-compatible with their fallback variant.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/pinctrl/ingenic,pinctrl.txt      |  81 ----------
>  .../bindings/pinctrl/ingenic,pinctrl.yaml     | 138 ++++++++++++++++++
>  2 files changed, 138 insertions(+), 81 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml


> diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> new file mode 100644
> index 000000000000..adf462cc2737
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs pin controller devicetree bindings
> +
> +description: >
> +  Please refer to pinctrl-bindings.txt in this directory for details of the
> +  common pinctrl bindings used by client devices, including the meaning of the
> +  phrase "pin configuration node".
> +
> +  For the Ingenic SoCs, pin control is tightly bound with GPIO ports. All pins
> +  may be used as GPIOs, multiplexed device functions are configured within the
> +  GPIO port configuration registers and it is typical to refer to pins using the
> +  naming scheme "PxN" where x is a character identifying the GPIO port with
> +  which the pin is associated and N is an integer from 0 to 31 identifying the
> +  pin within that GPIO port. For example PA0 is the first pin in GPIO port A,
> +  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000 and the X1830
> +  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The JZ4760, the
> +  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a total of 192
> +  pins.
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  nodename:
> +    pattern: "^pin-controller@[0-9a-f]+$"

That would have been more consistent, but 'pinctrl@...' is the standard.

> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +        - ingenic,jz4740-pinctrl
> +        - ingenic,jz4725b-pinctrl
> +        - ingenic,jz4760-pinctrl
> +        - ingenic,jz4770-pinctrl
> +        - ingenic,jz4780-pinctrl
> +        - ingenic,x1000-pinctrl
> +        - ingenic,x1500-pinctrl
> +        - ingenic,x1830-pinctrl
> +      - items:
> +        - const: ingenic,jz4760b-pinctrl
> +        - const: ingenic,jz4760-pinctrl
> +      - items:
> +        - const: ingenic,x1000e-pinctrl
> +        - const: ingenic,x1000-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^gpio@[0-9]$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - ingenic,jz4740-gpio
> +          - ingenic,jz4725b-gpio
> +          - ingenic,jz4760-gpio
> +          - ingenic,jz4770-gpio
> +          - ingenic,jz4780-gpio
> +          - ingenic,x1000-gpio
> +          - ingenic,x1500-gpio
> +          - ingenic,x1830-gpio
> +
> +      reg:
> +        items:
> +          - description: The GPIO bank number
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +      interrupt-controller: true
> +
> +      "#interrupt-cells":
> +        const: 2
> +        description:
> +          Refer to ../interrupt-controller/interrupts.txt for more details.
> +
> +      interrupts:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - interrupts
> +      - interrupt-controller
> +      - "#interrupt-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pin-controller@10010000 {
> +      compatible = "ingenic,jz4770-pinctrl";
> +      reg = <0x10010000 0x600>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      gpio@0 {
> +        compatible = "ingenic,jz4770-gpio";
> +        reg = <0>;
> +
> +        gpio-controller;
> +        gpio-ranges = <&pinctrl 0 0 32>;
> +        #gpio-cells = <2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        interrupt-parent = <&intc>;
> +        interrupts = <17>;
> +      };
> +    };

What about pinctrl child nodes?
 
> -- 
> 2.26.2
> 
