Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33C9172B605
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 05:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjFLDUL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 23:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234386AbjFLDTj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 23:19:39 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BA219BB
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 20:17:39 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30af86a96b4so2498749f8f.3
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 20:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686539855; x=1689131855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=luzx1jHcYiBbB4g3TD2qwt1BgVetDbdHkYsa7Oauwzs=;
        b=Ycokdq4qqzdZnW4/YxkzU/GgrUkCyia4E9wCS2SBie8VIe1MqrdgTUXxfL/Q6cipFe
         hYGgg7ICJCet00aZMrD9rWpTtYTAR4PL5/4DomLTi8GGLYi+XZ8XTKgbAJzI5hEXb8JF
         swG6tFFltrBXeAg8gYGVyQH+VDFPnNhYFbkc7eme7UfmZuEx3cM+qkHIOSycMivyJtME
         ftaRM/2qz+/syinwbYKP56gqYSP7coPpRcYyJTYMDkbFqOo/ZLW6Pn9L4OMXyKNSr/dE
         wWYQy2mv/AdRqD7rSLy5RT9RUSkI789GYnQY5vFUeQ7uMo+RgIQLG9Dy/7r5WkDdYSkj
         +ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686539855; x=1689131855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luzx1jHcYiBbB4g3TD2qwt1BgVetDbdHkYsa7Oauwzs=;
        b=kJxzR/euxe8AMK/VMK8gDkpObLszmPYg63yim9YLTT5QM/lMJ1rWIiv8s20DQRuzct
         7sUeVPr/kq3sVYt5V6oXvPIt4nmG1NUm5IxsGYI0jZjl+vfd9Vhh7TPQtMkcR1xsLd4V
         ham5Kg1TdmoAvhiTP33iwKAp77EgeZIHHFrRSU/v8JpQGugDrtlW41I+dU3hG60rXagO
         cpFu8tNeSkZZEhSRB/CQWWUTV/xhvL+G1cWtpMwiuce0WwUsxHaAlZFrrcOcTU2cTQ0P
         qxT/mQ2RE7Xjwm8yc7FqhFkLb22n8DecXWZFmafzNkgZR0GZpYuRN1QqXze7sgFhqlKW
         q3lA==
X-Gm-Message-State: AC+VfDx9rWCukYC/JzGDAkW76xsHBFoGMY6zZevoTD8ff1mKno6O2ZBX
        jHvYj8IYeeiqjtnpImB1WuYeanCjGdw=
X-Google-Smtp-Source: ACHHUZ7nM171xWdj02btDyOeaXstagFbLQCpOXMOTOvniauP7q8gFy9zXuyxjl3QZqA5v0zS/Xwuwg==
X-Received: by 2002:adf:f352:0:b0:306:2fab:1f81 with SMTP id e18-20020adff352000000b003062fab1f81mr3750481wrp.21.1686539854658;
        Sun, 11 Jun 2023 20:17:34 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s2-20020adfecc2000000b0030aed4223e0sm10952982wro.105.2023.06.11.20.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jun 2023 20:17:32 -0700 (PDT)
Message-ID: <ca6115d9-f39c-9350-f63b-19a40b4f7600@gmail.com>
Date:   Mon, 12 Jun 2023 05:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 08/15] i2c: busses: mt7621: Use devm_clk_get_enabled()
To:     Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Stefan Roese <sr@denx.de>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-9-andi.shyti@kernel.org>
Content-Language: en-US, ca-ES, es-ES
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230611225702.891856-9-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/06/2023 00:56, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Stefan Roese <sr@denx.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/i2c/busses/i2c-mt7621.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index f9c294e2bd3c5..104bb194e9906 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -282,16 +282,11 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	if (IS_ERR(i2c->base))
>   		return PTR_ERR(i2c->base);
>   
> -	i2c->clk = devm_clk_get(&pdev->dev, NULL);
> +	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>   	if (IS_ERR(i2c->clk)) {
> -		dev_err(&pdev->dev, "no clock defined\n");
> +		dev_err(&pdev->dev, "Failed to enable clock\n");
>   		return PTR_ERR(i2c->clk);
>   	}
> -	ret = clk_prepare_enable(i2c->clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Unable to enable clock\n");
> -		return ret;
> -	}
>   
>   	i2c->dev = &pdev->dev;
>   
> @@ -301,8 +296,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	if (i2c->bus_freq == 0) {
>   		dev_warn(i2c->dev, "clock-frequency 0 not supported\n");
> -		ret = -EINVAL;
> -		goto err_disable_clk;
> +		return -EINVAL;
>   	}
>   
>   	adap = &i2c->adap;
> @@ -320,23 +314,17 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	ret = i2c_add_adapter(adap);
>   	if (ret < 0)
> -		goto err_disable_clk;
> +		return ret;
>   
>   	dev_info(&pdev->dev, "clock %u kHz\n", i2c->bus_freq / 1000);
>   
>   	return 0;
> -
> -err_disable_clk:
> -	clk_disable_unprepare(i2c->clk);
> -
> -	return ret;
>   }
>   
>   static void mtk_i2c_remove(struct platform_device *pdev)
>   {
>   	struct mtk_i2c *i2c = platform_get_drvdata(pdev);
>   
> -	clk_disable_unprepare(i2c->clk);
>   	i2c_del_adapter(&i2c->adap);
>   }
>   
