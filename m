Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8926A60ADA4
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 16:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235416AbiJXOaf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 10:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234904AbiJXO2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 10:28:51 -0400
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED92D73C2;
        Mon, 24 Oct 2022 06:02:17 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13b23e29e36so10999254fac.8;
        Mon, 24 Oct 2022 06:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+x9joGdXdBFLPPxN1p6d7/jrm+b1E7zu0ZikUl9XbM=;
        b=kN4xIs/QEGJ+oT9qrn2OjPi/N6FcvGH6BvACP76blbVF103TXYi+7qEU5tINWQ+OJz
         dApYzrcvxoO2ZIXOFTxb7h3JgOvX67e53Ux9I2wwMvKPIJrbpeDZZobSiNgXQhwqMaF/
         R3ztR06WTPRqxKei/NzyOWyK9tZuNZ0Cm15uInIPmFb7tUxRSre+3lm52uo1EfezpHK9
         o9VNCRaweqKifLKL/48NiILy3trNo3072uYGiXhEVisoQwGcZ30ghYt4hAv1vlMBiN/X
         ltLvQXpHTYGfKkWtuOvorD19U4Zbzkwzp6qZaLG5THbYH133b9fRVRaPubb8xH2WHVbL
         oPdg==
X-Gm-Message-State: ACrzQf3i7XkzH7UpZj1xKGIMrADeoCGwSUDmJj0hXhqGuTa4oC2Svjr2
        vms3XoPp+qtUCiVrBxssV68CXNLJaw==
X-Google-Smtp-Source: AMsMyM4RB1x55W7tWXLqKMCfn9+yNGKoyP28eeDXqoWuK46CSg7FurAIxSSG6961lNUtLuCZU2W88g==
X-Received: by 2002:a05:6870:e9a8:b0:133:223f:49a1 with SMTP id r40-20020a056870e9a800b00133223f49a1mr38235091oao.114.1666616434841;
        Mon, 24 Oct 2022 06:00:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g20-20020a056870c15400b0012796e8033dsm2716705oad.57.2022.10.24.06.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 06:00:34 -0700 (PDT)
Received: (nullmailer pid 1652638 invoked by uid 1000);
        Mon, 24 Oct 2022 13:00:35 -0000
Date:   Mon, 24 Oct 2022 08:00:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-watchdog@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 00/21] ARM: s3c: clean out obsolete platforms
Message-ID: <20221024130035.GA1645003-robh@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021202254.4142411-1-arnd@kernel.org>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 21, 2022 at 10:22:28PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was marked as deprecated a while ago,
> and for the s3c64xx platform, we marked all except one legacy
> board file as unused.
> 
> This series removes all of those, leaving only s3c64xx support
> for DT based boots as well as the cragg6410 board file.
> 
> About half of the s3c specific drivers were only used on
> the now removed machines, so these drivers can be retired
> as well. I can either merge the driver removal patches through
> the soc tree along with the board file patches, or subsystem
> maintainers can pick them up into their own trees, whichever
> they prefer.

[...]

>  Documentation/arm/index.rst                   |    1 -
>  Documentation/arm/samsung-s3c24xx/cpufreq.rst |   77 -
>  .../arm/samsung-s3c24xx/eb2410itx.rst         |   59 -
>  Documentation/arm/samsung-s3c24xx/gpio.rst    |  172 --
>  Documentation/arm/samsung-s3c24xx/h1940.rst   |   41 -
>  Documentation/arm/samsung-s3c24xx/index.rst   |   20 -
>  Documentation/arm/samsung-s3c24xx/nand.rst    |   30 -
>  .../arm/samsung-s3c24xx/overview.rst          |  311 ---
>  Documentation/arm/samsung-s3c24xx/s3c2412.rst |  121 -
>  Documentation/arm/samsung-s3c24xx/s3c2413.rst |   22 -
>  .../arm/samsung-s3c24xx/smdk2440.rst          |   57 -
>  Documentation/arm/samsung-s3c24xx/suspend.rst |  137 --
>  .../arm/samsung-s3c24xx/usb-host.rst          |   91 -
>  Documentation/arm/samsung/overview.rst        |   13 -

What about?:

Documentation/devicetree/bindings/clock/samsung,s3c2410-clock.txt
Documentation/devicetree/bindings/interrupt-controller/samsung,s3c24xx-irq.txt
Documentation/devicetree/bindings/mmc/samsung,s3cmci.txt
Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
Documentation/devicetree/bindings/usb/s3c2410-usb.txt

Rob
