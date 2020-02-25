Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAE6A16C411
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730172AbgBYOhM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:37:12 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41673 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbgBYOhM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 09:37:12 -0500
Received: by mail-pl1-f193.google.com with SMTP id t14so5567638plr.8;
        Tue, 25 Feb 2020 06:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ipevhSF8N9M3cyotJYXUjwn4UfTuGovT1aQqFV/X9qA=;
        b=qZI8D8+Q392/bA/HphKfRiLKSbZMGKrKBqpeCmjuJSyeb6hbvqgyZ+lZA7WHB1+GZp
         KHge0+WsP3W8x9WW2swiydXqKYDTMvkUNAVI3qZa4c4as9SoseNFbXw3I1+K8kwCmxQ+
         CnW6bLm+CcsHIC5nUg7UPzKXgVHVwxhsQt5cR6Cc/qUpnBFyjMlMb+INsbajimwv1yNA
         cIG2hiEK4wM1k65tVbfkiOh0GI8ffmIl2z0liEG3e08o7yN9hzUv43dATicf/d7oAD+A
         GCG5fGYeSd9q/NcidYPUeMHzd9rwLYPGpafIpbiG5tZvitvtEgkNVLeZyryHxJtd01wC
         7v4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ipevhSF8N9M3cyotJYXUjwn4UfTuGovT1aQqFV/X9qA=;
        b=KGPhC+557V9kSslKmzvBgo1hZOu4i2+ibtWdVwmlTqxPnrTYvcMqk5Hf3CKmEKQKV/
         qE5palE32KfNUQnF881Q7VDPPDUycCsOHDIX+W+kFis7qGZ6ncX3Rz63SPdHKhZUUxKe
         hns/4SCZMaXg8qfONabL9GEiktFliN5EJCOxB++MDNUcpwu6RGBNj0atCo0PYtfLkKhD
         6nO6aoHYdWZmCCMP2Th07+ZsDlg+5G+hi+qpKZd8J9IrWXsoP2Au2Sv1H8elf6j0P6Ns
         5odZ3aUXHHJd2kr6gU+dsmHnmwz3/2a/2gyZdRYnThLi3JCLW5KP2t0GhchLIRWwGVHU
         RZvw==
X-Gm-Message-State: APjAAAUb4DbMiixhaKFXPs1iAZgEjhCOPycLpSjV9JB351ihWtZGFr7H
        SW9wtOQV8w5asbFRhcwQIw4=
X-Google-Smtp-Source: APXvYqwETdgLZFN5OPBfpsGlLn4WflSJ106UwC0zYPQepTknpnzAG/rvZl0HqyHBw6s84ZuOHuvSVA==
X-Received: by 2002:a17:90b:254:: with SMTP id fz20mr5468567pjb.25.1582641431565;
        Tue, 25 Feb 2020 06:37:11 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g13sm16993177pgh.82.2020.02.25.06.37.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 06:37:10 -0800 (PST)
Date:   Tue, 25 Feb 2020 06:37:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: iTCO_wdt: Make ICH_RES_IO_SMI optional
Message-ID: <20200225143709.GA450@roeck-us.net>
References: <20200225123802.88984-1-mika.westerberg@linux.intel.com>
 <20200225123802.88984-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225123802.88984-3-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 25, 2020 at 03:38:01PM +0300, Mika Westerberg wrote:
> The iTCO_wdt driver only needs ICH_RES_IO_SMI I/O resource when either
> turn_SMI_watchdog_clear_off module parameter is set to match ->iTCO_version
> (or higher), and when legacy iTCO_vendorsupport is set. Modify the driver
> so that ICH_RES_IO_SMI is optional if the two conditions are not met.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/watchdog/iTCO_wdt.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 156360e37714..f1692452bc25 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -460,7 +460,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  
>  	p->smi_res = platform_get_resource(pdev, IORESOURCE_IO, ICH_RES_IO_SMI);
> -	if (!p->smi_res)
> +	if (!p->smi_res && iTCO_vendorsupport)
>  		return -ENODEV;
>  
>  	p->iTCO_version = pdata->version;
> @@ -492,15 +492,19 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	/* Set the NO_REBOOT bit to prevent later reboots, just for sure */
>  	p->update_no_reboot_bit(p->no_reboot_priv, true);
>  
> -	/* The TCO logic uses the TCO_EN bit in the SMI_EN register */
> -	if (!devm_request_region(dev, p->smi_res->start,
> -				 resource_size(p->smi_res),
> -				 pdev->name)) {
> -		pr_err("I/O address 0x%04llx already in use, device disabled\n",
> -		       (u64)SMI_EN(p));
> -		return -EBUSY;
> -	}
>  	if (turn_SMI_watchdog_clear_off >= p->iTCO_version) {
> +		if (!p->smi_res) {
> +			pr_err("SMI I/O resource is missing\n");
> +			return -EINVAL;
> +		}
> +		/* The TCO logic uses the TCO_EN bit in the SMI_EN register */
> +		if (!devm_request_region(dev, p->smi_res->start,
> +					 resource_size(p->smi_res),
> +					 pdev->name)) {
> +			pr_err("I/O address 0x%04llx already in use, device disabled\n",
> +			       (u64)SMI_EN(p));
> +			return -EBUSY;
> +		}

The request_region call is also needed if iTCO_vendorsupport is true.
Well, not strictly speaking, I guess, but then one could argue that
it isn't needed at all.

In this context - looking into the vendorsupport code, I wonder if
it is time to retire it. Separate patch, of course, but still.
Any thoughts ?

Guenter
