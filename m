Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58BCB7D2C62
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 10:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbjJWINo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 04:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232536AbjJWINV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 04:13:21 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B234C10DB
        for <linux-i2c@vger.kernel.org>; Mon, 23 Oct 2023 01:13:18 -0700 (PDT)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39MMuAT5003452;
        Mon, 23 Oct 2023 10:13:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=selector1; bh=uGVBV1d/D6wGF/m4kiZ0k
        6gEqWbpi/kRFdi49AJcz0E=; b=sCai1+lLygpHsKigaeCjyT+Kebn5hjdAqc3t+
        UKky4FoBwaDhmGiTrPdilHZhx4RaxqZLvMqkRO01dvmNqKps8ZHJjQVrj5rWl3xw
        nEUkFXFcgdcZWXoKv7yZtrrf6De8/WTvKJkGLdYOGmdYeTbg5qJ1ywBgaIxxlD3T
        xux9Yk9HMtZooV9YH7gVRDo78wvPFkQWrkyEX8hKqSj1W+bVLOTcBvTsEJnDI5mE
        0eno/+eAG4T8a1gI6SSj3m5q6RMoPbH2Y6G7zFwOtC9dcOvARP17/unTqq5pyveR
        ycVuolG1Rc+a+YsTlIfcOSQnaD3InGlqaWLXZIt8DIDsLn9Yw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tvr6yv8dx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Oct 2023 10:13:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC97E10002A;
        Mon, 23 Oct 2023 10:13:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B56FB2132D0;
        Mon, 23 Oct 2023 10:13:04 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 23 Oct
 2023 10:13:04 +0200
Date:   Mon, 23 Oct 2023 10:12:51 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Linux I2C <linux-i2c@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 11/15] i2c: busses: stm32f4: Use devm_clk_get_enabled()
Message-ID: <20231023081251.GA2429932@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-12-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-12-andi.shyti@kernel.org>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_06,2023-10-19_01,2023-05-22_02
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

sorry for the delay.

On Mon, Jun 12, 2023 at 12:56:58AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f4.c | 32 ++++++++++----------------------
>  1 file changed, 10 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index 6ad06a5a22b43..7bbb0acbdf74d 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -784,23 +784,17 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
> +	i2c_dev->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(i2c_dev->clk)) {
> -		dev_err(&pdev->dev, "Error: Missing controller clock\n");
> +		dev_err(&pdev->dev, "Failed to enable clock\n");
>  		return PTR_ERR(i2c_dev->clk);
>  	}
> -	ret = clk_prepare_enable(i2c_dev->clk);
> -	if (ret) {
> -		dev_err(i2c_dev->dev, "Failed to prepare_enable clock\n");
> -		return ret;
> -	}
>  
>  	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -	if (IS_ERR(rst)) {
> -		ret = dev_err_probe(&pdev->dev, PTR_ERR(rst),
> -				    "Error: Missing reset ctrl\n");
> -		goto clk_free;
> -	}
> +	if (IS_ERR(rst))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rst),
> +				     "Error: Missing reset ctrl\n");
> +
>  	reset_control_assert(rst);
>  	udelay(2);
>  	reset_control_deassert(rst);
> @@ -817,7 +811,7 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to request irq event %i\n",
>  			irq_event);
> -		goto clk_free;
> +		return ret;
>  	}
>  
>  	ret = devm_request_irq(&pdev->dev, irq_error, stm32f4_i2c_isr_error, 0,
> @@ -825,12 +819,12 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to request irq error %i\n",
>  			irq_error);
> -		goto clk_free;
> +		return ret;
>  	}
>  
>  	ret = stm32f4_i2c_hw_config(i2c_dev);
>  	if (ret)
> -		goto clk_free;
> +		return ret;
>  
>  	adap = &i2c_dev->adap;
>  	i2c_set_adapdata(adap, i2c_dev);
> @@ -846,7 +840,7 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
>  
>  	ret = i2c_add_adapter(adap);
>  	if (ret)
> -		goto clk_free;
> +		return ret;
>  
>  	platform_set_drvdata(pdev, i2c_dev);
>  
> @@ -855,10 +849,6 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
>  	dev_info(i2c_dev->dev, "STM32F4 I2C driver registered\n");
>  
>  	return 0;
> -
> -clk_free:
> -	clk_disable_unprepare(i2c_dev->clk);
> -	return ret;
>  }
>  
>  static void stm32f4_i2c_remove(struct platform_device *pdev)
> @@ -866,8 +856,6 @@ static void stm32f4_i2c_remove(struct platform_device *pdev)
>  	struct stm32f4_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
>  
>  	i2c_del_adapter(&i2c_dev->adap);
> -
> -	clk_unprepare(i2c_dev->clk);
>  }
>  
>  static const struct of_device_id stm32f4_i2c_match[] = {
> -- 
> 2.40.1
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain
