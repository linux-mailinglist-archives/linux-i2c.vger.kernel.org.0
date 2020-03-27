Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED86B195E12
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbgC0TDK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:03:10 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42399 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgC0TDJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:03:09 -0400
Received: by mail-io1-f65.google.com with SMTP id q128so10926611iof.9;
        Fri, 27 Mar 2020 12:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3ITt8Qtkvl5bWhH2ykH+DLle23U//GmXww0cEqt/CIY=;
        b=CvCynFAZS4dMybHvxtHUziRZ36RAQk8WsTg4Ahx/3PxcK3bFi5w2lnQkx3VUN9YrFD
         NWQenPDqZBOM5mkJYDucIeRM5V2OaOI3DHXIbEw3EqmyDYcnze9hV3grG+HNG8ihdTJ4
         vLBA1VfDFT9jswcrsvdXzHC6XOzRDzDyarqB8BI8h0gq5ebWwO2TjGFWXMl0NBtan+Az
         SDlQh0JUDAZIZHhJRfyd11UmluOC8HfS9ivtQxZobhH9gdrx6yu9gUMLkgAcw1ZR76U/
         lcOEkM3MBqKiGMPLT5Ehl6ipFxWMrGSn/tFYMobRjGKSme0gTj/l2uZfsjAwOLvYgIyO
         DiGg==
X-Gm-Message-State: ANhLgQ0xuctvJK0voy9vg05a09pNYesrfPKo9u4fU6zWuT7J7AFZcraO
        MX1q7B09Rd91iEY/IFQpsg==
X-Google-Smtp-Source: ADFU+vsunpeTEtU3sJ3oVNdeonBxmAUzgtdZqJZ/EoRBD2F6QkitYdNkClMiUGGxNjFjEiNEshg0VQ==
X-Received: by 2002:a6b:c8d4:: with SMTP id y203mr72705iof.111.1585335787129;
        Fri, 27 Mar 2020 12:03:07 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id i6sm2148350ila.20.2020.03.27.12.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:03:06 -0700 (PDT)
Received: (nullmailer pid 28795 invoked by uid 1000);
        Fri, 27 Mar 2020 19:03:04 -0000
Date:   Fri, 27 Mar 2020 13:03:04 -0600
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
Subject: Re: [PATCH 14/28] dt-bindings: arm: l2x0: Tauros 3 is PL310
 compatible
Message-ID: <20200327190304.GA27639@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-15-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-15-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 10:39:08AM +0100, Lubomir Rintel wrote:
> The validation is unhappy about mmp3-dell-ariel declaring its
> marvell,tauros3-cache node to be compatible with arm,pl310-cache:
> 
>   mmp3-dell-ariel.dt.yaml: cache-controller@d0020000: compatible:
>        Additional items are not allowed ('arm,pl310-cache' was unexpected)
>   mmp3-dell-ariel.dt.yaml: cache-controller@d0020000: compatible:
>        ['marvell,tauros3-cache', 'arm,pl310-cache'] is too long
> 
> Let's allow this -- Tauros 3 is designed to be compatible with PL310.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../devicetree/bindings/arm/l2c2x0.yaml       | 45 ++++++++++---------
>  1 file changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.yaml b/Documentation/devicetree/bindings/arm/l2c2x0.yaml
> index 913a8cd8b2c00..7e39088a9bed2 100644
> --- a/Documentation/devicetree/bindings/arm/l2c2x0.yaml
> +++ b/Documentation/devicetree/bindings/arm/l2c2x0.yaml
> @@ -29,27 +29,30 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - arm,pl310-cache
> -      - arm,l220-cache
> -      - arm,l210-cache
> -        # DEPRECATED by "brcm,bcm11351-a2-pl310-cache"
> -      - bcm,bcm11351-a2-pl310-cache
> -        # For Broadcom bcm11351 chipset where an
> -        # offset needs to be added to the address before passing down to the L2
> -        # cache controller
> -      - brcm,bcm11351-a2-pl310-cache
> -        # Marvell Controller designed to be
> -        # compatible with the ARM one, with system cache mode (meaning
> -        # maintenance operations on L1 are broadcasted to the L2 and L2
> -        # performs the same operation).
> -      - marvell,aurora-system-cache
> -        # Marvell Controller designed to be
> -        # compatible with the ARM one with outer cache mode.
> -      - marvell,aurora-outer-cache
> -        # Marvell Tauros3 cache controller, compatible
> -        # with arm,pl310-cache controller.
> -      - marvell,tauros3-cache
> +    oneOf:
> +      - enum:
> +        - arm,pl310-cache

The list should be indented 2 more spaces. I'll fixup when applying.

> +        - arm,l220-cache
> +        - arm,l210-cache
> +          # DEPRECATED by "brcm,bcm11351-a2-pl310-cache"
> +        - bcm,bcm11351-a2-pl310-cache
> +          # For Broadcom bcm11351 chipset where an
> +          # offset needs to be added to the address before passing down to the L2
> +          # cache controller
> +        - brcm,bcm11351-a2-pl310-cache
> +          # Marvell Controller designed to be
> +          # compatible with the ARM one, with system cache mode (meaning
> +          # maintenance operations on L1 are broadcasted to the L2 and L2
> +          # performs the same operation).
> +        - marvell,aurora-system-cache
> +          # Marvell Controller designed to be
> +          # compatible with the ARM one with outer cache mode.
> +        - marvell,aurora-outer-cache
> +      - items:
> +         # Marvell Tauros3 cache controller, compatible
> +         # with arm,pl310-cache controller.
> +        - const: marvell,tauros3-cache
> +        - const: arm,pl310-cache
>  
>    cache-level:
>      const: 2
> -- 
> 2.25.1
> 
