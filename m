Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB1A7D2C63
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 10:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbjJWIOQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 04:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbjJWIOB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 04:14:01 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23E310F7
        for <linux-i2c@vger.kernel.org>; Mon, 23 Oct 2023 01:13:46 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39N7WqZP014402;
        Mon, 23 Oct 2023 10:13:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=selector1; bh=srMQPJNR5QllAWi/kEglc
        rOU1+6HpllfvQNlYh6ehq4=; b=ga3CDQWHqUEbB5X5byxhUECOOZvnpZDqhC9jb
        S1K6L5GpzPinWqOH0DLqPHGcYb6OxuinQgot87wH7zT/qYKjEprZJWB4dZlGqKFs
        07LRElgPhMvHZoZaCYOdC1R5lHu6+hmR090EEWrp5FDnFjox7/NUa30PSt/RSxlM
        zLv78AQwqzTnKNpV+8UxzlI5l2Ds6nhVAHNSXZytIGIVH3Q3W3uahd+UC9wQbOfw
        xECMXvUL1f1fi/WANzqtD2WkT2ByJPKPlR1dbiYhHJBJDrVuN37TpJKzmJ8zQS0x
        FT6DNpjTxwY+I+5hn04MTMLiXZjYzswwBeihOCrS+UHy1IGkw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tv5yweg33-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Oct 2023 10:13:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA91410005A;
        Mon, 23 Oct 2023 10:13:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3C292132D0;
        Mon, 23 Oct 2023 10:13:38 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 23 Oct
 2023 10:13:38 +0200
Date:   Mon, 23 Oct 2023 10:13:37 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Linux I2C <linux-i2c@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 12/15] i2c: busses: stm32f7: Use devm_clk_get_enabled()
Message-ID: <20231023081337.GB2429932@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-13-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-13-andi.shyti@kernel.org>
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

On Mon, Jun 12, 2023 at 12:56:59AM +0200, Andi Shyti wrote:
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
>  drivers/i2c/busses/i2c-stm32f7.c | 37 +++++++++++---------------------
>  1 file changed, 12 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index e897d9101434d..e556ba073bc0c 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -2131,23 +2131,16 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
>  						    "wakeup-source");
>  
> -	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
> +	i2c_dev->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(i2c_dev->clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
> -				     "Failed to get controller clock\n");
> -
> -	ret = clk_prepare_enable(i2c_dev->clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to prepare_enable clock\n");
> -		return ret;
> -	}
> +				     "Failed to enable controller clock\n");
>  
>  	rst = devm_reset_control_get(&pdev->dev, NULL);
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
> @@ -2162,7 +2155,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to request irq event %i\n",
>  			irq_event);
> -		goto clk_free;
> +		return ret;
>  	}
>  
>  	ret = devm_request_irq(&pdev->dev, irq_error, stm32f7_i2c_isr_error, 0,
> @@ -2170,29 +2163,28 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to request irq error %i\n",
>  			irq_error);
> -		goto clk_free;
> +		return ret;
>  	}
>  
>  	setup = of_device_get_match_data(&pdev->dev);
>  	if (!setup) {
>  		dev_err(&pdev->dev, "Can't get device data\n");
> -		ret = -ENODEV;
> -		goto clk_free;
> +		return -ENODEV;
>  	}
>  	i2c_dev->setup = *setup;
>  
>  	ret = stm32f7_i2c_setup_timing(i2c_dev, &i2c_dev->setup);
>  	if (ret)
> -		goto clk_free;
> +		return ret;
>  
>  	/* Setup Fast mode plus if necessary */
>  	if (i2c_dev->bus_rate > I2C_MAX_FAST_MODE_FREQ) {
>  		ret = stm32f7_i2c_setup_fm_plus_bits(pdev, i2c_dev);
>  		if (ret)
> -			goto clk_free;
> +			return ret;
>  		ret = stm32f7_i2c_write_fm_plus_bits(i2c_dev, true);
>  		if (ret)
> -			goto clk_free;
> +			return ret;
>  	}
>  
>  	adap = &i2c_dev->adap;
> @@ -2303,9 +2295,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  fmp_clear:
>  	stm32f7_i2c_write_fm_plus_bits(i2c_dev, false);
>  
> -clk_free:
> -	clk_disable_unprepare(i2c_dev->clk);
> -
>  	return ret;
>  }
>  
> @@ -2339,8 +2328,6 @@ static void stm32f7_i2c_remove(struct platform_device *pdev)
>  	}
>  
>  	stm32f7_i2c_write_fm_plus_bits(i2c_dev, false);
> -
> -	clk_disable_unprepare(i2c_dev->clk);
>  }
>  
>  static int __maybe_unused stm32f7_i2c_runtime_suspend(struct device *dev)
> -- 
> 2.40.1
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain
