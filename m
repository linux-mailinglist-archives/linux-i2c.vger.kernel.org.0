Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEBCE311172
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 20:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbhBESC4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 13:02:56 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51453 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233208AbhBEPWb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Feb 2021 10:22:31 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 115Ew7va006820;
        Fri, 5 Feb 2021 15:59:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=y9uOPV8cFboy9YY1yKj94wk8lrFJp4minMTR/xd3fpY=;
 b=qAILEEd2+7MNbDexsCJwB3FPRdBbVrh0Xy04dgBTAymBBsQWz070cGEnSFBL/7v7Jbdg
 pk3oDiuoJp4mKv70YmBjFowoOBVxQwdRSBvP66PxGt82EWWPOJ+WUiUwjuxQdeN2OLe9
 W6O+7tMxPlP+etNFOq7fyT5+CvkABTW4CHvfgzJyA3rsxy+oqPVlqJqce/+CpaCn7wyN
 BGPxeRYB3jQkKSQpFduK/LdwlHPf4035UYVQA1zQyNvFID6I5l6AQ9O7F23tkFhg7hUz
 WSFk0Y50g5LSH4ek6no4I6HRj6RGX50IsuRagbCq1eVZVmgF0L1ZlQtXV+jiptiVCU7H mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36d0fsfg95-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 Feb 2021 15:59:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2244F10002A;
        Fri,  5 Feb 2021 15:59:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2871240295;
        Fri,  5 Feb 2021 15:58:59 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb
 2021 15:58:58 +0100
Subject: Re: [PATCH 2/5] i2c: stm32f7: support DT binding i2c-analog-filter
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-3-git-send-email-alain.volmat@foss.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <d39593ea-ef47-5688-202b-66458f13ecc8@foss.st.com>
Date:   Fri, 5 Feb 2021 15:58:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612515104-838-3-git-send-email-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-05_09:2021-02-05,2021-02-05 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello all

Looks good to me

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

On 2/5/21 9:51 AM, Alain Volmat wrote:
> Replace driver internally coded enabling/disabling of the
> analog-filter with the DT binding "i2c-analog-filter".
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 473fbe144b7e..0c539fea2754 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -164,7 +164,6 @@ enum {
>  #define STM32F7_I2C_DNF_DEFAULT			0
>  #define STM32F7_I2C_DNF_MAX			15
>  
> -#define STM32F7_I2C_ANALOG_FILTER_ENABLE	1
>  #define STM32F7_I2C_ANALOG_FILTER_DELAY_MIN	50	/* ns */
>  #define STM32F7_I2C_ANALOG_FILTER_DELAY_MAX	260	/* ns */
>  
> @@ -224,7 +223,6 @@ struct stm32f7_i2c_spec {
>   * @rise_time: Rise time (ns)
>   * @fall_time: Fall time (ns)
>   * @dnf: Digital filter coefficient (0-16)
> - * @analog_filter: Analog filter delay (On/Off)
>   * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
>   */
>  struct stm32f7_i2c_setup {
> @@ -233,7 +231,6 @@ struct stm32f7_i2c_setup {
>  	u32 rise_time;
>  	u32 fall_time;
>  	u8 dnf;
> -	bool analog_filter;
>  	u32 fmp_clr_offset;
>  };
>  
> @@ -312,6 +309,7 @@ struct stm32f7_i2c_msg {
>   * @wakeup_src: boolean to know if the device is a wakeup source
>   * @smbus_mode: states that the controller is configured in SMBus mode
>   * @host_notify_client: SMBus host-notify client
> + * @analog_filter: boolean to indicate enabling of the analog filter
>   */
>  struct stm32f7_i2c_dev {
>  	struct i2c_adapter adap;
> @@ -340,6 +338,7 @@ struct stm32f7_i2c_dev {
>  	bool wakeup_src;
>  	bool smbus_mode;
>  	struct i2c_client *host_notify_client;
> +	bool analog_filter;
>  };
>  
>  /*
> @@ -386,14 +385,12 @@ static const struct stm32f7_i2c_setup stm32f7_setup = {
>  	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
>  	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
>  	.dnf = STM32F7_I2C_DNF_DEFAULT,
> -	.analog_filter = STM32F7_I2C_ANALOG_FILTER_ENABLE,
>  };
>  
>  static const struct stm32f7_i2c_setup stm32mp15_setup = {
>  	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
>  	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
>  	.dnf = STM32F7_I2C_DNF_DEFAULT,
> -	.analog_filter = STM32F7_I2C_ANALOG_FILTER_ENABLE,
>  	.fmp_clr_offset = 0x40,
>  };
>  
> @@ -471,10 +468,10 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  
>  	/*  Analog and Digital Filters */
>  	af_delay_min =
> -		(setup->analog_filter ?
> +		(i2c_dev->analog_filter ?
>  		 STM32F7_I2C_ANALOG_FILTER_DELAY_MIN : 0);
>  	af_delay_max =
> -		(setup->analog_filter ?
> +		(i2c_dev->analog_filter ?
>  		 STM32F7_I2C_ANALOG_FILTER_DELAY_MAX : 0);
>  	dnf_delay = setup->dnf * i2cclk;
>  
> @@ -676,12 +673,15 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  		return ret;
>  	}
>  
> +	i2c_dev->analog_filter = of_property_read_bool(i2c_dev->dev->of_node,
> +						       "i2c-analog-filter");
> +
>  	dev_dbg(i2c_dev->dev, "I2C Speed(%i), Clk Source(%i)\n",
>  		setup->speed_freq, setup->clock_src);
>  	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
>  		setup->rise_time, setup->fall_time);
>  	dev_dbg(i2c_dev->dev, "I2C Analog Filter(%s), DNF(%i)\n",
> -		(setup->analog_filter ? "On" : "Off"), setup->dnf);
> +		(i2c_dev->analog_filter ? "On" : "Off"), setup->dnf);
>  
>  	i2c_dev->bus_rate = setup->speed_freq;
>  
> @@ -720,8 +720,8 @@ static void stm32f7_i2c_hw_config(struct stm32f7_i2c_dev *i2c_dev)
>  	timing |= STM32F7_I2C_TIMINGR_SCLL(t->scll);
>  	writel_relaxed(timing, i2c_dev->base + STM32F7_I2C_TIMINGR);
>  
> -	/* Enable I2C */
> -	if (i2c_dev->setup.analog_filter)
> +	/* Configure the Analog Filter */
> +	if (i2c_dev->analog_filter)
>  		stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1,
>  				     STM32F7_I2C_CR1_ANFOFF);
>  	else
> 

-- 
--
~ Py MORDRET
--
