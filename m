Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61543402CEA
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Sep 2021 18:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343591AbhIGQic (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Sep 2021 12:38:32 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:43958 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbhIGQib (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Sep 2021 12:38:31 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8449B1FFC9;
        Tue,  7 Sep 2021 16:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1631032643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p9rdqH1pcw3ehI7M4Fzbi1mIjTKdQJHDxtva/qKp4Mo=;
        b=pOCpFDt1aUnYY6ChY5JxRTJM1VmaMeRFM8PZ2asL4LXWblcEtLDVTbnjyi9homFX1kabcW
        IA91CI8+1KpVqa6XAKwdy6xZYY1DmXKi1bAoscvvU2CqIVhoUc2VWXqGEYp8fNGjnwNGcT
        XhULm1eerFqNCplL1UyzQy2uqfZXbRs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1631032643;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p9rdqH1pcw3ehI7M4Fzbi1mIjTKdQJHDxtva/qKp4Mo=;
        b=91JVTp2L1mzzuMmo00uZJ0HGcpMG2fsrU8fGZJLvhF7V3AhJhRiquEATYyTfvi0A/nBgox
        XCiSTZMnkPGb8jCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 34F2713A51;
        Tue,  7 Sep 2021 16:37:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id 9uQnCkOVN2EZLAAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Tue, 07 Sep 2021 16:37:23 +0000
Date:   Tue, 7 Sep 2021 18:37:20 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     linux-kernel@vger.kernel.org, thomas.lendacky@amd.com,
        linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
Message-ID: <20210907183720.6e0be6b6@endymion>
In-Reply-To: <20210715221828.244536-1-Terry.Bowman@amd.com>
References: <20210715221828.244536-1-Terry.Bowman@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Terry,

Sorry for the late review.

On Thu, 15 Jul 2021 17:18:28 -0500, Terry Bowman wrote:
> cd6h/cd7h port io can be disabled on recent AMD hardware. Read accesses to
> disabled cd6h/cd7h will return F's and written data is dropped. The
> recommended workaround to handle disabled cd6h/cd7h port io is replacing
> with MMIO accesses. Support for MMIO has been available as an alternative
> cd6h/cd7h access method since at least smbus controller with PCI revision
> 0x59. The piix4_smbus driver uses cd6h/cd7h port io in the following 2
> cases and requires updating to use MMIO:
> 
> 1. The FCH::PM::DECODEEN[smbusasfiobase] and FCH::PM::DECODEEN[0..7]
>    register fields are used to discover the smbus port io address.
> 2. During access requests the piix4_smbus driver enables the requested port
>    if it is not already enabled. The downstream port is enabled through the
>    FCH::PM::DECODEEN[smbus0sel] register.
> 
> Signed-off-by: Terry Bowman <Terry.Bowman@amd.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
> Cc: linux-i2c@vger.kernel.org
> ---
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 8c1b31ed0c42..2d2105793944 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -77,6 +77,7 @@
>  
>  /* SB800 constants */
>  #define SB800_PIIX4_SMB_IDX		0xcd6
> +#define SB800_PIIX4_SMB_MAP_SIZE	2

Now that this is defined, it should be used consistently in the whole
driver.

As a general rule, do not hesitate to split your changes into smaller
steps whenever possible. Small changes are easier to review. The
introduction of SB800_PIIX4_SMB_MAP_SIZE is independent from the rest
of your changes, so it could go into a separate patch.

>  
>  #define KERNCZ_IMC_IDX			0x3e
>  #define KERNCZ_IMC_DATA			0x3f
> @@ -97,6 +98,12 @@
>  #define SB800_PIIX4_PORT_IDX_MASK_KERNCZ	0x18
>  #define SB800_PIIX4_PORT_IDX_SHIFT_KERNCZ	3
>  
> +#define SB800_PIIX4_FCH_PM_DECODEEN_MMIO_EN     BIT(1)

That's many "EN", seems redundant, can it be simplified?

> +#define SB800_PIIX4_FCH_PM_ADDR                 0xFED80300

Isn't this address supposed to be changeable? As I read the datasheet,
you should get the value from PM register 24h?

> +#define SB800_PIIX4_FCH_PM_SIZE                 8
> +
> +#define AMD_PCI_SMBUS_REVISION_MMIO             0x59
> +
>  /* insmod parameters */
>  
>  /* If force is set to anything different from 0, we forcibly enable the
> @@ -155,6 +162,12 @@ static const char *piix4_main_port_names_sb800[PIIX4_MAX_ADAPTERS] = {
>  };
>  static const char *piix4_aux_port_name_sb800 = " port 1";
>  
> +struct sb800_mmio_cfg {
> +	void __iomem *addr;
> +	struct resource *res;
> +	bool use_mmio;
> +};
> +
>  struct i2c_piix4_adapdata {
>  	unsigned short smba;
>  
> @@ -162,8 +175,72 @@ struct i2c_piix4_adapdata {
>  	bool sb800_main;
>  	bool notify_imc;
>  	u8 port;		/* Port number, shifted */
> +	struct sb800_mmio_cfg mmio_cfg;
>  };
>  
> +static int piix4_sb800_region_setup(struct device *dev,
> +				    struct sb800_mmio_cfg *mmio_cfg)

For symmetry, this function should be named piix4_sb800_region_request.

> +{
> +	if (mmio_cfg->use_mmio) {
> +		struct resource *res;
> +		void __iomem *addr;
> +
> +		res = request_mem_region(SB800_PIIX4_FCH_PM_ADDR,
> +					 SB800_PIIX4_FCH_PM_SIZE,
> +					 "sb800_piix4_smb");

Is there any other driver which will be accessing this memory area? The
old code path is using request_muxed_region(), so there must be.

The git history shows that things were done that way by Guenter (Cc'd)
in commit 04b6fcaba346e1ce76321ba9b0fd549da4c37ac2, to avoid a conflict
with the sp5100_tco driver. So I suspect that this driver will need the
same changes you are submitting to the i2c-piix4 driver now.

Then the question is, what happens if both drivers request the mem
region at the same time? Will the second be happy or will it fail with
-EBUSY? Honestly I'm not sure. More on this at the end.

> +		if (!res) {
> +			dev_err(dev,
> +				"SMB base address memory region 0x%x already in use.\n",
> +				SB800_PIIX4_FCH_PM_ADDR);

It is a good opportunity to use "SMBus" instead of "SMB" in these
messages, as "SMB" is ambiguous.

> +			return -EBUSY;
> +		}
> +
> +		addr = ioremap(SB800_PIIX4_FCH_PM_ADDR,
> +			       SB800_PIIX4_FCH_PM_SIZE);
> +		if (!addr) {
> +			release_resource(res);
> +			dev_err(dev, "SMB base address mapping failed.\n");
> +			return -ENOMEM;
> +		}
> +
> +		mmio_cfg->res = res;
> +		mmio_cfg->addr = addr;
> +	} else {
> +		if (!request_muxed_region(SB800_PIIX4_SMB_IDX,
> +					  SB800_PIIX4_SMB_MAP_SIZE,
> +					  "sb800_piix4_smb")) {
> +			dev_err(dev,
> +				"SMB base address index region 0x%x already in use.\n",
> +				SB800_PIIX4_SMB_IDX);
> +			return -EBUSY;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void piix4_sb800_region_release(struct device *dev,
> +				       struct sb800_mmio_cfg *mmio_cfg)
> +{
> +	if (mmio_cfg->use_mmio) {
> +		iounmap(mmio_cfg->addr);
> +		mmio_cfg->addr = NULL;

I see no need to set it to NULL, as the code is never going to check it.

> +
> +		release_resource(mmio_cfg->res);
> +		mmio_cfg->res = NULL;

Ditto.

> +	} else {
> +		release_region(SB800_PIIX4_SMB_IDX,
> +			       SB800_PIIX4_SMB_MAP_SIZE);
> +	}
> +}
> +
> +static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
> +{
> +	return (PIIX4_dev->vendor == PCI_VENDOR_ID_AMD &&
> +		PIIX4_dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
> +		PIIX4_dev->revision >= AMD_PCI_SMBUS_REVISION_MMIO);
> +}
> +
>  static int piix4_setup(struct pci_dev *PIIX4_dev,
>  		       const struct pci_device_id *id)
>  {
> @@ -263,12 +340,58 @@ static int piix4_setup(struct pci_dev *PIIX4_dev,
>  	return piix4_smba;
>  }
>  
> +static int piix4_setup_sb800_smba(struct pci_dev *PIIX4_dev,
> +				  u8 smb_en,
> +				  u8 aux,
> +				  u8 *smb_en_status,
> +				  unsigned short *piix4_smba)
> +{
> +	struct sb800_mmio_cfg mmio_cfg;
> +	u8 smba_en_lo;
> +	u8 smba_en_hi;

Could be declared on the same line.

> +	int retval;
> +
> +	mmio_cfg.use_mmio = piix4_sb800_use_mmio(PIIX4_dev);
> +
> +	retval = piix4_sb800_region_setup(&PIIX4_dev->dev, &mmio_cfg);
> +	if (retval)
> +		return retval;
> +
> +	if (mmio_cfg.use_mmio) {
> +		iowrite32(ioread32(mmio_cfg.addr + 4) | SB800_PIIX4_FCH_PM_DECODEEN_MMIO_EN,
> +			  mmio_cfg.addr + 4);
> +
> +		smba_en_lo = ioread8(mmio_cfg.addr);
> +		smba_en_hi = ioread8(mmio_cfg.addr + 1);
> +	} else {
> +		outb_p(smb_en, SB800_PIIX4_SMB_IDX);
> +		smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
> +		outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
> +		smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
> +	}
> +
> +	piix4_sb800_region_release(&PIIX4_dev->dev, &mmio_cfg);
> +
> +	if (!smb_en) {
> +		*smb_en_status = smba_en_lo & 0x10;
> +		*piix4_smba = smba_en_hi << 8;
> +		if (aux)
> +			*piix4_smba |= 0x20;
> +	} else {
> +		*smb_en_status = smba_en_lo & 0x01;
> +		*piix4_smba = ((smba_en_hi << 8) | smba_en_lo) & 0xffe0;
> +	}
> +
> +	return retval;

Value of retval is always 0 here, so you should hard-code it for
clarity.

> +}
> +
>  static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
>  			     const struct pci_device_id *id, u8 aux)
>  {
>  	unsigned short piix4_smba;
> -	u8 smba_en_lo, smba_en_hi, smb_en, smb_en_status, port_sel;
> +	u8 smb_en, smb_en_status, port_sel;
>  	u8 i2ccfg, i2ccfg_offset = 0x10;
> +	int retval;
>  
>  	/* SB800 and later SMBus does not support forcing address */
>  	if (force || force_addr) {
> @@ -290,29 +413,10 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
>  	else
>  		smb_en = (aux) ? 0x28 : 0x2c;
>  
> -	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, 2, "sb800_piix4_smb")) {
> -		dev_err(&PIIX4_dev->dev,
> -			"SMB base address index region 0x%x already in use.\n",
> -			SB800_PIIX4_SMB_IDX);
> -		return -EBUSY;
> -	}
> -
> -	outb_p(smb_en, SB800_PIIX4_SMB_IDX);
> -	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
> -	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
> -	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
> -
> -	release_region(SB800_PIIX4_SMB_IDX, 2);
> -
> -	if (!smb_en) {
> -		smb_en_status = smba_en_lo & 0x10;
> -		piix4_smba = smba_en_hi << 8;
> -		if (aux)
> -			piix4_smba |= 0x20;
> -	} else {
> -		smb_en_status = smba_en_lo & 0x01;
> -		piix4_smba = ((smba_en_hi << 8) | smba_en_lo) & 0xffe0;
> -	}
> +	retval = piix4_setup_sb800_smba(PIIX4_dev, smb_en,
> +					aux, &smb_en_status, &piix4_smba);
> +	if (retval)
> +		return retval;
>  
>  	if (!smb_en_status) {
>  		dev_err(&PIIX4_dev->dev,
> @@ -662,6 +766,28 @@ static void piix4_imc_wakeup(void)
>  	release_region(KERNCZ_IMC_IDX, 2);
>  }
>  
> +static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
> +{
> +	u8 smba_en_lo;
> +
> +	if (mmio_cfg->use_mmio) {
> +		smba_en_lo = ioread8(mmio_cfg->addr + piix4_port_sel_sb800);
> +
> +		if ((smba_en_lo & piix4_port_mask_sb800) != port)
> +			iowrite8((smba_en_lo & ~piix4_port_mask_sb800) | port,
> +				 mmio_cfg->addr + piix4_port_sel_sb800);
> +	} else {
> +		outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
> +		smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
> +
> +		if ((smba_en_lo & piix4_port_mask_sb800) != port)
> +			outb_p((smba_en_lo & ~piix4_port_mask_sb800) | port,
> +			       SB800_PIIX4_SMB_IDX + 1);
> +	}
> +
> +	return (smba_en_lo & piix4_port_mask_sb800);
> +}
> +
>  /*
>   * Handles access to multiple SMBus ports on the SB800.
>   * The port is selected by bits 2:1 of the smb_en register (0x2c).
> @@ -678,12 +804,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>  	unsigned short piix4_smba = adapdata->smba;
>  	int retries = MAX_TIMEOUT;
>  	int smbslvcnt;
> -	u8 smba_en_lo;
> -	u8 port;
> +	u8 prev_port;
>  	int retval;
>  
> -	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, 2, "sb800_piix4_smb"))
> -		return -EBUSY;
> +	retval = piix4_sb800_region_setup(&adap->dev, &adapdata->mmio_cfg);
> +	if (retval)
> +		return retval;
>  
>  	/* Request the SMBUS semaphore, avoid conflicts with the IMC */
>  	smbslvcnt  = inb_p(SMBSLVCNT);
> @@ -738,18 +864,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>  		}
>  	}
>  
> -	outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
> -	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
> -
> -	port = adapdata->port;
> -	if ((smba_en_lo & piix4_port_mask_sb800) != port)
> -		outb_p((smba_en_lo & ~piix4_port_mask_sb800) | port,
> -		       SB800_PIIX4_SMB_IDX + 1);
> +	prev_port = piix4_sb800_port_sel(adapdata->port, &adapdata->mmio_cfg);
>  
>  	retval = piix4_access(adap, addr, flags, read_write,
>  			      command, size, data);
>  
> -	outb_p(smba_en_lo, SB800_PIIX4_SMB_IDX + 1);
> +	piix4_sb800_port_sel(prev_port, &adapdata->mmio_cfg);

While functionally correct, this change has a pretty high cost, as you
turn a single I/O operation into a function call + 2 tests + 2 or 3 I/O
operations.

I'm not even sure why we restore the original port at this point. Other
drivers (e.g. i2c-i801) only restore the original settings on suspend
and shutdown. If something else (ACPI code, BIOS through SMI code) was
to access the SMBus device at runtime, we would be in trouble anyway,
as there is no synchronization in place.

>  
>  	/* Release the semaphore */
>  	outb_p(smbslvcnt | 0x20, SMBSLVCNT);
> @@ -758,7 +878,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>  		piix4_imc_wakeup();
>  
>  release:
> -	release_region(SB800_PIIX4_SMB_IDX, 2);
> +	piix4_sb800_region_release(&adap->dev, &adapdata->mmio_cfg);
>  	return retval;
>  }
>  
> @@ -840,6 +960,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>  	adapdata->sb800_main = sb800_main;
>  	adapdata->port = port << piix4_port_shift_sb800;
>  	adapdata->notify_imc = notify_imc;
> +	adapdata->mmio_cfg.use_mmio = piix4_sb800_use_mmio(dev);
>  
>  	/* set up the sysfs linkage to our parent device */
>  	adap->dev.parent = &dev->dev;

More generally, I am worried about the overall design. The driver
originally used per-access I/O port requesting because keeping the I/O
ports busy all the time would prevent other drivers from working. Do we
still need to do the same with the new code? If it is possible and safe
to have a permanent mapping to the memory ports, that would be a lot
faster.

On the other hand, the read-modify-write cycle in
piix4_setup_sb800_smba() is unsafe if 2 drivers can actually call
request_mem_region() on the same memory area successfully.

I'm not opposed to taking your patch with minimal changes (as long as
the code is safe) and working on performance improvements later.

-- 
Jean Delvare
SUSE L3 Support
