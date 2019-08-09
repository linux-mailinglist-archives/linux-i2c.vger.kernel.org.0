Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8664588442
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 22:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfHIUty (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 16:49:54 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33711 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfHIUty (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Aug 2019 16:49:54 -0400
Received: by mail-pg1-f194.google.com with SMTP id n190so5598683pgn.0;
        Fri, 09 Aug 2019 13:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hJJT1ymL0J7mCHWyypa9/1ViXebR8DKZp56qRVfUD3k=;
        b=W9IiWK5mNRb5v0Z60Udl2qWtr5McC19LDDU9Uh35V7PWknGHcqYx6jtXzkm4p3E8Hu
         S2zpCu/5tMEQWyutxqMXPhl6ixOTzXkAZjKbSMzQazwzdf2/TsdjgkcATtYFcwmxcErS
         ASZQC6/IP4F9Zkjaa9fSXW7OD7wA48FMOi73QtOgjkK/eZiZSHFa4r2BNdVflogPGR1S
         eSHBH5CQyhyJF/5uXaG+ychE9dX4Rl9Yyj6l2GpH83joyOTbT+xzxvc4E93p1pyj+G8K
         YIGOTsDwCPYnXGxwHVZ179Dst5lnYS7xVmHZUb00GBWPN3OMoCwFYiSr0WDNsMgfPYbN
         JpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hJJT1ymL0J7mCHWyypa9/1ViXebR8DKZp56qRVfUD3k=;
        b=fI41rt8VJnUg4uWN+R5zqL+5fftxQXDd2gZmFejWMNNuGbbXtRhYe3xiM8VVv5Lrvg
         H7ZCZhxlMThV//zGH8CJcKA3DSPvDcaEBQyZlKJnMo5D8yQWT/ndnzurnnlD9zCdJd+k
         /JaY41B7B/9ziZzAvWOab0IPoIkCX3oYGzWNsWZvVT+PTcVMhXxcvCChfjPpMp0w1Pv4
         0Kf5JMxW4mywMATVs8AIEb35JY2I5aiwIFDQ8oDe356tvIR2hy/VHl/v3rF1itr0fkIJ
         0nSZzO4l4PMsRzr3ETZtR016Z9lARS6ZKU8rQ5AZtBrt43Oh0XfwP9qV+XDajLeyabud
         F4IA==
X-Gm-Message-State: APjAAAWTrlpwMZwfNdE8UBSHPrBndIIlgEP6kzs5VvunNyisY0YAuLRL
        /Kd8uBxJP06nnyZsQzzu/H0sU0KC
X-Google-Smtp-Source: APXvYqxAs/H11obqnFZLlgOJG5x8xfRmZPLWgxaCmjFUne1g/M6zrWS2VkEkebAR2v8CWZOZCV3nGw==
X-Received: by 2002:a62:2c93:: with SMTP id s141mr6233405pfs.114.1565383793588;
        Fri, 09 Aug 2019 13:49:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 131sm28299090pge.37.2019.08.09.13.49.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 13:49:53 -0700 (PDT)
Date:   Fri, 9 Aug 2019 13:49:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: iTCO: Add support for Cannon Lake PCH iTCO
Message-ID: <20190809204952.GA21059@roeck-us.net>
References: <20190809124553.67012-1-mika.westerberg@linux.intel.com>
 <20190809124553.67012-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809124553.67012-2-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 09, 2019 at 03:45:52PM +0300, Mika Westerberg wrote:
> In Intel Cannon Lake PCH the NO_REBOOT bit was moved from the private
> register space to be part of the TCO1_CNT register. For this reason
> introduce another version (6) that uses this register to set and clear
> NO_REBOOT bit.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

I assume this will be applied through i2c together with the other patch
of the series.

Guenter

> ---
>  drivers/watchdog/iTCO_wdt.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index c559f706ae7e..505f2c837347 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -215,6 +215,23 @@ static int update_no_reboot_bit_mem(void *priv, bool set)
>  	return 0;
>  }
>  
> +static int update_no_reboot_bit_cnt(void *priv, bool set)
> +{
> +	struct iTCO_wdt_private *p = priv;
> +	u16 val, newval;
> +
> +	val = inw(TCO1_CNT(p));
> +	if (set)
> +		val |= BIT(0);
> +	else
> +		val &= ~BIT(0);
> +	outw(val, TCO1_CNT(p));
> +	newval = inw(TCO1_CNT(p));
> +
> +	/* make sure the update is successful */
> +	return val != newval ? -EIO : 0;
> +}
> +
>  static void iTCO_wdt_no_reboot_bit_setup(struct iTCO_wdt_private *p,
>  		struct itco_wdt_platform_data *pdata)
>  {
> @@ -224,7 +241,9 @@ static void iTCO_wdt_no_reboot_bit_setup(struct iTCO_wdt_private *p,
>  		return;
>  	}
>  
> -	if (p->iTCO_version >= 2)
> +	if (p->iTCO_version >= 6)
> +		p->update_no_reboot_bit = update_no_reboot_bit_cnt;
> +	else if (p->iTCO_version >= 2)
>  		p->update_no_reboot_bit = update_no_reboot_bit_mem;
>  	else if (p->iTCO_version == 1)
>  		p->update_no_reboot_bit = update_no_reboot_bit_pci;
> @@ -452,7 +471,8 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	 * Get the Memory-Mapped GCS or PMC register, we need it for the
>  	 * NO_REBOOT flag (TCO v2 and v3).
>  	 */
> -	if (p->iTCO_version >= 2 && !pdata->update_no_reboot_bit) {
> +	if (p->iTCO_version >= 2 && p->iTCO_version < 6 &&
> +	    !pdata->update_no_reboot_bit) {
>  		p->gcs_pmc_res = platform_get_resource(pdev,
>  						       IORESOURCE_MEM,
>  						       ICH_RES_MEM_GCS_PMC);
> @@ -502,6 +522,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  
>  	/* Clear out the (probably old) status */
>  	switch (p->iTCO_version) {
> +	case 6:
>  	case 5:
>  	case 4:
>  		outw(0x0008, TCO1_STS(p)); /* Clear the Time Out Status bit */
> -- 
> 2.20.1
> 
