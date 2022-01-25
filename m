Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D974449B551
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 14:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1577663AbiAYNsZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jan 2022 08:48:25 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:39848 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1577673AbiAYNpd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jan 2022 08:45:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C598621114;
        Tue, 25 Jan 2022 13:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643118322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I6CqmgtJFWuTScfRpyaz1bBj03rUu9663Hrdm0JPgEk=;
        b=AwS3ZFlJVZMdUHBuQKFbGXfiksWKZOKM5vBTIPH2AYHvWizntc2h15eaTBTOzIdjsbAINK
        kVb5qIU3fTNuyvtY8X0yCZ70L6DJgJhZmzHZNrDazhOFr2NVkq3mc4+YHesA6oUlnGubqr
        K/Dx7NWrhiubxDixQpDzbB15hxfZOSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643118322;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I6CqmgtJFWuTScfRpyaz1bBj03rUu9663Hrdm0JPgEk=;
        b=TO1pvBk2l4LxEbsWO+rfYVZ4Y2YhKkq9h4HXZ4c4zq+tRVvIVg/svdbiC7UxPMpPOznJwp
        0/Oe9xjS7+8j2eAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CB9E13DEF;
        Tue, 25 Jan 2022 13:45:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 84KrAPL+72FyVQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 25 Jan 2022 13:45:22 +0000
Date:   Tue, 25 Jan 2022 14:45:20 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <Nehal-bakulchandra.Shah@amd.com>, <Basavaraj.Natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
Message-ID: <20220125144520.17a220bc@endymion>
In-Reply-To: <20220118202234.410555-3-terry.bowman@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
        <20220118202234.410555-3-terry.bowman@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Terry,

Sorry for the late review, I hope you did not send an updated series
already.

On Tue, 18 Jan 2022 14:22:32 -0600, Terry Bowman wrote:
> Combine MMIO base address and alternate base address detection. Combine
> based on layout type. This will simplify the function by eliminating
> a switch case.
> 
> Move existing request/release code into functions. This currently only
> supports port I/O request/release. The move into a separate function
> will make it ready for adding MMIO region support.
> 
> (...)
> +static int __sp5100_tco_prepare_base(struct sp5100_tco *tco,
> +				     u32 mmio_addr,
> +				     const char *dev_name)
> +{
> +	struct device *dev = tco->wdd.parent;
> +	int ret = 0;
> +
> +	if (!mmio_addr)
> +		return -ENOMEM;

Can this actually happen? If it does, is -ENOMEM really the best error
value?

And if it can happen, I think I would prefer if you would simply not
call this function, knowing it can only fail. In other words, I'd go
for something like the following in the function below:

	/* Check MMIO address conflict */
	if (mmio_addr)
		ret = __sp5100_tco_prepare_base(tco, mmio_addr, dev_name);

The intention is clearer and execution is faster too.

> +
> +	if (!devm_request_mem_region(dev, mmio_addr,
> +				    SP5100_WDT_MEM_MAP_SIZE,
> +				    dev_name)) {
> +		dev_dbg(dev, "MMIO address 0x%08x already in use\n",
> +			mmio_addr);
> +		return -EBUSY;
> +	}
> +
> +	tco->tcobase = devm_ioremap(dev, mmio_addr,
> +				    SP5100_WDT_MEM_MAP_SIZE);
> +	if (!tco->tcobase) {
> +		dev_dbg(dev, "MMIO address 0x%08x failed mapping.\n",
> +			mmio_addr);

Remove trailing dot for consistency with the other messages.

> +		devm_release_mem_region(dev, mmio_addr,
> +					SP5100_WDT_MEM_MAP_SIZE);
> +		return -ENOMEM;
> +	}
> +
> +	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n",
> +		 mmio_addr);
> +
> +	return ret;
> +}
> +
> +static int sp5100_tco_prepare_base(struct sp5100_tco *tco,
> +				   u32 mmio_addr,
> +				   u32 alt_mmio_addr,
> +				   const char *dev_name)
> +{
> +	struct device *dev = tco->wdd.parent;
> +	int ret = 0;
> +
> +	dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n",
> +		mmio_addr);
> +
> +	/* Check MMIO address conflict */
> +	ret = __sp5100_tco_prepare_base(tco, mmio_addr, dev_name);
> +
> +	/* Check alternate MMIO address conflict */
> +	if (ret)
> +		ret = __sp5100_tco_prepare_base(tco, alt_mmio_addr,
> +						dev_name);
> +
> +	if (ret)
> +		dev_err(dev, "Failed to reserve-map MMIO (%X) and alternate MMIO (%X) regions. ret=%X",
> +			mmio_addr, alt_mmio_addr, ret);

