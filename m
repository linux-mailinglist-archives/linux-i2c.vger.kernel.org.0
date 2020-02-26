Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F22A1170019
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 14:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgBZNdE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 08:33:04 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:51113 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgBZNdE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Feb 2020 08:33:04 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so1268297pjb.0;
        Wed, 26 Feb 2020 05:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ugA4PvlHlEoN902t1rkNTkcHB6J4KdRZYzHNdSIl+2k=;
        b=EddzZKC1rEFRw4FcRf9MHBHOSertUe+bBZW2hjyP5QR8cugW5OmcOQNU5Wg+WJ2JI7
         bi2LVKDNthLKfi8bF++83gxhHpZyhYMYWAD2ZH26nYpEsHBPSIRuwdm9CsDXYeKkIb0p
         C8SQucZy1c33NAumJpHKDCX1TzaF9GJAvH8u+VYPen19i9c51sZ02JiI7OHDTmS827nX
         RY9fknH93TJGmRoguwDlY64k0zwK/TP7fxEWGKo75ayou+mFthFHhQ6sV5vIj6hnDxyD
         mIZPrVwTy+hqF4lAmmYjff8CLZM3MavvBB5Swi4FPArfvpJYRJJdL+CS9DUOfPoWovRB
         BitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ugA4PvlHlEoN902t1rkNTkcHB6J4KdRZYzHNdSIl+2k=;
        b=c3k/S/r5d0tKyLWqGpkIbPPcG7DsDB4MwsIqpfH0uunyGD4u5agRHN3PNAPPC4N4/9
         WcguNNg2iboI7SlaEJimNfs56v8N4eQnhROMwtjTUOjjvQNMqkiHJpSacmMpSS/dxO7Q
         VALn2GofYpNqDqZgBMV/0eDPnvw7Of/Tezh3pTM1lPe/Z28ayekRyk/fX2AkGYz3Ri/M
         tXbsUAyd3gIVADP+PDkNZi6h9RiovWcXTGgcujDOvf8ZVqavdRoJoXOHfGQzh4epML5p
         aWy0x/yz5TO4G+z6dHf9kd0JZGdzFXFXfSqCTu4QNh7m3LLqtt5YlvsAhZ3C8Vk2vgS4
         Aujg==
X-Gm-Message-State: APjAAAVnMsCS1ea8TOuRD6hlx+Gz2h+YexXohCxR9cQyOKgAO7FYoZZJ
        75mwU8fmgk8urqTBnsgxCqWAXe56
X-Google-Smtp-Source: APXvYqxAYJJGIt+2qVo2jkrYYMTkGWotcFY/Aafr1Qw6dTIbvXcovIsDuDUbleXtu0jXHkT2KiFGPg==
X-Received: by 2002:a17:90a:ac0f:: with SMTP id o15mr5165322pjq.133.1582723982564;
        Wed, 26 Feb 2020 05:33:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g7sm3339812pfq.33.2020.02.26.05.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 05:33:02 -0800 (PST)
Subject: Re: [PATCH v2 2/3] watchdog: iTCO_wdt: Make ICH_RES_IO_SMI optional
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
 <20200226132122.62805-3-mika.westerberg@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <8565beae-e7b3-c683-cd39-5af869513f1a@roeck-us.net>
Date:   Wed, 26 Feb 2020 05:33:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226132122.62805-3-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/26/20 5:21 AM, Mika Westerberg wrote:
> The iTCO_wdt driver only needs ICH_RES_IO_SMI I/O resource when either
> turn_SMI_watchdog_clear_off module parameter is set to match ->iTCO_version
> (or higher), and when legacy iTCO_vendorsupport is set. Modify the driver
> so that ICH_RES_IO_SMI is optional if the two conditions are not met.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/iTCO_wdt.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index 156360e37714..e707c4797f76 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -459,13 +459,25 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>  	if (!p->tco_res)
>  		return -ENODEV;
>  
> -	p->smi_res = platform_get_resource(pdev, IORESOURCE_IO, ICH_RES_IO_SMI);
> -	if (!p->smi_res)
> -		return -ENODEV;
> -
>  	p->iTCO_version = pdata->version;
>  	p->pci_dev = to_pci_dev(dev->parent);
>  
> +	p->smi_res = platform_get_resource(pdev, IORESOURCE_IO, ICH_RES_IO_SMI);
> +	if (p->smi_res) {
> +		/* The TCO logic uses the TCO_EN bit in the SMI_EN register */
> +		if (!devm_request_region(dev, p->smi_res->start,
> +					 resource_size(p->smi_res),
> +					 pdev->name)) {
> +			pr_err("I/O address 0x%04llx already in use, device disabled\n",
> +			       (u64)SMI_EN(p));
> +			return -EBUSY;
> +		}
> +	} else if (iTCO_vendorsupport ||
> +		   turn_SMI_watchdog_clear_off >= p->iTCO_version) {
> +		pr_err("SMI I/O resource is missing\n");
> +		return -ENODEV;
> +	}
> +
>  	iTCO_wdt_no_reboot_bit_setup(p, pdata);
>  
>  	/*
> @@ -492,14 +504,6 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
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
>  		/*
>  		 * Bit 13: TCO_EN -> 0
> 

