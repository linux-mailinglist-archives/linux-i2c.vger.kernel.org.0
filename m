Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 528BE73C7E2
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 09:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbjFXH7F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 03:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbjFXH7D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 03:59:03 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588FB2709
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 00:59:01 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-987c932883bso180339466b.0
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 00:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593540; x=1690185540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2RPXidMTrzBctnlI68UKYA3FxvKEi+gyM/+eAniSxHU=;
        b=biIFt0+5HLIeQJNObq9fw50IfGs4F5DFXzw8WQaXnv6Hdp3USYZJNL8PssYy6o2vEe
         uTNazxcXxlW9nYoOgc1ECAXqLXI0Fy6OTpXxKHrO5KBGlvJvfFS0T1Yy1tTOfdnYqT7s
         cMkaa3hPEAmXD6ANC4ih3z1UVMiivHFKHKNCNhNRtq9hQ7bMkaNVdI+n4Hlx2BE7yzQO
         jx50D2lQ67d60SVIUDBnCbxdMAAwJOdFf8iKs6wYFG3VWtA2pwPKLl5H6eldXBBdXINm
         rY7xzFgOPvVvf6qqwYEsEXTKFvEIRltIXoBmYft7pQBxV4w1cue28E4Voq0fdjydEvEn
         MpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593540; x=1690185540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RPXidMTrzBctnlI68UKYA3FxvKEi+gyM/+eAniSxHU=;
        b=Cz9cMcgGdS47iMijiG+Ua6F6G10qUIPbFvTFQU5cbBRicSC8IH8cUbM7hm4EGJfZjN
         YtQFRF5koCR58xFlqJN8b2qBDD3UkhSmWNAJPbhokCppcG1ZdoLBUDKPyhGFka6f303o
         H45p86vzR7/Rb2aEbApC1Hls0iu8/G39kuav6+swoHmM82WqMqU7jP/8p6O9tRaHmXmB
         x0VKMSU5z8pNoET3WR6ZjcKY+Etav3ZgTpFtM0Cp5JgmTy0rP59HmuucPcZ0I2MOVVOt
         ZiUFsfkm5++qmaqYHjFGXjb/pay2M+n3ckwJ+Rxacy0Wh7QlGTsRgBBRi40hRQFTHQBm
         jP1g==
X-Gm-Message-State: AC+VfDy47C3Ffu18Qao8Zy3Nrr/OEgRG9KTx54/0a9yOf0RRTVYBOa8f
        MsRWmcCJ485DB51HIZg03y+3yg==
X-Google-Smtp-Source: ACHHUZ6KTEX3PoU0t4AzSkFJrRvYcc7s1C5vvyEb440YGE+szTSoYCbadoq/cw/0a/YYcc9DpVEdLg==
X-Received: by 2002:a17:907:a06:b0:974:1e0e:9bd4 with SMTP id bb6-20020a1709070a0600b009741e0e9bd4mr20928031ejc.16.1687593539714;
        Sat, 24 Jun 2023 00:58:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l24-20020a1709060e1800b009783791b1a1sm592525eji.121.2023.06.24.00.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:58:59 -0700 (PDT)
Message-ID: <28a5d2e7-d3bf-d373-10ad-73c7590924c4@linaro.org>
Date:   Sat, 24 Jun 2023 09:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 14/45] dt-bindings: crypto: add bindings for sam9x7 in
 Atmel AES
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
 <20230623203056.689705-15-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-15-varshini.rajendran@microchip.com>
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
> Add DT bindings for atmel AES.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> index 0b7383b3106b..f0736696c883 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> +++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> @@ -12,7 +12,10 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: atmel,at91sam9g46-aes
> +    oneOf:

This is not oneOf.

> +      - items:

And these are not items. You just broke existing users, which points to
the fact that you did not test the bindings nor the DTS. You didn't test
anything here.

This comment applies for entire patchset - please test everything. I
expect v3, after testing.


Best regards,
Krzysztof

