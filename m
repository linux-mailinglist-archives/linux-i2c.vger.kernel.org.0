Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF944A78F6
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 20:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347030AbiBBTvh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 14:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347024AbiBBTvf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 14:51:35 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0214BC06173B;
        Wed,  2 Feb 2022 11:51:34 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id m10so417711oie.2;
        Wed, 02 Feb 2022 11:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CPnsn/J9UKl4WpEgSo9FCsz9h3CvEmPL0aFphevuXDU=;
        b=TYZj7nf9m6AJrV/EGw7HnNryZ9YBS3TKVf815VxoiS2hUQXt9cZIoIDIqf+i61FIRL
         fwl14iM00qlkmmaaANpoIZHUpUTZyG8U5Xpn+cm6xK78V0fHT+DOl9J6XELihC+8yZL7
         icVY/zQlVuB/h5nmj3sH55yOvxtiuGnRwgXdFd+SiNb1gbFQzA7YElWW3727fAwlH7Xt
         Q6KYtrr8eHKmbuyJ1Ohtwma3pj/RsMXnXIwh/3v/JEsXudWvRSeZHti/2BRMwfmGKRsE
         QJFOgnx/eRbkL3807ygEfIrPNyHE+CaIXcOZ3sUIyN6u0qQTWFpEBcC184imNgbbKUPp
         in4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=CPnsn/J9UKl4WpEgSo9FCsz9h3CvEmPL0aFphevuXDU=;
        b=CMoqFQuR6ZrLFc456/qbs48+l9T5v5d1iBlukwhq4iI1IfF7b8aEzZLkHorCcWggCM
         suClRqaNVrKrvPaBe5WMb49mtPCbE+pPvRjAygdY3VnDMEF4cTeAUru9YV977OTlIv8S
         KMar/U78daeD4ZsbaLvmWVLa/YPHaOX9wVV16POEqNVQQBQvPw6unh8bIU/BEEyEus3h
         pllMgeopy0r3u7Zih5sIRMGa5AFNkbPmk5kFWirdysAFwivaVH78eTkb9HJMm6Aoawjp
         KsHNyL6zLvkqTqcGi7pwtfY4MDm892+9f7HOHpktgWiitACyoCgumTR6X/F7MblnvLzW
         lNZA==
X-Gm-Message-State: AOAM530mMZhjiIN7BUabuoW0pOJ9DwsG9b4z7fh6cds6tvEIMKLche11
        ZxGeJiBIy3Xuly1PoWj2qEI=
X-Google-Smtp-Source: ABdhPJxErei+VJVsWVb27XcjE8SDAeNg/fsA9kYUbSwmwjgNEl0iz2ueiYPN3FCOr35vMeCkm36L+Q==
X-Received: by 2002:a05:6808:1704:: with SMTP id bc4mr5342878oib.177.1643831492984;
        Wed, 02 Feb 2022 11:51:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bb16sm5113662oob.42.2022.02.02.11.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 11:51:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Feb 2022 11:51:31 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v5 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
Message-ID: <20220202195131.GB2346468@roeck-us.net>
References: <20220202153525.1693378-1-terry.bowman@amd.com>
 <20220202153525.1693378-3-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202153525.1693378-3-terry.bowman@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 02, 2022 at 09:35:23AM -0600, Terry Bowman wrote:
