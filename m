Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E843153414
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2020 16:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgBEPkS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Feb 2020 10:40:18 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:36702 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726592AbgBEPkS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Feb 2020 10:40:18 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 015FWwvf008590;
        Wed, 5 Feb 2020 16:40:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=WdNadQvxNBXO+0tm2iC0eiSJG8J7/mehWsNGj64gZlw=;
 b=STDP4ci2p3F4IwppsnFjj8Y6G5zVYxUOAGHB5d/lgrSWq0HWHgEeacREUenF0JBZBxH/
 dXysb9Oi0dLO87O832Vw5/0A7cGf7adsyWixRC5BkCI3b1sQQj0erUs36Gx3K78ln5y0
 xEoxuG+zqnHcvcFS583IweXAsgv3G6524QnFJoPJ0UOaPFN3QDxHWGPX55q/OCmK1oRW
 0yX0d4X1UDo60DwNrzzCHPHXftvDX5mFSxTHj/J/euC8n+v+JJOLp+bv+0VuBM7UJwsl
 QuJERc6xmLC4TTCqEx2CFOwcwdl/26WgrAmGwh424pmVf8vZFlXao4vwoKIVTMVqTRBT xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xyhktqwj6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Feb 2020 16:40:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30698100038;
        Wed,  5 Feb 2020 16:40:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B8462C38AF;
        Wed,  5 Feb 2020 16:40:01 +0100 (CET)
Received: from [10.48.1.171] (10.75.127.44) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Feb
 2020 16:40:00 +0100
