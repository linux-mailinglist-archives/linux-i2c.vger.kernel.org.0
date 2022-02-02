Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47C724A78FE
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 20:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347043AbiBBTvy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 14:51:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347055AbiBBTvw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 14:51:52 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C66C061714;
        Wed,  2 Feb 2022 11:51:52 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 4so330794oil.11;
        Wed, 02 Feb 2022 11:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b4gvsDqdGYUqsR8ZAoXwalFh50CbTTaN5Iudw9gTftI=;
        b=oJp507ANwWxWMGNxbyEJFdAwvflpPjo27jV5cLHjWtLH7jdG80/DhqVlXdRH4/Ld9I
         Zo64VILfdI8WrYUkrQTgrSrpG170HEZuFwnkfFmo0Toyo7SpeBFaWK4Pf1RFubwJioyZ
         vn96NqwOP4zYiqBiktQwm4tzvm1/H+fCXJiYoDq9IJAWfU1DvL0nLgBpSvicLZeqBoA5
         Km2GOc9ERr0945dpIGDkyJW14mt/R/MEr3pm0FW4z9PTS3Oti3EviFBGHxAdpyHBc1+b
         fcKsdeNRjdKo4/gIenSOywL2BVEE1/+rLsCZawcueehQDXERnWHxTJZJ/tBqFAJY8YTb
         z+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=b4gvsDqdGYUqsR8ZAoXwalFh50CbTTaN5Iudw9gTftI=;
        b=zvdLI1/PsLa+U/Rt/fI22IXizLEnqIAYm6tzVbWg3pMUbrf3gpXy67QaJ7BTQP4/0x
         tyUJE7s+Juh4kq4zF3d1yLsBMkYD9tUMYys2L/t0xnHY9gVCdUvrn1N8Hvx70qZ4+TBe
         UsnizFnT4Sjan73qiiKMz/ZSiGe0u/SowJXHIq3NF7ugCwIqeZ+5cLPzjZG3D8LMDdn1
         9gvzonvb8kvUJdpn8vWYPySu97+3QbXgxRtp1srjqtrRyuwyfYNh43rs+9G23kZZOz2+
         78INhjoko9jld6W5qJpUAYqSokfs5jRAOvsrBNWRqYmDxxH2RTxO5nHUMrJ5HL6aI3oL
         kxlQ==
X-Gm-Message-State: AOAM531apKBjalA4BHR1nlM0y+lXTR9bEI1yP3LqPXHK32ChC0upGBu/
        +SQgP0lwCqjtYM/YhQVj5v8=
X-Google-Smtp-Source: ABdhPJzfAuAqG8hYv0K6PSbBQAI/7QAJJ6FKor57K5dMeHOBMlZ5yQwIGUNLOLvPILWCNFETIdoQ3g==
X-Received: by 2002:a05:6808:1599:: with SMTP id t25mr5670315oiw.210.1643831512094;
        Wed, 02 Feb 2022 11:51:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o1sm7943245oik.0.2022.02.02.11.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 11:51:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Feb 2022 11:51:50 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v5 4/4] Watchdog: sp5100_tco: Enable Family 17h+ CPUs
Message-ID: <20220202195150.GD2346468@roeck-us.net>
References: <20220202153525.1693378-1-terry.bowman@amd.com>
 <20220202153525.1693378-5-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202153525.1693378-5-terry.bowman@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 02, 2022 at 09:35:25AM -0600, Terry Bowman wrote:
> The driver currently uses a CPU family match of 17h to determine
> EFCH_PM_DECODEEN_WDT_TMREN register support. This family check will not
> support future AMD CPUs and instead will require driver updates to add
> support.
> 
> Remove the family 17h family check and add a check for SMBus PCI
> revision ID 0x51 or greater. The MMIO access method has been available
> since at least SMBus controllers using PCI revision 0x51. This revision
> check will support family 17h and future AMD processors including EFCH
> functionality without requiring driver changes.
> 
> Co-developed-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Tested-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sp5100_tco.c | 16 ++++------------
>  drivers/watchdog/sp5100_tco.h |  1 +
>  2 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
> index e02399ea8730..86ffb58fbc85 100644
> --- a/drivers/watchdog/sp5100_tco.c
> +++ b/drivers/watchdog/sp5100_tco.c
> @@ -86,6 +86,10 @@ static enum tco_reg_layout tco_reg_layout(struct pci_dev *dev)
>  	    dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
>  	    dev->revision < 0x40) {
>  		return sp5100;
> +	} else if (dev->vendor == PCI_VENDOR_ID_AMD &&
> +	    sp5100_tco_pci->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
> +	    sp5100_tco_pci->revision >= AMD_ZEN_SMBUS_PCI_REV) {
> +		return efch_mmio;
>  	} else if (dev->vendor == PCI_VENDOR_ID_AMD &&
>  	    ((dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS &&
>  	     dev->revision >= 0x41) ||
> @@ -459,18 +463,6 @@ static int sp5100_tco_setupdevice(struct device *dev,
>  		break;
>  	case efch:
>  		dev_name = SB800_DEVNAME;
> -		/*
> -		 * On Family 17h devices, the EFCH_PM_DECODEEN_WDT_TMREN bit of
> -		 * EFCH_PM_DECODEEN not only enables the EFCH_PM_WDT_ADDR memory
> -		 * region, it also enables the watchdog itself.
> -		 */
> -		if (boot_cpu_data.x86 == 0x17) {
> -			val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
> -			if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
> -				sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN, 0xff,
> -							  EFCH_PM_DECODEEN_WDT_TMREN);
> -			}
> -		}
>  		val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
>  		if (val & EFCH_PM_DECODEEN_WDT_TMREN)
>  			mmio_addr = EFCH_PM_WDT_ADDR;
> diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
> index 8ca1b215e3ce..6a0986d2c94b 100644
> --- a/drivers/watchdog/sp5100_tco.h
> +++ b/drivers/watchdog/sp5100_tco.h
> @@ -89,3 +89,4 @@
>  #define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
>  					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
>  #define EFCH_PM_ACPI_MMIO_PM_SIZE	8
> +#define AMD_ZEN_SMBUS_PCI_REV		0x51
> -- 
> 2.30.2
> 
