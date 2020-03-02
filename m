Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5FC417561F
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Mar 2020 09:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgCBIkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Mar 2020 03:40:24 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:2864 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727159AbgCBIkY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Mar 2020 03:40:24 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0228crOn021067;
        Mon, 2 Mar 2020 09:40:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=HzgTipVMRHzQXhDAuT68aCrEvMztB20bO45+Qvf+5AI=;
 b=dRUoNZe5XB4Dxne+78YqbCmhNLSyn6zZJuopjh5iJ9t1ms9k+7mRnY/Mm+5eglTPOy7a
 xek4+dQDITXQoDalBdKJ60ZOCaJIQQyUCOt9apkySkF1tq5st5UfMu+TzLxsA77wY3Yn
 IKzOuMZxnedxWqnbMk1ybNPMgHvFoZ5lpBm5JU/J/1fzuyUJhum6xXt8zqW+TvwPtftJ
 inXDvqDZ3xYG9ngPWOu5WXiUtQgD/NHeryrn3vbuHkypBF4DnaxZy/1s+Hb1YGopDkTh
 PEVZk4RWn/geCBJR/qihHpGJTo2VjM611SsT4UPC3S44DpldyA5mtZKdvWdMZYbCMNty 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yfdycjhbt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Mar 2020 09:40:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C544100034;
        Mon,  2 Mar 2020 09:40:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80BB32A7776;
        Mon,  2 Mar 2020 09:40:17 +0100 (CET)
Received: from [10.48.1.172] (10.75.127.51) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Mar
 2020 09:40:16 +0100
Subject: Re: [PATCH v1 33/40] i2c: stm32f7: Use generic definitions for bus
 frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>
CC:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-33-andriy.shevchenko@linux.intel.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <01fa2e71-83fd-b59c-9be3-fd9eab00fca6@st.com>
Date:   Mon, 2 Mar 2020 09:40:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200224151530.31713-33-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-02_02:2020-02-28,2020-03-02 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

Look good to me.

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 2/24/20 4:15 PM, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
> 
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 5c3e8ac6ad92..9af5733ed513 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -334,9 +334,9 @@ struct stm32f7_i2c_dev {
>   */
>  static struct stm32f7_i2c_spec i2c_specs[] = {
>  	[STM32_I2C_SPEED_STANDARD] = {
> -		.rate = 100000,
> -		.rate_min = 80000,
> -		.rate_max = 100000,
> +		.rate = I2C_STANDARD_MODE_FREQ,
> +		.rate_min = I2C_STANDARD_MODE_FREQ * 8 / 10,	/* 80% */
> +		.rate_max = I2C_STANDARD_MODE_FREQ,
>  		.fall_max = 300,
>  		.rise_max = 1000,
>  		.hddat_min = 0,
> @@ -346,9 +346,9 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
>  		.h_min = 4000,
>  	},
>  	[STM32_I2C_SPEED_FAST] = {
> -		.rate = 400000,
> -		.rate_min = 320000,
> -		.rate_max = 400000,
> +		.rate = I2C_FAST_MODE_FREQ,
> +		.rate_min = I2C_FAST_MODE_FREQ * 8 / 10,	/* 80% */
> +		.rate_max = I2C_FAST_MODE_FREQ,
>  		.fall_max = 300,
>  		.rise_max = 300,
>  		.hddat_min = 0,
> @@ -358,9 +358,9 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
>  		.h_min = 600,
>  	},
>  	[STM32_I2C_SPEED_FAST_PLUS] = {
> -		.rate = 1000000,
> -		.rate_min = 800000,
> -		.rate_max = 1000000,
> +		.rate = I2C_FAST_MODE_PLUS_FREQ,
> +		.rate_min = I2C_FAST_MODE_PLUS_FREQ * 8 / 10,	/* 80% */
> +		.rate_max = I2C_FAST_MODE_PLUS_FREQ,
>  		.fall_max = 100,
>  		.rise_max = 120,
>  		.hddat_min = 0,
> @@ -1894,14 +1894,14 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
>  	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
>  				       &clk_rate);
> -	if (!ret && clk_rate >= 1000000) {
> +	if (!ret && clk_rate >= I2C_FAST_MODE_PLUS_FREQ) {
>  		i2c_dev->speed = STM32_I2C_SPEED_FAST_PLUS;
>  		ret = stm32f7_i2c_setup_fm_plus_bits(pdev, i2c_dev);
>  		if (ret)
>  			goto clk_free;
> -	} else if (!ret && clk_rate >= 400000) {
> +	} else if (!ret && clk_rate >= I2C_FAST_MODE_FREQ) {
>  		i2c_dev->speed = STM32_I2C_SPEED_FAST;
> -	} else if (!ret && clk_rate >= 100000) {
> +	} else if (!ret && clk_rate >= I2C_STANDARD_MODE_FREQ) {
>  		i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
>  	}
>  
> 
