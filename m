Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB923223F28
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 17:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgGQPLL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 11:11:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:60292 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726945AbgGQPLL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Jul 2020 11:11:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 53A09B1C4;
        Fri, 17 Jul 2020 15:11:14 +0000 (UTC)
Date:   Fri, 17 Jul 2020 17:11:08 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Cc:     helgaas@kernel.org, bjorn@helgaas.com, skhan@linuxfoundation.org,
        linux-pci@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH 15/35] i2c/busses: Tidy Success/Failure checks
Message-ID: <20200717171108.6e9f1b16@endymion>
In-Reply-To: <20200713122247.10985-16-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
        <20200713122247.10985-16-refactormyself@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 13 Jul 2020 14:22:27 +0200, Saheed O. Bolarinwa wrote:
> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
> ---
> This patch depends on PATCH 15/35

Not possible, as this *is* patch 15/35. Not really worth mentioning
anyway, as it is expected that patches in a given series may depend on
any earlier patch in the same series.

> 
>  drivers/i2c/busses/i2c-ali15x3.c |  5 ++---
>  drivers/i2c/busses/i2c-nforce2.c |  3 +--
>  drivers/i2c/busses/i2c-sis5595.c | 15 +++++----------
>  3 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
> index 359ee3e0864a..c9e779cc184e 100644
> --- a/drivers/i2c/busses/i2c-ali15x3.c
> +++ b/drivers/i2c/busses/i2c-ali15x3.c
> @@ -167,11 +167,10 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
>  	if(force_addr) {
>  		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
>  			ali15x3_smba);
> -		if (0 != pci_write_config_word(ALI15X3_dev,
> -								SMBBA,
> +		if (pci_write_config_word(ALI15X3_dev, SMBBA,
>  								ali15x3_smba))
>  			goto error;

You can't possibly leave the code with such a ugly alignment and run
away. The whole point of tidying patches it to have more readable code
in the end, right?

> -		if (0 != pci_read_config_word(ALI15X3_dev,
> +		if (pci_read_config_word(ALI15X3_dev,
>  								SMBBA, &a))
>  			goto error;
>  		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
> diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
> index 385f4f446f36..54d2985b7aaf 100644
> --- a/drivers/i2c/busses/i2c-nforce2.c
> +++ b/drivers/i2c/busses/i2c-nforce2.c
> @@ -327,8 +327,7 @@ static int nforce2_probe_smb(struct pci_dev *dev, int bar, int alt_reg,
>  		/* Older incarnations of the device used non-standard BARs */
>  		u16 iobase;
>  
> -		if (pci_read_config_word(dev, alt_reg, &iobase)
> -		    != 0) {
> +		if (pci_read_config_word(dev, alt_reg, &iobase)) {
>  			dev_err(&dev->dev, "Error reading PCI config for %s\n",
>  				name);
>  			return -EIO;
> diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
> index fbe3ee31eae3..b016f48519d3 100644
> --- a/drivers/i2c/busses/i2c-sis5595.c
> +++ b/drivers/i2c/busses/i2c-sis5595.c
> @@ -175,11 +175,9 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
>  
>  	if (force_addr) {
>  		dev_info(&SIS5595_dev->dev, "forcing ISA address 0x%04X\n", sis5595_base);
> -		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base)
> -		    != 0)
> +		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base))
>  			goto error;
> -		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a)
> -		    != 0)
> +		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a))
>  			goto error;
>  		if ((a & ~(SIS5595_EXTENT - 1)) != sis5595_base) {
>  			/* doesn't work for some chips! */
> @@ -188,16 +186,13 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
>  		}
>  	}
>  
> -	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
> -	    != 0)
> +	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val))
>  		goto error;
>  	if ((val & 0x80) == 0) {
>  		dev_info(&SIS5595_dev->dev, "enabling ACPI\n");
> -		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80)
> -		    != 0)
> +		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80))
>  			goto error;
> -		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
> -		    != 0)
> +		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val))
>  			goto error;
>  		if ((val & 0x80) == 0) {
>  			/* doesn't work for some chips? */

Overall I'd be happy to have a more consistent style for checking
errors on PCI config registers access, so this seems to be going into
the right direction.

-- 
Jean Delvare
SUSE L3 Support
