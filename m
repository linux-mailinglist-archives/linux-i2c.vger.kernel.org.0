Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD9D73C796
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 09:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbjFXHxn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 03:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231966AbjFXHxk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 03:53:40 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D902942
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 00:53:35 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-98de21518fbso46528166b.0
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 00:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593213; x=1690185213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0dU3KHDoF8oZzutBDKpvFK9O6jXuVzZS7UeXmnvOCk=;
        b=qL+14ZF0SFDS92k57he/MqJcbZWj42LI8iTDe5f6UYIF6jj69Jgr0nJO9ZKFef0TUo
         97WraEyayeMo+lJuOUrJK7R4eJVDqCzjfRmhLG3P8cyutMpOzOWG/lQIHosPAX4ha2E9
         zMU/72ZWCKk3PZdPbJDC10ZHfV68fkWiuDOPnvDrzAWl4ttHZ/GP3O4Ox1Q1s9xdYpYS
         2KSNZFsLSyFMd/9XzPC8BdcOaV+EvQg7dZxPuDxO7s3T8cuSuKYXpGtE7vaH7AQxM9f4
         bJAsKHAKvYjav2XjXHTrmIboFnd594b8tp61wr6olfTnGaBDiPapYgy5Df8wNpjx/XnY
         9F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593213; x=1690185213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0dU3KHDoF8oZzutBDKpvFK9O6jXuVzZS7UeXmnvOCk=;
        b=PDWlnThptnjbEh5YKpFsqFguXlJzhedGgHzea0eWb3LEccHr1gu3qeqFBgo6mi6x6f
         c01708v91la+5N+HYSQrMyKt/13AOR+TOEhjzKnpk+JdKLkE2iPc1LbW6n7uVN9LpsMM
         AKLJ7oAtcWQYo7cSR6UrEmchHErexYFxA5oHnaoD7V3axAl6ifssnmuLbmJH2S84dehs
         Xm+uaw6L8weGa8khYLdGxkK2cXaKJI9+mGvWqRsd3IlRaLHm4dyxYhpAFKldoN2bX0Ei
         QjarIFhwq1Ti4AHUChPwmnwwsUq6xNt/ewWL82hMHjAAZjv2yGD/kL0u8yCOywVE5NVn
         LdAg==
X-Gm-Message-State: AC+VfDw7thk9d6Pwkda42t/AYKeJEgst+Cr7/9jkRv4YvRrIp93h6AHV
        6tiMGrpc4PYvlPE1TwQKuF/pQg==
X-Google-Smtp-Source: ACHHUZ6rxF9D2gin1FtwSBjnqHQU40ChmXYOoZkfDSe/Nou9AC2VX7R26o19SB77+MsKurZ8l61ESw==
X-Received: by 2002:a17:906:7a19:b0:98d:b73b:b5f2 with SMTP id d25-20020a1709067a1900b0098db73bb5f2mr1706603ejo.71.1687593213726;
        Sat, 24 Jun 2023 00:53:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id g25-20020a1709064e5900b00987e76827b2sm602028ejw.53.2023.06.24.00.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:53:33 -0700 (PDT)
Message-ID: <8574bbcc-2dfd-3fed-ff4c-cab1f6e79f7b@linaro.org>
Date:   Sat, 24 Jun 2023 09:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 02/45] dt-bindings: usb: ehci: Add atmel
 at91sam9g45-ehci compatible
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
 <20230623203056.689705-3-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-3-varshini.rajendran@microchip.com>
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
> Document at91sam9g45-ehci compatible for usb-ehci.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

