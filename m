Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07DF1377D99
	for <lists+linux-i2c@lfdr.de>; Mon, 10 May 2021 10:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhEJIEl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 May 2021 04:04:41 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:48994 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229852AbhEJIEl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 May 2021 04:04:41 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14A82YLT024580;
        Mon, 10 May 2021 10:03:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=U1+KIixkS19m/tNfZg9O3JhGC2YusgG9DdMeBKOr67w=;
 b=1RxCaimzFNRmPSkyiLBZ+DxoAGp8ip4DpOretHPweqyR5ifi13xUlt08C8QQcCc3I8BR
 FmUtSLQGVY1c8ukOG4kYe/tFvMqcz8vuYFg8n3XdmzrcvQZFq0i4QiYHxlqbsNtYQWYH
 ICna4rHIuqMjbhgeLdOUVAdi8WQTZ916xpNae8EDYtEjC7uCvF0HnFqPP/TkiDDzwUxq
 lhzFlYgcOoxsD3kvvrTXkmE1+b3cuNX7KehHnOQ4SQ7TQnjXui9UcJ2trU8TASWBCwgy
 HXGQn6EWChDpm2wP2QGDuWDBX/0f4LaMfHgCcZrOWgr9Kdz+T40HdHgd5meTKLEpvCH6 eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38ekxj2x18-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 May 2021 10:03:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5128310002A;
        Mon, 10 May 2021 10:03:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 332F9218107;
        Mon, 10 May 2021 10:03:15 +0200 (CEST)
Received: from lmecxl1060.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 10 May
 2021 10:03:14 +0200
Subject: Re: [PATCH v4 2/2] i2c: stm32f7: add SMBus-Alert support
To:     Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>
References: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
 <1620220479-2647-3-git-send-email-alain.volmat@foss.st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <7d175ddb-f60c-6f77-5934-c58d5238435e@foss.st.com>
Date:   Mon, 10 May 2021 10:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620220479-2647-3-git-send-email-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-10_02:2021-05-10,2021-05-10 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all

Look good to me. I agree more generic


Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

On 5/5/21 3:14 PM, Alain Volmat wrote:
> Add support for the SMBus-Alert protocol to the STM32F7 that has
> dedicated control and status logic.
> 
> If SMBus-Alert is used, the SMBALERT# pin must be configured as alternate
> function for I2C Alert.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> v4: - check for smbus-alert property
> v2: - rely on st,smbus-alert binding instead of smbus
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 73 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 0138317ea600..b9b19a2a2ffa 100644
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
> @@ -279,6 +282,17 @@ struct stm32f7_i2c_msg {
>  };
>  
>  /**
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
> +/**
>   * struct stm32f7_i2c_dev - private data of the controller
>   * @adap: I2C adapter for this controller
>   * @dev: device for this controller
> @@ -310,6 +324,7 @@ struct stm32f7_i2c_msg {
>   * @analog_filter: boolean to indicate enabling of the analog filter
>   * @dnf_dt: value of digital filter requested via dt
>   * @dnf: value of digital filter to apply
> + * @alert: SMBus alert specific data
>   */
>  struct stm32f7_i2c_dev {
>  	struct i2c_adapter adap;
> @@ -341,6 +356,7 @@ struct stm32f7_i2c_dev {
>  	bool analog_filter;
>  	u32 dnf_dt;
>  	u32 dnf;
> +	struct stm32f7_i2c_alert *alert;
>  };
>  
>  /*
> @@ -1624,6 +1640,13 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
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
> @@ -1990,6 +2013,42 @@ static void stm32f7_i2c_disable_smbus_host(struct stm32f7_i2c_dev *i2c_dev)
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
> @@ -2173,6 +2232,16 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (of_property_read_bool(pdev->dev.of_node, "smbus-alert")) {
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
> @@ -2180,6 +2249,9 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +i2c_disable_smbus_host:
> +	stm32f7_i2c_disable_smbus_host(i2c_dev);
> +
>  i2c_adapter_remove:
>  	i2c_del_adapter(adap);
>  
> @@ -2214,6 +2286,7 @@ static int stm32f7_i2c_remove(struct platform_device *pdev)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
>  
> +	stm32f7_i2c_disable_smbus_alert(i2c_dev);
>  	stm32f7_i2c_disable_smbus_host(i2c_dev);
>  
>  	i2c_del_adapter(&i2c_dev->adap);
> 

-- 
--
~ Py MORDRET
--
