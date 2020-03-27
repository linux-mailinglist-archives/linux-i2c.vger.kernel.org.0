Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C38B195F02
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbgC0TmN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:42:13 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40109 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgC0TmN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:42:13 -0400
Received: by mail-io1-f67.google.com with SMTP id k9so11119621iov.7;
        Fri, 27 Mar 2020 12:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J+eKavC3dH+LtgsGnwVUNkTf62isAx3N9otX3WYGzn4=;
        b=ax5KZRuNW5MKZp6yQyXbHLRyba5tDXwNFtn7Nj2CqMe8cQPTjTP1Gnt+m5FtCY47L3
         dKG1vWbniGd5t4SqIqomOxgtk7bMJFl3E2vvTcg/LGWE8FJj+DAIYRF3h41A10Tz/dVj
         AdbBxx8Aqm0lUu0pcMW+1QBBpkFZxvxqxi0UL78n5SMfqEkKVoyPCRYF7rZRWgn6cQN4
         UMSIZfBjBuz64qrkcv6+W9StSIEq0BzChVRnzMRb71mnLXfmfEoPcweZjsLy1jIPckds
         DMY6fHn40g1b3lxiA+2ksRwOAmDECN6cxwMcPP/AmEpgXFoMO4oMYw4VVKHQvMsIikhW
         FdBQ==
X-Gm-Message-State: ANhLgQ24hjJ7w9B9D9Q7kt9wZEBSLJqSUTsqmN0kiu8+65iRMxJ5MrjV
        hdWpxUVc0bApV2t4OPIUEQ==
X-Google-Smtp-Source: ADFU+vtaqOYVm5jQ3T0KyCku4PrT1GKhidjGRLWhBZJrfWRSxAQS0x+Hv05bo4XZ/NfRSq5tCFg/UQ==
X-Received: by 2002:a5e:9b01:: with SMTP id j1mr250339iok.27.1585338131399;
        Fri, 27 Mar 2020 12:42:11 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id g12sm1734481iom.5.2020.03.27.12.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:42:10 -0700 (PDT)
Received: (nullmailer pid 18591 invoked by uid 1000);
        Fri, 27 Mar 2020 19:42:07 -0000
Date:   Fri, 27 Mar 2020 13:42:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 23/28] dt-bindings: interrupt-controller: Convert
 mrvl,intc to json-schema
Message-ID: <20200327194207.GA1996@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-24-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-24-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 10:39:17AM +0100, Lubomir Rintel wrote:
> Convert the mrvl,intc binding to DT schema format using json-schema.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../interrupt-controller/mrvl,intc.txt        |  64 --------
>  .../interrupt-controller/mrvl,intc.yaml       | 144 ++++++++++++++++++
>  2 files changed, 144 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
> deleted file mode 100644
> index a0ed02725a9d7..0000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -* Marvell MMP Interrupt controller
> -
> -Required properties:
> -- compatible : Should be
> -               "mrvl,mmp-intc" on Marvel MMP,
> -               "mrvl,mmp2-intc" along with "mrvl,mmp2-mux-intc" on MMP2 or
> -               "marvell,mmp3-intc" with "mrvl,mmp2-mux-intc" on MMP3
> -- reg : Address and length of the register set of the interrupt controller.
> -  If the interrupt controller is intc, address and length means the range
> -  of the whole interrupt controller. The "marvell,mmp3-intc" controller
> -  also has a secondary range for the second CPU core.  If the interrupt
> -  controller is mux-intc, address and length means one register. Since
> -  address of mux-intc is in the range of intc. mux-intc is secondary
> -  interrupt controller.
> -- reg-names : Name of the register set of the interrupt controller. It's
> -  only required in mux-intc interrupt controller.
> -- interrupts : Should be the port interrupt shared by mux interrupts. It's
> -  only required in mux-intc interrupt controller.
> -- interrupt-controller : Identifies the node as an interrupt controller.
> -- #interrupt-cells : Specifies the number of cells needed to encode an
> -  interrupt source.
> -- mrvl,intc-nr-irqs : Specifies the number of interrupts in the interrupt
> -  controller.
> -- mrvl,clr-mfp-irq : Specifies the interrupt that needs to clear MFP edge
> -  detection first.
> -
> -Example:
> -	intc: interrupt-controller@d4282000 {
> -		compatible = "mrvl,mmp2-intc";
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -		reg = <0xd4282000 0x1000>;
> -		mrvl,intc-nr-irqs = <64>;
> -	};
> -
> -	intcmux4@d4282150 {
> -		compatible = "mrvl,mmp2-mux-intc";
> -		interrupts = <4>;
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -		reg = <0x150 0x4>, <0x168 0x4>;
> -		reg-names = "mux status", "mux mask";
> -		mrvl,intc-nr-irqs = <2>;
> -	};
> -
> -* Marvell Orion Interrupt controller
> -
> -Required properties
> -- compatible :  Should be "marvell,orion-intc".
> -- #interrupt-cells: Specifies the number of cells needed to encode an
> -  interrupt source. Supported value is <1>.
> -- interrupt-controller : Declare this node to be an interrupt controller.
> -- reg : Interrupt mask address. A list of 4 byte ranges, one per controller.
> -        One entry in the list represents 32 interrupts.
> -
> -Example:
> -
> -	intc: interrupt-controller {
> -        	compatible = "marvell,orion-intc", "marvell,intc";
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -                reg = <0xfed20204 0x04>,
> -		      <0xfed20214 0x04>;
> -        };
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
> new file mode 100644
> index 0000000000000..f0644f7d7e1d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
> @@ -0,0 +1,144 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/mrvl,intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell MMP/Orion Interrupt controller bindings
> +
> +maintainers:
> +  - devicetree@vger.kernel.org
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

