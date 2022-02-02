Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFAE4A78F4
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 20:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347016AbiBBTvZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 14:51:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347008AbiBBTvY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 14:51:24 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7579C061714;
        Wed,  2 Feb 2022 11:51:23 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id s185so404744oie.3;
        Wed, 02 Feb 2022 11:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wLwfEE97yZLdA4aymB7jDhApXpK3kvAfJvBAUv91c9g=;
        b=ohuzNntr3lgFqPOsRwtOVOoNg5qya+zqzjVHGiOIUQo0VjKO7mbehmyFhzVZykYDnZ
         bqqVWQbGnAZYCI3/bb+dDRYtuu3sWYNV4yIWfbS22c1233L/WdIWaWAnaKs3QK/c/3sO
         X7K+P4KaO4AvHGGtR/DOaRPMdRJCCJwJz1u11fsEtjt31UTP+26BjQZbcGuxMqNI6HgC
         +zWAVdCjt3o+H1naK3kmCHuZ9DEoo7SzOd7cppKnehvtffNqpU75+CbAQGX5g3POaO94
         PFtcDo+RZEIPxMRH/ZXv5oHnUMZhq/4EOuot6eJJWXkhEG9AjtHHoCh6jSfX2GN0X2a2
         2oLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=wLwfEE97yZLdA4aymB7jDhApXpK3kvAfJvBAUv91c9g=;
        b=SaQNx2Jjc9hoQVsaDokY8O0EITR2lSg9aaYKvpMRPKYKtUTlsAoc8gzQzfzUmM1ZGl
         dwMCqEe2Jv6oslV9VHeE3UF07TLXJPqNXuRlrG5SfQ1KBN11RU2SYYRhR7EtLExthEEc
         H44LtHcxHbDsyAHLF4l2PNo7XqDZt/oewxrTWT/MaXbbIxgD5foUrSjGaCWHPOsTvn7L
         PdAa2iSKFi0RuQ08xdiXnD5WFPcVcoBUW6e3ZW1ZKcKn4Wde1+Ok40wWcl2C0k2mb9oy
         9JdF/0RzIMSzncUyoGveVdqTw8wOhv/Bk/nLc4zJHV9nmsw87/73mZXqW46PLapSEWKQ
         puqg==
X-Gm-Message-State: AOAM531dm5mITPHvnFM19IIiuXNZXIiuGPZB1TTz83UsovgCdJ3iOVwz
        chHEyrmqmj1n8xbtwXaOY0I=
X-Google-Smtp-Source: ABdhPJzjQ7NBwTr8rhUbj/Fy8B83pdvdCPLzTIaLap8pWTjbYSCKiFeT3XDFp5FiXXgWm3TWg6dU1Q==
X-Received: by 2002:a05:6808:1885:: with SMTP id bi5mr5837150oib.310.1643831483267;
        Wed, 02 Feb 2022 11:51:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bg10sm8612869oib.33.2022.02.02.11.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 11:51:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Feb 2022 11:51:20 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v5 1/4] Watchdog: sp5100_tco: Move timer initialization
 into function
Message-ID: <20220202195120.GA2346468@roeck-us.net>
References: <20220202153525.1693378-1-terry.bowman@amd.com>
 <20220202153525.1693378-2-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202153525.1693378-2-terry.bowman@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 02, 2022 at 09:35:22AM -0600, Terry Bowman wrote:
> Refactor driver's timer initialization into new function. This is needed
> inorder to support adding new device layouts while using common timer
> initialization.
> 
> Co-developed-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Tested-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sp5100_tco.c | 65 +++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
> index dd9a744f82f8..b365bbc9ac36 100644
> --- a/drivers/watchdog/sp5100_tco.c
> +++ b/drivers/watchdog/sp5100_tco.c
> @@ -223,6 +223,41 @@ static u32 sp5100_tco_read_pm_reg32(u8 index)
>  	return val;
>  }
>  
> +static int sp5100_tco_timer_init(struct sp5100_tco *tco)
> +{
> +	struct watchdog_device *wdd = &tco->wdd;
> +	struct device *dev = wdd->parent;
> +	u32 val;
> +
> +	val = readl(SP5100_WDT_CONTROL(tco->tcobase));
> +	if (val & SP5100_WDT_DISABLED) {
> +		dev_err(dev, "Watchdog hardware is disabled\n");
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * Save WatchDogFired status, because WatchDogFired flag is
> +	 * cleared here.
> +	 */
> +	if (val & SP5100_WDT_FIRED)
> +		wdd->bootstatus = WDIOF_CARDRESET;
> +
> +	/* Set watchdog action to reset the system */
> +	val &= ~SP5100_WDT_ACTION_RESET;
> +	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
> +
> +	/* Set a reasonable heartbeat before we stop the timer */
> +	tco_timer_set_timeout(wdd, wdd->timeout);
> +
> +	/*
> +	 * Stop the TCO before we change anything so we don't race with
> +	 * a zeroed timer.
> +	 */
> +	tco_timer_stop(wdd);
> +
> +	return 0;
> +}
> +
>  static int sp5100_tco_setupdevice(struct device *dev,
>  				  struct watchdog_device *wdd)
>  {
> @@ -348,35 +383,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
>  	/* Setup the watchdog timer */
>  	tco_timer_enable(tco);
>  
> -	val = readl(SP5100_WDT_CONTROL(tco->tcobase));
> -	if (val & SP5100_WDT_DISABLED) {
> -		dev_err(dev, "Watchdog hardware is disabled\n");
> -		ret = -ENODEV;
> -		goto unreg_region;
> -	}
> -
> -	/*
> -	 * Save WatchDogFired status, because WatchDogFired flag is
> -	 * cleared here.
> -	 */
> -	if (val & SP5100_WDT_FIRED)
> -		wdd->bootstatus = WDIOF_CARDRESET;
> -	/* Set watchdog action to reset the system */
> -	val &= ~SP5100_WDT_ACTION_RESET;
> -	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
> -
> -	/* Set a reasonable heartbeat before we stop the timer */
> -	tco_timer_set_timeout(wdd, wdd->timeout);
> -
> -	/*
> -	 * Stop the TCO before we change anything so we don't race with
> -	 * a zeroed timer.
> -	 */
> -	tco_timer_stop(wdd);
> -
> -	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
> -
> -	return 0;
> +	ret = sp5100_tco_timer_init(tco);
>  
>  unreg_region:
>  	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
> -- 
> 2.30.2
> 
