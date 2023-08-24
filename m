Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18E21786B34
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 11:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236015AbjHXJKb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 05:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbjHXJK3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 05:10:29 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA0A1989
        for <linux-i2c@vger.kernel.org>; Thu, 24 Aug 2023 02:10:24 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31977ace1c8so5760159f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 24 Aug 2023 02:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692868222; x=1693473022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKd6Vvyg5ivmrlFMRaOzprAQ+7LMDgFGorbXZwvtdBc=;
        b=UtOf53zCWwvSmtWKwUsfXtI9nVcdRIpJQj3Q3GOTDLRh8jJ/HUIJJ5wAtouFJA3JSA
         OgzYvO5ojI2ZIjJauqTkqFnNUJtA661EBWnihPUl8Wll4fw7prW0LQu5m6RZT39R2+/h
         43JAGSrjfwdoAcyc0kfnj4/1F40XxcUb/FLRxDVAdKexQ+qxqJmBvXm0ZKXHjujlUzvX
         gt9Zv+mhzYZ5nAEsq8IflloSygPrq2O13ARPNjPbvFVMU1lt3q8vY/z0lpPg3oRIfsTk
         ENpeT24SFS3SeRHFpDRU5H3IpOk7/5i2cHPwz7pnZv5KkTyLfHeSlL8lKvIZurFj9Apd
         F+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692868222; x=1693473022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mKd6Vvyg5ivmrlFMRaOzprAQ+7LMDgFGorbXZwvtdBc=;
        b=Fqsz0IyTH5Ehbc9ccrM/VJD87ScwrYfSLosUVEytNxYEcInL1z6cCCfWQms+8xWd4s
         iKShHFVYH7lLK8KiGXgwt6tA03fesP2N+Yo1kQH36FpITrWf4tpwW1TI8exJ5XYlVTp+
         56Q0QyxQ7miGLoCofN85UD9bBWxb4uYbhxAy1OXG+6ScYvYSNExcb2/celz95sCPzjTg
         xaLlgYH/slWCrTn4MkuW0ZencJOa3uRnFs0ZajdgZtvraep4jUgdPLjYImwcVZ9eh1lL
         0TCrRMQt/IRBUIkeV67QzJf4wb+d6hO3iB9bZT6V+s8XOT1I2xIcBOWXG+aRdVBJu4O6
         EYHA==
X-Gm-Message-State: AOJu0Yxxv9ijJe2/L0zo6m5bpmtJktiWM5vS7XlZQIYyRmvDEmL5bAj5
        fXlEoga0ygcvgfhJexn0kFFRAg==
X-Google-Smtp-Source: AGHT+IEFtIP2c9EMTFKuYT/daW8nU0vsF89E71wEi0EWILazOM7HDO+P+pVno5HHzC9MfGzx4+Zfxg==
X-Received: by 2002:adf:d0c4:0:b0:319:785a:fce5 with SMTP id z4-20020adfd0c4000000b00319785afce5mr10365544wrh.38.1692868222588;
        Thu, 24 Aug 2023 02:10:22 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x9-20020a5d4909000000b0031c5e9c2ed7sm8765038wrq.92.2023.08.24.02.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 02:10:22 -0700 (PDT)
Message-ID: <bacbdd5e-0547-213e-407e-eabf4e84141d@linaro.org>
Date:   Thu, 24 Aug 2023 10:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH next] i2c: qcom-cci: Fix error checking in cci_probe()
Content-Language: en-US
To:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        dmitry.baryshkov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Liao Chang <liaochang1@huawei.com>,
        Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, vegard.nossum@oracle.com
References: <20230823194202.2280957-1-harshit.m.mogalapalli@oracle.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230823194202.2280957-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23/08/2023 20:42, Harshit Mogalapalli wrote:
> devm_clk_bulk_get_all() can return zero when no clocks are obtained.
> Passing zero to dev_err_probe() is a success which is incorrect.
> 
> Fixes: 605efbf43813 ("i2c: qcom-cci: Use dev_err_probe in probe function")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> Only compile tested, found by static analysis with smatch.
> 
> https://lore.kernel.org/all/CAA8EJprTOjbOy7N5+8NiJaNNhK+_btdUUFcpHKPkMuCZj5umMA@mail.gmail.com/
> ^^ I reported initially here, Dmitry suggested we need to fix it in a
> different patch.
> 
> the Fixes commit used above pointed this bug, but the real fixes tag is this:
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> ---
>   drivers/i2c/busses/i2c-qcom-cci.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index cf13abec05f1..414882c57d7f 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -588,8 +588,10 @@ static int cci_probe(struct platform_device *pdev)
>   	/* Clocks */
>   
>   	ret = devm_clk_bulk_get_all(dev, &cci->clocks);
> -	if (ret < 1)
> +	if (ret < 0)
>   		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +	else if (!ret)
> +		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
>   	cci->nclocks = ret;
>   
>   	/* Retrieve CCI clock rate */
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
