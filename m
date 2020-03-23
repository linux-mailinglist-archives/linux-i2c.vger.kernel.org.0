Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B69218F011
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 08:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbgCWHER (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 03:04:17 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:47759 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727164AbgCWHER (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Mar 2020 03:04:17 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02N72eNf002860;
        Mon, 23 Mar 2020 08:04:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=q6bInOczMw++p6k6+ZxjySLZMA/Fk+RppSY+8RV8QlA=;
 b=Y0EK9yb0IqnGAKK5EfQFlwfDKQ4TNF9gmTn6nE/84rwrfRkRy7/oXv+xZirUFoLprkHg
 JtOvuZyoIlFAPcBqFLU4PuQUxJK1D+lUN3OHOcAMOBsLD318jyNsf3dTGakfpXOwgSMl
 OwftruQNo8QPD9CWA4iXnwoPUjH09j5eqVDkBlSfZYOJDdpaoI6d9OjkIwePrNZQsb4A
 iCj+IWeGrPyGzrbw0eNz8kXO2Qqaqt2ovmtqe5qd3ghVRoWxXREU4aUeaU5o3z8unVIA
 UXVdH2Fngpdz/OGwiGjOj6ie+3NycaKG5XwZO9rVuUJdbmfxMj7T/U9thigpkZ86SmV0 Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw9jyrc6e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Mar 2020 08:04:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91785100034;
        Mon, 23 Mar 2020 08:04:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 844C221C099;
        Mon, 23 Mar 2020 08:04:04 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 23 Mar
 2020 08:04:04 +0100
Date:   Mon, 23 Mar 2020 08:04:00 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
Subject: Re: [PATCH v4 4/6] i2c: =?iso-8859-1?Q?stm?=
 =?iso-8859-1?Q?32f7=3A_switch_to_I=B2C?= generic property parsing
Message-ID: <20200323070400.GA19464@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
References: <20200320191249.28835-1-andriy.shevchenko@linux.intel.com>
 <20200320191249.28835-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200320191249.28835-4-andriy.shevchenko@linux.intel.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-23_01:2020-03-21,2020-03-23 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

Looks good for me,

Reviewed-by: Alain Volmat <alain.volmat@st.com>

Regards

On Fri, Mar 20, 2020 at 07:12:47PM +0000, Andy Shevchenko wrote:
> Switch to the new generic functions: i2c_parse_fw_timings().
> 
> While here, replace hard coded values with standard bus frequency definitions.
> 
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Alain Volmat <alain.volmat@st.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v4: fixed typo in parameter (Alain)
>  drivers/i2c/busses/i2c-stm32f7.c | 57 +++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 6418f5982894..330ffed011e0 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -344,9 +344,9 @@ struct stm32f7_i2c_dev {
>   */
>  static struct stm32f7_i2c_spec i2c_specs[] = {
>  	[STM32_I2C_SPEED_STANDARD] = {
> -		.rate = 100000,
> -		.rate_min = 80000,
> -		.rate_max = 100000,
> +		.rate = I2C_MAX_STANDARD_MODE_FREQ,
> +		.rate_min = I2C_MAX_STANDARD_MODE_FREQ * 8 / 10,	/* 80% */
> +		.rate_max = I2C_MAX_STANDARD_MODE_FREQ,
>  		.fall_max = 300,
>  		.rise_max = 1000,
>  		.hddat_min = 0,
> @@ -356,9 +356,9 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
>  		.h_min = 4000,
>  	},
>  	[STM32_I2C_SPEED_FAST] = {
> -		.rate = 400000,
> -		.rate_min = 320000,
> -		.rate_max = 400000,
> +		.rate = I2C_MAX_FAST_MODE_FREQ,
> +		.rate_min = I2C_MAX_FAST_MODE_FREQ * 8 / 10,		/* 80% */
> +		.rate_max = I2C_MAX_FAST_MODE_FREQ,
>  		.fall_max = 300,
>  		.rise_max = 300,
>  		.hddat_min = 0,
> @@ -368,9 +368,9 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
>  		.h_min = 600,
>  	},
>  	[STM32_I2C_SPEED_FAST_PLUS] = {
> -		.rate = 1000000,
> -		.rate_min = 800000,
> -		.rate_max = 1000000,
> +		.rate = I2C_MAX_FAST_MODE_PLUS_FREQ,
> +		.rate_min = I2C_MAX_FAST_MODE_PLUS_FREQ * 8 / 10,	/* 80% */
> +		.rate_max = I2C_MAX_FAST_MODE_PLUS_FREQ,
>  		.fall_max = 100,
>  		.rise_max = 120,
>  		.hddat_min = 0,
> @@ -610,8 +610,25 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  				    struct stm32f7_i2c_setup *setup)
>  {
> +	struct i2c_timings timings, *t = &timings;
>  	int ret = 0;
>  
> +	t->bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
> +	t->scl_rise_ns = i2c_dev->setup.rise_time;
> +	t->scl_fall_ns = i2c_dev->setup.fall_time;
> +
> +	i2c_parse_fw_timings(i2c_dev->dev, t, false);
> +
> +	if (t->bus_freq_hz >= I2C_MAX_FAST_MODE_PLUS_FREQ)
> +		i2c_dev->speed = STM32_I2C_SPEED_FAST_PLUS;
> +	else if (t->bus_freq_hz >= I2C_MAX_FAST_MODE_FREQ)
> +		i2c_dev->speed = STM32_I2C_SPEED_FAST;
> +	else
> +		i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
> +
> +	i2c_dev->setup.rise_time = t->scl_rise_ns;
> +	i2c_dev->setup.fall_time = t->scl_fall_ns;
> +
>  	setup->speed = i2c_dev->speed;
>  	setup->speed_freq = i2c_specs[setup->speed].rate;
>  	setup->clock_src = clk_get_rate(i2c_dev->clk);
> @@ -1914,7 +1931,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	struct stm32f7_i2c_dev *i2c_dev;
>  	const struct stm32f7_i2c_setup *setup;
>  	struct resource *res;
> -	u32 clk_rate, rise_time, fall_time;
>  	struct i2c_adapter *adap;
>  	struct reset_control *rst;
>  	dma_addr_t phy_addr;
> @@ -1961,17 +1977,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
> -	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
> -				       &clk_rate);
> -	if (!ret && clk_rate >= 1000000) {
> -		i2c_dev->speed = STM32_I2C_SPEED_FAST_PLUS;
> -	} else if (!ret && clk_rate >= 400000) {
> -		i2c_dev->speed = STM32_I2C_SPEED_FAST;
> -	} else if (!ret && clk_rate >= 100000) {
> -		i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
> -	}
> -
>  	rst = devm_reset_control_get(&pdev->dev, NULL);
>  	if (IS_ERR(rst)) {
>  		dev_err(&pdev->dev, "Error: Missing controller reset\n");
> @@ -2011,16 +2016,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	}
>  	i2c_dev->setup = *setup;
>  
> -	ret = device_property_read_u32(i2c_dev->dev, "i2c-scl-rising-time-ns",
> -				       &rise_time);
> -	if (!ret)
> -		i2c_dev->setup.rise_time = rise_time;
> -
> -	ret = device_property_read_u32(i2c_dev->dev, "i2c-scl-falling-time-ns",
> -				       &fall_time);
> -	if (!ret)
> -		i2c_dev->setup.fall_time = fall_time;
> -
>  	ret = stm32f7_i2c_setup_timing(i2c_dev, &i2c_dev->setup);
>  	if (ret)
>  		goto clk_free;
> -- 
> 2.25.1
> 
