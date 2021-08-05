Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D8A3E12D7
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 12:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240237AbhHEKmJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 06:42:09 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:38002 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232619AbhHEKmI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 06:42:08 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 41FE31FD37;
        Thu,  5 Aug 2021 10:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628160114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7L6k7Zw2ZIau4O5/7J2BiHoRC/q4nKwDgo2nh+KxxeU=;
        b=d1eHewqv4FH7uIEcqCG39l4SxAm0l7JrFDV+DR0CHZCAkfOeUtn7gyddqKRiwtTz7E8QRl
        hypgGJhLy8EmXHmqppv5uHrFJli0RZ9v/uG/hhFTKSlGcCatEDRL+84/vBVKZoZ7hH0gFO
        DvHyoksnS+1Ih+eqb72KZUlqMXodgJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628160114;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7L6k7Zw2ZIau4O5/7J2BiHoRC/q4nKwDgo2nh+KxxeU=;
        b=JXiVgfXtiiZgaybHyJzTuKUsMPcRaqPAKEy1d21s0IOa1UyZvxAuNM4n6uLicrr+FPrU7Q
        z+W71k1sStiyS1Cw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 134BB13785;
        Thu,  5 Aug 2021 10:41:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id v8ZzAnLAC2G7eQAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 05 Aug 2021 10:41:54 +0000
Date:   Thu, 5 Aug 2021 12:41:50 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 06/10] i2c: i801: Remove not needed check for
 PCI_COMMAND_INTX_DISABLE
Message-ID: <20210805124150.3fbdfa9b@endymion>
In-Reply-To: <f9115eb4-4b19-0a9c-0354-b3ded261c155@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <f9115eb4-4b19-0a9c-0354-b3ded261c155@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sun, 01 Aug 2021 16:21:08 +0200, Heiner Kallweit wrote:
> do_pci_enable_device() takes care that PCI_COMMAND_INTX_DISABLE
> is cleared if a legacy interrupt is used.

Only if pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin) returned a
non-zero pin, if I read the code correctly. While I can't remember the
context in which I wrote this piece of code, I suppose that pin == 0
was the situation where this test was needed. I mean, the board
designer can legitimately not wire the interrupt pin, and require that
polling is being used, right?

In your favor, I can't find any online kernel log with this message.
However that doesn't mean I'm comfortable removing the safety check.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a6287c520..5b9eebc1c 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1825,19 +1825,12 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
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


-- 
Jean Delvare
SUSE L3 Support
