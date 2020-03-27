Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1926C195F49
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgC0Txx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:53:53 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:38592 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgC0Txx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:53:53 -0400
Received: by mail-il1-f194.google.com with SMTP id n13so2594810ilm.5;
        Fri, 27 Mar 2020 12:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mJE/FmDo61k1Y1kMUmnrw+f/plh9UpOJw+NgcOKyCAM=;
        b=Nl0RkAkg90RZyQqS9cu6gK7/QKNgAm2NkPeMQSz8Ub14RgVMM/0BOAV5clrvGWfZBo
         YN9MWImB+ZRHIDErNSW89tHFa4i752oweOMDCeKBjWcl+h56SjjqWXWoD/wlHCBp3j0J
         mgSye0mcUgDcS6Ez34gGWjeYKmPe3Dw+G7exOGJhUR4MfnGNJB+Tcssq3QkucbgqUX5R
         PU0TdPt8B1azNXnGG8/snlTCYmsnH4/GhOoQEedTcpZhJ3ZbU2gM/Rg1NXr6LRH/4qxN
         Rfv+8SIqRtHMENRd73ktN8fPFDcx+WHRqIny8nkuqjqoLLNJEuXrQRxoxkhU/jqZQkMh
         sNHw==
X-Gm-Message-State: ANhLgQ3pvpl0E6Zbd9/jP2OWfx1Gv7ljaY/w7e9orDqqsiP04wmA0E1F
        9rA4seUD6zH2D5dpSGYOwg==
X-Google-Smtp-Source: ADFU+vv7l6X4QqyDklk801ff+s7+6Bx+Yr+DsrSctVissFQbcxeD7iAKesA6K4k1zLa10W4Ji94BwQ==
X-Received: by 2002:a92:d0c7:: with SMTP id y7mr841907ila.56.1585338831900;
        Fri, 27 Mar 2020 12:53:51 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id w28sm2178668ill.69.2020.03.27.12.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:53:51 -0700 (PDT)
Received: (nullmailer pid 2012 invoked by uid 1000);
        Fri, 27 Mar 2020 19:53:49 -0000
Date:   Fri, 27 Mar 2020 13:53:49 -0600
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
Subject: Re: [PATCH 27/28] dt-bindings: timer: Convert mrvl,mmp-timer to
 json-schema
Message-ID: <20200327195349.GA459@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-28-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-28-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 10:39:21AM +0100, Lubomir Rintel wrote:
> A straightforward conversion of the mrvl,mmp-timer binding to DT schema
> format using json-schema.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../bindings/timer/mrvl,mmp-timer.txt         | 17 --------
>  .../bindings/timer/mrvl,mmp-timer.yaml        | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
> deleted file mode 100644
> index b8f02c6635219..0000000000000
> --- a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -* Marvell MMP Timer controller
> -
> -Required properties:
> -- compatible : Should be "mrvl,mmp-timer".
> -- reg : Address and length of the register set of timer controller.
> -- interrupts : Should be the interrupt number.
> -
> -Optional properties:
> -- clocks : Should contain a single entry describing the clock input.
> -
> -Example:
> -	timer0: timer@d4014000 {
> -		compatible = "mrvl,mmp-timer";
> -		reg = <0xd4014000 0x100>;
> -		interrupts = <13>;
> -		clocks = <&coreclk 2>;
> -	};
> diff --git a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml
> new file mode 100644
> index 0000000000000..ebee0b862d493
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml
> @@ -0,0 +1,43 @@

License?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/mrvl,mmp-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell MMP Timer bindings
> +
> +maintainers:
> +  - devicetree@vger.kernel.org

Real person?

> +
> +properties:
> +  $nodename:
> +    pattern: '^timer@[a-f0-9]+$'
> +
> +  compatible:
> +    const: mrvl,mmp-timer
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
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@d4014000 {
> +        compatible = "mrvl,mmp-timer";
> +        reg = <0xd4014000 0x100>;
> +        interrupts = <13>;
> +        clocks = <&coreclk 2>;
> +    };
> +
> +...
> -- 
> 2.25.1
> 
