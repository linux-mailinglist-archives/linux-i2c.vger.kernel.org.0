Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5549473CA03
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 11:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbjFXJUH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 05:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232976AbjFXJUA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 05:20:00 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB3A1BF8
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 02:19:58 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51cb40f13f6so891919a12.2
        for <linux-i2c@vger.kernel.org>; Sat, 24 Jun 2023 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687598396; x=1690190396;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfAcGT4J8pUoMJBGxBaLszgHGiS6c9l8JOpUoHeAAOA=;
        b=yQVzjTKSXVmVV9dLLVhjlfW4hSkCHaHSkFp8XKDuppCzQpGHvyVttjnWT3sZWadL6G
         Aptg8K8aHU9euO2VsKWw8w5GNb7iZUmQN6s980dsKNw8bDt/Gg0mjyG+1qbTOWHueIrY
         /Q6bxSUkrx10KI9Bk3ImA6gPyy5RwRLI1IVUQjGo73WdFwY+k9WU2qYNImsGMRH4LVBY
         NGoLGDAz09o/yosqduTlRt/bCpwDw40AnKJvyTtb5EsV6kYLtwXhkQO6myiWdEiHilCp
         eezk0kHCVcUBB/e4mc1VfkMXxJnPCuve2SWX/BdtYwhjQIOCgvko85iNcFXLb/8ecU/N
         rm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687598396; x=1690190396;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KfAcGT4J8pUoMJBGxBaLszgHGiS6c9l8JOpUoHeAAOA=;
        b=hH+RbK5hCcfydNPomqZ4j88KOfhYG6MHr8h7ARKX+H6wW4IcbOuL6TbkIg8bkuweho
         hgm73G6AwVyPut4M6RVOtvKBy00qJ9fd4CLZbC9daehLzYMuRZt9USS8rHJ6CkHgD+3u
         sfG5lvb61P5SKZ1Poe4hOB3yjfpujvWjQIj/7/rLeTU+SsY8wia1rNwHReryGM8kJmeS
         7JxK2nUWQsm9b48TMf4reZGUCkYEWjUKcpqnBR92tzLkGqZducS8v8mUoZ1i9TlUMB5c
         Ux17Oq/9heEERxvusrIgdXmPN+hzyDVf4FcVNnV5pA/qAJFJDURujd22vTlTgBEOQyXU
         atFQ==
X-Gm-Message-State: AC+VfDyzRGV7vpEFxmHWR8OHekPFr8BLwMp3Me9ytnrK5dt8GGH1Kl3B
        i460D4nKlxjjHbDqIQHmNbleKg==
X-Google-Smtp-Source: ACHHUZ5fG8f481PX14S7vktzFZQMA1l6HoKP1yysFPHfBvGgcLJOb2TMBp2polua7/w5jYwHHssrXQ==
X-Received: by 2002:a17:907:987:b0:987:6372:c31f with SMTP id bf7-20020a170907098700b009876372c31fmr16230436ejc.37.1687598396633;
        Sat, 24 Jun 2023 02:19:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p13-20020a1709060e8d00b00989065149d0sm663324ejf.86.2023.06.24.02.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:19:55 -0700 (PDT)
Message-ID: <ca3b6a75-2811-6013-28cc-9f6a7854b469@linaro.org>
Date:   Sat, 24 Jun 2023 11:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/45] dt-bindings: microchip: atmel,at91rm9200-tcb:
 add sam9x60, sam9x7 compatible
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 <20230623203056.689705-2-varshini.rajendran@microchip.com>
 <074048a2-5153-e013-3562-b5cad2ba0954@linaro.org>
In-Reply-To: <074048a2-5153-e013-3562-b5cad2ba0954@linaro.org>
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

On 24/06/2023 09:53, Krzysztof Kozlowski wrote:
> On 23/06/2023 22:30, Varshini Rajendran wrote:
>> Add sam9x60, sam9x7 compatible string support in the schema file.
>>
>> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>> ---
>>  .../devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml | 
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Un-acked. Actually NAK.

This does not match your DTS. Please test your patches before sending.

Best regards,
Krzysztof

