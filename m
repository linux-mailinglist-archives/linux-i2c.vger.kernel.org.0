Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58745195F2B
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbgC0TtG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:49:06 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:45183 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbgC0TtF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:49:05 -0400
Received: by mail-io1-f67.google.com with SMTP id a24so10479243iol.12;
        Fri, 27 Mar 2020 12:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JwHJvDoSR0JDEswzj161SwVvwRMkW2YaUVDeHpPAOos=;
        b=GOR5UrOb7Vqqk4GC3Ls7slX6NIzdksUg3KoPv7sfjrzTg7GEB/uN6ZkqyFSQAK/BKS
         wNeC443aq00JBkd7GuQRPuYFcRWr5XFYXN6EeoafRi/Jq2GITpl50laru0CpHWdxEFwk
         m0ocN0/aSAW7i+wMJ9AARiAaxG4X44jaBBYWWmaplWEhbvzu4rgQoh+FVTFNebmwDKmF
         4VCpTncP0ghlWfZNDkmRW72c5q0MyOe+9PXZf7DoJr43QSnSN7dKSTLg88yAkK+rA0Pj
         GKDK7SXYYfeHBNxwmkZ3H5oaHIyTkKXg3BQbPgalab3w5u5Li2RYMjHtyBaTdY0EmGNJ
         TetA==
X-Gm-Message-State: ANhLgQ0rGCqATget081uhjXwMeNuMQAilPO4uBt6CW0CTcni0vVbPFSd
        GYzwb28cpDWuuELIPcNvOg==
X-Google-Smtp-Source: ADFU+vt/jqlhr/e4v02qTN70XwC1Yhc1SXWH++HcB6WjRUDC5ZNHHU0TizL6To4k79LdobvC8EAwnA==
X-Received: by 2002:a5d:8782:: with SMTP id f2mr269819ion.53.1585338544805;
        Fri, 27 Mar 2020 12:49:04 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id 79sm2195767ila.54.2020.03.27.12.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:49:04 -0700 (PDT)
Received: (nullmailer pid 27841 invoked by uid 1000);
        Fri, 27 Mar 2020 19:49:02 -0000
Date:   Fri, 27 Mar 2020 13:49:02 -0600
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
Subject: Re: [PATCH 25/28] dt-bindings: rtc: Convert sa1100-rtc to json-schema
Message-ID: <20200327194902.GA24914@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-26-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-26-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 10:39:19AM +0100, Lubomir Rintel wrote:
> Convert the sa1100-rtc binding to DT schema format using json-schema.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../devicetree/bindings/rtc/sa1100-rtc.txt    | 17 ------
>  .../devicetree/bindings/rtc/sa1100-rtc.yaml   | 55 +++++++++++++++++++
>  2 files changed, 55 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt b/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
> deleted file mode 100644
> index 968ac820254bb..0000000000000
> --- a/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -* Marvell Real Time Clock controller
> -
> -Required properties:
> -- compatible: should be "mrvl,sa1100-rtc"
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- interrupts: Should be two. The first interrupt number is the rtc alarm
> -  interrupt and the second interrupt number is the rtc hz interrupt.
> -- interrupt-names: Assign name of irq resource.
> -
> -Example:
> -	rtc: rtc@d4010000 {
> -		compatible = "mrvl,mmp-rtc";
> -		reg = <0xd4010000 0x1000>;
> -		interrupts = <5>, <6>;
> -		interrupt-names = "rtc 1Hz", "rtc alarm";
> -	};
> diff --git a/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml b/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
> new file mode 100644
> index 0000000000000..53a8b72df9f34
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
> @@ -0,0 +1,55 @@

License

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sa1100-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Real Time Clock controller bindings
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +maintainers:
> +  - devicetree@vger.kernel.org

Real person

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mrvl,sa1100-rtc
> +      - mrvl,mmp-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1

clocks and resets weren't documented before. Fine to add here, but add 
that to the commit msg.

> +
> +  interrupts:
> +    minItems: 2
> +    maxItems: 2

Drop minItems.

> +
> +  interrupt-names:
> +    items:
> +      - const: 'rtc 1Hz'
> +      - const: 'rtc alarm'
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rtc: rtc@d4010000 {
> +        compatible = "mrvl,mmp-rtc";
> +        reg = <0xd4010000 0x1000>;
> +        interrupts = <5>, <6>;
> +        interrupt-names = "rtc 1Hz", "rtc alarm";
> +    };
> +
> +...
> -- 
> 2.25.1
> 
