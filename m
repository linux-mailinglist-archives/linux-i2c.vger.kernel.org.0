Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D67BA73C8F3
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 10:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjFXIXk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 04:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbjFXIXb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 04:23:31 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBF32130
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:23:29 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51be61663c8so1371026a12.2
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595008; x=1690187008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGCuLOrcQg1CRlpQSfVcmvKebFGyaZsdxYX9CXcfLZM=;
        b=xFKigBdV83Jd1qUsH05hPiIU1P7h6ll6on3yqFhMjrYPwiCXFC0e303zASaD1ZqqKd
         Ndiy0iOYjUF8YhQxuAkR8Nx1s9PjpApJ0TyNtB1b5gwgsCvZs0iajX45ENiiPCQcPY96
         g4S9zr1214rNmDdio/oKh2DCVClan9uYvQlB4qQl0yjuKnXTLTRyO6dOXqyvfX0Ge8of
         8DruxxWJt1OJ2iHb05QqWeR0WDztLvfZd6ajx/RAVn5knbq8nIzSWIixJylIR/D0BwLR
         irpLdb/TPiW3i6BbsRoMZNvBM8AZ4+ztRJOKNPudJyzZ1WNXldj3Z+N3OczkwWUKt0K3
         5mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595008; x=1690187008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGCuLOrcQg1CRlpQSfVcmvKebFGyaZsdxYX9CXcfLZM=;
        b=bv0YSQylgsR//6tbxIqC+9ZhVIxnTJfyi1NN7GWdeq3qUaQ1A36F37H3mDkV8/PMbB
         Tq0eAWKJs7mGnvOxv5J6sjOvcUwivjpyGjKlym2MEpO3CuqpIbXYVM1QtgZa1vEd74Sx
         z0A0qktknJ3wXRr/NCRA2IQPS2FYvflljs6yFdNIZMhstL736uGAKszav0z5nXZr4J50
         4IxXEBjgs0npY4Dgzsvmq12LG8HIoOuJ9cIVyAIEJxYtO1vbw9ThUXIQ0s4h8lIa/Rr7
         aki/ed3BlMO/yuIh27rrLyFgt4/qsHMzsFzHXfqmjUz3FPJUYeciD/4X2QU36V64l2xH
         yK5A==
X-Gm-Message-State: AC+VfDwcg9ZnBjFZG4RBMwXW29huky9E2RnWYOWbHc47g54UrZmXZjGY
        W7pKs1rI91bHhwgA0AFwDin6Ew==
X-Google-Smtp-Source: ACHHUZ5rxUhuZrDxVobS5SDmzvY5J2k9KNpHXKQzE6cA0gPVXDKAPA/JRUBn5KncILCak4yP/Iurig==
X-Received: by 2002:aa7:d281:0:b0:51b:e89e:a848 with SMTP id w1-20020aa7d281000000b0051be89ea848mr4981862edq.17.1687595007953;
        Sat, 24 Jun 2023 01:23:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g19-20020a056402115300b0051873c201a0sm436026edw.26.2023.06.24.01.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:23:27 -0700 (PDT)
Message-ID: <2b6ee66b-b2d1-23c3-9b26-d44fce7fd6bd@linaro.org>
Date:   Sat, 24 Jun 2023 10:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 35/45] dt-bindings: irqchip/atmel-aic5: Add support for
 sam9x7 aic
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
 <20230623203056.689705-36-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-36-varshini.rajendran@microchip.com>
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
> Document the support added for the Advanced interrupt controller(AIC)
> chip in the sam9x7 SoC family.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/interrupt-controller/atmel,aic.txt      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt b/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
> index 7079d44bf3ba..2c267a66a3ea 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
> @@ -4,7 +4,7 @@ Required properties:
>  - compatible: Should be:
>      - "atmel,<chip>-aic" where  <chip> can be "at91rm9200", "sama5d2",
>        "sama5d3" or "sama5d4"
> -    - "microchip,<chip>-aic" where <chip> can be "sam9x60"
> +    - "microchip,<chip>-aic" where <chip> can be "sam9x60", "sam9x7"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