Subject: Re: [PATCHv2] i2c: i2c-stm32f7: allow controller to be wakeup-source
To:     Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1580752328-26009-1-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <883584b6-ceab-b199-3118-e801e5109e10@st.com>
Date:   Wed, 5 Feb 2020 16:40:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1580752328-26009-1-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-05_04:2020-02-04,2020-02-05 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 2/3/20 6:52 PM, Alain Volmat wrote:
> Allow the i2c-stm32f7 controller to become a wakeup-source
> of the system. In such case, when a slave is registered to the
> I2C controller, receiving a I2C message targeting that registered
> slave address wakes up the suspended system.
> 
> In order to be able to wake-up, the I2C controller DT node
> must have the property wakeup-source defined and a slave
> must be registered.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  v2: - enclose _suspend and _resume functions (and related) with
>        #ifdef CONFIG_PM_SLEEP
>      - remove the __maybe_unused for functions enclosed with CONFIG_PM_SLEEP
>      - move stm32f7_i2c_enable_wakeup function upper in the file to avoid
>        having a prototype.
>  
>  drivers/i2c/busses/i2c-stm32f7.c | 107 +++++++++++++++++++++++++------
>  1 file changed, 86 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 5c3e8ac6ad92..378956ac6d1d 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -29,6 +29,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> @@ -49,6 +50,7 @@
>  
>  /* STM32F7 I2C control 1 */
>  #define STM32F7_I2C_CR1_PECEN			BIT(23)
> +#define STM32F7_I2C_CR1_WUPEN			BIT(18)
>  #define STM32F7_I2C_CR1_SBC			BIT(16)
>  #define STM32F7_I2C_CR1_RXDMAEN			BIT(15)
>  #define STM32F7_I2C_CR1_TXDMAEN			BIT(14)
> @@ -301,6 +303,7 @@ struct stm32f7_i2c_msg {
>   * @dma: dma data
>   * @use_dma: boolean to know if dma is used in the current transfer
>   * @regmap: holds SYSCFG phandle for Fast Mode Plus bits
> + * @wakeup_src: boolean to know if the device is a wakeup source
>   */
>  struct stm32f7_i2c_dev {
>  	struct i2c_adapter adap;
> @@ -323,6 +326,7 @@ struct stm32f7_i2c_dev {
>  	struct stm32_i2c_dma *dma;
>  	bool use_dma;
>  	struct regmap *regmap;
> +	bool wakeup_src;
>  };
>  
>  /*
> @@ -1691,6 +1695,24 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>  	return ret;
>  }
>  
> +static void stm32f7_i2c_enable_wakeup(struct stm32f7_i2c_dev *i2c_dev,
> +				      bool enable)
> +{
> +	void __iomem *base = i2c_dev->base;
> +	u32 mask = STM32F7_I2C_CR1_WUPEN;
> +
> +	if (!i2c_dev->wakeup_src)
> +		return;
> +
> +	if (enable) {
> +		device_set_wakeup_enable(i2c_dev->dev, true);
> +		stm32f7_i2c_set_bits(base + STM32F7_I2C_CR1, mask);
> +	} else {
> +		device_set_wakeup_enable(i2c_dev->dev, false);
> +		stm32f7_i2c_clr_bits(base + STM32F7_I2C_CR1, mask);
> +	}
> +}
> +
>  static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(slave->adapter);
> @@ -1717,6 +1739,9 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
> +		stm32f7_i2c_enable_wakeup(i2c_dev, true);
> +
>  	if (id == 0) {
>  		/* Configure Own Address 1 */
>  		oar1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR1);
> @@ -1758,6 +1783,9 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
>  
>  	ret = 0;
>  pm_free:
> +	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
> +		stm32f7_i2c_enable_wakeup(i2c_dev, false);
> +
>  	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
> @@ -1791,8 +1819,10 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
>  
>  	i2c_dev->slave[id] = NULL;
>  
> -	if (!(stm32f7_i2c_is_slave_registered(i2c_dev)))
> +	if (!stm32f7_i2c_is_slave_registered(i2c_dev)) {
>  		stm32f7_i2c_disable_irq(i2c_dev, STM32F7_I2C_ALL_IRQ_MASK);
> +		stm32f7_i2c_enable_wakeup(i2c_dev, false);
> +	}
>  
>  	pm_runtime_mark_last_busy(i2c_dev->dev);
>  	pm_runtime_put_autosuspend(i2c_dev->dev);
> @@ -1879,6 +1909,9 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  		return irq_error ? : -ENOENT;
>  	}
>  
> +	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
> +						    "wakeup-source");
> +
>  	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(i2c_dev->clk)) {
>  		dev_err(&pdev->dev, "Error: Missing controller clock\n");
> @@ -1985,6 +2018,16 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  		goto clk_free;
>  	}
>  
> +	if (i2c_dev->wakeup_src) {
> +		device_set_wakeup_capable(i2c_dev->dev, true);
> +
> +		ret = dev_pm_set_wake_irq(i2c_dev->dev, irq_event);
> +		if (ret) {
> +			dev_err(i2c_dev->dev, "Failed to set wake up irq\n");
> +			goto clr_wakeup_capable;
> +		}
> +	}
> +
>  	platform_set_drvdata(pdev, i2c_dev);
>  
>  	pm_runtime_set_autosuspend_delay(i2c_dev->dev,
> @@ -2014,6 +2057,13 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	pm_runtime_set_suspended(i2c_dev->dev);
>  	pm_runtime_dont_use_autosuspend(i2c_dev->dev);
>  
> +	if (i2c_dev->wakeup_src)
> +		dev_pm_clear_wake_irq(i2c_dev->dev);
> +
> +clr_wakeup_capable:
> +	if (i2c_dev->wakeup_src)
> +		device_set_wakeup_capable(i2c_dev->dev, false);
> +
>  	if (i2c_dev->dma) {
>  		stm32_i2c_dma_free(i2c_dev->dma);
>  		i2c_dev->dma = NULL;
> @@ -2032,6 +2082,15 @@ static int stm32f7_i2c_remove(struct platform_device *pdev)
>  	i2c_del_adapter(&i2c_dev->adap);
>  	pm_runtime_get_sync(i2c_dev->dev);
>  
> +	if (i2c_dev->wakeup_src) {
> +		dev_pm_clear_wake_irq(i2c_dev->dev);
> +		/*
> +		 * enforce that wakeup is disabled and that the device
> +		 * is marked as non wakeup capable
> +		 */
> +		device_init_wakeup(i2c_dev->dev, false);
> +	}
> +
>  	pm_runtime_put_noidle(i2c_dev->dev);
>  	pm_runtime_disable(i2c_dev->dev);
>  	pm_runtime_set_suspended(i2c_dev->dev);
> @@ -2073,8 +2132,8 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused
> -stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
> +#ifdef CONFIG_PM_SLEEP
> +static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
>  {
>  	int ret;
>  	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
> @@ -2095,8 +2154,7 @@ stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
>  	return ret;
>  }
>  
> -static int __maybe_unused
> -stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
> +static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
>  {
>  	u32 cr1;
>  	int ret;
> @@ -2127,41 +2185,48 @@ stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
>  	return ret;
>  }
>  
> -static int __maybe_unused stm32f7_i2c_suspend(struct device *dev)
> +static int stm32f7_i2c_suspend(struct device *dev)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>  	int ret;
>  
>  	i2c_mark_adapter_suspended(&i2c_dev->adap);
> -	ret = stm32f7_i2c_regs_backup(i2c_dev);
> -	if (ret < 0) {
> -		i2c_mark_adapter_resumed(&i2c_dev->adap);
> -		return ret;
> -	}
>  
> -	pinctrl_pm_select_sleep_state(dev);
> -	pm_runtime_force_suspend(dev);
> +	if (!device_may_wakeup(dev) && !dev->power.wakeup_path) {
> +		ret = stm32f7_i2c_regs_backup(i2c_dev);
> +		if (ret < 0) {
> +			i2c_mark_adapter_resumed(&i2c_dev->adap);
> +			return ret;
> +		}
> +
> +		pinctrl_pm_select_sleep_state(dev);
> +		pm_runtime_force_suspend(dev);
> +	}
>  
>  	return 0;
>  }
>  
> -static int __maybe_unused stm32f7_i2c_resume(struct device *dev)
> +static int stm32f7_i2c_resume(struct device *dev)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>  	int ret;
>  
> -	ret = pm_runtime_force_resume(dev);
> -	if (ret < 0)
> -		return ret;
> -	pinctrl_pm_select_default_state(dev);
> +	if (!device_may_wakeup(dev) && !dev->power.wakeup_path) {
> +		ret = pm_runtime_force_resume(dev);
> +		if (ret < 0)
> +			return ret;
> +		pinctrl_pm_select_default_state(dev);
> +
> +		ret = stm32f7_i2c_regs_restore(i2c_dev);
> +		if (ret < 0)
> +			return ret;
> +	}
>  
> -	ret = stm32f7_i2c_regs_restore(i2c_dev);
> -	if (ret < 0)
> -		return ret;
>  	i2c_mark_adapter_resumed(&i2c_dev->adap);
>  
>  	return 0;
>  }
> +#endif
>  
>  static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
>  	SET_RUNTIME_PM_OPS(stm32f7_i2c_runtime_suspend,
> 