Format for the addresses is inconsistent with the other messages above,
please use 0x%08x for consistency. As for the return value (which
should be preceded by a comma rather than a dot), it should be printed
as a decimal, not hexadecimal, value.

(And nitpicking: I'd split after "dev," so as to not make the line
longer than needed.

> +
> +	return ret;
> +}
> +
>  static int sp5100_tco_timer_init(struct sp5100_tco *tco)
>  {
>  	struct watchdog_device *wdd = &tco->wdd;
> @@ -264,6 +324,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
>  	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
>  	const char *dev_name;
>  	u32 mmio_addr = 0, val;
> +	u32 alt_mmio_addr = 0;
>  	int ret;
>  
>  	/* Request the IO ports used by this driver */
> @@ -282,11 +343,35 @@ static int sp5100_tco_setupdevice(struct device *dev,
>  		dev_name = SP5100_DEVNAME;
>  		mmio_addr = sp5100_tco_read_pm_reg32(SP5100_PM_WATCHDOG_BASE) &
>  								0xfffffff8;
> +
> +		/*
> +		 * Secondly, Find the watchdog timer MMIO address
> +		 * from SBResource_MMIO register.
> +		 */
> +		/* Read SBResource_MMIO from PCI config(PCI_Reg: 9Ch) */
> +		pci_read_config_dword(sp5100_tco_pci,
> +				      SP5100_SB_RESOURCE_MMIO_BASE,
> +				      &alt_mmio_addr);
> +		if (alt_mmio_addr & ((SB800_ACPI_MMIO_DECODE_EN |
> +				      SB800_ACPI_MMIO_SEL) !=
> +				     SB800_ACPI_MMIO_DECODE_EN)) {
> +			alt_mmio_addr &= ~0xFFF;
> +			alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
> +		}
>  		break;
>  	case sb800:
>  		dev_name = SB800_DEVNAME;
>  		mmio_addr = sp5100_tco_read_pm_reg32(SB800_PM_WATCHDOG_BASE) &
>  								0xfffffff8;
> +		/* Read SBResource_MMIO from AcpiMmioEn(PM_Reg: 24h) */
> +		alt_mmio_addr =
> +			sp5100_tco_read_pm_reg32(SB800_PM_ACPI_MMIO_EN);
> +		if (!(alt_mmio_addr & (((SB800_ACPI_MMIO_DECODE_EN |
> +				       SB800_ACPI_MMIO_SEL)) !=
> +		      SB800_ACPI_MMIO_DECODE_EN))) {

The condition is the opposite of the sp5100 case above, which looks
quite suspicious. As far as I can see, that wasn't the case in the
original code. Please double check. In any case, please avoid double
negations, they are too easy to get wrong.

> +			alt_mmio_addr &= ~0xFFF;
> +			alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
> +		}
>  		break;
>  	case efch:
>  		dev_name = SB800_DEVNAME;
> @@ -305,87 +390,24 @@ static int sp5100_tco_setupdevice(struct device *dev,
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
> (...)

Rest looks OK to me.

-- 
Jean Delvare
SUSE L3 Support
