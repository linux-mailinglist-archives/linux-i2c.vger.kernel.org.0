Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE01590EF6
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 12:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238172AbiHLKO2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 06:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238109AbiHLKOK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 06:14:10 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05FAAB4E6
        for <linux-i2c@vger.kernel.org>; Fri, 12 Aug 2022 03:13:18 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id by6so477148ljb.11
        for <linux-i2c@vger.kernel.org>; Fri, 12 Aug 2022 03:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=8cLhmbUzxjFPeEqNnxegdJhRMYmiHcGmozP5wffiZTU=;
        b=WTxdbpatl/Nddz+PTuVRR73SuOXowEQtLmLFxwXWr5GSYU+ztSACZWVLaK2vzxj6m2
         3NdwSnjEIuzz6QdV1sGNd+PZwhsw0kp2vd8OV4FBs95Ubiv1gkcyN7+g+cGKDByb+dwc
         VQaz4lcgk7eb4C/9zl9ZYT0SHgo4br4IhFxpnqSl4UJ9dKefLYB9Ro0WwChQc7roJYiv
         qtr4ZjKf0hvB8pl/KDFx1/0QTUUnNrZUeTJYA9rnIsSID56uY/KMzHsCWv4uyxdt/0Z3
         w+mbvhDGrfZt2gPg0v9ElyCXUE5wVb/a+Etr7VCnn3ncEwUWWctATPiZqmDsJPyv+BLB
         mg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=8cLhmbUzxjFPeEqNnxegdJhRMYmiHcGmozP5wffiZTU=;
        b=Ft8YYMKlRkDC9jKP/y4fswXQiNwtZ8uyrUqUugwe5UPjYjn+okT5GCb9vh5h+cDItp
         iu1tZiQrsWSvEHn2Qcpy0K0mq5Brff4nFLtFyBuv+sLD/zCcYGrnbN6Ym0jeN5g+xZz5
         mnMQcJw8oelLcZ+/us5jEbJ4Itnn15hxd7fHFDJfrviVkREnYZ2Pf+uuGUKHozYmZjNZ
         W3LuwIdaztwOIXO7piYumdznWS7hgdsZ1DWuYEOn58K4bqlNDZuWvOoPd8bmNSEz4D0E
         SvDtIFfxW0Gv70MPWrtErOHOsHz7PPHB49bMES28MkHZC7mYvBdiJxeCGLCzH653Z+FQ
         Dk7Q==
X-Gm-Message-State: ACgBeo2QwEcal4oRXaUCl7yn5OWF66h+EcFMzf8wKFJ8UktrLnPC+XAv
        wkKEdKlxNKpoKYWjC0XNlP/Sww==
X-Google-Smtp-Source: AA6agR7naJ9emf9TqWnh8kwp04vlKy5jAdUnOcyWakfGln360Wqaak0cNUSE0V2nXvLtaxyZjCuJ0Q==
X-Received: by 2002:a2e:b8d3:0:b0:25f:e94d:10ae with SMTP id s19-20020a2eb8d3000000b0025fe94d10aemr897828ljp.331.1660299197072;
        Fri, 12 Aug 2022 03:13:17 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id e7-20020a05651c038700b0025df04af0f0sm305398ljp.51.2022.08.12.03.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 03:13:16 -0700 (PDT)
Message-ID: <c2991370-b55f-c782-d62c-f9c667e40389@linaro.org>
Date:   Fri, 12 Aug 2022 13:13:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] i2c: imx-lpi2c: handle IPG clock
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, aisheng.dong@nxp.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        xiaoning.wang@nxp.com, Peng Fan <peng.fan@nxp.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
 <20220812043424.4078034-7-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812043424.4078034-7-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/08/2022 07:34, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The LPI2C controller needs both PER and IPG clock to work, but current
> driver only supports PER clock. This patch add IPG clock.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 41 ++++++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 8b9ba055c418..f43ad1ae8627 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -94,7 +94,8 @@ enum lpi2c_imx_pincfg {
>  
>  struct lpi2c_imx_struct {
>  	struct i2c_adapter	adapter;
> -	struct clk		*clk;
> +	struct clk		*clk_per;
> +	struct clk		*clk_ipg;
>  	void __iomem		*base;
>  	__u8			*rx_buf;
>  	__u8			*tx_buf;
> @@ -207,7 +208,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
>  
>  	lpi2c_imx_set_mode(lpi2c_imx);
>  
> -	clk_rate = clk_get_rate(lpi2c_imx->clk);
> +	clk_rate = clk_get_rate(lpi2c_imx->clk_per);
>  	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
>  		filt = 0;
>  	else
> @@ -561,10 +562,16 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>  	strlcpy(lpi2c_imx->adapter.name, pdev->name,
>  		sizeof(lpi2c_imx->adapter.name));
>  
> -	lpi2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(lpi2c_imx->clk)) {
> +	lpi2c_imx->clk_per = devm_clk_get(&pdev->dev, "per");
> +	if (IS_ERR(lpi2c_imx->clk_per)) {
>  		dev_err(&pdev->dev, "can't get I2C peripheral clock\n");
> -		return PTR_ERR(lpi2c_imx->clk);
> +		return PTR_ERR(lpi2c_imx->clk_per);
> +	}
> +
> +	lpi2c_imx->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
> +	if (IS_ERR(lpi2c_imx->clk_ipg)) {
> +		dev_err(&pdev->dev, "can't get I2C ipg clock\n");
> +		return PTR_ERR(lpi2c_imx->clk_ipg);
>  	}

You just broke all DTS...

Best regards,
Krzysztof
