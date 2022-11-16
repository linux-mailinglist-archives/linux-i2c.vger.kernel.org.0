Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD0562BA09
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Nov 2022 11:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238888AbiKPKty (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Nov 2022 05:49:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236982AbiKPKtY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Nov 2022 05:49:24 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA860B1FF
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:38:38 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bp15so28753510lfb.13
        for <linux-i2c@vger.kernel.org>; Wed, 16 Nov 2022 02:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sFXZNnC1r3n2agymwGJrvkUkPxxvd0733cgDv6oszs=;
        b=zJCwjGUVoIWq0gTmFIs+O6sXzOcBM9+ANna4bVaIB/QZxF25vfCGHQLDyrrpdipDvI
         qTU/L7lh6MFZaCVyLm/pWshXFhIs26+IGBgjemBKN+sW2wQqcfju28WuQygnkmzeN2nS
         hcJgH8m5GYiXQeMx0EUdsybCg1NbQWgBusJqRk9MnugqyXwNGglzYNbSU0GpHSUfsE7T
         PfrF+KmAxpHdVTaIhUx8UwGCytj6e49055fcg0Fe3qNQvhwhi3aqEmpt9QOlE+JzYb4Q
         2B4fmmx1XeQ6D3oV8lBL/7t84l2ZTwbuvUlnJ73+FUWHMeAfHe1x2cF/xjiO6MAwkBbk
         Km1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/sFXZNnC1r3n2agymwGJrvkUkPxxvd0733cgDv6oszs=;
        b=7NMMQmPRFRBtwRq/tHZzrFX5P6ElW6qKBSqlBzyjMOmgF+aYcJMZGWQEr1/0ERm37N
         qSYAwnwW/pSdARmrdWxEsh21/9Yuhn7KQS7Qp09IDoX9Q/7dhSOxq46T9PtOS0frRfeI
         /0eXVTsayOS1SkLKGeyyNHuWAQYb7IG9IK0C2aSQQLJbKAk6Bbw1BKrO8+eo7LJuV0Zw
         e1BmCpIWGQI4J7dvEIx6TFqDyKhvuey6LOosBlJMUTusejDktqGgIIBRoDGXzd0aCvxD
         /h/n2z+N3HCSSf9MCQPzeATeN5sQ7HPMqwf0h/eJohgeMdHSr9tXdBJ9h7HWWapAdJJW
         /GFQ==
X-Gm-Message-State: ANoB5pmRgM/B03Nm2qV//7ZXF6TMLqp6u6A4tirKBLHmQRKMuj/ax3yH
        jt2NrqCZ26oAF5KQ2N+TnLwT6Q==
X-Google-Smtp-Source: AA0mqf4kqe7dYOt417HutmC/BY8vX8YJnqNTsxyQz8kbZy9Ylm0Z9ZSsUUlPlh7QdGDgc6EsV0emTA==
X-Received: by 2002:a05:6512:1042:b0:4a2:2aad:95c4 with SMTP id c2-20020a056512104200b004a22aad95c4mr8277336lfb.110.1668595116379;
        Wed, 16 Nov 2022 02:38:36 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id p24-20020a2eb118000000b002772b70c1acsm2941048ljl.21.2022.11.16.02.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 02:38:36 -0800 (PST)
Message-ID: <e99dc990-5e20-3a9a-1710-482e9c0a1c54@linaro.org>
Date:   Wed, 16 Nov 2022 11:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 6/6] i2c: qcom-geni: add support for I2C Master Hub
 variant
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-0-64449106a148@linaro.org>
 <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-6-64449106a148@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-i2c-master-hub-v1-6-64449106a148@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
> This adds the I2C Master Hub serial engine compatible along the
> specific requirements in a new desc struct passed throug the device
> match data.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/i2c/busses/i2c-qcom-geni.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 75dd0718c5a1..bfe75038bc14 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1026,8 +1026,16 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
>   									NULL)
>   };
>   
> +const struct geni_i2c_desc i2c_master_hub = {
> +	.has_core_clk = true,
> +	.icc_ddr = NULL,
> +	.no_dma_support = true,
> +	.tx_fifo_depth = 16,
> +};
> +
>   static const struct of_device_id geni_i2c_dt_match[] = {
>   	{ .compatible = "qcom,geni-i2c" },
> +	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
> 
