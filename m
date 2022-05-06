Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F21C51D74E
	for <lists+linux-i2c@lfdr.de>; Fri,  6 May 2022 14:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391640AbiEFMKI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 May 2022 08:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379864AbiEFMKG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 May 2022 08:10:06 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C003A64BE8
        for <linux-i2c@vger.kernel.org>; Fri,  6 May 2022 05:06:21 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id p18so8458230edr.7
        for <linux-i2c@vger.kernel.org>; Fri, 06 May 2022 05:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xFmHe5bkQAJ5aCJTsLWLd98BK2vXyR0AnmNa1zUXsdw=;
        b=gq7RAY9Wzf/338Lts4ds4xDAELCJptxV8Yk3X3fNOhrOHPa3qKF8LtdJ10PD0dhPjJ
         NJ9yrVqjapiTCTD5kjOXwrCn0MS8LNTy4s/CLZKCYq30426fAHVVVl2HzvlL05+ZpXm7
         zMHgITwWstk63cxeYCanKM3oZiwfMhpwP0OaDnozVgIrjOAJ/SMc7a6tl93/8r9BCRDI
         Y4BFqRc40fmatvjYCVkVvR3y7Zf602m8XKTNdpi/xpvtVXjRjZ4ZqH6x/pJl7SaQOakG
         BVk/6QfDzvn0HzR41ot1srtwzQwolRSFPZQkwElcgspNZbSnvn2fGzS1YoOGBw1rYmBZ
         4DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xFmHe5bkQAJ5aCJTsLWLd98BK2vXyR0AnmNa1zUXsdw=;
        b=2blCd5LuUgIy+t4cCTlfF+X7y9HQHGzOCnI5bdVFPcrpoB63N2vIVNwer/XeZV53rX
         8RM+H9+Bs4BmtbSIHPGc50R6poi9KlyXfAgRPoceSOHbjAI5n8yY/gAvwjJf8PuqQGRH
         1+TYJAMPFkouVTzwKTsNzA46Gfu/9dIQuyx/GFBBRaJ3DpU2lg4gqC9hRFC/jm0Wu3Bi
         BPFqC5JC3o7tYlzYZF9pHWcLRbLyqEljMzATEmq//Owbd+3qI6Beocc+xOEBA6uj7fbV
         eJ1byLQwsCLT+qP6O8CtPZDEnQCROSLWUn02xUGv19Ls0lMrvCpHCSQR9vod8FJOohhj
         kP9Q==
X-Gm-Message-State: AOAM5310HDP8SZ0lUAEvwaGfskMZheEjCAEtetBzhaCVdV2sdjduC73V
        N6MUwIM8qE2oSBIXM7J/bTdXXQ==
X-Google-Smtp-Source: ABdhPJx7ciama2+XwGOT9X7qW1ScXEtcrEsU/0JJXqlPqFpvUwHFs4XzAO2ER/pXKoHhGXX+ZU7i9A==
X-Received: by 2002:aa7:ce87:0:b0:425:d88c:bc92 with SMTP id y7-20020aa7ce87000000b00425d88cbc92mr3167564edv.147.1651838780324;
        Fri, 06 May 2022 05:06:20 -0700 (PDT)
Received: from [192.168.0.227] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 9-20020a508749000000b00426488dce1dsm2173209edv.25.2022.05.06.05.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 05:06:19 -0700 (PDT)
Message-ID: <5f862222-b3ea-ac7d-2c82-92aaad56ad3e@linaro.org>
Date:   Fri, 6 May 2022 14:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] i2c: s3c2410: change return type of
 'i2c_s3c_irq_nextbyte' from 'int' to 'void'
Content-Language: en-US
To:     Yihao Han <hanyihao@vivo.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@vivo.com
References: <20220506113415.10462-1-hanyihao@vivo.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220506113415.10462-1-hanyihao@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06/05/2022 13:34, Yihao Han wrote:
> Since ret is a redundant variable, and none of the callers check
> for return, so remove ret variable and change return type of 
> 'i2c_s3c_irq_nextbyte' from 'int' to 'void'
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index b49a1b170bb2..75ddf7ffb028 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -381,17 +381,15 @@ static inline int is_msgend(struct s3c24xx_i2c *i2c)
>  /*
>   * process an interrupt and work out what to do
>   */
> -static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
> +static void i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
>  {
>  	unsigned long tmp;
>  	unsigned char byte;
> -	int ret = 0;
>  
>  	switch (i2c->state) {
>  
>  	case STATE_IDLE:
>  		dev_err(i2c->dev, "%s: called in STATE_IDLE\n", __func__);
> -		goto out;

This does not look equivalent. Should be a return here.


Best regards,
Krzysztof
