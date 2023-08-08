Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3D8A774352
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 20:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235220AbjHHSBd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 14:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbjHHSBD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 14:01:03 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD40AD20
        for <linux-i2c@vger.kernel.org>; Tue,  8 Aug 2023 09:28:03 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe1e1142caso56566715e9.0
        for <linux-i2c@vger.kernel.org>; Tue, 08 Aug 2023 09:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512045; x=1692116845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2MJPyoks2T/ViX3nyRQF8CYDSyq3wamUO8HlMVdzMs=;
        b=dI5If1CQzI+SphW5RlV4Lh5VCaY//SxedWvkyXQH2j5F1QGSd1tAx3zoXx82OCslRX
         AdX5LkmXu3rlr0/RgG1qyth+t3ZDJTKytpZeZXA3rOvDpFE+PRu3LTZ76UAWil8sP5E2
         p7YQYDBGWxPBDrkiQ7l8asOYU6t1zV3+Ikh0hHRNhqNYZu14nmUue1BEx77JaG59l5ak
         8r5cZPWOBN5NMF+a1+1DIGy4kqg8XODg0th746J/h10zrr08ZrHTvvo0x3r5tTph6Vuv
         TLG0UOJ47KqXVilHE4HI0OM6b+LaHxAV+SwiCTbXjZDcPxQkWXAYbLz0ckvDbGHSa1PC
         LeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512045; x=1692116845;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2MJPyoks2T/ViX3nyRQF8CYDSyq3wamUO8HlMVdzMs=;
        b=IrOeKF3Pm49KXe3T6DOQmXHFF+YTVx4VfCcq22QBQ/gax2xk7dgjHZlOsqMgDkk5YA
         ILyemJKEgd/se5KgzGLkRsS2g7rPWsJk8/vmtSaJvxX72LJd+tVl4dyufX9f5R8w5BV/
         0uAwQuVIcVHWe1IbtBEukjxjWrqU2rh7+klS/fcxGbhmm4JguHFYj6lPi3j68XUeanbR
         c9wZJBGqeiGVbvBG2/4gkuzT2dHU7sL1j/sMTrdvEYO5hQyzFl7uHBG4ZmNxQ7dkoIBg
         VEM3OtM3WNUJAdv7AwLN0OTQJsFn/UTVFpwUXiMy/l/+SSVTSMwDnTeZgxmx7KaWjSNZ
         IK3A==
X-Gm-Message-State: AOJu0YzYj57iTHXyD/Q49VLOV6fu8Rt+nJWaVoVdu6amPn+LrP2mPZek
        etROLipskB6n2DoBmluDvSJNCXk59xoOgG82AEo=
X-Google-Smtp-Source: AGHT+IHVYl6k7X1HkWuOZJGrwfDyphp8mGeKHbuzBByCu7FEdYTXY1+5KAwkmhFPQxZ+9wIOIIVSOg==
X-Received: by 2002:aa7:d7c7:0:b0:523:2df6:395e with SMTP id e7-20020aa7d7c7000000b005232df6395emr5416705eds.31.1691483787005;
        Tue, 08 Aug 2023 01:36:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id n24-20020a05640204d800b0052307566ed2sm6257416edw.14.2023.08.08.01.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 01:36:26 -0700 (PDT)
Message-ID: <b32797d7-ef81-7051-85b5-cbe0cd3302ae@linaro.org>
Date:   Tue, 8 Aug 2023 10:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/9] i2c: xlp9xx: Use dev_err_probe in probe function
Content-Language: en-US
To:     Liao Chang <liaochang1@huawei.com>, andi.shyti@kernel.org,
        florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-4-liaochang1@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808012954.1643834-4-liaochang1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/08/2023 03:29, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  drivers/i2c/busses/i2c-xlp9xx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
> index f59e8c544f36..08a59a920929 100644
> --- a/drivers/i2c/busses/i2c-xlp9xx.c
> +++ b/drivers/i2c/busses/i2c-xlp9xx.c
> @@ -529,10 +529,8 @@ static int xlp9xx_i2c_probe(struct platform_device *pdev)
>  
>  	err = devm_request_irq(&pdev->dev, priv->irq, xlp9xx_i2c_isr, 0,
>  			       pdev->name, priv);
> -	if (err) {
> -		dev_err(&pdev->dev, "IRQ request failed!\n");

I don't think this is needed:
https://lore.kernel.org/all/20230721094641.77189-1-frank.li@vivo.com/

Best regards,
Krzysztof

