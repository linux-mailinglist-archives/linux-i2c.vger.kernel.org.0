Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9CEA745E86
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 16:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjGCObo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 10:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjGCObo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 10:31:44 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF28DE59
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 07:31:41 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso3830527e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 07:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688394700; x=1690986700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9EGFOki3xiHnF+7FGAAtZBB7mQbs7Eeh4q/1Vj38Fc=;
        b=gNYhxNbFP8IzfoJRIxeCaMSWWFNO1JHLT/5dtrYJHDBQIJ/1LXVs3YQWM7JwEDVQND
         XEdM0av8oed2tWaU76NQGdE4P3fmzdp5Mb6qpQX9bQRymPE7gmK861NL7nhg5z1JpxeF
         bZw7i353l6g88e9qdxwijj7Ocb5qzRU4ayw+sZKk1dzzV+U3Y6mIYi7ux0jyb2OmOntb
         Hqu6MW19sQT83/ryim69UdtMc11F7kvp96RwYMRbNdnMgRQjiIyoyOr0sGHVw63TK+MT
         9Fhz6gOfc9TcImcO9GcIGJo74/jkGwS/xCqTEb3cJzXjeAk/WTK4w1+rUNuqu332p5/e
         LVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688394700; x=1690986700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9EGFOki3xiHnF+7FGAAtZBB7mQbs7Eeh4q/1Vj38Fc=;
        b=fXnhHO610JLwqzR/qOycLOgIgb3/cvK4ZyMSsCwsMKT53c1Ht9QXKjUBnWIYedn/lJ
         BOPDf28am4rv0upRox6KsmIU6/OxebDLzT0ZAbUekv9IHhwAOiyJ1rwR3XfskWz24egm
         MhfFkStLca+Mcle49HCKAYzB/VvkwM3V48XP2jxoG0Wh2ohWJm3xzME4exHQnV7ux4Ib
         91z67lK0X2LK5+goYVKfH+9w/Bqv5Qin8csQBUxkppcFxgvc83amVqlT65bB9i8nzUlM
         YE6xv8xAJJcUpOsf/3wxE3tyT7IxsYnpUzfWhAgX0FcXatjSNmZ+ZrpZQEh033vVt2sq
         IEww==
X-Gm-Message-State: ABy/qLbj2QsN0EMvELgspc71p2kReZnCwM93lkMP4luUqX2pZa6wuKCc
        knU6VNDQkDN7DLNcSixJdT9mBA==
X-Google-Smtp-Source: APBJJlHFnl9pjPTADToa5QxsSJWwI7H0vQw+sI7M7U3gEoIJRsZNiQ+IGa1hAankXA5VYYCKg4zhug==
X-Received: by 2002:a05:6512:3e0a:b0:4f9:72a5:2b76 with SMTP id i10-20020a0565123e0a00b004f972a52b76mr7876617lfv.65.1688394700107;
        Mon, 03 Jul 2023 07:31:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d20-20020ac24c94000000b004fbab80ecefsm1557245lfl.145.2023.07.03.07.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 07:31:39 -0700 (PDT)
Message-ID: <29f6e66d-d093-8d65-bf88-046dca5f0dcf@linaro.org>
Date:   Mon, 3 Jul 2023 17:31:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/5] soc: qcom: geni-se: Allow any combination of icc
 paths
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
 <20230703-topic-8250_qup_icc-v1-4-fea39aa07525@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230703-topic-8250_qup_icc-v1-4-fea39aa07525@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03/07/2023 16:31, Konrad Dybcio wrote:
> Not all SoCs provide all the usual paths. By the looks of it, at least
> SM8150 and SM8250 don't have one that would resemble "qup-core".
> 
> Check for the error that icc_get throws and assign a NULL value to each
> path that can't be found to effectively allow any combination of icc paths
> (which, like previously, includes no icc paths). The ICC APIs gracefully
> handle a NULL path by exiting early.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/soc/qcom/qcom-geni-se.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index ba788762835f..a5e2e8925c8e 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -813,8 +813,13 @@ int geni_icc_get(struct geni_se *se, const char *icc_ddr)
>   			continue;
>   
>   		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);

Would it make sense to add (devm_)of_icc_get_optional instead?  I think 
we already have several usecases for such API call

For this patch:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> -		if (IS_ERR(se->icc_paths[i].path))
> -			goto err;
> +		if (IS_ERR(se->icc_paths[i].path)) {
> +			/* Not all SoCs implement all the paths */
> +			if (PTR_ERR(se->icc_paths[i].path) == -ENODATA)
> +				se->icc_paths[i].path = NULL;
> +			else
> +				goto err;
> +		}
>   	}
>   
>   	return 0;
> 

-- 
With best wishes
Dmitry

