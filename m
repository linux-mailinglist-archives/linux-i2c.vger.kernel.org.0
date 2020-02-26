Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9097A170008
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 14:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgBZNbi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 08:31:38 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38801 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbgBZNbi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Feb 2020 08:31:38 -0500
Received: by mail-pg1-f194.google.com with SMTP id d6so1313188pgn.5;
        Wed, 26 Feb 2020 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yXaNdZxxeeLiYteK+gGmD0B4XKL5Bja5LliTny0rgdg=;
        b=PcdwUo/xQWD99Xft/fjNSpbQRlKzeHSfRif3GFk+9DuvCOVs4dak2XNo3SI3E8+o4p
         HGl/iBPRREanS0DV9NwITNXXa/WL+bn6LUUddAq1PPq7Blg7KRElsMC4H5v7yIWCYvG9
         vlHATJLhYnAIrek5bMSAU8tbbVhgnIgnqFBv+plUIU3qe/mFd92JNZ7wDUZT/+IvSYVd
         XwU0G8Y/dOPEWqGY6BP+s7oXaNwVbACvpowGPwExUa+B1HlgJF7+rS0CIro4jcZRJk4q
         4+4A6wQUt8OBAVfnVEt/8TFCke0NZCYi0he8bgeUjoxInyFqU80ZPmh9kCnDcfRQILHj
         szJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yXaNdZxxeeLiYteK+gGmD0B4XKL5Bja5LliTny0rgdg=;
        b=W+1HodJpaDvXaWm5Mv10uR0me+IA8QrUYSEP2oA6vyE5k26H8yZsJeJb+3tSgkNv7S
         tFVE3wjCPq2HbNAEKnZW2lBHq7PypsHrXNwXSL7P3womDi1FtSCp8e7Tl6En6owkjDM0
         PkETixI7jwwO4ZCICw02sbKx1gQczBsxk3OETViCr9e2hQYcl0fsMmKvzGhBLtRbkNtc
         6S98xbQ9db4y45d1tWbpnrq8QIXiNXASx2TMXuaa/SXmOyBjufbpx7WVRhQvi3BJ+s2p
         nPwNny6y71ISs9vsAR0FPY6zzJfGgCcL138Ve2Q6tPNocpdFFMHJG5JWvhC+rDRlJdro
         ambQ==
X-Gm-Message-State: APjAAAWCZN385aUceEIGPP1wXdc/aTnItSJJ9RPFbEpQqGDGTcGPZbeC
        SnLzHzmn5OtkGHIU/Xud2B+R05qg
X-Google-Smtp-Source: APXvYqyJQYBrhFe7lEeksu+YwmsbVehOyqUuDKB3U044IYLa2XRTprU1xNVPxiQcmch37KE9763sww==
X-Received: by 2002:a63:5423:: with SMTP id i35mr3913634pgb.179.1582723894710;
        Wed, 26 Feb 2020 05:31:34 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b1sm3166268pfp.44.2020.02.26.05.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 05:31:33 -0800 (PST)
Subject: Re: [PATCH v2 3/3] i2c: i801: Do not add ICH_RES_IO_SMI for the
 iTCO_wdt device
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
 <20200226132122.62805-4-mika.westerberg@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <f8549db6-de8a-2205-5cef-f0cb457a21f1@roeck-us.net>
