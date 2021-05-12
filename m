Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F1A37CDA6
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 19:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238474AbhELQ5I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 12:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239550AbhELQJ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 12:09:59 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5177AC061377;
        Wed, 12 May 2021 08:45:29 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so3286247wmb.3;
        Wed, 12 May 2021 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2mpyyEC7XJrsgi3YMcgqzQye6WX/xUo0syDXtLLqF04=;
        b=WFdXTTeGbyXygnc4svp/5Z6Yk40JUjx0BGhGZTTdIpzcdVLERcPZdfDiQraL3WyFSz
         WVcHOixfJNFZrHnz2ATXiy6RSFHvmnAG1znR2IcVgWn6UhSc0ohGvdE0LGlp5TK5ZykB
         p6sHfLifLnmwXqZWKOJNYT+dlxdURVlGN9XpdjTTsSZRfcE2e2thjcKuGJLrUZCPAFa3
         TpZIFmUY5z6YpSkwRXETaVrPln0GY9MiLJB6uM+MHmWJ67u/gBpGuiSp2lMvXKWfRBNi
         vyFt2wZAvZtqWSnP7q5qwje5gnKdD5PLNveQoqL92ci2uqPwnX7UJ69ik2I4iG+yP5lW
         xQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2mpyyEC7XJrsgi3YMcgqzQye6WX/xUo0syDXtLLqF04=;
        b=HDOVKgL9gpEtcQOK56aJCl65+8vfFmKdgnF3sZuf5ySYuhUiX0HZys0niJ+PTvw17g
         XNZ5SUegLROd7z6A3PVz5Dmrb1B5nEwolnxKOo4oyvxC3BvGBZ8gpilVslTdFTlICoXl
         2/sCq6bPW7+Zer2knE8S8qjsxCUAQE5TZtDzsPAKATbd1cPvX7qmh7uqrJiLWE8uFAJx
         SfxS8OG5FsGbnlQ0ev464brFXF33lIoipOVraAsc4baf9rZKpx0ybCNtxMBCppeL2nst
         w4HLOQ/KdzWCTIwLZVcl+wJ+lce2gDl/qqNw0jxe0ZKxiguv/6wf8L2U2aW6IhmNsZeL
         upWQ==
X-Gm-Message-State: AOAM531u4cpVbFncAV1tiDWcTa5ah7hYgD6zA+TBWecTn3y6Rq5R6igp
        dCcj67lYy41Ndm0kX3D+gus=
X-Google-Smtp-Source: ABdhPJyoX0JIfO4FFBxxeezwHm+TZ3T0E/Xd6lO8PKbV1N17Ydciv5FK3V4Aa254aJ28KFfR+uSWkQ==
X-Received: by 2002:a7b:c252:: with SMTP id b18mr39969380wmj.32.1620834328018;
        Wed, 12 May 2021 08:45:28 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
        by smtp.gmail.com with ESMTPSA id l18sm19802wrx.96.2021.05.12.08.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 08:45:27 -0700 (PDT)
Subject: Re: [PATCH v21 1/5] i2c: core: support bus regulator controlling in
 adapter
To:     Hsin-Yi Wang <hsinyi@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
 <20210507131406.2224177-2-hsinyi@chromium.org>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2df39bc6-3ab1-69f2-4ac3-952277f53fe5@gmail.com>
