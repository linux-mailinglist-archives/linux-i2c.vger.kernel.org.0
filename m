Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F021CD3D7
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 10:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbgEKI15 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 04:27:57 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:47855 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728556AbgEKI14 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 04:27:56 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04B8IEmb014713;
        Mon, 11 May 2020 10:27:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=MkB6oHaf/ViYjgYx9aFJLoIBv429C02RlVwSRBZJsTg=;
 b=zTji591zW1Zwp1k36VSezqFxGGCNjPWrEvABHo0pFDeY2mCdtkSn+PHc2L33FPrzPGnf
 S9HEH6/HgbERExhVNK3YxhVVik5nDd/P+xC/Hii/NjChD/nB9mRCXae5cHDRyF4a2JC9
 s8hRapBqUZOSSXDzQD7af61gsJDbcdhlnXz07/83mAz9hZTdKWDUwy8XW7EnsDFXeDhu
 IkjPc0UgYB2Rjslkjz7z4irtQnZm5m8jhMvdeSnpzQYOjHifHletdmZdrV0ICgo2Fnpy
 5RllPcN4kJOyHpa2I26Q7h/mSWpvipBjniHHm8AaV7MPwznBHSO3K+OdIRx/YKiub2jJ fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30wj9w9876-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 May 2020 10:27:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C509110002A;
        Mon, 11 May 2020 10:27:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B81142B27B4;
        Mon, 11 May 2020 10:27:38 +0200 (CEST)