> Combine MMIO base address and alternate base address detection. Combine
> based on layout type. This will simplify the function by eliminating
> a switch case.
> 
> Move existing request/release code into functions. This currently only
> supports port I/O request/release. The move into a separate function
> will make it ready for adding MMIO region support.
> 
> Co-developed-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Tested-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sp5100_tco.c | 155 ++++++++++++++++++----------------
>  drivers/watchdog/sp5100_tco.h |   1 +
>  2 files changed, 82 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
> index b365bbc9ac36..8db7504f0aa4 100644
> --- a/drivers/watchdog/sp5100_tco.c
> +++ b/drivers/watchdog/sp5100_tco.c
> @@ -223,6 +223,55 @@ static u32 sp5100_tco_read_pm_reg32(u8 index)
>  	return val;
>  }
>  
> +static u32 sp5100_tco_request_region(struct device *dev,
> +				     u32 mmio_addr,
> +				     const char *dev_name)
> +{
> +	if (!devm_request_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE,
> +				     dev_name)) {
> +		dev_dbg(dev, "MMIO address 0x%08x already in use\n", mmio_addr);
> +		return 0;
> +	}
> +
> +	return mmio_addr;
> +}
> +
> +static u32 sp5100_tco_prepare_base(struct sp5100_tco *tco,
> +				   u32 mmio_addr,
> +				   u32 alt_mmio_addr,
> +				   const char *dev_name)
> +{
> +	struct device *dev = tco->wdd.parent;
> +
> +	dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n", mmio_addr);
> +
> +	if (!mmio_addr && !alt_mmio_addr)
> +		return -ENODEV;
> +
> +	/* Check for MMIO address and alternate MMIO address conflicts */
> +	if (mmio_addr)
> +		mmio_addr = sp5100_tco_request_region(dev, mmio_addr, dev_name);
> +
> +	if (!mmio_addr && alt_mmio_addr)
> +		mmio_addr = sp5100_tco_request_region(dev, alt_mmio_addr, dev_name);
> +
> +	if (!mmio_addr) {
> +		dev_err(dev, "Failed to reserve MMIO or alternate MMIO region\n");
> +		return -EBUSY;
> +	}
> +
> +	tco->tcobase = devm_ioremap(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
> +	if (!tco->tcobase) {
> +		dev_err(dev, "MMIO address 0x%08x failed mapping\n", mmio_addr);
> +		devm_release_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
> +		return -ENOMEM;
> +	}
> +
> +	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", mmio_addr);
> +
> +	return 0;
> +}
> +
>  static int sp5100_tco_timer_init(struct sp5100_tco *tco)
>  {
>  	struct watchdog_device *wdd = &tco->wdd;
> @@ -264,6 +313,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
>  	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
>  	const char *dev_name;
>  	u32 mmio_addr = 0, val;
> +	u32 alt_mmio_addr = 0;
>  	int ret;
>  
>  	/* Request the IO ports used by this driver */
> @@ -282,11 +332,32 @@ static int sp5100_tco_setupdevice(struct device *dev,
>  		dev_name = SP5100_DEVNAME;
>  		mmio_addr = sp5100_tco_read_pm_reg32(SP5100_PM_WATCHDOG_BASE) &
>  								0xfffffff8;
> +
> +		/*
> +		 * Secondly, find the watchdog timer MMIO address
> +		 * from SBResource_MMIO register.
> +		 */
> +
> +		/* Read SBResource_MMIO from PCI config(PCI_Reg: 9Ch) */
> +		pci_read_config_dword(sp5100_tco_pci,
> +				      SP5100_SB_RESOURCE_MMIO_BASE,
> +				      &val);
> +
> +		/* Verify MMIO is enabled and using bar0 */
> +		if ((val & SB800_ACPI_MMIO_MASK) == SB800_ACPI_MMIO_DECODE_EN)
> +			alt_mmio_addr = (val & ~0xfff) + SB800_PM_WDT_MMIO_OFFSET;
>  		break;
>  	case sb800:
>  		dev_name = SB800_DEVNAME;
>  		mmio_addr = sp5100_tco_read_pm_reg32(SB800_PM_WATCHDOG_BASE) &
>  								0xfffffff8;
> +
> +		/* Read SBResource_MMIO from AcpiMmioEn(PM_Reg: 24h) */
> +		val = sp5100_tco_read_pm_reg32(SB800_PM_ACPI_MMIO_EN);
> +
> +		/* Verify MMIO is enabled and using bar0 */
> +		if ((val & SB800_ACPI_MMIO_MASK) == SB800_ACPI_MMIO_DECODE_EN)
> +			alt_mmio_addr = (val & ~0xfff) + SB800_PM_WDT_MMIO_OFFSET;
>  		break;
>  	case efch:
>  		dev_name = SB800_DEVNAME;
> @@ -305,87 +376,23 @@ static int sp5100_tco_setupdevice(struct device *dev,
>  		val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
>  		if (val & EFCH_PM_DECODEEN_WDT_TMREN)
>  			mmio_addr = EFCH_PM_WDT_ADDR;
> +
> +		val = sp5100_tco_read_pm_reg8(EFCH_PM_ISACONTROL);
> +		if (val & EFCH_PM_ISACONTROL_MMIOEN)
> +			alt_mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
> +				EFCH_PM_ACPI_MMIO_WDT_OFFSET;
>  		break;
>  	default:
>  		return -ENODEV;
>  	}
>  
> -	/* Check MMIO address conflict */
> -	if (!mmio_addr ||
> -	    !devm_request_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE,
> -				     dev_name)) {
> -		if (mmio_addr)
> -			dev_dbg(dev, "MMIO address 0x%08x already in use\n",
> -				mmio_addr);
> -		switch (tco->tco_reg_layout) {
> -		case sp5100:
> -			/*
> -			 * Secondly, Find the watchdog timer MMIO address
> -			 * from SBResource_MMIO register.
> -			 */
> -			/* Read SBResource_MMIO from PCI config(PCI_Reg: 9Ch) */
> -			pci_read_config_dword(sp5100_tco_pci,
> -					      SP5100_SB_RESOURCE_MMIO_BASE,
> -					      &mmio_addr);
> -			if ((mmio_addr & (SB800_ACPI_MMIO_DECODE_EN |
> -					  SB800_ACPI_MMIO_SEL)) !=
> -						  SB800_ACPI_MMIO_DECODE_EN) {
> -				ret = -ENODEV;
> -				goto unreg_region;
> -			}
> -			mmio_addr &= ~0xFFF;
> -			mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
> -			break;
> -		case sb800:
> -			/* Read SBResource_MMIO from AcpiMmioEn(PM_Reg: 24h) */
> -			mmio_addr =
> -				sp5100_tco_read_pm_reg32(SB800_PM_ACPI_MMIO_EN);
> -			if ((mmio_addr & (SB800_ACPI_MMIO_DECODE_EN |
> -					  SB800_ACPI_MMIO_SEL)) !=
> -						  SB800_ACPI_MMIO_DECODE_EN) {
> -				ret = -ENODEV;
> -				goto unreg_region;
> -			}
> -			mmio_addr &= ~0xFFF;
> -			mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
> -			break;
> -		case efch:
> -			val = sp5100_tco_read_pm_reg8(EFCH_PM_ISACONTROL);
> -			if (!(val & EFCH_PM_ISACONTROL_MMIOEN)) {
> -				ret = -ENODEV;
> -				goto unreg_region;
> -			}
> -			mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
> -				    EFCH_PM_ACPI_MMIO_WDT_OFFSET;
> -			break;
> -		}
> -		dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n",
> -			mmio_addr);
> -		if (!devm_request_mem_region(dev, mmio_addr,
> -					     SP5100_WDT_MEM_MAP_SIZE,
> -					     dev_name)) {
> -			dev_dbg(dev, "MMIO address 0x%08x already in use\n",
> -				mmio_addr);
> -			ret = -EBUSY;
> -			goto unreg_region;
> -		}
> -	}
> -
> -	tco->tcobase = devm_ioremap(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
> -	if (!tco->tcobase) {
> -		dev_err(dev, "failed to get tcobase address\n");
> -		ret = -ENOMEM;
> -		goto unreg_region;
> +	ret = sp5100_tco_prepare_base(tco, mmio_addr, alt_mmio_addr, dev_name);
> +	if (!ret) {
> +		/* Setup the watchdog timer */
> +		tco_timer_enable(tco);
> +		ret = sp5100_tco_timer_init(tco);
>  	}
>  
> -	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", mmio_addr);
> -
> -	/* Setup the watchdog timer */
> -	tco_timer_enable(tco);
> -
> -	ret = sp5100_tco_timer_init(tco);
> -
> -unreg_region:
>  	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
>  	return ret;
>  }
> diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
> index adf015aa4126..daee872f9b71 100644
> --- a/drivers/watchdog/sp5100_tco.h
> +++ b/drivers/watchdog/sp5100_tco.h
> @@ -58,6 +58,7 @@
>  #define SB800_PM_WATCHDOG_SECOND_RES	GENMASK(1, 0)
>  #define SB800_ACPI_MMIO_DECODE_EN	BIT(0)
>  #define SB800_ACPI_MMIO_SEL		BIT(1)
> +#define SB800_ACPI_MMIO_MASK		GENMASK(1, 0)
>  
>  #define SB800_PM_WDT_MMIO_OFFSET	0xB00
>  
> -- 
> 2.30.2
> 
