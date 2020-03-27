Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA824195EA2
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgC0T23 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:28:29 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44675 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgC0T23 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:28:29 -0400
Received: by mail-io1-f68.google.com with SMTP id v3so10941236iot.11;
        Fri, 27 Mar 2020 12:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wSuTgZKTO0qQOqXByUSPaUzWdLN8577ii/3i8TYD/j4=;
        b=jPYR9vVO4YMsP5fstaCfQDfCt2nr2hfTiEXjXqI+lJlLGWfeFE2WEA8WnCYqFXPdTP
         CMZyy5fK8/sy4aagLTaumNySbBgWkElzN9pXyTjzYrIR73IoQTCr3Qa5c3d9TbI2EGHm
         7mjnaTQmmBWO2hzOp4dFrmjlX2ZXTy91OwSlt1CBHi/U6Rnj1E+wFwpUhJsgTxaLFBI8
         r4RB9dkNOQk6Rhx05QTMJC0Aed06K3m/1ANF02NXJVY9Ohdlj2E1OPjLrn2RtitahMLx
         HMqP0DLrqjjy/8N88iKxhRZc7B2tq3xXbIduBA42CgKBNAP7YNXdp4cnqQtNQ8hETeYY
         9YPQ==
X-Gm-Message-State: ANhLgQ3zzimEB0nSq8IB/MUMoLbd68zjWZrKRjJKoDICZCdBv/Ryt52G
        WImD77BOqRo+fSHTudiOUA==
X-Google-Smtp-Source: ADFU+vth6s3C4OMa7P2NrAFx24kevxMVVS6l73efVN15xapS4Cr/+y7vVrxHjDFNT97ioEaZowh09g==
X-Received: by 2002:a02:cd2d:: with SMTP id h13mr455298jaq.46.1585337306126;
        Fri, 27 Mar 2020 12:28:26 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c12sm2129545ile.12.2020.03.27.12.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:28:25 -0700 (PDT)
Received: (nullmailer pid 31924 invoked by uid 1000);
        Fri, 27 Mar 2020 19:28:20 -0000
Date:   Fri, 27 Mar 2020 13:28:20 -0600
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
Subject: Re: [PATCH 21/28] dt-bindings: gpio: Convert mrvl-gpio to json-schema
Message-ID: <20200327192820.GA8577@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-22-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-22-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 10:39:15AM +0100, Lubomir Rintel wrote:
> This converts the mrvl-gpio binding to DT schema format using json-schema.
> 
> Various fixes were done during the conversion, such as adding more
> properties that are in fact mandatory or extending the examples to
> include child nodes with extra GPIO blocks.

Ugg, not how I would have done this. Differences in register layout 
should be implied by the compatible strings. But I guess we have to live 
with it now.

> The compatible strings are a mess. It is not clear why so many of them
> are needed; the driver doesn't really seem to differentiate between the
> models. Some of them, like marvell,pxa93x-gpio and marvell,pxa1928-gpio
> are not used at all, so it's not known how many interrupts they utilize.
> On the other hand, mrvl,pxa-gpio has been seen in the tree, but it
> doesn't end up in any actual DTB file.

I added pxa1928 and then work on it ended. I think it is safe to remove, 
but I dug up dts file and it is 1 irq.

