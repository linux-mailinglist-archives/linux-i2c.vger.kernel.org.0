Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDDE195E3E
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgC0TIO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:08:14 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46433 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgC0TIN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:08:13 -0400
Received: by mail-io1-f66.google.com with SMTP id i3so1795269ioo.13;
        Fri, 27 Mar 2020 12:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G6Mcq1Dk0g3WSPkXd3vm1drdjvGGXVVnp1+lciMwA2s=;
        b=l7yaH3CYcINPH9lqLdUgrZbhhpm0Hl5F63l9vUil+tR/Rb25eGm+oPmQ+aOll9Ia9F
         VSxl+JOShXgad/vNDnmy7ynplVkoN9fmeHsQ8NjC2Wp35FXv4KE4uQnpA66i/DIZsEPl
         4CYn+wMnsDE2v0vYqAjay3V7xfTdYGcPirS6Al/Z8onIUtCNPO5S04vsjphtyW1i+0Tm
         VJu9jZoIbIitRhi8ZwC0JSpv5JfSN21rphHwaJa8aXGw650GOJDFjqLfQVGsQdbcdoJO
         c+qXnJ0pgdi4HxheTpvhdvGq0lR7JzjQy5fmDfh6qeAWYZDDQokY7c73Z4o5/QJkHUl7
         GETA==
X-Gm-Message-State: ANhLgQ2JMhde375pN4EBvG56cX3MblWLBdtc0y8E6lFqJFYPYFQHCyK8
        oXbOHV19xbVOf/h2gJ1OlQ==
X-Google-Smtp-Source: ADFU+vsDV6QtM1XfWx4B4NR7pPv6MF3Unp5WzMOEqMx+UmNiEXyjrdwhZM8UGHFFIg04dOh4Lm12Mg==
X-Received: by 2002:a05:6602:204f:: with SMTP id z15mr76719iod.207.1585336090948;
        Fri, 27 Mar 2020 12:08:10 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id p76sm1693709iod.13.2020.03.27.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:08:10 -0700 (PDT)
Received: (nullmailer pid 4379 invoked by uid 1000);
        Fri, 27 Mar 2020 19:08:07 -0000
Date:   Fri, 27 Mar 2020 13:08:07 -0600
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
Subject: Re: [PATCH 17/28] dt-bindings: mmc: Fix up clk-phase-sd-hs in an
 example
Message-ID: <20200327190807.GA1996@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-18-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-18-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 17, 2020 at 10:39:11AM +0100, Lubomir Rintel wrote:
> This way the validator can know that the two cells constitute a singlej
> pair of clock phase degrees value, not separate items Otherwise it is
> unhappy:
> 
>   mmc-controller.example.dt.yaml: mmc@ab000000: clk-phase-sd-hs:0:
>       [63] is too short
>   mmc-controller.example.dt.yaml: mmc@ab000000: clk-phase-sd-hs:1:
>       [72] is too short

I'm going to fix this in the tools to allow either form. 

> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index 8fded83c519ad..c9384ed685b8f 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -363,7 +363,7 @@ examples:
>          keep-power-in-suspend;
>          wakeup-source;
>          mmc-pwrseq = <&sdhci0_pwrseq>;
> -        clk-phase-sd-hs = <63>, <72>;
> +        clk-phase-sd-hs = <63 72>;
>      };
>  
>    - |
> -- 
> 2.25.1
> 
