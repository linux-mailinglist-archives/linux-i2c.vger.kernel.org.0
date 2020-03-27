Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4467C195F4C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgC0TzY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:55:24 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:42049 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgC0TzY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:55:24 -0400
Received: by mail-il1-f193.google.com with SMTP id f16so9920519ilj.9;
        Fri, 27 Mar 2020 12:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=csHMLQRL98LenQ/lQbpc93jnwU8kRqtxGH56mtF9FXU=;
        b=WvKu/ivGejE4Hwf4vzr15vb+mRRxfsHTz1l00dqUZpX3xWclAVX8gZsXG2TCMfWqwJ
         s3pgZZ7d23GQRo9gfvSdHXxq3+fX80E9y8eZBWjtiP0YT+5fXEAB7IqD4vTIMPHjrYob
         B7eOLpcsVxd3Xx1JLwAFLg60BTAcfSRDF1H5ViDWtQYOfSiqk47ibp7/WZZtN2PuOb7t
         bpqzqZWe29Z2rCzf9nTSi2Jtfd2Q52NbX4zMFHcZkWuCHMbM5EFeb7oSXc0nPNCkmY59
         lqs/XETfHPgwnHvEwPl5Wjo281URi/7CLAE3uFLAE++rRnKIXo0NShcoyBmD4t5npuTr
         15ug==
X-Gm-Message-State: ANhLgQ0X9uHhwnIDG8j/WobhSk1HnaZykm4qrJ+9B/vVw5CFU1r1LGF1
        oQAnaa0WgSSpSbR6v5oitw==
X-Google-Smtp-Source: ADFU+vvK/OlPRlrv0zdhRACJE4TlaiS+cpaAN0toP14RA+18Djh+2NRPMAxrfVKb7LtTlW0/j9dRrw==
X-Received: by 2002:a92:39c9:: with SMTP id h70mr826045ilf.74.1585338922613;
        Fri, 27 Mar 2020 12:55:22 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l6sm2204381ilh.27.2020.03.27.12.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:55:21 -0700 (PDT)
Received: (nullmailer pid 4525 invoked by uid 1000);
        Fri, 27 Mar 2020 19:55:20 -0000
Date:   Fri, 27 Mar 2020 13:55:20 -0600
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
Subject: Re: [PATCH 28/28] dt-bindings: usb: Convert ehci-mv to json-schema
Message-ID: <20200327195520.GA2235@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-29-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-29-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 10:39:22AM +0100, Lubomir Rintel wrote:
> A straightforward conversion of the ehci-mv binding to DT schema format
> using json-schema.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../devicetree/bindings/usb/ehci-mv.txt       | 23 -------
>  .../bindings/usb/marvell,pxau2o-ehci.yaml     | 60 +++++++++++++++++++
>  2 files changed, 60 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/ehci-mv.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/ehci-mv.txt b/Documentation/devicetree/bindings/usb/ehci-mv.txt
> deleted file mode 100644
> index 335589895763e..0000000000000
> --- a/Documentation/devicetree/bindings/usb/ehci-mv.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -* Marvell PXA/MMP EHCI controller.
> -
> -Required properties:
> -
> -- compatible: must be "marvell,pxau2o-ehci"
> -- reg: physical base addresses of the controller and length of memory mapped region
> -- interrupts: one EHCI controller interrupt should be described here
> -- clocks: phandle list of usb clocks
> -- clock-names: should be "USBCLK"
> -- phys: phandle for the PHY device
> -- phy-names: should be "usb"
> -
> -Example:
> -
> -	ehci0: usb-ehci@d4208000 {
> -		compatible = "marvell,pxau2o-ehci";
> -		reg = <0xd4208000 0x200>;
> -		interrupts = <44>;
> -		clocks = <&soc_clocks MMP2_CLK_USB>;
> -		clock-names = "USBCLK";
> -		phys = <&usb_otg_phy>;
> -		phy-names = "usb";
> -	};
> diff --git a/Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml b/Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml
> new file mode 100644
> index 0000000000000..189025ef1e92e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)

Same license comment.

> +# Copyright 2019,2020 Lubomir Rintel <lkundrak@v3.sk>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/marvell,pxau2o-ehci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell PXA/MMP EHCI bindings
> +
> +maintainers:
> +  - Lubomir Rintel <lkundrak@v3.sk>
> +
> +allOf:
> +  - $ref: usb-hcd.yaml#
> +
> +properties:
> +  compatible:
> +    const: marvell,pxau2o-ehci
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
> +    const: USBCLK
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: usb
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/marvell,mmp2.h>
> +    usb@d4208000 {
> +        compatible = "marvell,pxau2o-ehci";
> +        reg = <0xd4208000 0x200>;
> +        interrupts = <44>;
> +        clocks = <&soc_clocks MMP2_CLK_USB>;
> +        clock-names = "USBCLK";
> +        phys = <&usb_otg_phy>;
> +        phy-names = "usb";
> +    };
> +
> +...
> -- 
> 2.25.1
> 
