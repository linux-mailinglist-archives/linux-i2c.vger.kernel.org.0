Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF1C1A74FB
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 09:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406775AbgDNHmD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 03:42:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:52926 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729368AbgDNHmB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Apr 2020 03:42:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 62554AE17;
        Tue, 14 Apr 2020 07:41:59 +0000 (UTC)
Date:   Tue, 14 Apr 2020 09:41:58 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Adam Honse <calcprogrammer1@gmail.com>
Subject: Re: [PATCH] i2c: piix4: Add second SMBus for X370/X470/X570
Message-ID: <20200414094158.089dd5ea@endymion>
In-Reply-To: <20200413150634.474842-1-sebastian.reichel@collabora.com>
References: <20200413150634.474842-1-sebastian.reichel@collabora.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sebastian,

On Mon, 13 Apr 2020 17:06:34 +0200, Sebastian Reichel wrote:
> The second interface can be found on X370, X470 and X570 according
> to the bugzilla entry. I only tested with X570 on an ASRock X570
> Taichi:
> 
> $ lspci -nnv -d 1022:790b
> 00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller [1022:790b] (rev 61)
> 	Subsystem: ASRock Incorporation FCH SMBus Controller [1849:ffff]
> 	Flags: 66MHz, medium devsel
> 	Kernel driver in use: piix4_smbus
> 	Kernel modules: i2c_piix4, sp5100_tco
> 
> Before the patch:
> 
> $ i2cdetect -l | grep PIIX4
> i2c-1	unknown   	SMBus PIIX4 adapter port 2 at 0b00	N/A
> i2c-0	unknown   	SMBus PIIX4 adapter port 0 at 0b00	N/A
> 
> After the patch:
> 
> $ i2cdetect -l | grep PIIX4
> i2c-1	unknown   	SMBus PIIX4 adapter port 2 at 0b00	N/A
> i2c-2	unknown   	SMBus PIIX4 adapter port 1 at 0b20	N/A
> i2c-0	unknown   	SMBus PIIX4 adapter port 0 at 0b00	N/A
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=202587
> Reported-by: Adam Honse <calcprogrammer1@gmail.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Hi,
> 
> The Bugzilla entry contains a second change, which reduces the timeouts
> for quicker operation. I did not include that change, since I do not know
> if this is a good idea for all devices supported by this driver. In any
> case it should be a separate patch. Let's get the interface working for
> now.
> 
> -- Sebastian
> ---
>  drivers/i2c/busses/i2c-piix4.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 30ded6422e7b..3e89143a0ecf 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -976,9 +976,11 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		}
>  	}
>  
> -	if (dev->vendor == PCI_VENDOR_ID_AMD &&
> -	    dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS) {
> -		retval = piix4_setup_sb800(dev, id, 1);
> +	if (dev->vendor == PCI_VENDOR_ID_AMD) {
> +		if (dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS ||
> +		    dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS) {
> +			retval = piix4_setup_sb800(dev, id, 1);
> +		}
>  	}
>  
>  	if (retval > 0) {

Adam just sent pretty much the same patch:

https://patchwork.ozlabs.org/project/linux-i2c/patch/20200410204843.3856-1-calcprogrammer1@gmail.com/

Reviewed-by: Jean Delvare <jdelvare@suse.de>

I'll leave it to Wolfram which one he wants to apply.

-- 
Jean Delvare
SUSE L3 Support