> In any case -- the schema merely copies whatever was in the original
> binding document, so it's hopefully no more wrong that the original.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../devicetree/bindings/gpio/mrvl-gpio.txt    |  48 -----
>  .../devicetree/bindings/gpio/mrvl-gpio.yaml   | 173 ++++++++++++++++++
>  2 files changed, 173 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt b/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
> deleted file mode 100644
> index 30fd2201b3d4c..0000000000000
> --- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -* Marvell PXA GPIO controller
> -
> -Required properties:
> -- compatible : Should be "intel,pxa25x-gpio", "intel,pxa26x-gpio",
> -		"intel,pxa27x-gpio", "intel,pxa3xx-gpio",
> -		"marvell,pxa93x-gpio", "marvell,mmp-gpio",
> -		"marvell,mmp2-gpio" or marvell,pxa1928-gpio.
> -- reg : Address and length of the register set for the device
> -- interrupts : Should be the port interrupt shared by all gpio pins.
> -  There're three gpio interrupts in arch-pxa, and they're gpio0,
> -  gpio1 and gpio_mux. There're only one gpio interrupt in arch-mmp,
> -  gpio_mux.
> -- interrupt-names : Should be the names of irq resources. Each interrupt
> -  uses its own interrupt name, so there should be as many interrupt names
> -  as referenced interrupts.
> -- interrupt-controller : Identifies the node as an interrupt controller.
> -- #interrupt-cells: Specifies the number of cells needed to encode an
> -  interrupt source.
> -- gpio-controller : Marks the device node as a gpio controller.
> -- #gpio-cells : Should be two.  The first cell is the pin number and
> -  the second cell is used to specify flags. See gpio.txt for possible
> -  values.
> -
> -Example for a MMP platform:
> -
> -	gpio: gpio@d4019000 {
> -		compatible = "marvell,mmp-gpio";
> -		reg = <0xd4019000 0x1000>;
> -		interrupts = <49>;
> -		interrupt-names = "gpio_mux";
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -      };
> -
> -Example for a PXA3xx platform:
> -
> -	gpio: gpio@40e00000 {
> -		compatible = "intel,pxa3xx-gpio";
> -		reg = <0x40e00000 0x10000>;
> -		interrupt-names = "gpio0", "gpio1", "gpio_mux";
> -		interrupts = <8 9 10>;
> -		gpio-controller;
> -		#gpio-cells = <0x2>;
> -		interrupt-controller;
> -		#interrupt-cells = <0x2>;
> -	};
> diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
> new file mode 100644
> index 0000000000000..5c713bf59b06d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
> @@ -0,0 +1,173 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/mrvl-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell PXA GPIO controller
> +
> +maintainers:
> +  - devicetree@vger.kernel.org

Needs to be a real person that cares about this h/w.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - intel,pxa25x-gpio
> +              - intel,pxa26x-gpio
> +              - intel,pxa27x-gpio
> +              - intel,pxa3xx-gpio
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 3
> +          maxItems: 3
> +        interrupt-names:
> +          items:
> +            - const: gpio0
> +            - const: gpio1
> +            - const: gpio_mux
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - marvell,mmp-gpio
> +              - marvell,mmp2-gpio

I'd make this an else clause.

> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        interrupt-names:
> +          items:
> +            - const: gpio_mux
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpio@[0-9a-f]+$'
> +
> +  compatible:
> +    enum:
> +      - intel,pxa25x-gpio
> +      - intel,pxa26x-gpio
> +      - intel,pxa27x-gpio
> +      - intel,pxa3xx-gpio
> +      - marvell,mmp-gpio
> +      - marvell,mmp2-gpio
> +      - marvell,pxa93x-gpio
> +      - marvell,pxa1928-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  ranges: true
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1

My pxa1928 dts has this in the child nodes. Sure this is right?

> +
> +  interrupts: true
> +
> +  interrupt-names: true
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +patternProperties:
> +  '^gpio@[0-9a-f]*$':
> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - interrupts
> +  - interrupt-names
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/pxa-clock.h>
> +    gpio@40e00000 {
> +        compatible = "intel,pxa3xx-gpio";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        reg = <0x40e00000 0x10000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupts = <8>, <9>, <10>;
> +        interrupt-names = "gpio0", "gpio1", "gpio_mux";
> +        clocks = <&clks CLK_GPIO>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        ranges;

No child, so there should be no ranges here.

> +    };
> +  - |
> +    #include <dt-bindings/clock/marvell,pxa910.h>
> +    gpio@d4019000 {
> +        compatible = "marvell,mmp-gpio";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        reg = <0xd4019000 0x1000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupts = <49>;
> +        interrupt-names = "gpio_mux";
> +        clocks = <&soc_clocks PXA910_CLK_GPIO>;
> +        resets = <&soc_clocks PXA910_CLK_GPIO>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        ranges;
> +
> +        gpio@d4019000 {
> +            reg = <0xd4019000 0x4>;
> +        };
> +
> +        gpio@d4019004 {
> +            reg = <0xd4019004 0x4>;
> +        };
> +
> +        gpio@d4019008 {
> +            reg = <0xd4019008 0x4>;
> +        };
> +
> +        gpio@d4019100 {
> +            reg = <0xd4019100 0x4>;
> +        };
> +     };
> +
> +...
> -- 
> 2.25.1
> 
