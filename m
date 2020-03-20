Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D54B18C8ED
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 09:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgCTIX6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 04:23:58 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:3328 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726527AbgCTIX5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Mar 2020 04:23:57 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02K8D0WO029961;
        Fri, 20 Mar 2020 09:23:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=IVUdMwNLOHv5Z1dR+oJVPCmPMgRPVCuDODoFxr3S/1A=;
 b=xKXSF7ZozlWL15opO3RIct5JePmpcU1xdxRQkj+X+QPYXB9AKFG3wDfZMMJ28l6U0/Sf
 yvMus/ZqkI/YIEJvyUvhIGjI8MzKKtWWx2fbmk94hQhjEyDgsu8QTRvdcIyZt7yMEK1J
 5GsPcpM0t+f/bxPBBuAJHrrlQOSZ6UMDo4vA3PSOhuFVNcT5J55ZHQnckCGFkFlFtJnz
 4VwXnSgdNt0bZblQu8fsMPCXpPutX1HSCOonrilvAh/KxMqHNLW/6YaIEpwe8Z4N+jOP
 o0EbHt+DSTvvxZZRzPJ6pD830aprxz+tSuCTN8UJXkkV98Dyr1OCtS4SWMIS3fAnfUC5 IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yu6xdpuc1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 Mar 2020 09:23:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 344C510002A;
        Fri, 20 Mar 2020 09:23:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26B13220963;
        Fri, 20 Mar 2020 09:23:48 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 20 Mar
 2020 09:23:47 +0100
Date:   Fri, 20 Mar 2020 09:23:42 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v3 4/6] i2c: =?iso-8859-1?Q?stm?=
 =?iso-8859-1?Q?32f7=3A_switch_to_I=B2C?= generic property parsing
Message-ID: <20200320082342.GA30425@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
References: <20200316154929.20886-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200316154929.20886-4-andriy.shevchenko@linux.intel.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-20_01:2020-03-19,2020-03-20 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 16, 2020 at 05:49:27PM +0200, Andy Shevchenko wrote:
> Switch to the new generic functions: i2c_parse_fw_timings().
> 
> While here, replace hard coded values with standard bus frequency definitions.
> 
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v3: new patch instead of simple frequency conversion
>  drivers/i2c/busses/i2c-stm32f7.c | 57 +++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 6418f5982894..18f231f631f5 100644
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
> +	i2c_parse_fw_timings(&pdev->dev, t, false);

Andy, thanks for the patch.
Looks fine overall, apart from the above line which should be

        i2c_parse_fw_timings(i2c_dev->dev, t, false);

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
