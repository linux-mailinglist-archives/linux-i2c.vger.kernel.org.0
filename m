Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C18467549
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 11:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239797AbhLCKpW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 05:45:22 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:39738 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235965AbhLCKpW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 05:45:22 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 9BFCA212C6;
        Fri,  3 Dec 2021 10:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1638528117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BnhopZcN9X+P79BTxSJX9tWTc25DD5MoNIF74lU0JCw=;
        b=iptpqJk7qmCa2cCiFL9LdD1+l4A4PA90nGQjl36i2cfalwCmuguRN4MeJH03Tp0DhTGNp8
        eZ01A+O0Ajk+Mlm68k8AVbz2ZLpLm7e7MtASO84UEvXSDZN/X+Dy8xMDv9arF24h22m75d
        M6cqN6348M4dcyQM2bCaARHjSpxOk8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1638528117;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BnhopZcN9X+P79BTxSJX9tWTc25DD5MoNIF74lU0JCw=;
        b=yW+V8CKsu/QhGdV6Jer9njZpWK7tLEJm/dutS+JzDSS2on2J+k+MmEwLcOsT6A8BjbpSiP
        b6/eB7wuI59cg2Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 670E613DC9;
        Fri,  3 Dec 2021 10:41:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 6VTwFnX0qWGtFQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 03 Dec 2021 10:41:57 +0000
Date:   Fri, 3 Dec 2021 11:41:56 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Don't clear status flags twice in interrupt
 mode
Message-ID: <20211203114156.3f0142bf@endymion>
In-Reply-To: <8fba896a-81c4-dda7-6481-92ae8dccf41c@gmail.com>
References: <8fba896a-81c4-dda7-6481-92ae8dccf41c@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Thu, 02 Dec 2021 10:57:43 +0100, Heiner Kallweit wrote:
> In interrupt mode we clear the status flags twice, in the interrupt
> handler and in i801_check_post(). Remove clearing the status flags
> from i801_check_post() and let i801_wait_intr() clear them in
> polling mode. Another benefit is that now only checks for error
> conditions are left in i801_check_post(), thus better matching the
> function name.
> 
> Note: There's a comment in i801_check_post() that i801_wait_intr()
> clears the error status bits. Actually this hasn't been true until
> this change.

While reviewing this, I have noticed other comments which seem outdated:

* In i801_isr(), "->status must be cleared before the next transaction
  is started." We no longer do this since
  1de93d5d521717cbb77cc9796a4df141d800d608, and things are working
  well, so clearly this is no longer necessary and the comment could be
  removed.
* The comment before i801_check_post() is obsoleted by your
  proposed change.

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 7446bed78..82553e0cb 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -438,9 +438,6 @@ static int i801_check_post(struct i801_priv *priv, int status)
>  		dev_dbg(&priv->pci_dev->dev, "Lost arbitration\n");
>  	}
>  
> -	/* Clear status flags except BYTE_DONE, to be cleared by caller */
> -	outb_p(status, SMBHSTSTS(priv));
> -
>  	return result;
>  }
>  
> @@ -455,8 +452,10 @@ static int i801_wait_intr(struct i801_priv *priv)
>  		status = inb_p(SMBHSTSTS(priv));
>  		busy = status & SMBHSTSTS_HOST_BUSY;
>  		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
> -		if (!busy && status)
> +		if (!busy && status) {
> +			outb_p(status, SMBHSTSTS(priv));
>  			return status;
> +		}
>  	} while (time_is_after_eq_jiffies(timeout));
>  
>  	return -ETIMEDOUT;

I like the idea to make things consistent between the interrupt and
poll modes, however I'm afraid there's one code path not covered by
your patch. If i801_wait_byte_done() returns an error flag in
i801_block_transaction_byte_by_byte(), we jump directly to
i801_check_post() without calling i801_wait_intr(). In that case, the
error flags are not cleared, right? Doesn't look good.

Makes me wonder if we shouldn't actually let i801_check_post() clear
the flags and remove that piece of code everywhere else? Or is there a
reason why it has to be done earlier in i801_isr(), that I do not
remember?

I'm also wondering if there's actually any reason to clear the flags at
all at the end of the transaction, considering that we'll be doing it
again at the beginning of the next transaction anyway to be on the safe
side.

-- 
Jean Delvare
SUSE L3 Support
