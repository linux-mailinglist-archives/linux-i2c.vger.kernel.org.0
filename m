Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8478F467464
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 10:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351414AbhLCKCk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 05:02:40 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:32788 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbhLCKCk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 05:02:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E1E83212BE;
        Fri,  3 Dec 2021 09:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1638525555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0zKQfBWhnJiOJith7h692yDCuhYBK47AlBbqf4KIGmM=;
        b=VO7nQJsiVSDnrjLWRkhziDAwcBXBPwa+X4b50Zp+J7wnxdKQsJ4SNw7evjAJ4HfP95dVOi
        S+9WwtfSwjomrsYRTjoznLKXFHXHd5xeip5Vv5nNA6YmZ/vKBx98pBRgPROLIGiqZpeWck
        4FRidSpw0rnDB3HZPWS+kpxfLLCY3z4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1638525555;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0zKQfBWhnJiOJith7h692yDCuhYBK47AlBbqf4KIGmM=;
        b=fOK6v70P/cjn0y91s9bDKPyeup3s1B3/PGqpW1lzl8Ycp/zVD2AfikbeZ/hEjqFARSYH17
        YTV6cSR07n4lstBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACAE513D9E;
        Fri,  3 Dec 2021 09:59:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id fhnBJ3PqqWEOAwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 03 Dec 2021 09:59:15 +0000
Date:   Fri, 3 Dec 2021 10:59:14 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Don't read back cleared status in
 i801_check_pre()
Message-ID: <20211203105914.393ffd24@endymion>
In-Reply-To: <f0d7dd91-5b35-d5bb-33b7-dacc632c542a@gmail.com>
References: <f0d7dd91-5b35-d5bb-33b7-dacc632c542a@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Thu, 02 Dec 2021 10:53:05 +0100, Heiner Kallweit wrote:
> I see no need to read back the registers to verify that the bits
> have actually been cleared. I can't imagine any scenario where
> the bits would remain set after a write to them.

This happened at least once in the past. See this archived message:

https://www.spinics.net/lists/linux-i2c/msg02651.html

This was in i801_check_post(), not i801_check_pre(), but that was the
same code. Which was removed in
6cad93c4bbd62ecfa2e1b3a95c1ac4f6f27764c7 because there was little point
in checking the same condition twice.

Unfortunately it seems that the error messages were copied manually so
we lack the details of which status bit couldn't be cleared exactly.

Granted, it was caused by a driver bug, which was fixed since (commit
c074c39d62306efa5ba7c69c1a1531bc7333d252) but this shows that the
condition can actually trigger.

> Whilst at it, change involved syslog messages to use pci_dbg() et al.
> to simplify them.

Fine with me.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 22 +++-------------------
>  1 file changed, 3 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c
> b/drivers/i2c/busses/i2c-i801.c index 720f7e9d0..a82aaef27 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -328,22 +328,14 @@ static int i801_check_pre(struct i801_priv
> *priv) 
>  	status = inb_p(SMBHSTSTS(priv));
>  	if (status & SMBHSTSTS_HOST_BUSY) {
> -		dev_err(&priv->pci_dev->dev, "SMBus is busy, can't use it!\n");
> +		pci_err(priv->pci_dev, "SMBus is busy, can't use it!\n");
>  		return -EBUSY;
>  	}
>  
>  	status &= STATUS_FLAGS;
>  	if (status) {
> -		dev_dbg(&priv->pci_dev->dev, "Clearing status flags (%02x)\n",
> -			status);
> +		pci_dbg(priv->pci_dev, "Clearing status flags (%02x)\n", status);
>  		outb_p(status, SMBHSTSTS(priv));
> -		status = inb_p(SMBHSTSTS(priv)) & STATUS_FLAGS;
> -		if (status) {
> -			dev_err(&priv->pci_dev->dev,
> -				"Failed clearing status flags (%02x)\n",
> -				status);
> -			return -EBUSY;
> -		}
>  	}
>  
>  	/*
> @@ -356,16 +348,8 @@ static int i801_check_pre(struct i801_priv *priv)
>  	if (priv->features & FEATURE_SMBUS_PEC) {
>  		status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
>  		if (status) {
> -			dev_dbg(&priv->pci_dev->dev,
> -				"Clearing aux status flags (%02x)\n", status);
> +			pci_dbg(priv->pci_dev, "Clearing aux status flags (%02x)\n", status);
>  			outb_p(status, SMBAUXSTS(priv));
> -			status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
> -			if (status) {
> -				dev_err(&priv->pci_dev->dev,
> -					"Failed clearing aux status flags (%02x)\n",
> -					status);
> -				return -EBUSY;
> -			}
>  		}
>  	}
>  

So I'm not too sure what to do with this. On the one hand, the code you
want to remove could be useful to catch and investigate future bugs.
The rest of the code does assume that the status bits are properly
cleared before starting a new transaction. On the other hand, it is
slowing down the driver a bit when all is fine. Is that really worth
optimizing?

-- 
Jean Delvare
SUSE L3 Support