Drop this. It is already applied based on matching on the node name.

> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              const: marvell,orion-intc
> +    then:
> +      required:
> +        - mrvl,intc-nr-irqs
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mrvl,mmp-intc
> +              - mrvl,mmp2-intc
> +    then:
> +      properties:
> +        reg:
> +          minItems: 1
> +          maxItems: 1

Drop minItems, as just 'maxItems: 1' is enough.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - marvell,mmp3-intc
> +              - mrvl,mmp2-mux-intc
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2

Just 'minItems: 2'.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: marvell,orion-intc
> +    then:
> +      properties:
> +        reg:
> +          minItems: 1
> +          maxItems: 2

Normally, for a compatible this would not vary...

In any case, move this to the main section and drop this if.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mrvl,mmp2-mux-intc
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          maxItems: 1

Just 'maxItems'

> +        reg-names:
> +          minItems: 2
> +          maxItems: 2

These are redundant as 'items' size implies this.

> +          items:
> +            - const: 'mux status'
> +            - const: 'mux mask'

Move this to the main section.

> +      required:
> +        - interrupts
> +    else:
> +      properties:
> +        interrupts: false
> +
> +properties:
> +  '#interrupt-cells':
> +    const: 1
> +
> +  compatible:
> +    enum:
> +      - mrvl,mmp-intc
> +      - mrvl,mmp2-intc
> +      - marvell,mmp3-intc
> +      - marvell,orion-intc
> +      - mrvl,mmp2-mux-intc
> +
> +  reg: true
> +
> +  reg-names: true
> +
> +  interrupts: true
> +
> +  interrupt-controller: true
> +
> +  mrvl,intc-nr-irqs:
> +    description: |
> +      Specifies the number of interrupts in the interrupt controller.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Is there a max number?

> +
> +  mrvl,clr-mfp-irq:
> +    description: |
> +      Specifies the interrupt that needs to clear MFP edge detection first.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Constraints?

> +
> +required:
> +  - '#interrupt-cells'
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@d4282000 {
> +        compatible = "mrvl,mmp2-intc";
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        reg = <0xd4282000 0x1000>;
> +        mrvl,intc-nr-irqs = <64>;
> +    };
> +
> +    interrupt-controller@d4282150 {
> +        compatible = "mrvl,mmp2-mux-intc";
> +        interrupts = <4>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        reg = <0x150 0x4>, <0x168 0x4>;
> +        reg-names = "mux status", "mux mask";
> +        mrvl,intc-nr-irqs = <2>;
> +    };
> +  - |
> +    interrupt-controller@fed20204 {
> +        compatible = "marvell,orion-intc";
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        reg = <0xfed20204 0x04>,
> +              <0xfed20214 0x04>;
> +    };
> +
> +...
> -- 
> 2.25.1
> 
