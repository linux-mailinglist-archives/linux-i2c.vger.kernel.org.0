Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF97498702
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jan 2022 18:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244593AbiAXRgz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 12:36:55 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:43804 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235334AbiAXRgy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 12:36:54 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 78FF21F461;
        Mon, 24 Jan 2022 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643045813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TeUyB/stdDyhMS5JgA+yJwWxJq83TqkT8J8yugOGVb8=;
        b=usRWu42pulbSgSGZ7TgqxzJ75vdlAC2VpC4qJTRM8vwTH1LFDkT+13DNn9EIjrqPKwc/0I
        uYCr5x9LmLp309jntGNCJeZJeGH5fORMSQEMn/6kxSnwDNP18cC+Xs+6/TDmkZ3t7ce7gt
        aRlO4EeyAnUS7vu/QB9GI7zw1DStpQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643045813;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TeUyB/stdDyhMS5JgA+yJwWxJq83TqkT8J8yugOGVb8=;
        b=iG4l1hud7YFGrE/zjYbhrpv78/SQcZbvNGXV+Gy4yrWE8zVPWWNI6d6ghigBlRj+elV6Vz
        TwdvBv5eyUb4dfCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3AA213C44;
        Mon, 24 Jan 2022 17:36:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 54eJKbTj7mGdZAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 24 Jan 2022 17:36:52 +0000
Date:   Mon, 24 Jan 2022 18:36:51 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <Nehal-bakulchandra.Shah@amd.com>, <Basavaraj.Natikar@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v3 3/4] Watchdog: sp5100_tco: Add initialization using
 EFCH MMIO
Message-ID: <20220124183651.62d5a97d@endymion>
In-Reply-To: <20220118202234.410555-4-terry.bowman@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
        <20220118202234.410555-4-terry.bowman@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Terry,

On Tue, 18 Jan 2022 14:22:33 -0600, Terry Bowman wrote:
> cd6h/cd7h port I/O can be disabled on recent AMD hardware. Read
> accesses to disabled cd6h/cd7h port I/O will return F's and written
> data is dropped. It is recommended to replace the cd6h/cd7h
> port I/O with MMIO.
> 
> Co-developed-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> To: Guenter Roeck <linux@roeck-us.net>
> To: linux-watchdog@vger.kernel.org
> To: Jean Delvare <jdelvare@suse.com>
> To: linux-i2c@vger.kernel.org
> To: Wolfram Sang <wsa@kernel.org>
> To: Andy Shevchenko <andy.shevchenko@gmail.com>
> To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Robert Richter <rrichter@amd.com>
> Cc: Thomas Lendacky <thomas.lendacky@amd.com>
> ---
>  drivers/watchdog/sp5100_tco.c | 88 ++++++++++++++++++++++++++++++++++-
>  drivers/watchdog/sp5100_tco.h |  5 ++
>  2 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
> index 64ecebd93403..36519a992ca1 100644
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
> @@ -318,6 +320,87 @@ static int sp5100_tco_timer_init(struct sp5100_tco *tco)
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
> +
> +	res = request_mem_region(EFCH_PM_ACPI_MMIO_PM_ADDR,
> +				 EFCH_PM_ACPI_MMIO_PM_SIZE,
> +				 "sp5100_tco");
> +
> +	if (!res) {
> +		dev_err(dev,
> +			"SMB base address memory region 0x%x already in use.\n",

SMB -> SMBus

> +			EFCH_PM_ACPI_MMIO_PM_ADDR);
> +		return -EBUSY;
> +	}
> +
> +	addr = ioremap(EFCH_PM_ACPI_MMIO_PM_ADDR,
> +		       EFCH_PM_ACPI_MMIO_PM_SIZE);
> +	if (!addr) {
> +		release_resource(res);
> +		dev_err(dev, "SMB base address mapping failed.\n");

SMB -> SMBus

> +		return -ENOMEM;
> +	}
> +

A short comment saying what the next command is doing would be
appreciated.

> +	if (!(efch_read_pm_reg8(addr, EFCH_PM_DECODEEN) &
> +	      EFCH_PM_DECODEEN_WDT_TMREN)) {

I find such splits hard to read. If checkpatch complains when you don't
split it (but I think it no longer does, right?) then just introduce a
local variable to store the register value. Same for the 2 occurrences
below.

> +		efch_update_pm_reg8(addr, EFCH_PM_DECODEEN,
> +				    0xff,
> +				    EFCH_PM_DECODEEN_WDT_TMREN);

Easily fits in one fewer line.

> +	}
> +
> +	/* Determine MMIO base address */
> +	if (efch_read_pm_reg8(addr, EFCH_PM_DECODEEN) &
> +	    EFCH_PM_DECODEEN_WDT_TMREN)
> +		mmio_addr = EFCH_PM_WDT_ADDR;
> +
> +	/* Determine alternate MMIO base address */
> +	if (efch_read_pm_reg8(addr, EFCH_PM_ISACONTROL) &
> +	    EFCH_PM_ISACONTROL_MMIOEN)
> +		alt_mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
> +			EFCH_PM_ACPI_MMIO_WDT_OFFSET;
> +
> +	ret = sp5100_tco_prepare_base(tco, mmio_addr, alt_mmio_addr, dev_name);
> +	if (!ret) {
> +		tco_timer_enable_mmio(addr);
> +		ret = sp5100_tco_timer_init(tco);
> +	}
> +
> +	iounmap(addr);
> +	release_resource(res);
> +
> +	return ret;
> +}
> +
>  static int sp5100_tco_setupdevice(struct device *dev,
>  				  struct watchdog_device *wdd)
>  {
> @@ -327,6 +410,9 @@ static int sp5100_tco_setupdevice(struct device *dev,
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
> index adf015aa4126..2df8f8b2c55b 100644
> --- a/drivers/watchdog/sp5100_tco.h
> +++ b/drivers/watchdog/sp5100_tco.h
> @@ -83,3 +83,8 @@
>  
>  #define EFCH_PM_ACPI_MMIO_ADDR		0xfed80000
>  #define EFCH_PM_ACPI_MMIO_WDT_OFFSET	0x00000b00
> +#define EFCH_PM_ACPI_MMIO_PM_OFFSET	0x00000300
> +
> +#define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
> +					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
> +#define EFCH_PM_ACPI_MMIO_PM_SIZE       8

Other than these minor details, patch looks good to me, thanks.

Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
