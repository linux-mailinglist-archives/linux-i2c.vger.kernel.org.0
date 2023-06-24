Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D2F73C84C
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 10:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbjFXICt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 04:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbjFXICU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 04:02:20 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABD62975
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:02:12 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b46cfde592so23152691fa.0
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593731; x=1690185731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=48cLWxnO4hI8zObsw227oEYYKk0Y5PALRubNPuDO6vc=;
        b=LX7W+yoLVPlIwV1XGxBXwL2aJbtTMbGUVQFZjuzrXh0wV6QHjP/6CddCD/E2flMRhT
         vztsT0AxCVeYXrgCMazYCdwatn1oodAQYgEbYryOhgT9SawgGTiTsh+csgQdP6kNUyxe
         7+u8BPExqHZ7ZFyAJTcps4WTaIR9QoQUvOV8w9bGMoxE+6/N2/+adQYLXS0sGTiNN0KJ
         gcAcX+MzinSjOAga9K0bDpv84dH0l28yQim8n3ipOwgzwqkd/hgTSXelx4MOAJGDwm1c
         nahyrk+ER/vkBjbl1S6GBta/vg4KMt2zZaWLKqwbibfr91+e82MBHrvqwzlM62GfwzTs
         ebBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593731; x=1690185731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48cLWxnO4hI8zObsw227oEYYKk0Y5PALRubNPuDO6vc=;
        b=AgnEkjsqCRyANTIi3fVin67sM0aCNwKU2kDkVPLIugTYDRK4Ysq+ThqwNUpeU1tphR
         7qhaBqmT3AYjqIWkpSVDMl5YR9O/kHCpKZgpKa8GjDdfZqNGdHZX7X/H+QQqD1MwHsKx
         T0jC+IBjdtblezZvRM4W4pJJnf3SCt223k3LSx6sCM4F0cqGPsiCs23T5TdRoanv4Vkd
         baXclF+qzXHnQCTURUnVP3oA0EgLeUgk6LeIeEd3oaizU/RQra1saeE5xWga6u9zJDDl
         Qcv4+GBRLqDDXNpOyN+45n55lZwvn5i4tSrhqAyNFewtDGB/GoiYuRatoaO6CmfwTK4d
         DHjw==
X-Gm-Message-State: AC+VfDwQzRkiIv2wfasFz1beTI0BPjZvndqwysqyux/Mn5dEHqVWxIZH
        su6+y/EkMWpYcHrDkaqFnjXroQ==
X-Google-Smtp-Source: ACHHUZ62t6tmUqM8Yzti6qrq+RSBqmnbfIcQEwHs80C3q6C7j1x32A4aVswUaxA77ONO0Q35Bn2RsQ==
X-Received: by 2002:a2e:a0d8:0:b0:2b5:7f93:b3ad with SMTP id f24-20020a2ea0d8000000b002b57f93b3admr8673190ljm.16.1687593730934;
        Sat, 24 Jun 2023 01:02:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id dv9-20020a170906b80900b00982a077599fsm590940ejb.110.2023.06.24.01.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:02:10 -0700 (PDT)
Message-ID: <91773b0f-b337-c5d2-68e9-4d240920f659@linaro.org>
Date:   Sat, 24 Jun 2023 10:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 29/45] dt-bindings: rtt: at91rm9260: add sam9x7
 compatible
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
 <20230623203056.689705-30-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-30-varshini.rajendran@microchip.com>
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
> Add compatible for SAM9X7 RTT.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> index b80b85c394ac..2d5cce1c1331 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> @@ -20,6 +20,7 @@ properties:
>            - const: atmel,at91sam9260-rtt
>        - items:
>            - const: microchip,sam9x60-rtt
> +          - const: microchip,sam9x7-rtt
>            - const: atmel,at91sam9260-rtt

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.

Best regards,
Krzysztof

