Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC7D14A095
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 10:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbgA0JTi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 04:19:38 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:53337 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729037AbgA0JTi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 04:19:38 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00R9Cmal019871;
        Mon, 27 Jan 2020 10:19:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ueqthobvadLal6Ybw8bV50x/5p9w1/cZMHnbvGkPnpI=;
 b=Lq+cmVILX1s6L4L0ipLM7wNtDtdMFtxFhyrpkQGr1rvFDNNFbVJXpQwwQgrPP9eESOpS
 r2Gyx5T0dVDCcQbtaRdN7ZB69NiswaQ5BVb58ySxl7VTLY9xTGBy8Lb/mkhShwoGY/qf
 p6O7MEaXmWV3eiCRIhZ4ZBK+PnLukA1MT+08AM/wAQS1z9o7ZT5FVKW4rlI/wE4fCRfa
 5phCw4XzlJ4ItCnvMg5ahMmGziBEMbGpLBbqNqlRq1oi6ENTDjbigGbdTIyJlWk+LKfD
 pup8fFPL6Vv63m+Xqg0HjLc0uShB25oqUvKlFwC4WKHnernsRDHZr/RwUSbFbkuEqONl Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xrcaxr1v5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jan 2020 10:19:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8448310002A;
        Mon, 27 Jan 2020 10:19:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7855321E5DB;
        Mon, 27 Jan 2020 10:19:27 +0100 (CET)
Received: from [10.48.1.171] (10.75.127.48) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jan
 2020 10:19:26 +0100
Subject: Re: [PATCH 3/5] i2c: i2c-stm32f7: add a new st,stm32mp15-i2c
 compatible
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
 <1579795970-22319-4-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <fcd47330-2408-feb0-1ce0-127387c3f2fb@st.com>
Date:   Mon, 27 Jan 2020 10:19:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1579795970-22319-4-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-27_02:2020-01-24,2020-01-27 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 1/23/20 5:12 PM, Alain Volmat wrote:
> Add a new stm32mp15 specific compatible to handle FastMode+
> registers handling which is different on the stm32mp15 compared
> to the stm32f7 or stm32h7.
> Indeed, on the stm32mp15, the FastMode+ set and clear registers
> are separated while on the other platforms (F7 or H7) the control
> is done in a unique register.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 41 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 34 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 1a3b3fa582ff..6bee9eca789f 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -223,6 +223,7 @@ struct stm32f7_i2c_spec {
>   * @fall_time: Fall time (ns)
>   * @dnf: Digital filter coefficient (0-16)
>   * @analog_filter: Analog filter delay (On/Off)
> + * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
>   */
>  struct stm32f7_i2c_setup {
>  	enum stm32_i2c_speed speed;
> @@ -232,6 +233,7 @@ struct stm32f7_i2c_setup {
>  	u32 fall_time;
>  	u8 dnf;
>  	bool analog_filter;
> +	u32 fmp_clr_offset;
>  };
>  
>  /**
> @@ -303,8 +305,9 @@ struct stm32f7_i2c_msg {
>   * @dma: dma data
>   * @use_dma: boolean to know if dma is used in the current transfer
>   * @regmap: holds SYSCFG phandle for Fast Mode Plus bits
> - * @regmap_reg: register address for setting Fast Mode Plus bits
> - * @regmap_mask: mask for Fast Mode Plus bits in set register
> + * @regmap_sreg: register address for setting Fast Mode Plus bits
> + * @regmap_creg: register address for clearing Fast Mode Plus bits
> + * @regmap_mask: mask for Fast Mode Plus bits
>   * @wakeup_src: boolean to know if the device is a wakeup source
>   */
>  struct stm32f7_i2c_dev {
> @@ -328,7 +331,8 @@ struct stm32f7_i2c_dev {
>  	struct stm32_i2c_dma *dma;
>  	bool use_dma;
>  	struct regmap *regmap;
> -	u32 regmap_reg;
> +	u32 regmap_sreg;
> +	u32 regmap_creg;
>  	u32 regmap_mask;
>  	bool wakeup_src;
>  };
> @@ -386,6 +390,14 @@ static const struct stm32f7_i2c_setup stm32f7_setup = {
>  	.analog_filter = STM32F7_I2C_ANALOG_FILTER_ENABLE,
>  };
>  
> +static const struct stm32f7_i2c_setup stm32mp15_setup = {
> +	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
> +	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
> +	.dnf = STM32F7_I2C_DNF_DEFAULT,
> +	.analog_filter = STM32F7_I2C_ANALOG_FILTER_ENABLE,
> +	.fmp_clr_offset = 0x40,
> +};
> +
>  static inline void stm32f7_i2c_set_bits(void __iomem *reg, u32 mask)
>  {
>  	writel_relaxed(readl_relaxed(reg) | mask, reg);
> @@ -1822,15 +1834,26 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
>  static int stm32f7_i2c_write_fm_plus_bits(struct stm32f7_i2c_dev *i2c_dev,
>  					  bool enable)
>  {
> +	int ret;
> +
>  	if (i2c_dev->speed != STM32_I2C_SPEED_FAST_PLUS ||
>  	    IS_ERR_OR_NULL(i2c_dev->regmap)) {
>  		/* Optional */
>  		return 0;
>  	}
>  
> -	return regmap_update_bits(i2c_dev->regmap, i2c_dev->regmap_reg,
> -				  i2c_dev->regmap_mask,
> -				  enable ? i2c_dev->regmap_mask : 0);
> +	if (i2c_dev->regmap_sreg == i2c_dev->regmap_creg)
> +		ret = regmap_update_bits(i2c_dev->regmap,
> +					 i2c_dev->regmap_sreg,
> +					 i2c_dev->regmap_mask,
> +					 enable ? i2c_dev->regmap_mask : 0);
> +	else
> +		ret = regmap_write(i2c_dev->regmap,
> +				   enable ? i2c_dev->regmap_sreg :
> +					    i2c_dev->regmap_creg,
> +				   i2c_dev->regmap_mask);
> +
> +	return ret;
>  }
>  
>  static int stm32f7_i2c_setup_fm_plus_bits(struct platform_device *pdev,
> @@ -1846,10 +1869,13 @@ static int stm32f7_i2c_setup_fm_plus_bits(struct platform_device *pdev,
>  	}
>  
>  	ret = of_property_read_u32_index(np, "st,syscfg-fmp", 1,
> -					 &i2c_dev->regmap_reg);
> +					 &i2c_dev->regmap_sreg);
>  	if (ret)
>  		return ret;
>  
> +	i2c_dev->regmap_creg = i2c_dev->regmap_sreg +
> +			       i2c_dev->setup.fmp_clr_offset;
> +
>  	ret = of_property_read_u32_index(np, "st,syscfg-fmp", 2,
>  					 &i2c_dev->regmap_mask);
>  	if (ret)
> @@ -2271,6 +2297,7 @@ static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
>  
>  static const struct of_device_id stm32f7_i2c_match[] = {
>  	{ .compatible = "st,stm32f7-i2c", .data = &stm32f7_setup},
> +	{ .compatible = "st,stm32mp15-i2c", .data = &stm32mp15_setup},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, stm32f7_i2c_match);
> 