Date:   Wed, 12 May 2021 17:45:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210507131406.2224177-2-hsinyi@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 07/05/2021 15:14, Hsin-Yi Wang wrote:
> From: Bibby Hsieh <bibby.hsieh@mediatek.com>
> 
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
> 
> We can control bulk regulator if it is provided in i2c
> adapter device.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/i2c/i2c-core-base.c | 95 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  2 +
>  2 files changed, 97 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5a97e4a02fa2..23bc7c269184 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -461,12 +461,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>  static int i2c_device_probe(struct device *dev)
>  {
>  	struct i2c_client	*client = i2c_verify_client(dev);
> +	struct i2c_adapter	*adap;
>  	struct i2c_driver	*driver;
>  	int status;
>  
>  	if (!client)
>  		return 0;
>  
> +	adap = client->adapter;
>  	client->irq = client->init_irq;
>  
>  	if (!client->irq) {
> @@ -532,6 +534,14 @@ static int i2c_device_probe(struct device *dev)
>  
>  	dev_dbg(dev, "probe\n");
>  
> +	if (adap->bus_regulator) {
> +		status = regulator_enable(adap->bus_regulator);
> +		if (status < 0) {
> +			dev_err(&adap->dev, "Failed to enable bus regulator\n");
> +			goto err_clear_wakeup_irq;
> +		}
> +	}
> +
>  	status = of_clk_set_defaults(dev->of_node, false);
>  	if (status < 0)
>  		goto err_clear_wakeup_irq;
> @@ -589,8 +599,10 @@ static int i2c_device_probe(struct device *dev)
>  static int i2c_device_remove(struct device *dev)
>  {
>  	struct i2c_client	*client = to_i2c_client(dev);
> +	struct i2c_adapter      *adap;
>  	struct i2c_driver	*driver;
>  
> +	adap = client->adapter;
>  	driver = to_i2c_driver(dev->driver);
>  	if (driver->remove) {
>  		int status;
> @@ -605,6 +617,8 @@ static int i2c_device_remove(struct device *dev)
>  	devres_release_group(&client->dev, client->devres_group_id);
>  
>  	dev_pm_domain_detach(&client->dev, true);
> +	if (!pm_runtime_status_suspended(&client->dev) && adap->bus_regulator)
> +		regulator_disable(adap->bus_regulator);
>  
>  	dev_pm_clear_wake_irq(&client->dev);
>  	device_init_wakeup(&client->dev, false);
> @@ -617,6 +631,86 @@ static int i2c_device_remove(struct device *dev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_resume_early(struct device *dev)
> +{
> +	struct i2c_client *client = i2c_verify_client(dev);
> +	int err;
> +
> +	if (!client)
> +		return 0;
> +
> +	if (pm_runtime_status_suspended(&client->dev) &&
> +		client->adapter->bus_regulator) {
> +		err = regulator_enable(client->adapter->bus_regulator);
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
> +	int err;
> +
> +	if (!client)
> +		return 0;
> +
> +	err = pm_generic_suspend_late(&client->dev);
> +	if (err)
> +		return err;
> +
> +	if (!pm_runtime_status_suspended(&client->dev) &&
> +		client->adapter->bus_regulator)
> +		return regulator_disable(client->adapter->bus_regulator);
> +
> +	return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_PM
> +static int i2c_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client = i2c_verify_client(dev);
> +	int err;
> +
> +	if (!client)
> +		return 0;
> +
> +	if (client->adapter->bus_regulator) {
> +		err = regulator_enable(client->adapter->bus_regulator);
> +		if (err)
> +			return err;
> +	}
> +
> +	return pm_generic_runtime_resume(&client->dev);
> +}
> +
> +static int i2c_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = i2c_verify_client(dev);
> +	int err;
> +
> +	if (!client)
> +		return 0;
> +
> +	err = pm_generic_runtime_suspend(&client->dev);
> +	if (err)
> +		return err;
> +
> +	if (client->adapter->bus_regulator)
> +		return regulator_disable(client->adapter->bus_regulator);
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops i2c_device_pm = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late, i2c_resume_early)
> +	SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> +};
> +
>  static void i2c_device_shutdown(struct device *dev)
>  {
>  	struct i2c_client *client = i2c_verify_client(dev);
> @@ -674,6 +768,7 @@ struct bus_type i2c_bus_type = {
>  	.probe		= i2c_device_probe,
>  	.remove		= i2c_device_remove,
>  	.shutdown	= i2c_device_shutdown,
> +	.pm		= &i2c_device_pm,
>  };
>  EXPORT_SYMBOL_GPL(i2c_bus_type);
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index e8f2ac8c9c3d..953a4eecb88f 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>	/* for struct device */
>  #include <linux/sched.h>	/* for completion */
>  #include <linux/mutex.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/rtmutex.h>
>  #include <linux/irqdomain.h>		/* for Host Notify IRQ */
>  #include <linux/of.h>		/* for struct device_node */
> @@ -729,6 +730,7 @@ struct i2c_adapter {
>  	const struct i2c_adapter_quirks *quirks;
>  
>  	struct irq_domain *host_notify_domain;
> +	struct regulator *bus_regulator;
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>  
> 
