Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1C41A74D7
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 09:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406667AbgDNHeL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 03:34:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:50048 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406631AbgDNHeK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Apr 2020 03:34:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C1119ADCD;
        Tue, 14 Apr 2020 07:34:08 +0000 (UTC)
Date:   Tue, 14 Apr 2020 09:34:08 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Adam Honse <calcprogrammer1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Detect secondary SMBus controller on AMD AM4
 chipsets
Message-ID: <20200414093408.1a1209eb@endymion>
In-Reply-To: <20200410204843.3856-1-calcprogrammer1@gmail.com>
References: <20200410204843.3856-1-calcprogrammer1@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Adam,

On Fri, 10 Apr 2020 15:48:44 -0500, Adam Honse wrote:
> The AMD X370 and other AM4 chipsets (A/B/X 3/4/5 parts) and Threadripper equivalents have a secondary SMBus controller at I/O port address 0x0B20.  This bus is used by several manufacturers to control motherboard RGB lighting via embedded controllers.  I have been using this bus in my OpenRGB project to control the Aura RGB on many motherboards and ASRock also uses this bus for their Polychrome RGB controller.
> 
> See this kernel bug report: https://bugzilla.kernel.org/show_bug.cgi?id=202587
> 
> I am not aware of any CZ-compatible platforms which do not have the second SMBus channel.  All of AMD's AM4- and Threadripper- series chipsets that OpenRGB users have tested appear to have this secondary bus.  I also noticed this secondary bus is present on older AMD platforms including my FM1 home server.

Please wrap the patch description at 75 columns. Note that
./scripts/checkpatch.pl would tell you about that.

Maybe Wolfram can fix if for your this time, if not you'll have to
resubmit.

> 
> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
> 
> ---
>  drivers/i2c/busses/i2c-piix4.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 30ded6422e7b..69740a4ff1db 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -977,7 +977,8 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	}
>  
>  	if (dev->vendor == PCI_VENDOR_ID_AMD &&
> -	    dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS) {
> +	    (dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS ||
> +	     dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)) {
>  		retval = piix4_setup_sb800(dev, id, 1);
>  	}
>  

Fine with me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
