Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76F831976EC
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Mar 2020 10:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbgC3Is0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Mar 2020 04:48:26 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:8726 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729422AbgC3Is0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Mar 2020 04:48:26 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02U8h3Ox024505;
        Mon, 30 Mar 2020 10:48:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=vTy92sv00CxuFV+cNS/2Kf+W70cjMIce9Yb3a+cK9pI=;
 b=T+WsUN/ROngylVJApuHtDTDgnYiCKPjyoiIRdq6H1MDwE9AKoVPV2FO/i4LefMO/jLSe
 pmbEED76M2HyQnV3diBCoS1Au+PTv+3Ft2PpqYXHTjIK1rANUHCYWG47950JGOQ5q530
 ZooHTYu7SW18FBOv2132l1w9L6PqyI6Dm7TkcvggTLMWfBFOAnZmyfrEglZHhdMEaSiR
 13m4VPzkCA9FOtrcH1Z9v1zuteNcrDqpxJZYfxc4ekPlx1YjzU6lU4Qk4fqOIMwM4V7V
 TLt0JnEukvOqA2P+DwA+HSeGTsIV1BIypTHdR3rHrmyna1VKQf91pZ58yXJ0x63RIo1u wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 301vkdgtge-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 30 Mar 2020 10:48:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34C0A100038;
        Mon, 30 Mar 2020 10:48:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 198342A553C;
        Mon, 30 Mar 2020 10:48:09 +0200 (CEST)
Received: from [10.131.224.211] (10.75.127.51) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 30 Mar
 2020 10:48:07 +0200
Subject: Re: [PATCH v2 2/2] i2c: i2c-stm32f7: allows for any bus frequency
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1585226661-26262-1-git-send-email-alain.volmat@st.com>
 <1585226661-26262-3-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <7f9fe76a-92b0-11a0-3674-ee9354940b39@st.com>
