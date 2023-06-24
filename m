Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A42773C828
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 10:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232404AbjFXIBK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 04:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbjFXIBG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 04:01:06 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2722D40
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:00:48 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51bdca52424so1556656a12.3
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593647; x=1690185647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmzapWDzimsSs6oDauhmY7EwCGGpNbBGYW0zDq7Y0g0=;
        b=f5y83YDj2ZiTfv4GVL6XxhbaBiZOx8b2Dlce2BicSyjaKrg3kDy5bYdkvq4WYHDMz1
         Ux3eFKLU2XtW4NjNZu+3nofzPI6tApMEkrFij9agnP/0hLWMMo+HXTmVe4fIFHF7hTae
         SrSbgYuAOfTU+0JPddM5gmK/zaeXnm72JG7Uipl4neBtSGAQLTKpx5MCjVYgls6+G4NE
         H1Ec0eBTsmzlMz3qMbR91RzwyYZWUEUywL/5K07LC2PXw/FMwvaX6+z0Y8njTfC252LU
         Mec49oeKqIlgUkZU2Gfp86uWtTbkzHTzl1xyRp6Iv4f0UPBejvrofeBtdZUrrjTWxCdp
         0zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593647; x=1690185647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmzapWDzimsSs6oDauhmY7EwCGGpNbBGYW0zDq7Y0g0=;
        b=ec9kO3maHxCJKQCqUsC1HlQj/AvJO8qP+IZjmdRQrLSgEbaraDRsAZKFc5wF5XWxgv
         2txLXJH62REK11ip71TDiE/3L/vWVbpxJPuq0AA+jTz+IZ1xVzeviCUxRqgZWdWIOS0C
         Dk635SsyeG24E3sPwVG6Et3vh39SCsUyikuehSkB8lq7RVJvfifprd6A3F9ZEdoCl65A
         HpisJrVTUAA+xs6F60GdhZmZn3/gJFOk+07BidUQGdjtGBn/rL0kFw9UtoB7ubt4bcAm
         EgK1jV4ufoVwrEMfU/bTvEtiVqEEnVYMuEenFuKIkfS2a9y8T+mlvhAAbxOT4XZExAgJ
         IpqA==
X-Gm-Message-State: AC+VfDyYSiwpi2r4QjGG3tSJDtVOgicUu8i2nQcnSDJzxn+RUKdEXO+o
        LEQKlQRfUMTGX+xwBdVwLQMUDw==
X-Google-Smtp-Source: ACHHUZ7m+A1bOO2g0Q0gWubK6hkpG4u9CftsH8A5UeM6HKS2e7gJgZ9D0w88xvVVqU6mCdiqpCRT2Q==
X-Received: by 2002:aa7:d892:0:b0:51b:fc05:a6aa with SMTP id u18-20020aa7d892000000b0051bfc05a6aamr1674326edq.42.1687593646698;
        Sat, 24 Jun 2023 01:00:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b10-20020a05640202ca00b0051a4ab66d92sm410131edx.11.2023.06.24.01.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:00:46 -0700 (PDT)
Message-ID: <f2ba9ca6-ce6e-b012-d43c-f192a6043a42@linaro.org>
Date:   Sat, 24 Jun 2023 10:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 18/45] dt-bindings: i2c: at91: Add SAM9X7 compatible
 string
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
        tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
        ulf.hansson@linaro.org, tudor.ambarus@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        linus.walleij@linaro.org, p.zabel@pengutronix.de,
        olivia@selenic.com, a.zummo@towertech.it,
        radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
        gregkh@linuxfoundation.org, lgirdwood@gmail.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, sre@kernel.org, jerry.ray@microchip.com,
        horatiu.vultur@microchip.com, durai.manickamkr@microchip.com,
        andrew@lunn.ch, alain.volmat@foss.st.com,
        neil.armstrong@linaro.org, mihai.sain@microchip.com,
        eugen.hristev@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
        balamanikandan.gunasundar@microchip.com,
        manikandan.m@microchip.com, dharma.b@microchip.com,
        nayabbasha.sayed@microchip.com, balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-19-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-19-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add compatible string for sam9x7.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index 6adedd3ec399..440f890e209f 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -24,9 +24,11 @@ properties:
>                - atmel,sama5d4-i2c
>                - atmel,sama5d2-i2c
>                - microchip,sam9x60-i2c
> +              - microchip,sam9x7-i2c

Same as in other cases, so just to avoid applying by submaintainer:
looks not tested and not working.


Best regards,
Krzysztof

