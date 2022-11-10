Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91ADE623E88
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Nov 2022 10:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbiKJJZj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Nov 2022 04:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiKJJZi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Nov 2022 04:25:38 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFA869DFA
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 01:25:37 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so4205373pjc.3
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 01:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OBAvZyVdKdxCrRJk4/Y4XRx0xKLrQ3v4QwzwswlPqrU=;
        b=oac+QW/UrS149OaflUweDXjkJMQeL/m3U7pGrsm5gPYMlsPBpgRTkUJ3BzhD6NEZbJ
         H3iXY5bIIzadESW4ITb0IcWQ9mIiM1mho7JGp1fLvgNd4Y6csCVTmZONd7PhWS2XBPmi
         y/jEWJYrKcXze1JywRRncF1dgNHv9sxjJoA7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBAvZyVdKdxCrRJk4/Y4XRx0xKLrQ3v4QwzwswlPqrU=;
        b=5pSncZ2YnrXrW5rIKZLQ2aPBnmdd8SXES3k7aPK96KKleUBRsf+z+mf7lqCpWHbF+w
         D4LyopjZpA/+HOmO3ObMFqzKafBDOQgUMKflYALGXcPMhjz/Sx6NF0yc5+CIwPKvDirO
         OgpNhaybelPWTerZ0iL4hwVts0Im7WWCDulRKm1V/UYfNg6SKc6+6ngpvrPGxOut6vaE
         /lk8cjJEo+p2OkaHOKJm6zxutFvFS5pWT/qOCfXoojTcIY9aVYMdO6zNtGh2K5FVwyy+
         Snbk+BRw8mBa2PSIPok1cLxdS9WhLEAIrfk8tOvFCMj0PA4eHo9sEdTkjl+HKqIPTlPj
         bkhA==
X-Gm-Message-State: ACrzQf2lBm/Ut9Pc0d3nxP1FzGLE+L66Uv3GRgGGkdBMiU4uUfLW3Upe
        qRlzEs2O/SY0XrUVkTM3TlpAgQ==
X-Google-Smtp-Source: AMsMyM4RU6NgaZ4HDrUMXilA6ONITeC18JIEPpoKBJTmP+DDz48JBS2vElX3I7KDn2AYi50739d0Yg==
X-Received: by 2002:a17:902:db12:b0:187:4736:f780 with SMTP id m18-20020a170902db1200b001874736f780mr42281570plx.145.1668072337213;
        Thu, 10 Nov 2022 01:25:37 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:729a:7662:547f:f4a3])
        by smtp.gmail.com with ESMTPSA id t72-20020a63784b000000b0044ed37dbca8sm8814450pgc.2.2022.11.10.01.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 01:25:36 -0800 (PST)
Date:   Thu, 10 Nov 2022 18:25:34 +0900
From:   Hidenori Kobayashi <hidenorik@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: Restore initial power state when we are done.
Message-ID: <20221110092534.uzxfevcig4dllvb2@google.com>
References: <20221109-i2c-waive-v2-0-07550bf2dacc@chromium.org>
 <20221109-i2c-waive-v2-1-07550bf2dacc@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109-i2c-waive-v2-1-07550bf2dacc@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ricardo,

On Wed, Nov 09, 2022 at 04:17:06PM +0100, Ricardo Ribalda wrote:
> A driver that supports I2C_DRV_ACPI_WAIVE_D0_PROBE is not expected to
> power off a device that it has not powered on previously.
> 
> For devices operating in "full_power" mode, the first call to
> `i2c_acpi_waive_d0_probe` will return 0, which means that the device
> will be turned on with `dev_pm_domain_attach`.
> 
> If probe fails or the device is removed the second call to
> `i2c_acpi_waive_d0_probe` will return 1, which means that the device
> will not be turned off. This is, it will be left in a different power
> state. Lets fix it.
> 
> Fixes: b18c1ad685d9 ("i2c: Allow an ACPI driver to manage the device's power state during probe")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index b4edf10e8fd0..96623e0647bd 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -545,8 +545,9 @@ static int i2c_device_probe(struct device *dev)
>  	if (status < 0)
>  		goto err_clear_wakeup_irq;
>  
> +	client->turn_off_on_remove = !i2c_acpi_waive_d0_probe(dev);
>  	status = dev_pm_domain_attach(&client->dev,
> -				      !i2c_acpi_waive_d0_probe(dev));
> +				      client->turn_off_on_remove);
>  	if (status)
>  		goto err_clear_wakeup_irq;
>  
> @@ -585,7 +586,7 @@ static int i2c_device_probe(struct device *dev)
>  err_release_driver_resources:
>  	devres_release_group(&client->dev, client->devres_group_id);
>  err_detach_pm_domain:
> -	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
> +	dev_pm_domain_detach(&client->dev, client->turn_off_on_remove);
>  err_clear_wakeup_irq:
>  	dev_pm_clear_wake_irq(&client->dev);
>  	device_init_wakeup(&client->dev, false);
> @@ -610,7 +611,7 @@ static void i2c_device_remove(struct device *dev)
>  
>  	devres_release_group(&client->dev, client->devres_group_id);
>  
> -	dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
> +	dev_pm_domain_detach(&client->dev, client->turn_off_on_remove);
>  
>  	dev_pm_clear_wake_irq(&client->dev);
>  	device_init_wakeup(&client->dev, false);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index f7c49bbdb8a1..6b2dacb0bae1 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -326,6 +326,8 @@ struct i2c_driver {
>   *	calls it to pass on slave events to the slave driver.
>   * @devres_group_id: id of the devres group that will be created for resources
>   *	acquired when probing this device.
> + * @turn_off_on_remove: Record if we have turned on the device before probing
> + *	so we can restore the initial state after remove/probe error.
>   *
>   * An i2c_client identifies a single device (i.e. chip) connected to an
>   * i2c bus. The behaviour exposed to Linux is defined by the driver
> @@ -355,6 +357,7 @@ struct i2c_client {
>  	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
>  #endif
>  	void *devres_group_id;		/* ID of probe devres group	*/
> +	bool turn_off_on_remove;	/* power state when done	*/

Can we have a different name that also makes sense for attach()?
To me, it's kind of hard to see immediately what the second argument to
attach() meant.

Since this is used for both power_on and power_off, I think something
more neutral would be easier to read? For example: power_flag?

Or I guess we could name it like full_power and provide a wrapper for
the detach() cases?

>  };
>  #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
>  
> 
> -- 
> b4 0.11.0-dev-d93f8
> 
