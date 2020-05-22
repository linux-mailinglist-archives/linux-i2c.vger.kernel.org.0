Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38F01DEEC4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 20:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730750AbgEVSAG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 14:00:06 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53642 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730674AbgEVSAF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 May 2020 14:00:05 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04MHxo2l125244;
        Fri, 22 May 2020 12:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590170390;
        bh=gl9XRrI0+ST50TU70sz+SomDBS0aeHhLlg8nkROosvg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aXfCxukm+mrQPg6jqx5qpKGdHEVcaB+ndkmAqY1LSojmOrIq2FrO+qpvOIXVdmn7r
         14WxwAZxvgpcwu15IJjr6KOyMeoP57uIWYKt4j4XbleRKFuCQGgJpu3si1FopwGult
         JT2VXJUpOwRrd7S+fKUx0bKt/aNh2IR/96NRUCM0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04MHxoKF046789
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 22 May 2020 12:59:50 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 22
 May 2020 12:59:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 22 May 2020 12:59:12 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04MHx8Rx014196;
        Fri, 22 May 2020 12:59:09 -0500
Subject: Re: [PATCH v15 2/2] i2c: core: support bus regulator controlling in
 adapter
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
 <20200519072729.7268-3-bibby.hsieh@mediatek.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <952995ec-0865-d8ff-e285-522705fa9709@ti.com>
Date:   Fri, 22 May 2020 20:59:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519072729.7268-3-bibby.hsieh@mediatek.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 19/05/2020 10:27, Bibby Hsieh wrote:
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
> 
> We get and enable bulk regulator in i2c adapter device.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>   drivers/i2c/i2c-core-base.c | 84 +++++++++++++++++++++++++++++++++++++
>   include/linux/i2c.h         |  2 +
>   2 files changed, 86 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5cc0b0ec5570..e1cc8d46bc51 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -313,12 +313,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>   static int i2c_device_probe(struct device *dev)
>   {
>   	struct i2c_client	*client = i2c_verify_client(dev);
> +	struct i2c_adapter	*adap;
>   	struct i2c_driver	*driver;
>   	int status;
>   
>   	if (!client)
>   		return 0;
>   
> +	adap = client->adapter;
>   	driver = to_i2c_driver(dev->driver);
>   
>   	client->irq = client->init_irq;
> @@ -378,6 +380,12 @@ static int i2c_device_probe(struct device *dev)
>   
>   	dev_dbg(dev, "probe\n");
>   
> +	status = regulator_enable(adap->bus_regulator);
> +	if (status < 0) {
> +		dev_err(&adap->dev, "Failed to enable power regulator\n");
> +		goto err_clear_wakeup_irq;
> +	}
> +
>   	status = of_clk_set_defaults(dev->of_node, false);
>   	if (status < 0)
>   		goto err_clear_wakeup_irq;
> @@ -414,12 +422,14 @@ static int i2c_device_probe(struct device *dev)
>   static int i2c_device_remove(struct device *dev)
>   {
>   	struct i2c_client	*client = i2c_verify_client(dev);
> +	struct i2c_adapter      *adap;
>   	struct i2c_driver	*driver;
>   	int status = 0;
>   
>   	if (!client || !dev->driver)
>   		return 0;
>   
> +	adap = client->adapter;
>   	driver = to_i2c_driver(dev->driver);
>   	if (driver->remove) {
>   		dev_dbg(dev, "remove\n");
> @@ -427,6 +437,8 @@ static int i2c_device_remove(struct device *dev)
>   	}
>   
>   	dev_pm_domain_detach(&client->dev, true);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		regulator_disable(adap->bus_regulator);

Not sure this check is correct.

i2c_device_probe()
  - regulator_enable - 1

pm_runtime_get()
  - regulator_enable - 2

i2c_device_remove()
  - pm_runtime_status_suspended() flase
    - regulator_disable() - 1 --> still active?

Sorry, I probably missing smth.

>   
>   	dev_pm_clear_wake_irq(&client->dev);
>   	device_init_wakeup(&client->dev, false);
> @@ -438,6 +450,72 @@ static int i2c_device_remove(struct device *dev)
>   	return status;
>   }
>   

[...]

-- 
Best regards,
grygorii
