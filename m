Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A52138FE09
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 11:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbhEYJoQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 05:44:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:39090 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230508AbhEYJoQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 05:44:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1621935765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OMbLcRerrE/5FumT6OU98xFEJNSneZqFdQo0Vdsf/jI=;
        b=wJXpbX/2NeSz0t+OuJYE3Xsst8yWPPEW154jaAVNFTlLpI3BlXj6aoNyEZ5C6MWFlpPPLS
        wul2o+sDCYVUtITy9UNrtB+yuQotwqxCoaLaBHorCiijU2lIzJhv4GfGBgCRwgtkl0arYp
        6bGXF219RFbOThP7HZ4hoQPjGIvJzY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1621935765;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OMbLcRerrE/5FumT6OU98xFEJNSneZqFdQo0Vdsf/jI=;
        b=pWoF09ljrZ962MFEGRbAYBMy88fAScQRRK2BwZErjSTT/xroWk5QJxnUPWRJHRL2oFVUGr
        tdPQZfN2HmEk/IDg==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C8DBEAEA8;
        Tue, 25 May 2021 09:42:45 +0000 (UTC)
Date:   Tue, 25 May 2021 11:42:44 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Use standard PCI constants instead of own
 ones
Message-ID: <20210525114244.05709ade@endymion>
In-Reply-To: <a4b704b1-278c-20bc-854f-8e1177a530f5@gmail.com>
References: <a4b704b1-278c-20bc-854f-8e1177a530f5@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 22 May 2021 23:46:20 +0200, Heiner Kallweit wrote:
> Layout of these registers is part of the PCI standard. Therefore use
> the constants defined by the PCI subsystem.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 738204d77..f6d7866f1 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -131,8 +131,6 @@
>  
>  /* PCI Address Constants */
>  #define SMBBAR		4
> -#define SMBPCICTL	0x004
> -#define SMBPCISTS	0x006
>  #define SMBHSTCFG	0x040
>  #define TCOBASE		0x050
>  #define TCOCTL		0x054
> @@ -141,12 +139,6 @@
>  #define SBREG_SMBCTRL		0xc6000c
>  #define SBREG_SMBCTRL_DNV	0xcf000c
>  
> -/* Host status bits for SMBPCISTS */
> -#define SMBPCISTS_INTS		BIT(3)
> -
> -/* Control bits for SMBPCICTL */
> -#define SMBPCICTL_INTDIS	BIT(10)
> -
>  /* Host configuration bits for SMBHSTCFG */
>  #define SMBHSTCFG_HST_EN	BIT(0)
>  #define SMBHSTCFG_SMB_SMI_EN	BIT(1)
> @@ -648,8 +640,8 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
>  	u8 status;
>  
>  	/* Confirm this is our interrupt */
> -	pci_read_config_word(priv->pci_dev, SMBPCISTS, &pcists);
> -	if (!(pcists & SMBPCISTS_INTS))
> +	pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
> +	if (!(pcists & PCI_STATUS_INTERRUPT))
>  		return IRQ_NONE;
>  
>  	if (priv->features & FEATURE_HOST_NOTIFY) {
> @@ -1866,13 +1858,13 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		u16 pcictl, pcists;
>  
>  		/* Complain if an interrupt is already pending */
> -		pci_read_config_word(priv->pci_dev, SMBPCISTS, &pcists);
> -		if (pcists & SMBPCISTS_INTS)
> +		pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
> +		if (pcists & PCI_STATUS_INTERRUPT)
>  			dev_warn(&dev->dev, "An interrupt is pending!\n");
>  
>  		/* Check if interrupts have been disabled */
> -		pci_read_config_word(priv->pci_dev, SMBPCICTL, &pcictl);
> -		if (pcictl & SMBPCICTL_INTDIS) {
> +		pci_read_config_word(priv->pci_dev, PCI_COMMAND, &pcictl);
> +		if (pcictl & PCI_COMMAND_INTX_DISABLE) {
>  			dev_info(&dev->dev, "Interrupts are disabled\n");
>  			priv->features &= ~FEATURE_IRQ;
>  		}

Nice, thanks for the clean-up.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
