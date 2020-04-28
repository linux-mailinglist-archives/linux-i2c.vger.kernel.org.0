Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E6F1BBC5D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 13:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgD1LZ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 07:25:28 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47458 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgD1LZ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 07:25:27 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03SBP8aY027889;
        Tue, 28 Apr 2020 06:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588073108;
        bh=EiS/4MUYU8KqgsavRPxfRkmEd0Gp1d9200lIKcLyREA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=V99aRM5GnPxyZErsddaOboUqsr3LtAKmQTsOZn1FBvjKaA17VuSVbgnDP/8TakxjV
         xdcCoLNg9VvSwC1S5HeI6KwcWoY5NO2HaSXTd6KPJpQuIlNCPU+Tgd0RzQ4MRqh09O
         z/zRi/Udq9gd+Gngy8nRc+ut6er+HwqNOwbQJ8uA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03SBP8dN023718;
        Tue, 28 Apr 2020 06:25:08 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Apr 2020 06:25:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Apr 2020 06:25:07 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03SBP4XB123003;
        Tue, 28 Apr 2020 06:25:05 -0500
Subject: Re: [PATCH v14 2/2] i2c: core: support bus regulator controlling in
 adapter
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
References: <20200428061813.27072-1-bibby.hsieh@mediatek.com>
 <20200428061813.27072-3-bibby.hsieh@mediatek.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <e3583893-f49d-0e78-6414-ed565099af63@ti.com>
Date:   Tue, 28 Apr 2020 14:25:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428061813.27072-3-bibby.hsieh@mediatek.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 28/04/2020 09:18, Bibby Hsieh wrote:
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
> 
> We get and enable bulk regulator in i2c adapter device.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>   drivers/i2c/i2c-core-base.c | 82 +++++++++++++++++++++++++++++++++++++
>   include/linux/i2c.h         |  2 +
>   2 files changed, 84 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5cc0b0ec5570..f81b42a4ed07 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -313,6 +313,7 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>   static int i2c_device_probe(struct device *dev)
>   {
>   	struct i2c_client	*client = i2c_verify_client(dev);
> +	struct i2c_adapter	*adap = client->adapter;
>   	struct i2c_driver	*driver;
>   	int status;
>   
> @@ -378,6 +379,12 @@ static int i2c_device_probe(struct device *dev)
>   
>   	dev_dbg(dev, "probe\n");
>   
> +	status = regulator_enable(adap->bus_regulator);
> +	if (status < 0) {
> +		dev_err(&adap->dev, "Failed to enable power regulator\n");
> +		goto err_clear_wakeup_irq;
> +	}
> +

Sry, but this is confusing.
What if there is separate regulators for I2C device and bus/adapter?

I2C bus is transaction based and usually I2C bus drivers ensures that i2c bus is
in proper state to perform transaction. While I2C devices can be enable, configured and
function without actually interacting with I2C bus unless required (irq for example).

With you change any I2C device will enable and keep bus regulator on all the time it's active
even if there is no I2C interruptions.

Following the problem description it seems
  - i2c bus driver should get regulator and ensure it's enabled for the duration of transaction(s)
  - i2c device should get its own regulator (or the same if shared)  ensure it's enabled for
    the period device is active.


>   	status = of_clk_set_defaults(dev->of_node, false);
>   	if (status < 0)
>   		goto err_clear_wakeup_irq;
> @@ -414,6 +421,7 @@ static int i2c_device_probe(struct device *dev)
>   static int i2c_device_remove(struct device *dev)
>   {
>   	struct i2c_client	*client = i2c_verify_client(dev);
> +	struct i2c_adapter      *adap = client->adapter;
>   	struct i2c_driver	*driver;
>   	int status = 0;
>   
> @@ -427,6 +435,8 @@ static int i2c_device_remove(struct device *dev)
>   	}
>   
>   	dev_pm_domain_detach(&client->dev, true);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		regulator_disable(adap->bus_regulator);
>   
>   	dev_pm_clear_wake_irq(&client->dev);
>   	device_init_wakeup(&client->dev, false);
> @@ -438,6 +448,72 @@ static int i2c_device_remove(struct device *dev)
>   	return status;
>   }
>   
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_resume_early(struct device *dev)
> +{
> +	struct i2c_client *client = i2c_verify_client(dev);
> +	struct i2c_adapter *adap = client->adapter;
> +	int err;
> +
> +	if (!pm_runtime_status_suspended(&client->dev)) {
> +		err = regulator_enable(adap->bus_regulator);
> +		if (err)
> +			return err;
> +	}
> +
> +	return pm_generic_resume_early(&client->dev);
> +}
> +
> +static int i2c_suspend_late(struct device *dev)
> +{
> +	struct i2c_client *client = i2c_verify_client(dev);
> +	struct i2c_adapter *adap = client->adapter;
> +	int err;
> +
> +	err = pm_generic_suspend_late(&client->dev);
> +	if (err)
> +		return err;
> +
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		return regulator_disable(adap->bus_regulator);
> +
> +	return err;
> +}
> +#endif

Have you considered pm_runtime_force_suspend/pm_runtime_force_resume?

> +
> +#ifdef CONFIG_PM
> +static int i2c_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client = i2c_verify_client(dev);
> +	struct i2c_adapter *adap = client->adapter;
> +	int err;
> +
> +	err = regulator_enable(adap->bus_regulator);
> +	if (err)
> +		return err;
> +
> +	return pm_generic_runtime_resume(&client->dev);
> +}
> +
> +static int i2c_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = i2c_verify_client(dev);
> +	struct i2c_adapter *adap = client->adapter;
> +	int err;
> +
> +	err = pm_generic_runtime_suspend(&client->dev);
> +	if (err)
> +		return err;
> +
> +	return regulator_disable(adap->bus_regulator);
> +}
> +#endif
> +
> +static const struct dev_pm_ops i2c_device_pm = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late, i2c_resume_early)
> +	SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> +};
> +
>   static void i2c_device_shutdown(struct device *dev)
>   {
>   	struct i2c_client *client = i2c_verify_client(dev);
> @@ -495,6 +571,7 @@ struct bus_type i2c_bus_type = {
>   	.probe		= i2c_device_probe,
>   	.remove		= i2c_device_remove,
>   	.shutdown	= i2c_device_shutdown,
> +	.pm		= &i2c_device_pm,
>   };
>   EXPORT_SYMBOL_GPL(i2c_bus_type);
>   
> @@ -1333,6 +1410,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>   	if (res)
>   		goto out_reg;
>   
> +	adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> +	if (IS_ERR(adap->bus_regulator)) {
> +		res = PTR_ERR(adap->bus_regulator);
> +		goto out_reg;
> +	}
>   	dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
>   
>   	pm_runtime_no_callbacks(&adap->dev);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 456fc17ecb1c..bc83af0d38d1 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -15,6 +15,7 @@
>   #include <linux/device.h>	/* for struct device */
>   #include <linux/sched.h>	/* for completion */
>   #include <linux/mutex.h>
> +#include <linux/regulator/consumer.h>
>   #include <linux/rtmutex.h>
>   #include <linux/irqdomain.h>		/* for Host Notify IRQ */
>   #include <linux/of.h>		/* for struct device_node */
> @@ -721,6 +722,7 @@ struct i2c_adapter {
>   	const struct i2c_adapter_quirks *quirks;
>   
>   	struct irq_domain *host_notify_domain;
> +	struct regulator *bus_regulator;
>   };
>   #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>   
> 

-- 
Best regards,
grygorii
