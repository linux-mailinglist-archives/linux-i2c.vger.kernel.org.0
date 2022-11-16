Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D94662B9D5
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 11:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238771AbiKPKpr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 05:45:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbiKPKof (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 05:44:35 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B3F3E090
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:32:48 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b3so28804943lfv.2
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOHDUKetXbquoF6rjSkZdyFBCGGAbYCnf7e6hUKdFrE=;
        b=WLpJi3JcWVBgWisNzho4+Wf5a8Y9OalXRQn/Rh2bCuyE8OKcQB5bi2GoJFmx5JGdWn
         /TY2qx1KGejWBeS2s70GyyO/BtRvE+O4Dn2iJQSIepvm7ookyIjENy6avzyhnfSrddlV
         6pGqnFNcAHMBl/n9m58IR1ohYILQmRJY/7imUiynjryGDisEOHKa7c1d0oe1nB36E7H3
         nfrMboRDYRrIPc9Rl2mbTNBsyOkn5Bt7sJ7i5wjDARXLCl84txK/6VIDLSyJEQ2jLCzT
         WgKIQR45KojIWLlMEP4Sm3pEYFMphVeio2b4W+hq98MXOv8lZ8FjmJBjyyVRmPzNobIr
         C26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oOHDUKetXbquoF6rjSkZdyFBCGGAbYCnf7e6hUKdFrE=;
        b=m6z5nnlNN3o28VF6CPHVVfFsePquzOOUmm8vszYG2PRVW3mTGATCwhU2ns+12QlLOs
         C94qW1tdLri7TCZhTrNUf1qaXPWKCuK9sE3qjTSLh0fLK1PPzobXY0Hx0GSBULucj5KB
         IR9WiSVIAJ2LGSytOBX+JFLOcO3gAM3d/hIGIFwl4HIR3JOJhBqBJFslju91/7WAOikq
         dlyktssjB4CZkhzt98m3KUO6RzlsPIPNnG+WjVIKEy8sIoG+GWTWkeEupawQaycEP/cB
         qhuAxpOw0UZaZFMJpWJPWFV5K0mMEIm0neCvbOCnAfnIks0KfUIX+uU2wC/sM4Db/c9B
         0XoA==
X-Gm-Message-State: ANoB5pkYsKuz3yd84r8xT1DBlc9Ry/9+JL1o8AM7CPFMnpCgjSdrRhAD
        ETM3A/Vwo6pwtLd/Z+4BM/iB+g==
X-Google-Smtp-Source: AA0mqf7CWMlw4VeAF0f/wy6kDEyOsFD5FT+ac2NoilUfXgWdkWSRvuwfNjCeTVKYa9xMN3q+iAKrgg==
X-Received: by 2002:a05:6512:1dc:b0:4a2:8836:c07d with SMTP id f28-20020a05651201dc00b004a28836c07dmr6619708lfp.661.1668594766437;
        Wed, 16 Nov 2022 02:32:46 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id v26-20020ac2593a000000b00492b494c4e8sm2541052lfi.298.2022.11.16.02.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 02:32:46 -0800 (PST)
Message-ID: <3c2b2155-c4a5-306e-87a2-396eecdc239b@linaro.org>
Date:   Wed, 16 Nov 2022 11:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: add support for I2C Master Hub
 wrapper variant
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
 <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-4-64449106a148@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-4-64449106a148@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 16/11/2022 11:21, Neil Armstrong wrote:
> The I2C Master Hub is a stripped down version of the GENI Serial Engine
> QUP Wrapper Controller but only supporting I2C serial engines without
> DMA support.
> 
> This adds the clock list for the I2C Master Hub variant to a new desc
> struct then passes it through the I2C Master Hub compatible match data.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/soc/qcom/qcom-geni-se.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index f4f54d92a01a..8430a0192bb9 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -930,8 +930,18 @@ static const struct geni_se_desc qup_desc = {
>   	.num_clks = ARRAY_SIZE(qup_clks),
>   };
>   
> +static const char * const i2c_master_hub_clks[] = {
> +	"s-ahb",
> +};
> +
> +static const struct geni_se_desc i2c_master_hub_desc = {
> +	.clks = i2c_master_hub_clks,
> +	.num_clks = ARRAY_SIZE(i2c_master_hub_clks),
> +};
> +
>   static const struct of_device_id geni_se_dt_match[] = {
>   	{ .compatible = "qcom,geni-se-qup", .data = &qup_desc },
> +	{ .compatible = "qcom,geni-se-i2c-master-hub", .data = &i2c_master_hub_desc },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, geni_se_dt_match);
> 
