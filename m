Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A69C780ABF
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 13:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346135AbjHRLGu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Aug 2023 07:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244170AbjHRLGQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Aug 2023 07:06:16 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5402D73
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 04:06:14 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4ff88239785so1090143e87.0
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 04:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692356773; x=1692961573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMIktzBcgCZ2Vl0uMoPdLyMfuXFnj8LQIJonADyTrTE=;
        b=hc7DAw1jAzejV41R4/oXFzjTTyJcG4TEUTMq2mRDdLba4GbIlI6HIu45uZ55hhxcK5
         Hk1jHJkCz3PT4fZQh1pWDeERortudXYMit4GMFztCX8fpiiJWh/Se4OOB+bGSysIvy+D
         Q03npqSi7pZucFaqytpwos/Gs1lJZvhCPMX78z+z3BFIPj6MK89IbZkngBqcxM7t28Na
         4TncwsUIeSJlYeXpBeH98lgJrS57JRHmexw0C2s8odiyZY1hBO4u16fQ616TmRIDvtqM
         8K5P2SUH+Qt7SWMzeYaMG4fWi/D98DKiBJChjwxhTajd4x+p19nRAqMkW03bI3yTs54D
         OHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692356773; x=1692961573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMIktzBcgCZ2Vl0uMoPdLyMfuXFnj8LQIJonADyTrTE=;
        b=KXhEorIwnSTNwTJ+Cq5D0K/Rbqz4rSGv2XQUSDoXBWAW6R55PLrLzLuftsS+CwDcWl
         HuPDlX3183O/ygxcpPuwVF1jEYBxMZyYNe8aA6BMYPTnrc6N1XvyH0lE8eUc+T5rgvtp
         ZQkB1Zc9viIW3qSOs0s12akywhfE4s2FblMfuWLJy+ue2XwKa6y2Hai5hs4NRAjC6WFB
         oULt54xMeSaPWVa8TP17zMZYXtwUmPz7I2ETmWXtDXZBjn7anGyddmLpaWieCm0ZowL3
         ULgGnHhvj6VjehvWWpUxmkDBX/+1NfdPnmauZFmfGctqdtrfPI/++325jHAjd3cjnshR
         mcvw==
X-Gm-Message-State: AOJu0YwR4eJh67dN9OHaX4gbNDDFThFkviPfjtBkZWweCzmZviHLZCmT
        YH7jZoX/GlzRxX11Sbo+ovsB+Q==
X-Google-Smtp-Source: AGHT+IH0IRqcnpfQ1DcMW1gOJYtBbBbQUGhUUhchG+P2KKAZ3KQNIExD06f+xoIePJauUtb49QueuQ==
X-Received: by 2002:a05:6512:2342:b0:4f9:56a9:b98e with SMTP id p2-20020a056512234200b004f956a9b98emr1801620lfu.58.1692356772869;
        Fri, 18 Aug 2023 04:06:12 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id k19-20020ac257d3000000b004ff91a94156sm290851lfo.121.2023.08.18.04.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 04:06:12 -0700 (PDT)
Message-ID: <e87b35f9-f585-4a3f-bd31-9ebeba52f66b@linaro.org>
Date:   Fri, 18 Aug 2023 14:06:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] i2c: qcom-cci: Use dev_err_probe in probe function
Content-Language: en-GB
To:     Liao Chang <liaochang1@huawei.com>, andi.shyti@kernel.org,
        florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-6-liaochang1@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230728013148.1720978-6-liaochang1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28/07/2023 04:31, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>   drivers/i2c/busses/i2c-qcom-cci.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 622dc14add9d..cf13abec05f1 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -588,10 +588,8 @@ static int cci_probe(struct platform_device *pdev)
>   	/* Clocks */
>   
>   	ret = devm_clk_bulk_get_all(dev, &cci->clocks);
> -	if (ret < 1) {
> -		dev_err(dev, "failed to get clocks %d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 1)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
>   	cci->nclocks = ret;
>   
>   	/* Retrieve CCI clock rate */

-- 
With best wishes
Dmitry

