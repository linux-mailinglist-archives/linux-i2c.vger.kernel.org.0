Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A95A31155B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 23:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbhBEW3L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 17:29:11 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:22646 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232546AbhBEOUS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Feb 2021 09:20:18 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 115Er346020196;
        Fri, 5 Feb 2021 15:59:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rUxu5cd8zs1S0hDva5uNHDkNRW8BgOj2qVMzSr7soKY=;
 b=2htJvUGKQ2iCpg24MMwE3qBXxTPpRSznfsmlKUcDhwtc6GqUcz0KNLwccDMOpuXfvBns
 THzSqxznc2MGfg/oBu8n6n3UegksFryuYDHOHnBT4Ek3QUi2ysCToB4VTc8d0veKCK90
 nNvuW+62MG3r8sMzEtv1L12/HfDLLc9H+HbH5o4TR/yn36ayhnCVSiARWlYbPuunGE+5
 DvngZg1TEp3URQBznGYg2DlLKmyZJj39BHmkJMQiZ+b1B2ZRedbuR7MJUrEarKJzMy16
 QwwQvgQ+Y3ch4/17KWZDH0GVgQqBBvefcldaV+DY3gP+sA+DnP9DIieh8voFWb2EHqZU Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36d0nsg9yg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 05 Feb 2021 15:59:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2AD6610002A;
        Fri,  5 Feb 2021 15:59:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C31A2402BC;
        Fri,  5 Feb 2021 15:59:21 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb
 2021 15:59:20 +0100
Subject: Re: [PATCH 3/5] i2c: stm32f7: add support for DNF i2c-digital-filter
 binding
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-4-git-send-email-alain.volmat@foss.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <be1c42b6-c86b-7f17-bf50-f2f67ddb88af@foss.st.com>
Date:   Fri, 5 Feb 2021 15:59:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612515104-838-4-git-send-email-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
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
> Add the support for the i2c-digital-filter binding, allowing to enable
> the digital filter via the device-tree and indicate its value in the DT.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 0c539fea2754..f77cd6512a86 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -222,7 +222,6 @@ struct stm32f7_i2c_spec {
>   * @clock_src: I2C clock source frequency (Hz)
>   * @rise_time: Rise time (ns)
>   * @fall_time: Fall time (ns)
> - * @dnf: Digital filter coefficient (0-16)
>   * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
>   */
>  struct stm32f7_i2c_setup {
> @@ -230,7 +229,6 @@ struct stm32f7_i2c_setup {
>  	u32 clock_src;
>  	u32 rise_time;
>  	u32 fall_time;
> -	u8 dnf;
>  	u32 fmp_clr_offset;
>  };
>  
> @@ -310,6 +308,8 @@ struct stm32f7_i2c_msg {
>   * @smbus_mode: states that the controller is configured in SMBus mode
>   * @host_notify_client: SMBus host-notify client
>   * @analog_filter: boolean to indicate enabling of the analog filter
> + * @dnf_dt: value of digital filter requested via dt
> + * @dnf: value of digital filter to apply
>   */
>  struct stm32f7_i2c_dev {
>  	struct i2c_adapter adap;
> @@ -339,6 +339,8 @@ struct stm32f7_i2c_dev {
>  	bool smbus_mode;
>  	struct i2c_client *host_notify_client;
>  	bool analog_filter;
> +	u32 dnf_dt;
> +	u32 dnf;
>  };
>  
>  /*
> @@ -384,13 +386,11 @@ static struct stm32f7_i2c_spec stm32f7_i2c_specs[] = {
>  static const struct stm32f7_i2c_setup stm32f7_setup = {
>  	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
>  	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
> -	.dnf = STM32F7_I2C_DNF_DEFAULT,
>  };
>  
>  static const struct stm32f7_i2c_setup stm32mp15_setup = {
>  	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
>  	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
> -	.dnf = STM32F7_I2C_DNF_DEFAULT,
>  	.fmp_clr_offset = 0x40,
>  };
>  
> @@ -459,10 +459,11 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  		return -EINVAL;
>  	}
>  
> -	if (setup->dnf > STM32F7_I2C_DNF_MAX) {
> +	i2c_dev->dnf = DIV_ROUND_CLOSEST(i2c_dev->dnf_dt, i2cclk);
> +	if (i2c_dev->dnf > STM32F7_I2C_DNF_MAX) {
>  		dev_err(i2c_dev->dev,
>  			"DNF out of bound %d/%d\n",
> -			setup->dnf, STM32F7_I2C_DNF_MAX);
> +			i2c_dev->dnf * i2cclk, STM32F7_I2C_DNF_MAX * i2cclk);
>  		return -EINVAL;
>  	}
>  
> @@ -473,13 +474,13 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  	af_delay_max =
>  		(i2c_dev->analog_filter ?
>  		 STM32F7_I2C_ANALOG_FILTER_DELAY_MAX : 0);
> -	dnf_delay = setup->dnf * i2cclk;
> +	dnf_delay = i2c_dev->dnf * i2cclk;
>  
>  	sdadel_min = specs->hddat_min + setup->fall_time -
> -		af_delay_min - (setup->dnf + 3) * i2cclk;
> +		af_delay_min - (i2c_dev->dnf + 3) * i2cclk;
>  
>  	sdadel_max = specs->vddat_max - setup->rise_time -
> -		af_delay_max - (setup->dnf + 4) * i2cclk;
> +		af_delay_max - (i2c_dev->dnf + 4) * i2cclk;
>  
>  	scldel_min = setup->rise_time + specs->sudat_min;
>  
> @@ -645,6 +646,7 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  	setup->speed_freq = t->bus_freq_hz;
>  	i2c_dev->setup.rise_time = t->scl_rise_ns;
>  	i2c_dev->setup.fall_time = t->scl_fall_ns;
> +	i2c_dev->dnf_dt = t->digital_filter_width_ns;
>  	setup->clock_src = clk_get_rate(i2c_dev->clk);
>  
>  	if (!setup->clock_src) {
> @@ -652,6 +654,9 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  		return -EINVAL;
>  	}
>  
> +	if (!of_property_read_bool(i2c_dev->dev->of_node, "i2c-digital-filter"))
> +		i2c_dev->dnf_dt = STM32F7_I2C_DNF_DEFAULT;
> +
>  	do {
>  		ret = stm32f7_i2c_compute_timing(i2c_dev, setup,
>  						 &i2c_dev->timing);
> @@ -681,7 +686,7 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
>  		setup->rise_time, setup->fall_time);
>  	dev_dbg(i2c_dev->dev, "I2C Analog Filter(%s), DNF(%i)\n",
> -		(i2c_dev->analog_filter ? "On" : "Off"), setup->dnf);
> +		(i2c_dev->analog_filter ? "On" : "Off"), i2c_dev->dnf);
>  
>  	i2c_dev->bus_rate = setup->speed_freq;
>  
> @@ -732,7 +737,7 @@ static void stm32f7_i2c_hw_config(struct stm32f7_i2c_dev *i2c_dev)
>  	stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1,
>  			     STM32F7_I2C_CR1_DNF_MASK);
>  	stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1,
> -			     STM32F7_I2C_CR1_DNF(i2c_dev->setup.dnf));
> +			     STM32F7_I2C_CR1_DNF(i2c_dev->dnf));
>  
>  	stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1,
>  			     STM32F7_I2C_CR1_PE);
> 

-- 
--
~ Py MORDRET
--