Date:   Mon, 30 Mar 2020 10:48:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1585226661-26262-3-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-30_01:2020-03-27,2020-03-30 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello guys

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 3/26/20 1:44 PM, Alain Volmat wrote:
> Do not limitate to the 3 (100KHz, 400KHz, 1MHz) bus frequency but
> instead allows any frequency (if it matches timing requirements).
> Depending on the requested frequency, use the spec data from either
> Standard, Fast or Fast Plus mode.
> 
> Hardcoding of min/max bus frequencies is removed and is instead computed.
> 
> The driver do not use anymore speed identifier but instead handle
> directly the frequency and figure out the spec data (necessary
> for the computation of the timing register) based on the frequency.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
> v2: remove wrong "NOT REACHED" comment
>     simplify get_lower_rate function
> 
>  drivers/i2c/busses/i2c-stm32f7.c | 115 ++++++++++++++++---------------
>  1 file changed, 60 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 330ffed011e0..f369f086b9d0 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -189,8 +189,6 @@ struct stm32f7_i2c_regs {
>  /**
>   * struct stm32f7_i2c_spec - private i2c specification timing
>   * @rate: I2C bus speed (Hz)
> - * @rate_min: 80% of I2C bus speed (Hz)
> - * @rate_max: 100% of I2C bus speed (Hz)
>   * @fall_max: Max fall time of both SDA and SCL signals (ns)
>   * @rise_max: Max rise time of both SDA and SCL signals (ns)
>   * @hddat_min: Min data hold time (ns)
> @@ -201,8 +199,6 @@ struct stm32f7_i2c_regs {
>   */
>  struct stm32f7_i2c_spec {
>  	u32 rate;
> -	u32 rate_min;
> -	u32 rate_max;
>  	u32 fall_max;
>  	u32 rise_max;
>  	u32 hddat_min;
> @@ -214,7 +210,6 @@ struct stm32f7_i2c_spec {
>  
>  /**
>   * struct stm32f7_i2c_setup - private I2C timing setup parameters
> - * @speed: I2C speed mode (standard, Fast Plus)
>   * @speed_freq: I2C speed frequency  (Hz)
>   * @clock_src: I2C clock source frequency (Hz)
>   * @rise_time: Rise time (ns)
> @@ -224,7 +219,6 @@ struct stm32f7_i2c_spec {
>   * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
>   */
>  struct stm32f7_i2c_setup {
> -	enum stm32_i2c_speed speed;
>  	u32 speed_freq;
>  	u32 clock_src;
>  	u32 rise_time;
> @@ -287,7 +281,7 @@ struct stm32f7_i2c_msg {
>   * @base: virtual memory area
>   * @complete: completion of I2C message
>   * @clk: hw i2c clock
> - * @speed: I2C clock frequency of the controller. Standard, Fast or Fast+
> + * @bus_rate: I2C clock frequency of the controller
>   * @msg: Pointer to data to be written
>   * @msg_num: number of I2C messages to be executed
>   * @msg_id: message identifiant
> @@ -314,7 +308,7 @@ struct stm32f7_i2c_dev {
>  	void __iomem *base;
>  	struct completion complete;
>  	struct clk *clk;
> -	int speed;
> +	unsigned int bus_rate;
>  	struct i2c_msg *msg;
>  	unsigned int msg_num;
>  	unsigned int msg_id;
> @@ -343,10 +337,8 @@ struct stm32f7_i2c_dev {
>   * and Fast-mode Plus I2C-bus devices
>   */
>  static struct stm32f7_i2c_spec i2c_specs[] = {
> -	[STM32_I2C_SPEED_STANDARD] = {
> +	{
>  		.rate = I2C_MAX_STANDARD_MODE_FREQ,
> -		.rate_min = I2C_MAX_STANDARD_MODE_FREQ * 8 / 10,	/* 80% */
> -		.rate_max = I2C_MAX_STANDARD_MODE_FREQ,
>  		.fall_max = 300,
>  		.rise_max = 1000,
>  		.hddat_min = 0,
> @@ -355,10 +347,8 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
>  		.l_min = 4700,
>  		.h_min = 4000,
>  	},
> -	[STM32_I2C_SPEED_FAST] = {
> +	{
>  		.rate = I2C_MAX_FAST_MODE_FREQ,
> -		.rate_min = I2C_MAX_FAST_MODE_FREQ * 8 / 10,		/* 80% */
> -		.rate_max = I2C_MAX_FAST_MODE_FREQ,
>  		.fall_max = 300,
>  		.rise_max = 300,
>  		.hddat_min = 0,
> @@ -367,10 +357,8 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
>  		.l_min = 1300,
>  		.h_min = 600,
>  	},
> -	[STM32_I2C_SPEED_FAST_PLUS] = {
> +	{
>  		.rate = I2C_MAX_FAST_MODE_PLUS_FREQ,
> -		.rate_min = I2C_MAX_FAST_MODE_PLUS_FREQ * 8 / 10,	/* 80% */
> -		.rate_max = I2C_MAX_FAST_MODE_PLUS_FREQ,
>  		.fall_max = 100,
>  		.rise_max = 120,
>  		.hddat_min = 0,
> @@ -411,10 +399,23 @@ static void stm32f7_i2c_disable_irq(struct stm32f7_i2c_dev *i2c_dev, u32 mask)
>  	stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1, mask);
>  }
>  
> +static struct stm32f7_i2c_spec *get_specs(u32 rate)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(i2c_specs); i++)
> +		if (rate <= i2c_specs[i].rate)
> +			return &i2c_specs[i];
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +#define	RATE_MIN(rate)	(rate * 8 / 10)
>  static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  				      struct stm32f7_i2c_setup *setup,
>  				      struct stm32f7_i2c_timings *output)
>  {
> +	struct stm32f7_i2c_spec *specs;
>  	u32 p_prev = STM32F7_PRESC_MAX;
>  	u32 i2cclk = DIV_ROUND_CLOSEST(NSEC_PER_SEC,
>  				       setup->clock_src);
> @@ -432,18 +433,19 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  	u16 p, l, a, h;
>  	int ret = 0;
>  
> -	if (setup->speed >= STM32_I2C_SPEED_END) {
> -		dev_err(i2c_dev->dev, "speed out of bound {%d/%d}\n",
> -			setup->speed, STM32_I2C_SPEED_END - 1);
> +	specs = get_specs(setup->speed_freq);
> +	if (specs == ERR_PTR(-EINVAL)) {
> +		dev_err(i2c_dev->dev, "speed out of bound {%d}\n",
> +			setup->speed_freq);
>  		return -EINVAL;
>  	}
>  
> -	if ((setup->rise_time > i2c_specs[setup->speed].rise_max) ||
> -	    (setup->fall_time > i2c_specs[setup->speed].fall_max)) {
> +	if ((setup->rise_time > specs->rise_max) ||
> +	    (setup->fall_time > specs->fall_max)) {
>  		dev_err(i2c_dev->dev,
>  			"timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
> -			setup->rise_time, i2c_specs[setup->speed].rise_max,
> -			setup->fall_time, i2c_specs[setup->speed].fall_max);
> +			setup->rise_time, specs->rise_max,
> +			setup->fall_time, specs->fall_max);
>  		return -EINVAL;
>  	}
>  
> @@ -454,12 +456,6 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  		return -EINVAL;
>  	}
>  
> -	if (setup->speed_freq > i2c_specs[setup->speed].rate) {
> -		dev_err(i2c_dev->dev, "ERROR: Freq {%d/%d}\n",
> -			setup->speed_freq, i2c_specs[setup->speed].rate);
> -		return -EINVAL;
> -	}
> -
>  	/*  Analog and Digital Filters */
>  	af_delay_min =
>  		(setup->analog_filter ?
> @@ -469,13 +465,13 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  		 STM32F7_I2C_ANALOG_FILTER_DELAY_MAX : 0);
>  	dnf_delay = setup->dnf * i2cclk;
>  
> -	sdadel_min = i2c_specs[setup->speed].hddat_min + setup->fall_time -
> +	sdadel_min = specs->hddat_min + setup->fall_time -
>  		af_delay_min - (setup->dnf + 3) * i2cclk;
>  
> -	sdadel_max = i2c_specs[setup->speed].vddat_max - setup->rise_time -
> +	sdadel_max = specs->vddat_max - setup->rise_time -
>  		af_delay_max - (setup->dnf + 4) * i2cclk;
>  
> -	scldel_min = setup->rise_time + i2c_specs[setup->speed].sudat_min;
> +	scldel_min = setup->rise_time + specs->sudat_min;
>  
>  	if (sdadel_min < 0)
>  		sdadel_min = 0;
> @@ -530,8 +526,8 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  
>  	tsync = af_delay_min + dnf_delay + (2 * i2cclk);
>  	s = NULL;
> -	clk_max = NSEC_PER_SEC / i2c_specs[setup->speed].rate_min;
> -	clk_min = NSEC_PER_SEC / i2c_specs[setup->speed].rate_max;
> +	clk_max = NSEC_PER_SEC / RATE_MIN(setup->speed_freq);
> +	clk_min = NSEC_PER_SEC / setup->speed_freq;
>  
>  	/*
>  	 * Among Prescaler possibilities discovered above figures out SCL Low
> @@ -549,7 +545,7 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  		for (l = 0; l < STM32F7_SCLL_MAX; l++) {
>  			u32 tscl_l = (l + 1) * prescaler + tsync;
>  
> -			if ((tscl_l < i2c_specs[setup->speed].l_min) ||
> +			if ((tscl_l < specs->l_min) ||
>  			    (i2cclk >=
>  			     ((tscl_l - af_delay_min - dnf_delay) / 4))) {
>  				continue;
> @@ -561,7 +557,7 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  					setup->rise_time + setup->fall_time;
>  
>  				if ((tscl >= clk_min) && (tscl <= clk_max) &&
> -				    (tscl_h >= i2c_specs[setup->speed].h_min) &&
> +				    (tscl_h >= specs->h_min) &&
>  				    (i2cclk < tscl_h)) {
>  					int clk_error = tscl - i2cbus;
>  
> @@ -607,6 +603,17 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
>  	return ret;
>  }
>  
> +static u32 get_lower_rate(u32 rate)
> +{
> +	int i = ARRAY_SIZE(i2c_specs);
> +
> +	while (i--)
> +		if (i2c_specs[i].rate < rate)
> +			break;
> +
> +	return i2c_specs[i].rate;
> +}
> +
>  static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  				    struct stm32f7_i2c_setup *setup)
>  {
> @@ -619,18 +626,15 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  
>  	i2c_parse_fw_timings(i2c_dev->dev, t, false);
>  
> -	if (t->bus_freq_hz >= I2C_MAX_FAST_MODE_PLUS_FREQ)
> -		i2c_dev->speed = STM32_I2C_SPEED_FAST_PLUS;
> -	else if (t->bus_freq_hz >= I2C_MAX_FAST_MODE_FREQ)
> -		i2c_dev->speed = STM32_I2C_SPEED_FAST;
> -	else
> -		i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
> +	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
> +		dev_err(i2c_dev->dev, "Invalid bus speed (%i>%i)\n",
> +			t->bus_freq_hz, I2C_MAX_FAST_MODE_PLUS_FREQ);
> +		return -EINVAL;
> +	}
>  
> +	setup->speed_freq = t->bus_freq_hz;
>  	i2c_dev->setup.rise_time = t->scl_rise_ns;
>  	i2c_dev->setup.fall_time = t->scl_fall_ns;
> -
> -	setup->speed = i2c_dev->speed;
> -	setup->speed_freq = i2c_specs[setup->speed].rate;
>  	setup->clock_src = clk_get_rate(i2c_dev->clk);
>  
>  	if (!setup->clock_src) {
> @@ -644,14 +648,12 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  		if (ret) {
>  			dev_err(i2c_dev->dev,
>  				"failed to compute I2C timings.\n");
> -			if (i2c_dev->speed > STM32_I2C_SPEED_STANDARD) {
> -				i2c_dev->speed--;
> -				setup->speed = i2c_dev->speed;
> +			if (setup->speed_freq > I2C_MAX_STANDARD_MODE_FREQ) {
>  				setup->speed_freq =
> -					i2c_specs[setup->speed].rate;
> +					get_lower_rate(setup->speed_freq);
>  				dev_warn(i2c_dev->dev,
>  					 "downgrade I2C Speed Freq to (%i)\n",
> -					 i2c_specs[setup->speed].rate);
> +					 setup->speed_freq);
>  			} else {
>  				break;
>  			}
> @@ -663,13 +665,15 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  		return ret;
>  	}
>  
> -	dev_dbg(i2c_dev->dev, "I2C Speed(%i), Freq(%i), Clk Source(%i)\n",
> -		setup->speed, setup->speed_freq, setup->clock_src);
> +	dev_dbg(i2c_dev->dev, "I2C Speed(%i), Clk Source(%i)\n",
> +		setup->speed_freq, setup->clock_src);
>  	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
>  		setup->rise_time, setup->fall_time);
>  	dev_dbg(i2c_dev->dev, "I2C Analog Filter(%s), DNF(%i)\n",
>  		(setup->analog_filter ? "On" : "Off"), setup->dnf);
>  
> +	i2c_dev->bus_rate = setup->speed_freq;
> +
>  	return 0;
>  }
>  
> @@ -1866,7 +1870,7 @@ static int stm32f7_i2c_write_fm_plus_bits(struct stm32f7_i2c_dev *i2c_dev,
>  {
>  	int ret;
>  
> -	if (i2c_dev->speed != STM32_I2C_SPEED_FAST_PLUS ||
> +	if (i2c_dev->bus_rate <= I2C_MAX_FAST_MODE_FREQ ||
>  	    IS_ERR_OR_NULL(i2c_dev->regmap))
>  		/* Optional */
>  		return 0;
> @@ -2020,7 +2024,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto clk_free;
>  
> -	if (i2c_dev->speed == STM32_I2C_SPEED_FAST_PLUS) {
> +	/* Setup Fast mode plus if necessary */
> +	if (i2c_dev->bus_rate > I2C_MAX_FAST_MODE_FREQ) {
>  		ret = stm32f7_i2c_setup_fm_plus_bits(pdev, i2c_dev);
>  		if (ret)
>  			goto clk_free;
> 