Received: from [10.131.226.156] (10.75.127.46) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 10:27:37 +0200
Subject: Re: [PATCH 4/4] i2c: stm32f7: Add SMBus-specific protocols support
To:     Alain Volmat <alain.volmat@st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-5-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <4c9603b6-2500-5200-9e15-6c373294ff6a@st.com>
Date:   Mon, 11 May 2020 10:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1588657871-14747-5-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-11_03:2020-05-11,2020-05-11 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 5/5/20 7:51 AM, Alain Volmat wrote:
> This patch adds the support for SMBus Host notify and SMBus Alert
> extensions protocols
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/busses/Kconfig       |   1 +
>  drivers/i2c/busses/i2c-stm32f7.c | 198 +++++++++++++++++++++++++++++--
>  2 files changed, 189 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 2f6e39b41e6c..b82c2f7d7d50 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1024,6 +1024,7 @@ config I2C_STM32F7
>  	tristate "STMicroelectronics STM32F7 I2C support"
>  	depends on ARCH_STM32 || COMPILE_TEST
>  	select I2C_SLAVE
> +	select I2C_SMBUS
>  	help
>  	  Enable this option to add support for STM32 I2C controller embedded
>  	  in STM32F7 SoCs.
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 9c9e10ea9199..6d02ddbc1ab4 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -14,10 +14,12 @@
>   * This driver is based on i2c-stm32f4.c
>   *
>   */
> +#include <linux/atomic.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
> +#include <linux/i2c-smbus.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -50,6 +52,8 @@
>  
>  /* STM32F7 I2C control 1 */
>  #define STM32F7_I2C_CR1_PECEN			BIT(23)
> +#define STM32F7_I2C_CR1_ALERTEN			BIT(22)
> +#define STM32F7_I2C_CR1_SMBHEN			BIT(20)
>  #define STM32F7_I2C_CR1_WUPEN			BIT(18)
>  #define STM32F7_I2C_CR1_SBC			BIT(16)
>  #define STM32F7_I2C_CR1_RXDMAEN			BIT(15)
> @@ -121,6 +125,7 @@
>  				(((n) & STM32F7_I2C_ISR_ADDCODE_MASK) >> 17)
>  #define STM32F7_I2C_ISR_DIR			BIT(16)
>  #define STM32F7_I2C_ISR_BUSY			BIT(15)
> +#define STM32F7_I2C_ISR_ALERT			BIT(13)
>  #define STM32F7_I2C_ISR_PECERR			BIT(11)
>  #define STM32F7_I2C_ISR_ARLO			BIT(9)
>  #define STM32F7_I2C_ISR_BERR			BIT(8)
> @@ -134,6 +139,7 @@
>  #define STM32F7_I2C_ISR_TXE			BIT(0)
>  
>  /* STM32F7 I2C Interrupt Clear */
> +#define STM32F7_I2C_ICR_ALERTCF			BIT(13)
>  #define STM32F7_I2C_ICR_PECCF			BIT(11)
>  #define STM32F7_I2C_ICR_ARLOCF			BIT(9)
>  #define STM32F7_I2C_ICR_BERRCF			BIT(8)
> @@ -150,7 +156,7 @@
>  
>  #define STM32F7_I2C_MAX_LEN			0xff
>  #define STM32F7_I2C_DMA_LEN_MIN			0x16
> -#define STM32F7_I2C_MAX_SLAVE			0x2
> +#define STM32F7_I2C_MAX_SLAVE			0x3
>  
>  #define STM32F7_I2C_DNF_DEFAULT			0
>  #define STM32F7_I2C_DNF_MAX			16
> @@ -274,6 +280,29 @@ struct stm32f7_i2c_msg {
>  	u8 smbus_buf[I2C_SMBUS_BLOCK_MAX + 3] __aligned(4);
>  };
>  
> +/**
> + * struct stm32f7_i2c_host - SMBus host specific data
> + * @client: I2C slave device that represents SMBus host
> + * @notify_start: indicate that this is the start of the notify transaction
> + * @addr: device address of SMBus device that initiate SMBus host protocol
> + */
> +struct stm32f7_i2c_host {
> +	struct i2c_client *client;
> +	bool notify_start;
> +	u8 addr;
> +};
> +
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
> @@ -301,6 +330,9 @@ struct stm32f7_i2c_msg {
>   * @fmp_creg: register address for clearing Fast Mode Plus bits
>   * @fmp_mask: mask for Fast Mode Plus bits in set register
>   * @wakeup_src: boolean to know if the device is a wakeup source
> + * @host_notify_cnt: atomic to know number of host_notify enabled clients
> + * @host_notify_client: SMBus host-notify client
> + * @alert: SMBus alert specific data
>   */
>  struct stm32f7_i2c_dev {
>  	struct i2c_adapter adap;
> @@ -327,6 +359,9 @@ struct stm32f7_i2c_dev {
>  	u32 fmp_creg;
>  	u32 fmp_mask;
>  	bool wakeup_src;
> +	atomic_t host_notify_cnt;
> +	struct i2c_client *host_notify_client;
> +	struct stm32f7_i2c_alert *alert;
>  };
>  
>  /*
> @@ -1321,10 +1356,20 @@ static int stm32f7_i2c_get_free_slave_id(struct stm32f7_i2c_dev *i2c_dev,
>  	int i;
>  
>  	/*
> -	 * slave[0] supports 7-bit and 10-bit slave address
> -	 * slave[1] supports 7-bit slave address only
> +	 * slave[0] support only SMBus Host address (0x8)
> +	 * slave[1] supports 7-bit and 10-bit slave address
> +	 * slave[2] supports 7-bit slave address only
>  	 */
> -	for (i = STM32F7_I2C_MAX_SLAVE - 1; i >= 0; i--) {
> +	if (atomic_read(&i2c_dev->host_notify_cnt)) {
> +		if (slave->addr == 0x08) {
> +			if (i2c_dev->slave[0])
> +				goto fail;
> +			*id = 0;
> +			return 0;
> +		}
> +	}
> +
> +	for (i = STM32F7_I2C_MAX_SLAVE - 1; i > 0; i--) {
>  		if (i == 1 && (slave->flags & I2C_CLIENT_TEN))
>  			continue;
>  		if (!i2c_dev->slave[i]) {
> @@ -1333,6 +1378,7 @@ static int stm32f7_i2c_get_free_slave_id(struct stm32f7_i2c_dev *i2c_dev,
>  		}
>  	}
>  
> +fail:
>  	dev_err(dev, "Slave 0x%x could not be registered\n", slave->addr);
>  
>  	return -EINVAL;
> @@ -1586,6 +1632,13 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
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
> @@ -1776,7 +1829,13 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
>  	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
>  		stm32f7_i2c_enable_wakeup(i2c_dev, true);
>  
> -	if (id == 0) {
> +	switch (id) {
> +	case 0:
> +		/* Slave SMBus Host */
> +		i2c_dev->slave[id] = slave;
> +		break;
> +
> +	case 1:
>  		/* Configure Own Address 1 */
>  		oar1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR1);
>  		oar1 &= ~STM32F7_I2C_OAR1_MASK;
> @@ -1789,7 +1848,9 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
>  		oar1 |= STM32F7_I2C_OAR1_OA1EN;
>  		i2c_dev->slave[id] = slave;
>  		writel_relaxed(oar1, i2c_dev->base + STM32F7_I2C_OAR1);
> -	} else if (id == 1) {
> +		break;
> +
> +	case 2:
>  		/* Configure Own Address 2 */
>  		oar2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_OAR2);
>  		oar2 &= ~STM32F7_I2C_OAR2_MASK;
> @@ -1802,7 +1863,10 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
>  		oar2 |= STM32F7_I2C_OAR2_OA2EN;
>  		i2c_dev->slave[id] = slave;
>  		writel_relaxed(oar2, i2c_dev->base + STM32F7_I2C_OAR2);
> -	} else {
> +		break;
> +
> +	default:
> +		dev_err(dev, "I2C slave id not supported\n");
>  		ret = -ENODEV;
>  		goto pm_free;
>  	}
> @@ -1843,10 +1907,10 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
>  	if (ret < 0)
>  		return ret;
>  
> -	if (id == 0) {
> +	if (id == 1) {
>  		mask = STM32F7_I2C_OAR1_OA1EN;
>  		stm32f7_i2c_clr_bits(base + STM32F7_I2C_OAR1, mask);
> -	} else {
> +	} else if (id == 2) {
>  		mask = STM32F7_I2C_OAR2_OA2EN;
>  		stm32f7_i2c_clr_bits(base + STM32F7_I2C_OAR2, mask);
>  	}
> @@ -1911,6 +1975,103 @@ static int stm32f7_i2c_setup_fm_plus_bits(struct platform_device *pdev,
>  					  &i2c_dev->fmp_mask);
>  }
>  
> +static int stm32f7_i2c_enable_smbus_host(struct stm32f7_i2c_dev *i2c_dev)
> +{
> +	struct i2c_adapter *adap = &i2c_dev->adap;
> +	void __iomem *base = i2c_dev->base;
> +	struct i2c_client *client;
> +
> +	client = i2c_new_smbus_host_notify_device(adap);
> +	if (IS_ERR(client))
> +		return PTR_ERR(client);
> +
> +	i2c_dev->host_notify_client = client;
> +
> +	/* Enable SMBus Host address */
> +	stm32f7_i2c_set_bits(base + STM32F7_I2C_CR1, STM32F7_I2C_CR1_SMBHEN);
> +
> +	return 0;
> +}
> +
> +static void stm32f7_i2c_disable_smbus_host(struct stm32f7_i2c_dev *i2c_dev)
> +{
> +	void __iomem *base = i2c_dev->base;
> +
> +	if (i2c_dev->host_notify_client) {
> +		/* Disable SMBus Host address */
> +		stm32f7_i2c_clr_bits(base + STM32F7_I2C_CR1,
> +				     STM32F7_I2C_CR1_SMBHEN);
> +		i2c_free_smbus_host_notify_device(i2c_dev->host_notify_client);
> +	}
> +}
> +
> +static int stm32f7_i2c_reg_client(struct i2c_client *client)
> +{
> +	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(client->adapter);
> +	int ret;
> +
> +	if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
> +		/* Only enable on the first device registration */
> +		if (atomic_inc_return(&i2c_dev->host_notify_cnt) == 1) {
> +			ret = stm32f7_i2c_enable_smbus_host(i2c_dev);
> +			if (ret) {
> +				dev_err(i2c_dev->dev,
> +					"failed to enable SMBus host notify (%d)\n",
> +					ret);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void stm32f7_i2c_unreg_client(struct i2c_client *client)
> +{
> +	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(client->adapter);
> +
> +	if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
> +		if (atomic_dec_return(&i2c_dev->host_notify_cnt) == 0)
> +			stm32f7_i2c_disable_smbus_host(i2c_dev);
> +	}
> +}
> +
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
>  	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SLAVE |
> @@ -1918,7 +2079,7 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
>  		I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
>  		I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
>  		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC |
> -		I2C_FUNC_SMBUS_I2C_BLOCK;
> +		I2C_FUNC_SMBUS_I2C_BLOCK | I2C_FUNC_SMBUS_HOST_NOTIFY;
>  }
>  
>  static const struct i2c_algorithm stm32f7_i2c_algo = {
> @@ -1927,6 +2088,8 @@ static const struct i2c_algorithm stm32f7_i2c_algo = {
>  	.functionality = stm32f7_i2c_func,
>  	.reg_slave = stm32f7_i2c_reg_slave,
>  	.unreg_slave = stm32f7_i2c_unreg_slave,
> +	.reg_client = stm32f7_i2c_reg_client,
> +	.unreg_client = stm32f7_i2c_unreg_client,
>  };
>  
>  static int stm32f7_i2c_probe(struct platform_device *pdev)
> @@ -2088,6 +2251,16 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto pm_disable;
>  
> +	if (device_property_read_bool(&pdev->dev, "st,smbus-alert")) {
> +		ret = stm32f7_i2c_enable_smbus_alert(i2c_dev);
> +		if (ret) {
> +			dev_err(i2c_dev->dev,
> +				"failed to enable SMBus alert protocol (%d)\n",
> +				ret);
> +			goto i2c_adapter_remove;
> +		}
> +	}
> +
>  	dev_info(i2c_dev->dev, "STM32F7 I2C-%d bus adapter\n", adap->nr);
>  
>  	pm_runtime_mark_last_busy(i2c_dev->dev);
> @@ -2095,6 +2268,9 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +i2c_adapter_remove:
> +	i2c_del_adapter(adap);
> +
>  pm_disable:
>  	pm_runtime_put_noidle(i2c_dev->dev);
>  	pm_runtime_disable(i2c_dev->dev);
> @@ -2126,6 +2302,8 @@ static int stm32f7_i2c_remove(struct platform_device *pdev)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
>  
> +	stm32f7_i2c_disable_smbus_alert(i2c_dev);
> +
>  	i2c_del_adapter(&i2c_dev->adap);
>  	pm_runtime_get_sync(i2c_dev->dev);
>  
> 
