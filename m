Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A50F54A78FA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 20:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347033AbiBBTvo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 14:51:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347028AbiBBTvo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 14:51:44 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E99C061714;
        Wed,  2 Feb 2022 11:51:44 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id u13so385800oie.5;
        Wed, 02 Feb 2022 11:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HsCzwVGwIyiledAsS9C7/IDT1baVCjwbbXDvJaAojdk=;
        b=gLRz682BQR9QPTFtwWBlVbzoFMndRJm2H/k/pO7Ndq0ASsn6EzyvjO+8wu1j7FI3FS
         T3RgQwJc4yRF8oeugd4/7QVcBLr+xvZ0FEur04o8+s+ExLGCG1h6eFdSwLbWh8Ir4qka
         iOGTfIgJcXyCNbq+p7wGgu8T3nlyMtiiczXMsqKU7yT48p7UitltOX5okDi8bUGbIC8k
         225A8UOYuSkoAQbbuRZGHOdE/5mh2RNQKpoomTx4tdrp6/Ro167WJ76wZvaQFdpHdKeF
         zVqG4Vp3Gf3+eT1kIs83zU7+V5/YXWERh6X9e8eRLHE/vi6pAcZ7qenH3WuQEmMBAyJc
         pcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=HsCzwVGwIyiledAsS9C7/IDT1baVCjwbbXDvJaAojdk=;
        b=7TrUZgGuUoVL2OPCUaaKFS8CJylu2alHYNkDFFGQHNxyhNQ0NpcdTFvT92ANWIRXny
         sYtzLVnJDKaJLv0t3O86Fl532BuS5j0o04ctw4B0mfQR6tbSDWZ8oXUOOkOe+1xHzY7y
         /dxm8ZWC3NaoOUVQWTsicxQ2+np+4jU20cQ7MnyL7uxhE4KwLVUFi8iRz6689W/Xh9NC
         1guGsd74GbTPM0+rcn56cLqmiAxuaGxicS7lBzHn0DzLxLr7Wf1O+F4e599+FaZEWaw8
         3tCXrgGjKb7Xvlzq6SEKp15VYgZTjnEa5YiaUpO8wlLwdW2bGOZ4RB8HOQqEDxV0PoCW
         x1LA==
X-Gm-Message-State: AOAM532jUlqJpPlh/jv12STyaUdfAqDRpIkbw98OLAZ3peV7JTpd3YbR
        poVZR8ge0OHqkOcrkoncqnM=
X-Google-Smtp-Source: ABdhPJwwOenxC9s2PrRyY4UEVlyR+dQDF/pcACNTjN4WiGdQXOKovgMnlhWLEcBHquhP9ZB8oTQj2A==
X-Received: by 2002:a05:6808:3009:: with SMTP id ay9mr4789817oib.171.1643831502773;
        Wed, 02 Feb 2022 11:51:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w7sm17366530oou.13.2022.02.02.11.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 11:51:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Feb 2022 11:51:40 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v5 3/4] Watchdog: sp5100_tco: Add initialization using
 EFCH MMIO
Message-ID: <20220202195140.GC2346468@roeck-us.net>
References: <20220202153525.1693378-1-terry.bowman@amd.com>
 <20220202153525.1693378-4-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202153525.1693378-4-terry.bowman@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 02, 2022 at 09:35:24AM -0600, Terry Bowman wrote:
