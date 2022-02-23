Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACFE84C076A
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Feb 2022 02:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234944AbiBWBwS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Feb 2022 20:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235111AbiBWBwR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Feb 2022 20:52:17 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77FDE1141;
        Tue, 22 Feb 2022 17:51:48 -0800 (PST)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4K3JpX1n7Tz4wB9;
        Wed, 23 Feb 2022 09:48:20 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 09:51:46 +0800
CC:     <yangyicong@hisilicon.com>, <git@xilinx.com>,
        <michal.simek@xilinx.com>, <linux-kernel@vger.kernel.org>,
        Chirag Parekh <chiragp@xilinx.com>
Subject: Re: [PATCH] i2c: cadence: Recover bus after controller reset
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>
References: <20220222134632.18598-1-shubhrajyoti.datta@xilinx.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <ad6918e5-b9e8-75de-2a1c-b30a8d2a1a05@huawei.com>
Date:   Wed, 23 Feb 2022 09:51:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220222134632.18598-1-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022/2/22 21:46, Shubhrajyoti Datta wrote:
> From: Chirag Parekh <chiragp@xilinx.com>
> 
> This will save from potential lock-up caused when I2c master controller
> resets in the middle of transfer and the slave is holding SDA line to
> transmit more data.
> 
> Signed-off-by: Chirag Parekh <chiragp@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  drivers/i2c/busses/i2c-cadence.c | 109 +++++++++++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 805c77143a0f..682821481b67 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -7,13 +7,16 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
> +#include <linux/of_gpio.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pinctrl/consumer.h>
>  
>  /* Register offsets for the I2C device. */
>  #define CDNS_I2C_CR_OFFSET		0x00 /* Control Register, RW */
> @@ -179,6 +182,10 @@ enum cdns_i2c_slave_state {
>   * @clk_rate_change_nb:	Notifier block for clock rate changes
>   * @quirks:		flag for broken hold bit usage in r1p10
>   * @ctrl_reg:		Cached value of the control register.
> + * @rinfo:		Structure holding recovery information.
> + * @pinctrl:		Pin control state holder.
> + * @pinctrl_pins_default: Default pin control state.
> + * @pinctrl_pins_gpio:	GPIO pin control state.
>   * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
>   * @slave:		Registered slave instance.
>   * @dev_mode:		I2C operating role(master/slave).
> @@ -204,6 +211,10 @@ struct cdns_i2c {
>  	struct notifier_block clk_rate_change_nb;
>  	u32 quirks;
>  	u32 ctrl_reg;
> +	struct i2c_bus_recovery_info rinfo;
> +	struct pinctrl *pinctrl;
> +	struct pinctrl_state *pinctrl_pins_default;
> +	struct pinctrl_state *pinctrl_pins_gpio;

Some reason for managing the pin info in the cdns_i2c struct? Since you're using
generic GPIO recovery, if you store these in struct i2c_bus_recovery_info the
i2c core framework will help handling the pin mux on recovery and I think you
don't need the prepare/unprepare() method anymore.

>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>  	u16 ctrl_reg_diva_divb;
>  	struct i2c_client *slave;
> @@ -788,6 +799,7 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
>  	/* Wait for the signal of completion */
>  	time_left = wait_for_completion_timeout(&id->xfer_done, adap->timeout);
>  	if (time_left == 0) {
> +		i2c_recover_bus(adap);
>  		cdns_i2c_master_reset(adap);
>  		dev_err(id->adap.dev.parent,
>  				"timeout waiting on completion\n");
> @@ -1208,6 +1220,96 @@ static int __maybe_unused cdns_i2c_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +/**
> + * cdns_i2c_prepare_recovery - Withhold recovery state
> + * @adapter:    Pointer to i2c adapter
> + *
> + * This function is called to prepare for recovery.
> + * It changes the state of pins from SCL/SDA to GPIO.
> + */
> +static void cdns_i2c_prepare_recovery(struct i2c_adapter *adapter)
> +{
> +	struct cdns_i2c *p_cdns_i2c;
> +	int ret;
> +
> +	p_cdns_i2c = container_of(adapter, struct cdns_i2c, adap);
> +
> +	/* Setting pin state as gpio */
> +	ret = pinctrl_select_state(p_cdns_i2c->pinctrl,
> +			     p_cdns_i2c->pinctrl_pins_gpio);
> +	if (ret < 0)
> +		dev_err(p_cdns_i2c->adap.dev.parent,
> +				"pinctrl_select_state failed\n");
> +}
> +
> +/**
> + * cdns_i2c_unprepare_recovery - Release recovery state
> + * @adapter:    Pointer to i2c adapter
> + *
> + * This function is called on exiting recovery. It reverts
> + * the state of pins from GPIO to SCL/SDA.
> + */
> +static void cdns_i2c_unprepare_recovery(struct i2c_adapter *adapter)
> +{
> +	struct cdns_i2c *p_cdns_i2c;
> +	int ret;
> +
> +	p_cdns_i2c = container_of(adapter, struct cdns_i2c, adap);
> +
> +	/* Setting pin state to default(i2c) */
> +	ret = pinctrl_select_state(p_cdns_i2c->pinctrl,
> +			     p_cdns_i2c->pinctrl_pins_default);
> +	if (ret < 0)
> +		dev_err(p_cdns_i2c->adap.dev.parent,
> +				"pinctrl_select_state failed\n");
> +}
> +
> +/**
> + * cdns_i2c_init_recovery_info  - Initialize I2C bus recovery
> + * @pid:        Pointer to cdns i2c structure
> + * @pdev:       Handle to the platform device structure
> + *
> + * This function does required initialization for i2c bus
> + * recovery. It registers three functions for prepare,
> + * recover and unprepare
> + *
> + * Return: 0 on Success, negative error otherwise.
> + */
> +static int cdns_i2c_init_recovery_info(struct cdns_i2c *pid,
> +		struct platform_device *pdev)
> +{
> +	struct i2c_bus_recovery_info *rinfo = &pid->rinfo;
> +
> +	pid->pinctrl_pins_default = pinctrl_lookup_state(pid->pinctrl,
> +			PINCTRL_STATE_DEFAULT);
> +	pid->pinctrl_pins_gpio = pinctrl_lookup_state(pid->pinctrl, "gpio");
> +
> +	/* Fetches GPIO pins */
> +	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda-gpios", GPIOD_ASIS);
> +	rinfo->scl_gpiod = devm_gpiod_get(&pdev->dev, "scl-gpios", GPIOD_ASIS);
> +
> +	/* if GPIO driver isn't ready yet, deffer probe */
> +	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER ||
> +	    PTR_ERR(rinfo->scl_gpiod) == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> +
> +	/* Validates fetched information */
> +	if (IS_ERR(rinfo->sda_gpiod) ||
> +	    IS_ERR(rinfo->scl_gpiod) ||
> +			IS_ERR(pid->pinctrl_pins_default) ||
> +			IS_ERR(pid->pinctrl_pins_gpio)) {
> +		dev_dbg(&pdev->dev, "recovery information incomplete\n");
> +		return 0;
> +	}
> +
> +	rinfo->prepare_recovery     = cdns_i2c_prepare_recovery;
> +	rinfo->unprepare_recovery   = cdns_i2c_unprepare_recovery;
> +	rinfo->recover_bus          = i2c_generic_scl_recovery;
> +	pid->adap.bus_recovery_info = rinfo;
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops cdns_i2c_dev_pm_ops = {
>  	SET_RUNTIME_PM_OPS(cdns_i2c_runtime_suspend,
>  			   cdns_i2c_runtime_resume, NULL)
> @@ -1254,6 +1356,13 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>  		id->quirks = data->quirks;
>  	}
>  
> +	id->pinctrl = devm_pinctrl_get(&pdev->dev);
> +	if (!IS_ERR(id->pinctrl)) {
> +		ret = cdns_i2c_init_recovery_info(id, pdev);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	id->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
>  	if (IS_ERR(id->membase))
>  		return PTR_ERR(id->membase);
> 
