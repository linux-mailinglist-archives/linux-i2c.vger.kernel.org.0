Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14F01198145
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Mar 2020 18:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbgC3QbL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Mar 2020 12:31:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:59078 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730042AbgC3QbL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Mar 2020 12:31:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C130EAC7C;
        Mon, 30 Mar 2020 16:31:09 +0000 (UTC)
Date:   Mon, 30 Mar 2020 18:31:08 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Adam Honse <calcprogrammer1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Detect secondary SMBus controller on AMD AM4
 chipsets
Message-ID: <20200330183108.58c63736@endymion>
In-Reply-To: <20200329174440.19342-1-calcprogrammer1@gmail.com>
References: <20200329174440.19342-1-calcprogrammer1@gmail.com>
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

On Sun, 29 Mar 2020 12:44:40 -0500, Adam Honse wrote:
> The AMD X370 and other AM4 chipsets (A/B/X 3/4/5 parts) and Threadripper equivalents have a secondary SMBus controller at I/O port address 0x0B20.  This bus is used by several manufacturers to control motherboard RGB lighting via embedded controllers.  I have been using this bus in my OpenRGB project to control the Aura RGB on many motherboards and ASRock also uses this bus for their Polychrome RGB controller.
> 
> See this kernel bug report: https://bugzilla.kernel.org/show_bug.cgi?id=202587
> 
> Thanks,
> 
> Adam Honse (calcprogrammer1@gmail.com)

In order for this patch to be acceptable, this would need to be turned
into a proper Signed-off-by statement. Please see:

https://www.kernel.org/doc/html/v5.5/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

> 
> ---
>  drivers/i2c/busses/i2c-piix4.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 30ded6422e7b..6068364b84f6 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -981,6 +981,11 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		retval = piix4_setup_sb800(dev, id, 1);
>  	}
>  
> +	if (dev->vendor == PCI_VENDOR_ID_AMD &&
> +	    dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS) {
> +		retval = piix4_setup_sb800(dev, id, 1);
> +	}
> +
>  	if (retval > 0) {
>  		/* Try to add the aux adapter if it exists,
>  		 * piix4_add_adapter will clean up if this fails */

I'm a bit worried about this change. Sure it works on the systems which
do have the second SMBus channel, but what about the systems which
don't? If there no device revision that needs to be checked to ensure
that the second channel is present?

This patch needs to be tested on tested on systems with CZ-compatible
CPUs which do not have the second SMBus channel. Or do you believe they
all do have it?

-- 
Jean Delvare
SUSE L3 Support
