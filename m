Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91E7173C883
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 10:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232946AbjFXIDw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 04:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232885AbjFXIDE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 04:03:04 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4802733
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:02:56 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51d894b9b6cso14917a12.3
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593775; x=1690185775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Iag/fpvBDJ2RXwvleWT0ikdFf9vbvKuSWx8X7Un5jE=;
        b=bL65eKa13a0Hm/MQeDCju8xFmloMMrsquSTzxhwgWCUXUcWun2nHn0vSc6x7bTfuI8
         T3cr6eRZjgEb4z7lgrSWZ8+sV5BU/fmg9oE5SWx1qgy7BXrGcVNwNMAx8oyZ5G/1mX6y
         biBFZSvfqAOar3HTF8F8YOyBuHrvQtKXCOcwx2eEHbNMsBQWw2SV5EftCW2E8UTvuSgh
         PhApvRgechvpb2xu8BDjP/67MnHUUJnByOEfixy+DqNfzf+xFAmpqQuElR9rsyyZ5Yi9
         //dtU/MCN75LteZeqX6d6Oaw3ZJXBYj0Au3b8dTa2vfcFOPx/eq1YiC5UTVn3SyRtskC
         lAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593775; x=1690185775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Iag/fpvBDJ2RXwvleWT0ikdFf9vbvKuSWx8X7Un5jE=;
        b=VAsSC2+yrIM50W5fIWvU0eEFXGSsBvkpo6ILxSmG1VIjfdWoChgiOjYyf1gtV28LXs
         /lP+u5sT+TsYPecbbLGEycqGT70NAbCMGz53wcL0JEsnrmLKGMlxTuSQ4YVmSE0S1mWo
         z2OhPM5fS/LM3uIv3dpufnkTFT+Tqjnucfmm4+zxx/Fr1MfZ4njHeeYDtbI6amUHO2B6
         dBiiY5+92rBt9E/zvxD87mr76XLNGQLvbMowGoT7ILSZqEr4Xg6dRLQQZp/MPpKDfnOl
         1r8ZqgkhDLwvzSJ6KRydXKgCeBSroU3g+OkLwpQ8vWMLxkxBXG/E+isFj7hMfxMEemV5
         jgOw==
X-Gm-Message-State: AC+VfDxcf3urGmTh/2DoTz+5d1H25aL9RTeH/rbZO4zptvhBwztFsAxJ
        0dOIUhVWnHFh/DuCT/3G7kIY1g==
X-Google-Smtp-Source: ACHHUZ7CKo9kdIl+tQ6Se/8eLHNmDYA9AGuCXJ789LFfXORFWgCt90zprUQSuv47ZiAbLMJtW4DImw==
X-Received: by 2002:a05:6402:4c9:b0:51a:327d:f065 with SMTP id n9-20020a05640204c900b0051a327df065mr16466115edw.13.1687593775059;
        Sat, 24 Jun 2023 01:02:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o8-20020a056402038800b005183673f2fcsm402109edv.69.2023.06.24.01.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:02:54 -0700 (PDT)
Message-ID: <0492a8a3-6272-9ef8-07b2-d7d05b2f62e4@linaro.org>
Date:   Sat, 24 Jun 2023 10:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 32/45] spi: dt-bindings: atmel,at91rm9200-spi: add
 sam9x7 compatible
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
 <20230623203056.689705-33-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-33-varshini.rajendran@microchip.com>
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
> Add sam9x7 compatible to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> index 6c57dd6c3a36..bdc42eeacba4 100644
> --- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> @@ -19,6 +19,7 @@ properties:
>        - const: atmel,at91rm9200-spi
>        - items:
>            - const: microchip,sam9x60-spi
> +          - const: microchip,sam9x7-spi
>            - const: atmel,at91rm9200-spi
>  

Same as in other cases, so just to avoid applying by maintainer: not
tested, broken.

Best regards,
Krzysztof

