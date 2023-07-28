Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9BDD766C21
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 13:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbjG1LxN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 07:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233993AbjG1LxM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 07:53:12 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F46C3
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jul 2023 04:53:11 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-992ca792065so285168266b.2
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jul 2023 04:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690545190; x=1691149990;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ien+0dckqnLWwB5xIKB8g7x05aKwPMmWHImINEJsbdc=;
        b=qlO3CvyAFVUubKJ273SIs36eLN0cGKAdgV5du0jO1Ksgafk5MT2icPVPfPmAXnREpC
         EdaVp2eaNEA5u/wPSCYTondDCXd/Ru+VWAB7zbkVRdl4C88RNZnz/PFyi1ll+v3rVni4
         45QtvB5XJfgL2RbWAfLdiqhGYisRs0AL3ppC48ppSuu6IDuSZHvXy47tiW0mrp7FhMnV
         nvvs2QEr99t5rXxv1MJeo/cysanNbqmnvmea7u7vUeVEjQC6hoYI2Dv2f16GJYwqcEVg
         tIYuXyMwOtZMWLcTnc3M0G5fKnsviPKnAWcOZ2BFPlcFvELDCKRdn5/kTub9sMQkU4rp
         L+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690545190; x=1691149990;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ien+0dckqnLWwB5xIKB8g7x05aKwPMmWHImINEJsbdc=;
        b=cXVzAV8gfCVAjpNz+rO1oDPfRcPQor8kK3S79g2f5p2QALX2WYVq0e7R2pxBJSofEm
         urASTzHbjViVGMXMoeK/W2XEnm3pgh8OEa2wbFA8t/Pt13nKx+NtdXMcc66yHmVWRPIu
         Gw8X/Su/A/fOfJ0ppLzat0GjgsjrhKBpc4GgZWcU1B5Z4vWa5GuFy6yPeSq7CZu9K5GA
         Eq5SGl2VXxlaqtEmkTAQruDuuLTJ3zYgdBATHAnL4Fw4jRhqcWkVJV1Izc15Jo4BBsv2
         +EkVz7DnAp4JT5FJqdvUL2EjebMK66hgyMOkRUflAZ7/Q2Bmr/2wP5+A60RGm91fbjis
         Zbug==
X-Gm-Message-State: ABy/qLZDTg7d6ZLCqWgvjUesQjft7hgwMkMMiE1QvLnJgdPobqDBylWU
        GcUMfdVfTKZATbTuKep+WZSacA==
X-Google-Smtp-Source: APBJJlGnJFzK6I9oZtM+FA98OxfbMp4/Vs1wJq6IJhx1KqJ7hWxJFzKLr/x0xR0rEMS/u5T/Doz4bQ==
X-Received: by 2002:a17:906:2207:b0:988:9b29:5653 with SMTP id s7-20020a170906220700b009889b295653mr1627910ejs.77.1690545189938;
        Fri, 28 Jul 2023 04:53:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id kk9-20020a170907766900b00982cfe1fe5dsm1981569ejc.65.2023.07.28.04.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:53:09 -0700 (PDT)
Message-ID: <02c907b9-9c86-9f97-35c1-70e9ed041cdb@linaro.org>
Date:   Fri, 28 Jul 2023 13:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 13/50] dt-bindings: i2c: at91: Add sam9x7 compatible
 string
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        andi.shyti@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230728102506.265917-1-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728102506.265917-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28/07/2023 12:25, Varshini Rajendran wrote:
> Add compatible string for sam9x7.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index 6adedd3ec399..6f3158604d02 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -27,6 +27,9 @@ properties:
>        - items:
>            - const: microchip,sama7g5-i2c
>            - const: microchip,sam9x60-i2c
> +      - items:
> +          - const: microchip,sam9x7-i2c

Make it an enum with sama7g5.

> +          - const: microchip,sam9x60-i2c
>  
>    reg:
>      maxItems: 1
> @@ -84,6 +87,7 @@ allOf:
>                - atmel,sama5d4-i2c
>                - atmel,sama5d2-i2c
>                - microchip,sam9x60-i2c
> +              - microchip,sam9x7-i2c

This shouldn't be needed.

>                - microchip,sama7g5-i2c
>      then:
>        properties:

Best regards,
Krzysztof

