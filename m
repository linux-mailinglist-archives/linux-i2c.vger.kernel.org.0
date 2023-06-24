Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC8B373C958
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 10:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbjFXI1V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 04:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232976AbjFXI0Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 04:26:24 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF0C3A93
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:24:49 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-98377c5d53eso161069566b.0
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 01:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595058; x=1690187058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPneVN2rCFPZCWtN2Y3Y7VAYQxdyjaJ8jbh3KeTpdLs=;
        b=ma3NfE6b0iuczvDz33OkA/uVJrxAQ0MAFGHk9u7v1nR8D47ZBhw+gjIKtoDzcuY8wB
         5Pvy2qhRvcmPuwpH6Rnrell8MA5C7ERsiEZcNrkTdp2enRRGz9YPH87CceUiDv5qwK75
         d896yHgKdfHQUS9Eg9eIhEqyw4B9mE251eGpuz04MVFGWKdUuNcFeBoHnIh0QuUcthnS
         eJBnB3dNkPlBOU9M585Rs+CiS0CIFL/3ZSHm5w9+0Ssxpjw/anOhPvtredgrXIbeUSj1
         r9EbwEOwv+nT8pNTwsJJO4EB/ZoVNvunu6EeU/OOohiECV7HuhxnULraB/RzV8f3YdkX
         65nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595058; x=1690187058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPneVN2rCFPZCWtN2Y3Y7VAYQxdyjaJ8jbh3KeTpdLs=;
        b=YHStLORzlkDW1Xw3VR2wP5O7xJQVW/WirT8xEtO7di7m+ELW5RuMgXRQA4j02UCmXj
         QWapSs8QFrsMgOowrFJs5ID1mSPpLsa7mMoY5l28/L6GL1Fs5qaeEXI+wxSAdXJQa8QA
         JTfnH39SYlO7dg9DeHRm0ZxMFeTR3oEgb3XiAHGjKXyKziYxhyYMvNr+uOJjeJqAR0VE
         J8kSkF16WsOzVAqOez2K7gOfGpgDsmQwX9ciYgndnJW4adwsUP+o2ZcgnwbpxBgcaqQC
         mU4ZekcZ8MqwNWrgnXEORmc0VMSSljFy+a6EWx3XnhEJui28V1EQTZ/SIAxSvcf/XJ3b
         MJgg==
X-Gm-Message-State: AC+VfDyvoM95MYF6dLruv0+c0TFEAdKJjuDY5X1ehDlcGBIbzDuMF9tE
        DP50lqg4R3CHL93SZca7Uw2kwQ==
X-Google-Smtp-Source: ACHHUZ6AtPijKbF7bGoaGRTgUD1LMM3LYmmo8YnqmXKrV8jF1gHofaeMAnYGyMfoMbRKzIjPK+/0tw==
X-Received: by 2002:a17:907:980c:b0:988:c24d:3d33 with SMTP id ji12-20020a170907980c00b00988c24d3d33mr13654323ejc.12.1687595057964;
        Sat, 24 Jun 2023 01:24:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i23-20020a50fc17000000b0051c7b5692easm435291edr.7.2023.06.24.01.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:17 -0700 (PDT)
Message-ID: <fb79e3d6-7164-2dc6-0d73-c32ff8a1c7f9@linaro.org>
Date:   Sat, 24 Jun 2023 10:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 23/45] dt-bindings: atmel-ssc: add microchip,sam9x7-ssc
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
 <20230623203056.689705-24-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-24-varshini.rajendran@microchip.com>
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
> Add microchip,sam9x7-ssc to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/misc/atmel-ssc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/atmel-ssc.txt b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> index f9fb412642fe..67c1227a01bd 100644
> --- a/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> +++ b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> @@ -2,6 +2,7 @@
>  
>  Required properties:
>  - compatible: "atmel,at91rm9200-ssc" or "atmel,at91sam9g45-ssc"
> +	       or "microchip,sam9x7-ssc"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

