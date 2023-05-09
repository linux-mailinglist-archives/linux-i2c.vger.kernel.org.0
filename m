Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 303936FC1ED
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 10:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234635AbjEIIrH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 04:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234359AbjEIIrF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 04:47:05 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F69F2105
        for <linux-i2c@vger.kernel.org>; Tue,  9 May 2023 01:47:04 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4ec8133c59eso6319192e87.0
        for <linux-i2c@vger.kernel.org>; Tue, 09 May 2023 01:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683622022; x=1686214022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9vTXBvvI1Bt2aTvD0IHUrIyz/7MAI/FAwW92EEEeuo=;
        b=FYyfUe+wxE1SPQLl60OIAowwOEW8f9EAHWG9Ec4tFUkm7ycWEoFiSL+DHSS3/RUg7q
         5WmCvBRx5lYK1sMepjtDMe9+26XHbtTADmrZq1n4IeC6QVnGFOICFUgpC4BA/Jn1/4et
         UtCOjaHHgNWniJ8Vx1iyhI8P30NOANF2BWtkqtoUnd1cd8YnwVv9tHSWsRoJykLd9clO
         UAaKAIu5ej/IYSTCkzQgWoG/sXuLMIuKW/6nGnRc6ft9heqitGrIh5L6+jRnyKRJ+a7k
         q3/+V/Gz6sUY3VtO13A2aSH/UF4y1cVPUTonLK8as0sV9gVwknNgcZ/oDFh8VNRa6PBY
         d7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683622022; x=1686214022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9vTXBvvI1Bt2aTvD0IHUrIyz/7MAI/FAwW92EEEeuo=;
        b=D+ixDafTXBJsw+uMi5cBrJSJz2gDVzoSMtG32SCgUq4FhAF9KsTf6RqxmvLXl61BfU
         fi0vV8Wj4xAChynuJa2wPKxFHbOgBwPcbU9U42U1o0Zf7Zls03RcEKBxEsbEwUGykDhQ
         V9+9Rb9KJCkUPWJxxsxhUXBlCcThlgQ3UAmNnMbmEAfxRjAkGtzQDgtb3JibeMeZTHOF
         G176qEKed4tloWdDPaRYZ1oHYMfKrDBorSBLLyphai6p+JE6Y8N7DTDg8/KCR+RNxcaQ
         VKhPPCvhs99LE2oXLMxUZGy45PkKzbif1AbGoBNrA2MxBH1WgNBtnKtGQFuG6CCJkZ+3
         eKIQ==
X-Gm-Message-State: AC+VfDxwPNHGCWpACSCLINSY8HheRVxFI8aR68UPabqizhpemPA8k5wD
        zhwKFf0qYQ+xC5ouowEXzJzPHA==
X-Google-Smtp-Source: ACHHUZ4dPNrzXsQ1qSQgrdcrPzGsYwiL1E7qBAW+gk1qaPcsB7PkSjyD8tDU4VDa4RxdCuKfFeer7Q==
X-Received: by 2002:ac2:4157:0:b0:4ec:9e40:e445 with SMTP id c23-20020ac24157000000b004ec9e40e445mr473657lfi.19.1683622022784;
        Tue, 09 May 2023 01:47:02 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id w11-20020a19c50b000000b004f251cf3d31sm268994lfe.153.2023.05.09.01.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:47:02 -0700 (PDT)
Message-ID: <2ad329a7-d9ef-71fd-6d96-4c9743a3f8f9@linaro.org>
Date:   Tue, 9 May 2023 10:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 57/89] i2c: qup: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-58-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230508205306.1474415-58-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8.05.2023 22:52, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/i2c/busses/i2c-qup.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 2e153f2f71b6..6eef1dbd00de 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -1904,7 +1904,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int qup_i2c_remove(struct platform_device *pdev)
> +static void qup_i2c_remove(struct platform_device *pdev)
>  {
>  	struct qup_i2c_dev *qup = platform_get_drvdata(pdev);
>  
> @@ -1918,7 +1918,6 @@ static int qup_i2c_remove(struct platform_device *pdev)
>  	i2c_del_adapter(&qup->adap);
>  	pm_runtime_disable(qup->dev);
>  	pm_runtime_set_suspended(qup->dev);
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM
> @@ -1978,7 +1977,7 @@ MODULE_DEVICE_TABLE(of, qup_i2c_dt_match);
>  
>  static struct platform_driver qup_i2c_driver = {
>  	.probe  = qup_i2c_probe,
> -	.remove = qup_i2c_remove,
> +	.remove_new = qup_i2c_remove,
>  	.driver = {
>  		.name = "i2c_qup",
>  		.pm = &qup_i2c_qup_pm_ops,
