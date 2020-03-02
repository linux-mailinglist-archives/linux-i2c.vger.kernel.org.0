Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2F2917561D
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Mar 2020 09:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgCBIkH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Mar 2020 03:40:07 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:2942 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727242AbgCBIkH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Mar 2020 03:40:07 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0228crOg021067;
        Mon, 2 Mar 2020 09:40:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=xC3xDkGXBhL3oFybT1BzlbFne36y8tlJ9BUJzhRDiAM=;
 b=DXNbOzO+QFKO511WVBUSVBplaLu5rSgYA9su6Kn5mnMB7xRCB8/szi2gpmyDc6TJ/eVV
 yrGn1OO0pxAJ/Z2o+Soo7BRH21RNsCnNrbE7OWQ0WZ03FEYDS4qjme6paEaOsr2eg1Oj
 nGqF/YHX+20OgpsUKPZsbaZjXIwzJx0shTis5u2r3wcDCJVChDijIEDbeVl1qmT14D/x
 Fr8UPFNyvTLkS3mzu5+G3gmXolEqDcz1PVuc9iMLBaGhSlOSgMgYImprSelLGZcUJ5U1
 N97k6jdN69+bbQr8sAFj5AqJpwKM41gXUMH1CrhKTNepSrL1/noxPvxgiZUUYDVgwfEo Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yfdycjha5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Mar 2020 09:40:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23D4010002A;
        Mon,  2 Mar 2020 09:40:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13FD12A7775;
        Mon,  2 Mar 2020 09:40:01 +0100 (CET)
Received: from [10.48.1.172] (10.75.127.50) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Mar
 2020 09:40:00 +0100
Subject: Re: [PATCH v1 32/40] i2c: stm32f4: Use generic definitions for bus
 frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>
CC:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-32-andriy.shevchenko@linux.intel.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <b43ed1f1-70e8-8d6e-d013-8ceb62e64010@st.com>
Date:   Mon, 2 Mar 2020 09:39:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200224151530.31713-32-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG5NODE2.st.com
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
>  drivers/i2c/busses/i2c-stm32f4.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index ba600d77a3f8..0a67b44f2755 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -91,7 +91,6 @@
>  #define STM32F4_I2C_MIN_STANDARD_FREQ	2U
>  #define STM32F4_I2C_MIN_FAST_FREQ	6U
>  #define STM32F4_I2C_MAX_FREQ		46U
> -#define HZ_TO_MHZ			1000000
>  
>  /**
>   * struct stm32f4_i2c_msg - client specific data
> @@ -154,7 +153,7 @@ static int stm32f4_i2c_set_periph_clk_freq(struct stm32f4_i2c_dev *i2c_dev)
>  	u32 cr2 = 0;
>  
>  	i2c_dev->parent_rate = clk_get_rate(i2c_dev->clk);
> -	freq = DIV_ROUND_UP(i2c_dev->parent_rate, HZ_TO_MHZ);
> +	freq = DIV_ROUND_UP(i2c_dev->parent_rate, HZ_PER_MHZ);
>  
>  	if (i2c_dev->speed == STM32_I2C_SPEED_STANDARD) {
>  		/*
> @@ -190,7 +189,7 @@ static int stm32f4_i2c_set_periph_clk_freq(struct stm32f4_i2c_dev *i2c_dev)
>  
>  static void stm32f4_i2c_set_rise_time(struct stm32f4_i2c_dev *i2c_dev)
>  {
> -	u32 freq = DIV_ROUND_UP(i2c_dev->parent_rate, HZ_TO_MHZ);
> +	u32 freq = DIV_ROUND_UP(i2c_dev->parent_rate, HZ_PER_MHZ);
>  	u32 trise;
>  
>  	/*
> @@ -243,7 +242,7 @@ static void stm32f4_i2c_set_speed_mode(struct stm32f4_i2c_dev *i2c_dev)
>  		 * parent rate is not higher than 46 MHz . As a result val
>  		 * is at most 8 bits wide and so fits into the CCR bits [11:0].
>  		 */
> -		val = i2c_dev->parent_rate / (100000 << 1);
> +		val = i2c_dev->parent_rate / (I2C_STANDARD_MODE_FREQ << 1);
>  	} else {
>  		/*
>  		 * In fast mode, we compute CCR with duty = 0 as with low
> @@ -263,7 +262,7 @@ static void stm32f4_i2c_set_speed_mode(struct stm32f4_i2c_dev *i2c_dev)
>  		 * parent rate is not higher than 46 MHz . As a result val
>  		 * is at most 6 bits wide and so fits into the CCR bits [11:0].
>  		 */
> -		val = DIV_ROUND_UP(i2c_dev->parent_rate, 400000 * 3);
> +		val = DIV_ROUND_UP(i2c_dev->parent_rate, I2C_FAST_MODE_FREQ * 3);
>  
>  		/* Select Fast mode */
>  		ccr |= STM32F4_I2C_CCR_FS;
> @@ -807,7 +806,7 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
>  
>  	i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
>  	ret = of_property_read_u32(np, "clock-frequency", &clk_rate);
> -	if (!ret && clk_rate >= 400000)
> +	if (!ret && clk_rate >= I2C_FAST_MODE_FREQ)
>  		i2c_dev->speed = STM32_I2C_SPEED_FAST;
>  
>  	i2c_dev->dev = &pdev->dev;
> 
