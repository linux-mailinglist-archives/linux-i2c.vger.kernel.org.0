Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F16E4195E1C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgC0TEq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:04:46 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:38117 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgC0TEp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:04:45 -0400
Received: by mail-il1-f195.google.com with SMTP id n13so2458592ilm.5;
        Fri, 27 Mar 2020 12:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G03Tsqs7LWIXDOSCQ2j2Z4jsLZ/EPzP3AOvf4GENeZQ=;
        b=nwBsV8cTEFTlavowv7v7z7/4xlivsSdB3Mx0od27jDerRahTWG+mrwDrpWPojqR61s
         jBL+q76kaphkOgj1BOP6OLewp914LMh0yvDIX/aUI+ggoj5VJhGTrHQDFBG9Wxfe5Pv/
         T6ijGZyjFSKG9ChDFzEPXbSWJJpnN+gCYJno1/sxQbTCZ3EcwHTML+Zt/eFdeQHZn+es
         XzhCuQg8V+ZVw1hmrZqlTOSMrQivck8YoTpANfYMUsWkpyggt6NI+6Nf/y+gc3OPwvML
         i9rULtocBQC3mYW4OG9thnsrerAgJzUzTX55Ap4Sdn1nWZjMsSFhgb+vFPL+pjiOZqsH
         YAqA==
X-Gm-Message-State: ANhLgQ1YOMqFacO1ZXu6hNblzz8T+cvUfAw+ux/dfIduhDEePEQopIFT
        g/raHvB6OucWoOYZQvVLGA==
X-Google-Smtp-Source: ADFU+vuoAdCJ2A69Z/lHGzgAqzQy9crxH5i1AhkPavYeIB5RtVd7w2eWtIArzGYMdZSVad2vWQy2og==
X-Received: by 2002:a92:7e0d:: with SMTP id z13mr609334ilc.202.1585335884247;
        Fri, 27 Mar 2020 12:04:44 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id e137sm1668596iof.18.2020.03.27.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:04:43 -0700 (PDT)
Received: (nullmailer pid 31311 invoked by uid 1000);
        Fri, 27 Mar 2020 19:04:41 -0000
Date:   Fri, 27 Mar 2020 13:04:41 -0600
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
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 14/28] dt-bindings: arm: l2x0: Tauros 3 is PL310
 compatible
Message-ID: <20200327190441.GA31060@bogus>
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

On Tue, 17 Mar 2020 10:39:08 +0100, Lubomir Rintel wrote:
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

Applied, thanks.

Rob
