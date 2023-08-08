Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF789773ECD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 18:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbjHHQgC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 12:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232926AbjHHQex (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 12:34:53 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0041424D
        for <linux-i2c@vger.kernel.org>; Tue,  8 Aug 2023 08:52:36 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c136ee106so851273566b.1
        for <linux-i2c@vger.kernel.org>; Tue, 08 Aug 2023 08:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509953; x=1692114753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sQgrfQw0P6pTmKNcUIhzKP/rgp8qN+H1U22DXchyEX8=;
        b=odSCSjyoTpdaoDQR/7pXVJJVbKr3ENq78zanwE21XrwroDSHEziQ9Oqur698hiyIyu
         VhU9trg4Z1nR6/0t1sEBZonD38Ut9bkJB9oXAglOyj1+/W6DPou8AeEZmRk8HngZM2gR
         Ph8bwwP8VkabHYhj/SLtH0wtiBgQpH7MlJb69QaX5mkrZNCsFhM2rPn5cRgWK088kvV/
         df3hTbrHUziwlxrKhnHneHEQsGiaGimnZA3/I+jY+J0Zu+boxssAZDgjX8SvDZNioRvn
         H2LQxpTu1LuLnG7EXVCsSyDYMhcpvH4Pz8xS0n0Olrck332VjrGgWkmIn79S3r7syEsl
         azFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509953; x=1692114753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQgrfQw0P6pTmKNcUIhzKP/rgp8qN+H1U22DXchyEX8=;
        b=DsipE51N5f0vHgLmwaC+HF2MaU11IGX6/x9y9j0PLgss4g1zGGLcPnSyX5NzWK6ZRR
         HRZCJBoFHVxRvdfs+XvawNBmlnJRtk9Rfte8NzqWtS+0pm1tZAT4flpM9AUIsEPEiAj9
         o6SypU8+h/ZssQ0o5XKcIW7gHnu3AKqPDT1Jbc4crYzDr0psp9TPj5ysvGt5TXdbOxTd
         /O0/aElVVyTMBPQWJFj+woxHf3Aj7oqppN2wWP8NiJIygOq+mrHaSQVVQpg34tgXMw+0
         5Dkg3d/NtSo24QDHOL4Ebr3EGU7nzG03+xUrNWNMJ2COcF2YyN2NXuMGj9LbZaQJjrDw
         7RCg==
X-Gm-Message-State: AOJu0YyGHUDRJavPAW5hqUWg5Noklby+/OMheQV0YJ9yg1fcTta07jy7
        JfmzGDo4mgOGlOGzbfQ5oi9hoUZxYF8uKtf1cL8=
X-Google-Smtp-Source: AGHT+IHOV1+SwptyB2y6PObKLYIfXb0SnPIa+qNzfFQDPldY+tNhzDRnIS3lyd9q6xt4sZxlqEOpfw==
X-Received: by 2002:a17:906:84:b0:99c:980:d551 with SMTP id 4-20020a170906008400b0099c0980d551mr10554435ejc.50.1691483778414;
        Tue, 08 Aug 2023 01:36:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id k2-20020a1709063fc200b00993470682e5sm6344518ejj.32.2023.08.08.01.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 01:36:17 -0700 (PDT)
Message-ID: <ada9eaab-3ba7-3a14-5e33-5344d0511a60@linaro.org>
Date:   Tue, 8 Aug 2023 10:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 4/9] i2c: hisi: Use dev_err_probe in probe function
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
 <20230808012954.1643834-5-liaochang1@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808012954.1643834-5-liaochang1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
> Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  drivers/i2c/busses/i2c-hisi.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
> index e067671b3ce2..6fc8d6fa43b6 100644
> --- a/drivers/i2c/busses/i2c-hisi.c
> +++ b/drivers/i2c/busses/i2c-hisi.c
> @@ -462,18 +462,14 @@ static int hisi_i2c_probe(struct platform_device *pdev)
>  	hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
>  
>  	ret = devm_request_irq(dev, ctlr->irq, hisi_i2c_irq, 0, "hisi-i2c", ctlr);
> -	if (ret) {
> -		dev_err(dev, "failed to request irq handler, ret = %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq handler\n");

I don't think this is needed:
https://lore.kernel.org/all/20230721094641.77189-1-frank.li@vivo.com/

Best regards,
Krzysztof

