Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6CCB72F45
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jul 2019 14:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfGXMzV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Jul 2019 08:55:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:37256 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726550AbfGXMzU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 24 Jul 2019 08:55:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 83869AD3A;
        Wed, 24 Jul 2019 12:55:18 +0000 (UTC)
Date:   Wed, 24 Jul 2019 14:55:16 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andrew Cooks <andrew.cooks@opengear.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Cooks <acooks@rationali.st>,
        linux-acpi@vger.kernel.org, platypus-sw@opengear.com,
        "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: Re: [RESEND][PATCH v4 3/3] i2c: piix4: add ACPI support
Message-ID: <20190724145516.342195ac@endymion>
In-Reply-To: <d197d95d77afa2054ff1b2c593dae7939030e24b.1519601860.git.andrew.cooks@opengear.com>
References: <cover.1519601860.git.andrew.cooks@opengear.com>
        <d197d95d77afa2054ff1b2c593dae7939030e24b.1519601860.git.andrew.cooks@opengear.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 26 Feb 2018 10:28:45 +1000, Andrew Cooks wrote:
> Enable the i2c-piix4 SMBus controller driver to enumerate I2C slave
> devices using ACPI. It builds on the related I2C mux device work
> in commit 8eb5c87a92c0 ("i2c: add ACPI support for I2C mux ports")
> 
> In the i2c-piix4 driver the adapters are enumerated as:
>  Main SMBus adapter Port 0, Port 2, ..., aux port (i.e., ASF adapter)
> 
> However, in the AMD BKDG documentation[1], the implied order of ports is:
>  Main SMBus adapter Port 0, ASF adapter, Port 2, Port 3, ...
> 
> This ordering difference is unfortunate. We assume that ACPI
> developers will use the Linux ordering.
> 
> [1] 52740 BIOS and Kernel Developer's Guide (BKDG) for AMD Family 16h
> Models 30h-3Fh Processors
> 
> Signed-off-by: Andrew Cooks <andrew.cooks@opengear.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 01f1610..9a6cdc8 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -837,6 +837,12 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>  	/* set up the sysfs linkage to our parent device */
>  	adap->dev.parent = &dev->dev;
>  
> +	if (has_acpi_companion(&dev->dev)) {
> +		acpi_preset_companion(&adap->dev,
> +				ACPI_COMPANION(&dev->dev),
> +				piix4_adapter_count);

After the change I proposed for the previous patch, this is no longer
going to work. But I don't think it was really working before anyway.

For one thing, for the same reason I want to change the previous patch:
in case of failure to register some of the adapters, the numbering of
later adapters would be shifted. Also giving the aux bus a different
number depending on the device (4 before Hudson2, 2 for Hudson2 and
later) is unlikely to match the BIOS expectations.

For another, the assumption that "ACPI developers will use the Linux
ordering" is unlikely to be valid. I think we are talking about BIOS
developers here, and they should be OS-agnostic. If they are not, then
most likely they would align with whatever Windows drivers expect. So
our best chance is to stick to the datasheet.

Lastly, this would be inconsistent even with our own driver. We are
indeed not instantiating the adapters in the order listed by the
datasheet, and i2c adapter numbering is dynamic, but we are *naming* the
adapters to match the datasheet. So we should really pass the same
number to the ACPI layer, for consistency if nothing else. This
probably means passing one more parameter to piix4_add_adapter() and/or
some more code to figure out the bus number to pass to
acpi_preset_companion(), but I don't think we can avoid that, so let's
just do it.

> +	}
> +
>  	snprintf(adap->name, sizeof(adap->name),
>  		"SMBus PIIX4 adapter%s at %04x", name, smba);
>  


-- 
Jean Delvare
SUSE L3 Support
