Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F77259A58
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 18:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730287AbgIAQsY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 12:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730184AbgIAQsT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 12:48:19 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD8AC061244;
        Tue,  1 Sep 2020 09:48:19 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ls14so889132pjb.3;
        Tue, 01 Sep 2020 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ISgxfMlx1tpXNHdd5pRihxAjEYW9qIV34/48T7BNuKo=;
        b=AW84ZXUJF5oBW2VhIfg0ATYbyCPZIGPtJ9438VfPw7jMXzBQWgYrMaqamL3+IXN9V9
         aAz6PfNTJANhyF8bHwQdSdYHFRJ5LEq55RNo7m4iZUzCN2KUi6VYLmzKy8f3otHjnj5g
         6d+vU4rBIsisNAAPXjLwUpTowHW6PvRKXCv8mQ1NRMiC/D48t/P7AQuv5jLXQuidoj0H
         nrVdbbnVFlXiQ+mlA3ddOkKYUHBJi+zZh0KdjAUiG2SUr6DEdwL77p26Q3aXFYweKorY
         iYvI0sBBbGWcJholHg4CprxcddFp83pd5l6VweZ1rKw4lSA2dEZTfnC7l90MeWqyT8z4
         1Lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ISgxfMlx1tpXNHdd5pRihxAjEYW9qIV34/48T7BNuKo=;
        b=WtGjQ79XtroIsBJorry/JRarSXbEYjxf0Dfn9Z1XmUyONsPRohe71SwPR5u1ZOZ4IS
         8sQ12mjc/oKLYoB9YVdrPkz3BOMb56QX0IcPsCcqJw9j9pg085ejRL0Dm1WTdNqU0ode
         Pjgkmnk4IB3KWL3zY7iV/EnUiNQ4/HPMo2rDRvkQ/s2eZoC/sRbMZu86zK7awLkHgDFN
         L7FXCSkT4Bc5QJY0jtMG6ez2MEXdkN6aJc6vqFIkAPNKcKei4M/1fx+AdvLbeKYEi0Vd
         Q0lKubHwJkM/rlhljw7aA65XIxQXFkLc0DOSBRcTam2r7Oo1CMA0MzBG/F2rhtmXgSPm
         V9SQ==
X-Gm-Message-State: AOAM533s02fe8si/MkT0IzpH4xbphk8vQl9W9vHU7NPLWIWTBigCRtfw
        Pa+D/eKY6tWpryxeIwo1Nq2URs0enn8=
X-Google-Smtp-Source: ABdhPJwNrGAiXa0XZqPV+eTjrUOWWhZY8y69kQIgLJFv6Z+E/fQVc5qy5Y44tIqG8HhQ5V26/bCNpg==
X-Received: by 2002:a17:90a:d496:: with SMTP id s22mr2304548pju.167.1598978898277;
        Tue, 01 Sep 2020 09:48:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q24sm2551926pfs.206.2020.09.01.09.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 09:48:17 -0700 (PDT)
Subject: Re: [PATCH] watchdog: da9063: wake up parent ahead of reboot
To:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, linux-i2c@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <20200901161756.28100-1-uli+renesas@fpond.eu>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a89b6ee3-4b69-422c-4a48-d105ff8807ed@roeck-us.net>
Date:   Tue, 1 Sep 2020 09:48:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901161756.28100-1-uli+renesas@fpond.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/1/20 9:17 AM, Ulrich Hecht wrote:
> This patch ensures our parent is awake before a reboot takes place. This
> prevents situations in which the I2C host has been suspended and cannot
> be safely woken up anymore when it needs to talk to us.
> 

Why not call pm_runtime_get_sync() in da9063_wdt_restart() ? What
guarantees that the local notifier is called before the watchdog core's
restart notifier ? And what is the point of using the watchdog core's
reboot handler if it is bypassed anyway ?

Also, why is it not necessary to call pm functions when the watchdog is
started, when it is stopped, and during suspend/resume ?

Thanks,
Guenter

> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
> 
> Hi!
> 
> This is supposed to resolve the issue that came up in the review of
> "[PATCH v2] i2c: sh_mobile: implement atomic transfers" that the parent
> controller may be suspended when the restart method is called. See
> https://www.spinics.net/lists/linux-i2c/msg46367.html for details.
> 
> CU
> Uli
> 
> 
>  drivers/watchdog/da9063_wdt.c   | 21 +++++++++++++++++++++
>  include/linux/mfd/da9063/core.h |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
> index 423584252606..89718733491e 100644
> --- a/drivers/watchdog/da9063_wdt.c
> +++ b/drivers/watchdog/da9063_wdt.c
> @@ -18,6 +18,8 @@
>  #include <linux/mfd/da9063/registers.h>
>  #include <linux/mfd/da9063/core.h>
>  #include <linux/regmap.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reboot.h>
>  
>  /*
>   * Watchdog selector to timeout in seconds.
> @@ -158,6 +160,21 @@ static int da9063_wdt_set_timeout(struct watchdog_device *wdd,
>  	return ret;
>  }
>  
> +static int da9063_reboot_notifier(struct notifier_block *nb,
> +				  unsigned long code, void *unused)
> +{
> +	struct da9063 *da9063 = container_of(nb, struct da9063, reboot_nb);
> +
> +	/*
> +	 * Make sure parent device is running. This cannot be done in the
> +	 * restart handler because it is no longer safe to do runtime PM
> +	 * there.
> +	 */
> +	pm_runtime_get_sync(da9063->dev->parent);
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static int da9063_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>  			      void *data)
>  {
> @@ -233,6 +250,10 @@ static int da9063_wdt_probe(struct platform_device *pdev)
>  		set_bit(WDOG_HW_RUNNING, &wdd->status);
>  	}
>  
> +	/* Get early notification of reboot so we can wake up the parent. */
> +	da9063->reboot_nb.notifier_call = da9063_reboot_notifier;
> +	devm_register_reboot_notifier(dev, &da9063->reboot_nb);
> +
>  	return devm_watchdog_register_device(dev, wdd);
>  }
>  
> diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
> index fa7a43f02f27..9a3283d488b7 100644
> --- a/include/linux/mfd/da9063/core.h
> +++ b/include/linux/mfd/da9063/core.h
> @@ -85,6 +85,8 @@ struct da9063 {
>  	int		chip_irq;
>  	unsigned int	irq_base;
>  	struct regmap_irq_chip_data *regmap_irq;
> +
> +	struct notifier_block reboot_nb;
>  };
>  
>  int da9063_device_init(struct da9063 *da9063, unsigned int irq);
> 

