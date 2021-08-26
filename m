Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828DB3F8ADA
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Aug 2021 17:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239162AbhHZPTn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Aug 2021 11:19:43 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:41856 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbhHZPTn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Aug 2021 11:19:43 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id CE364201B6;
        Thu, 26 Aug 2021 15:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1629991134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=muJsoRFnYZgBsnd1/VBbjBsQhPbwtwtEK8FJ4pVgK4A=;
        b=O3pWG4NWeukTi4zqMWWbQd4/DByfH6AKWaawiTREMlKdxOBKeilRFp3N0sewIEDW3PiJii
        jgz/26PNlI1/7/YjzpA7NSmSRisoQ3uXuyEP6Ru1pi2I2ZJmoecerO6b0+NGgb2lXBljz5
        tn+TVMSZ/0+8qMDJx0r4GT6Pnr9RiJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1629991134;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=muJsoRFnYZgBsnd1/VBbjBsQhPbwtwtEK8FJ4pVgK4A=;
        b=2o+LevO5xFYuQw4b7FQ8dfG9xGBPky+jFvDxpokDpPt5QGgWtAVJhvIxK1bBHF9jDrwX6p
        j8VZUaDnJ6RqwQDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9E33D13689;
        Thu, 26 Aug 2021 15:18:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id e27VI96wJ2FwawAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 26 Aug 2021 15:18:54 +0000
Date:   Thu, 26 Aug 2021 17:18:52 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 5/9] i2c: i801: Remove not needed check for
 PCI_COMMAND_INTX_DISABLE
Message-ID: <20210826171852.4aed109a@endymion>
In-Reply-To: <9ac8ff4b-3e2a-278d-f7f6-65534b43eec7@gmail.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
        <9ac8ff4b-3e2a-278d-f7f6-65534b43eec7@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 06 Aug 2021 23:15:51 +0200, Heiner Kallweit wrote:
> do_pci_enable_device() takes care that PCI_COMMAND_INTX_DISABLE
> is cleared if a legacy interrupt is used.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index f56060fcf..7fa06b85f 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1827,19 +1827,12 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		priv->features &= ~FEATURE_IRQ;
>  
>  	if (priv->features & FEATURE_IRQ) {
> -		u16 pcictl, pcists;
> +		u16 pcists;
>  
>  		/* Complain if an interrupt is already pending */
>  		pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
>  		if (pcists & PCI_STATUS_INTERRUPT)
>  			dev_warn(&dev->dev, "An interrupt is pending!\n");
> -
> -		/* Check if interrupts have been disabled */
> -		pci_read_config_word(priv->pci_dev, PCI_COMMAND, &pcictl);
> -		if (pcictl & PCI_COMMAND_INTX_DISABLE) {
> -			dev_info(&dev->dev, "Interrupts are disabled\n");
> -			priv->features &= ~FEATURE_IRQ;
> -		}
>  	}
>  
>  	if (priv->features & FEATURE_IRQ) {

Reviewed-by: Jean Delvare <jdelvare@suse.de>

As said before, I'm not sure, but let's apply that and see if anybody
complains.

-- 
Jean Delvare
SUSE L3 Support
