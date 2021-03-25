Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F204348D4A
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Mar 2021 10:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhCYJqM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Mar 2021 05:46:12 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:58850 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229631AbhCYJp5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Mar 2021 05:45:57 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12P9f4WT021657;
        Thu, 25 Mar 2021 10:45:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PO4Z1bpenUTTOuTPNMpBm5oiVuvmInssBc5DdZs+Uos=;
 b=u4/PmXCWSkRarvV1PjXrhFZdmTs3HQ/6w5ZjkE3SD4QzAYXP3KB0f7ocZNmPCbGhVBAW
 Wqv8MbGzEdSEmcaH6r8v+6LgVjPuanG6ptv0D4nfaokp6Rboa+B8NJ6Zbf5P5d6xz1q6
 lkAILC4m1Ds3oUwlV6YvGNIA9xOvJQ5ZPIQJMjNDgXfdHPuxykJgJnSjaQegKmBUARqQ
 QfAp1AIoIKHpPaAm6u1fWuU5of7WbZOQc7AhfO+ButsLo8Q1y1536Pgbot4QAEVBl7ly
 iLwtBxmP/78zmFG2OWc7Lin3BxVGX3J2CXKJqBVww2hr48Q+qdVY8d5sMrmo9lUb36C1 vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37d996udtn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 10:45:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A6CEF10002A;
        Thu, 25 Mar 2021 10:45:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85BFA22B9C8;
        Thu, 25 Mar 2021 10:45:42 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 10:45:41 +0100
Subject: Re: [PATCH v2 2/2] i2c: stm32f7: add SMBus-Alert support
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>
References: <1616075089-28115-1-git-send-email-alain.volmat@foss.st.com>
 <1616075089-28115-3-git-send-email-alain.volmat@foss.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <0d42fbe4-549a-1b0b-fbbb-5b99ef2e2ca6@foss.st.com>
Date:   Thu, 25 Mar 2021 10:45:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1616075089-28115-3-git-send-email-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-25_02:2021-03-24,2021-03-25 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All