> cd6h/cd7h port I/O can be disabled on recent AMD hardware. Read
> accesses to disabled cd6h/cd7h port I/O will return F's and written
> data is dropped. It is recommended to replace the cd6h/cd7h
> port I/O with MMIO.
> 
> Co-developed-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Tested-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sp5100_tco.c | 100 +++++++++++++++++++++++++++++++++-
>  drivers/watchdog/sp5100_tco.h |   5 ++
>  2 files changed, 104 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
> index 8db7504f0aa4..e02399ea8730 100644
> --- a/drivers/watchdog/sp5100_tco.c
> +++ b/drivers/watchdog/sp5100_tco.c
> @@ -49,7 +49,7 @@
>  /* internal variables */
>  
>  enum tco_reg_layout {
> -	sp5100, sb800, efch
> +	sp5100, sb800, efch, efch_mmio
>  };
>  
>  struct sp5100_tco {
> @@ -209,6 +209,8 @@ static void tco_timer_enable(struct sp5100_tco *tco)
>  					  ~EFCH_PM_WATCHDOG_DISABLE,
>  					  EFCH_PM_DECODEEN_SECOND_RES);
>  		break;
> +	default:
> +		break;
>  	}
>  }
>  
> @@ -307,6 +309,99 @@ static int sp5100_tco_timer_init(struct sp5100_tco *tco)
>  	return 0;
>  }
>  
> +static u8 efch_read_pm_reg8(void __iomem *addr, u8 index)
> +{
> +	return readb(addr + index);
> +}
> +
> +static void efch_update_pm_reg8(void __iomem *addr, u8 index, u8 reset, u8 set)
> +{
> +	u8 val;
> +
> +	val = readb(addr + index);
> +	val &= reset;
> +	val |= set;
> +	writeb(val, addr + index);
> +}
> +
> +static void tco_timer_enable_mmio(void __iomem *addr)
> +{
> +	efch_update_pm_reg8(addr, EFCH_PM_DECODEEN3,
> +			    ~EFCH_PM_WATCHDOG_DISABLE,
> +			    EFCH_PM_DECODEEN_SECOND_RES);
> +}
> +
> +static int sp5100_tco_setupdevice_mmio(struct device *dev,
> +				       struct watchdog_device *wdd)
> +{
> +	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
> +	const char *dev_name = SB800_DEVNAME;
> +	u32 mmio_addr = 0, alt_mmio_addr = 0;
> +	struct resource *res;
> +	void __iomem *addr;
> +	int ret;
> +	u32 val;
> +
> +	res = request_mem_region_muxed(EFCH_PM_ACPI_MMIO_PM_ADDR,
> +				       EFCH_PM_ACPI_MMIO_PM_SIZE,
> +				       "sp5100_tco");
> +
> +	if (!res) {
> +		dev_err(dev,
> +			"Memory region 0x%08x already in use\n",
> +			EFCH_PM_ACPI_MMIO_PM_ADDR);
> +		return -EBUSY;
> +	}
> +
> +	addr = ioremap(EFCH_PM_ACPI_MMIO_PM_ADDR, EFCH_PM_ACPI_MMIO_PM_SIZE);
> +	if (!addr) {
> +		dev_err(dev, "Address mapping failed\n");
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	/*
> +	 * EFCH_PM_DECODEEN_WDT_TMREN is dual purpose. This bitfield
> +	 * enables sp5100_tco register MMIO space decoding. The bitfield
> +	 * also starts the timer operation. Enable if not already enabled.
> +	 */
> +	val = efch_read_pm_reg8(addr, EFCH_PM_DECODEEN);
> +	if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
> +		efch_update_pm_reg8(addr, EFCH_PM_DECODEEN, 0xff,
> +				    EFCH_PM_DECODEEN_WDT_TMREN);
> +	}
> +
> +	/* Error if the timer could not be enabled */
> +	val = efch_read_pm_reg8(addr, EFCH_PM_DECODEEN);
> +	if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
> +		dev_err(dev, "Failed to enable the timer\n");
> +		ret = -EFAULT;
> +		goto out;
> +	}
> +
> +	mmio_addr = EFCH_PM_WDT_ADDR;
> +
> +	/* Determine alternate MMIO base address */
> +	val = efch_read_pm_reg8(addr, EFCH_PM_ISACONTROL);
> +	if (val & EFCH_PM_ISACONTROL_MMIOEN)
> +		alt_mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
> +			EFCH_PM_ACPI_MMIO_WDT_OFFSET;
> +
> +	ret = sp5100_tco_prepare_base(tco, mmio_addr, alt_mmio_addr, dev_name);
> +	if (!ret) {
> +		tco_timer_enable_mmio(addr);
> +		ret = sp5100_tco_timer_init(tco);
> +	}
> +
> +out:
> +	if (addr)
> +		iounmap(addr);
> +
> +	release_resource(res);
> +
> +	return ret;
> +}
> +
>  static int sp5100_tco_setupdevice(struct device *dev,
>  				  struct watchdog_device *wdd)
>  {
> @@ -316,6 +411,9 @@ static int sp5100_tco_setupdevice(struct device *dev,
>  	u32 alt_mmio_addr = 0;
>  	int ret;
>  
> +	if (tco->tco_reg_layout == efch_mmio)
> +		return sp5100_tco_setupdevice_mmio(dev, wdd);
> +
>  	/* Request the IO ports used by this driver */
>  	if (!request_muxed_region(SP5100_IO_PM_INDEX_REG,
>  				  SP5100_PM_IOPORTS_SIZE, "sp5100_tco")) {
> diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
> index daee872f9b71..8ca1b215e3ce 100644
> --- a/drivers/watchdog/sp5100_tco.h
> +++ b/drivers/watchdog/sp5100_tco.h
> @@ -83,4 +83,9 @@
>  #define EFCH_PM_ISACONTROL_MMIOEN	BIT(1)
>  
>  #define EFCH_PM_ACPI_MMIO_ADDR		0xfed80000
> +#define EFCH_PM_ACPI_MMIO_PM_OFFSET	0x00000300
>  #define EFCH_PM_ACPI_MMIO_WDT_OFFSET	0x00000b00
> +
> +#define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
> +					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
> +#define EFCH_PM_ACPI_MMIO_PM_SIZE	8
> -- 
> 2.30.2
> 