Date:   Wed, 26 Feb 2020 05:31:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226132122.62805-4-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/26/20 5:21 AM, Mika Westerberg wrote:
> Martin noticed that nct6775 driver does not load properly on his system
> in v5.4+ kernels. The issue was bisected to commit b84398d6d7f9 ("i2c:
> i801: Use iTCO version 6 in Cannon Lake PCH and beyond") but it is
> likely not the culprit because the faulty code has been in the driver
> already since commit 9424693035a5 ("i2c: i801: Create iTCO device on
> newer Intel PCHs"). So more likely some commit that added PCI IDs of
> recent chipsets made the driver to create the iTCO_wdt device on Martins
> system.
> 
> The issue was debugged to be PCI configuration access to the PMC device
> that is not present. This returns all 1's when read and this caused the
> iTCO_wdt driver to accidentally request resourses used by nct6775.
> 
> It turns out that the SMI resource is only required for some ancient
> systems, not the ones supported by this driver. For this reason do not
> populate the SMI resource at all and drop all the related code. The
> driver now always populates the main I/O resource and only in case of SPT
> (Intel Sunrisepoint) compatible devices it adds another resource for the
> NO_REBOOT bit. These two resources are of different types so
> platform_get_resource() used by the iTCO_wdt driver continues to find
> the both resources at index 0.
> 
> Link: https://lore.kernel.org/linux-hwmon/CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com/
> Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
> Reported-by: Martin Volf <martin.volf.42@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/i2c/busses/i2c-i801.c | 45 ++++++++++-------------------------
>  1 file changed, 12 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ca4f096fef74..a9c03f5c3482 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -132,11 +132,6 @@
>  #define TCOBASE		0x050
>  #define TCOCTL		0x054
>  
> -#define ACPIBASE		0x040
> -#define ACPIBASE_SMI_OFF	0x030
> -#define ACPICTRL		0x044
> -#define ACPICTRL_EN		0x080
> -
>  #define SBREG_BAR		0x10
>  #define SBREG_SMBCTRL		0xc6000c
>  #define SBREG_SMBCTRL_DNV	0xcf000c
> @@ -1553,7 +1548,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, hidden);
>  	spin_unlock(&p2sb_spinlock);
>  
> -	res = &tco_res[ICH_RES_MEM_OFF];
> +	res = &tco_res[1];
>  	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)
>  		res->start = (resource_size_t)base64_addr + SBREG_SMBCTRL_DNV;
>  	else
> @@ -1563,7 +1558,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  	res->flags = IORESOURCE_MEM;
>  
>  	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
> -					tco_res, 3, &spt_tco_platform_data,
> +					tco_res, 2, &spt_tco_platform_data,
>  					sizeof(spt_tco_platform_data));
>  }
>  
> @@ -1576,17 +1571,16 @@ static struct platform_device *
>  i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
>  		 struct resource *tco_res)
>  {
> -	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
> -					tco_res, 2, &cnl_tco_platform_data,
> -					sizeof(cnl_tco_platform_data));
> +	return platform_device_register_resndata(&pci_dev->dev,
> +			"iTCO_wdt", -1, tco_res, 1, &cnl_tco_platform_data,
> +			sizeof(cnl_tco_platform_data));
>  }
>  
>  static void i801_add_tco(struct i801_priv *priv)
>  {
> -	u32 base_addr, tco_base, tco_ctl, ctrl_val;
>  	struct pci_dev *pci_dev = priv->pci_dev;
> -	struct resource tco_res[3], *res;
> -	unsigned int devfn;
> +	struct resource tco_res[2], *res;
> +	u32 tco_base, tco_ctl;
>  
>  	/* If we have ACPI based watchdog use that instead */
>  	if (acpi_has_watchdog())
> @@ -1601,30 +1595,15 @@ static void i801_add_tco(struct i801_priv *priv)
>  		return;
>  
>  	memset(tco_res, 0, sizeof(tco_res));
> -
> -	res = &tco_res[ICH_RES_IO_TCO];
> -	res->start = tco_base & ~1;
> -	res->end = res->start + 32 - 1;
> -	res->flags = IORESOURCE_IO;
> -
>  	/*
> -	 * Power Management registers.
> +	 * Always populate the main iTCO IO resource here. The second entry
> +	 * for NO_REBOOT MMIO is filled by the SPT specific function.
>  	 */
> -	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);
> -	pci_bus_read_config_dword(pci_dev->bus, devfn, ACPIBASE, &base_addr);
> -
> -	res = &tco_res[ICH_RES_IO_SMI];
> -	res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
> -	res->end = res->start + 3;
> +	res = &tco_res[0];
> +	res->start = tco_base & ~1;
> +	res->end = res->start + 32 - 1;
>  	res->flags = IORESOURCE_IO;
>  
> -	/*
> -	 * Enable the ACPI I/O space.
> -	 */
> -	pci_bus_read_config_dword(pci_dev->bus, devfn, ACPICTRL, &ctrl_val);
> -	ctrl_val |= ACPICTRL_EN;
> -	pci_bus_write_config_dword(pci_dev->bus, devfn, ACPICTRL, ctrl_val);
> -
>  	if (priv->features & FEATURE_TCO_CNL)
>  		priv->tco_pdev = i801_add_tco_cnl(priv, pci_dev, tco_res);
>  	else
> 