On 3/18/21 2:44 PM, Alain Volmat wrote:
> Add support for the SMBus-Alert protocol to the STM32F7 that has
> dedicated control and status logic.
> 
> If SMBus-Alert is used, the SMBALERT# pin must be configured as alternate
> function for I2C Alert.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2: - rely on st,smbus-alert binding instead of smbus
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 73 ++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index c62c815b88eb..bd840cd2b9e4 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -51,6 +51,7 @@
>  
>  /* STM32F7 I2C control 1 */
>  #define STM32F7_I2C_CR1_PECEN			BIT(23)
> +#define STM32F7_I2C_CR1_ALERTEN			BIT(22)
>  #define STM32F7_I2C_CR1_SMBHEN			BIT(20)
>  #define STM32F7_I2C_CR1_WUPEN			BIT(18)
>  #define STM32F7_I2C_CR1_SBC			BIT(16)
> @@ -125,6 +126,7 @@
>  				(((n) & STM32F7_I2C_ISR_ADDCODE_MASK) >> 17)
>  #define STM32F7_I2C_ISR_DIR			BIT(16)
>  #define STM32F7_I2C_ISR_BUSY			BIT(15)
> +#define STM32F7_I2C_ISR_ALERT			BIT(13)
>  #define STM32F7_I2C_ISR_PECERR			BIT(11)
>  #define STM32F7_I2C_ISR_ARLO			BIT(9)
>  #define STM32F7_I2C_ISR_BERR			BIT(8)
> @@ -138,6 +140,7 @@
>  #define STM32F7_I2C_ISR_TXE			BIT(0)
>  
>  /* STM32F7 I2C Interrupt Clear */
> +#define STM32F7_I2C_ICR_ALERTCF			BIT(13)
>  #define STM32F7_I2C_ICR_PECCF			BIT(11)
>  #define STM32F7_I2C_ICR_ARLOCF			BIT(9)
>  #define STM32F7_I2C_ICR_BERRCF			BIT(8)
> @@ -283,6 +286,17 @@ struct stm32f7_i2c_msg {
>  	u8 smbus_buf[I2C_SMBUS_BLOCK_MAX + 3] __aligned(4);
>  };
>  
> +/**
> + * struct stm32f7_i2c_alert - SMBus alert specific data
> + * @setup: platform data for the smbus_alert i2c client
> + * @ara: I2C slave device used to respond to the SMBus Alert with Alert
> + * Response Address
> + */
> +struct stm32f7_i2c_alert {
> +	struct i2c_smbus_alert_setup setup;
> +	struct i2c_client *ara;
> +};
> +
>  /**
>   * struct stm32f7_i2c_dev - private data of the controller
>   * @adap: I2C adapter for this controller
> @@ -312,6 +326,7 @@ struct stm32f7_i2c_msg {
>   * @wakeup_src: boolean to know if the device is a wakeup source
>   * @smbus_mode: states that the controller is configured in SMBus mode
>   * @host_notify_client: SMBus host-notify client
> + * @alert: SMBus alert specific data
>   */
>  struct stm32f7_i2c_dev {
>  	struct i2c_adapter adap;
> @@ -340,6 +355,7 @@ struct stm32f7_i2c_dev {
>  	bool wakeup_src;
>  	bool smbus_mode;
>  	struct i2c_client *host_notify_client;
> +	struct stm32f7_i2c_alert *alert;
>  };
>  
>  /*
> @@ -1616,6 +1632,13 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
>  		f7_msg->result = -EINVAL;
>  	}
>  
> +	if (status & STM32F7_I2C_ISR_ALERT) {
> +		dev_dbg(dev, "<%s>: SMBus alert received\n", __func__);
> +		writel_relaxed(STM32F7_I2C_ICR_ALERTCF, base + STM32F7_I2C_ICR);
> +		i2c_handle_smbus_alert(i2c_dev->alert->ara);
> +		return IRQ_HANDLED;
> +	}
> +
>  	if (!i2c_dev->slave_running) {
>  		u32 mask;
>  		/* Disable interrupts */
> @@ -1982,6 +2005,42 @@ static void stm32f7_i2c_disable_smbus_host(struct stm32f7_i2c_dev *i2c_dev)
>  	}
>  }
>  
> +static int stm32f7_i2c_enable_smbus_alert(struct stm32f7_i2c_dev *i2c_dev)
> +{
> +	struct stm32f7_i2c_alert *alert;
> +	struct i2c_adapter *adap = &i2c_dev->adap;
> +	struct device *dev = i2c_dev->dev;
> +	void __iomem *base = i2c_dev->base;
> +
> +	alert = devm_kzalloc(dev, sizeof(*alert), GFP_KERNEL);
> +	if (!alert)
> +		return -ENOMEM;
> +
> +	alert->ara = i2c_new_smbus_alert_device(adap, &alert->setup);
> +	if (IS_ERR(alert->ara))
> +		return PTR_ERR(alert->ara);
> +
> +	i2c_dev->alert = alert;
> +
> +	/* Enable SMBus Alert */
> +	stm32f7_i2c_set_bits(base + STM32F7_I2C_CR1, STM32F7_I2C_CR1_ALERTEN);
> +
> +	return 0;
> +}
> +
> +static void stm32f7_i2c_disable_smbus_alert(struct stm32f7_i2c_dev *i2c_dev)
> +{
> +	struct stm32f7_i2c_alert *alert = i2c_dev->alert;
> +	void __iomem *base = i2c_dev->base;
> +
> +	if (alert) {
> +		/* Disable SMBus Alert */
> +		stm32f7_i2c_clr_bits(base + STM32F7_I2C_CR1,
> +				     STM32F7_I2C_CR1_ALERTEN);
> +		i2c_unregister_device(alert->ara);
> +	}
> +}
> +
>  static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
> @@ -2169,6 +2228,16 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (of_property_read_bool(pdev->dev.of_node, "st,smbus-alert")) {
> +		ret = stm32f7_i2c_enable_smbus_alert(i2c_dev);
> +		if (ret) {
> +			dev_err(i2c_dev->dev,
> +				"failed to enable SMBus alert protocol (%d)\n",
> +				ret);
> +			goto i2c_disable_smbus_host;
> +		}
> +	}
> +
>  	dev_info(i2c_dev->dev, "STM32F7 I2C-%d bus adapter\n", adap->nr);
>  
>  	pm_runtime_mark_last_busy(i2c_dev->dev);
> @@ -2176,6 +2245,9 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +i2c_disable_smbus_host:
> +	stm32f7_i2c_disable_smbus_host(i2c_dev);
> +
>  i2c_adapter_remove:
>  	i2c_del_adapter(adap);
>  
> @@ -2210,6 +2282,7 @@ static int stm32f7_i2c_remove(struct platform_device *pdev)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
>  
> +	stm32f7_i2c_disable_smbus_alert(i2c_dev);
>  	stm32f7_i2c_disable_smbus_host(i2c_dev);
>  
>  	i2c_del_adapter(&i2c_dev->adap);
> 

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards
-- 
--
~ Py MORDRET
--
