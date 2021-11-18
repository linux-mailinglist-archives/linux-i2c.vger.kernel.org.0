Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F654558FC
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 11:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245607AbhKRK0r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 05:26:47 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:34084 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245650AbhKRK0K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 05:26:10 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A31081FD35;
        Thu, 18 Nov 2021 10:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637230989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PhEwrnxg0JcVPrlTn5V7Vzt0zu14KKeTb2gIbjLo9r0=;
        b=DlzIlZzA7qdSX6rNwRtB8YAWszRI2uhPysnnNjxEhP9DVV9JyeDe6R8fSKkqTATONuiWkB
        EEepWS1Nq+ey+tN8hxw1ae6N1HPGOW2IMuzUPfN9Pizn2TJZNq3T9k1XyMXjJ/c+1ulNkw
        ZUlezxtTSQqUnfNFCnNbKp1dG6DDW8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637230989;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PhEwrnxg0JcVPrlTn5V7Vzt0zu14KKeTb2gIbjLo9r0=;
        b=jURUazEPZvqMjmlp4nqDLxgcH7VtQ8C600PF5k6enPDRUc9Lgm4+BzdGtMxPdmsPP/4rsS
        E9gSk21/LCIgBiBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6DB8213D17;
        Thu, 18 Nov 2021 10:23:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 6CSGGI0plmHmDQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 18 Nov 2021 10:23:09 +0000
Date:   Thu, 18 Nov 2021 11:23:08 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Remove i801_set_block_buffer_mode
Message-ID: <20211118112308.62e3c2b3@endymion>
In-Reply-To: <ab295fad-3f5a-5cc9-14fe-5bfaea8099a9@gmail.com>
References: <ab295fad-3f5a-5cc9-14fe-5bfaea8099a9@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Thu, 11 Nov 2021 22:43:35 +0100, Heiner Kallweit wrote:
> If FEATURE_BLOCK_BUFFER is set I don't see how setting this bit could
> fail. Reading it back seems to be overly paranoid. Origin of this
> check seems to be 14 yrs ago when people were not completely sure
> which chip versions support block buffer mode.

Your reading of the history is correct, although "overly paranoid"
might be a somewhat exaggerated statement. When you modify a driver
used by millions and have been bitten by undocumented restrictions in
the same area, being cautious not to cause a regression doesn't seem
that bad to me.

What was wrong in that approach, I would think retrospectively, is that
i801_set_block_buffer_mode() should have been made verbose on failure,
so that we learned over time if any chipset actually failed to support
the feature in question. Because 14 years later we in fact still don't
know if the test was needed or not.

I'm fine with your change nevertheless, it should be fine, and if
anything breaks then we'll fix it.

I'll test it on my system later today.

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 4c96f1b47..608e928e9 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -521,9 +521,11 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
>  		return -EOPNOTSUPP;
>  	}
>  
> +	/* Set block buffer mode */
> +	outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_E32B, SMBAUXCTL(priv));
> +
>  	inb_p(SMBHSTCNT(priv)); /* reset the data buffer index */
>  
> -	/* Use 32-byte buffer to process this transaction */
>  	if (read_write == I2C_SMBUS_WRITE) {
>  		len = data->block[0];
>  		outb_p(len, SMBHSTDAT0(priv));
> @@ -750,14 +752,6 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>  	return i801_check_post(priv, status);
>  }
>  
> -static int i801_set_block_buffer_mode(struct i801_priv *priv)
> -{
> -	outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_E32B, SMBAUXCTL(priv));
> -	if ((inb_p(SMBAUXCTL(priv)) & SMBAUXCTL_E32B) == 0)
> -		return -EIO;
> -	return 0;
> -}
> -
>  /* Block transaction function */
>  static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
>  				  char read_write, int command)
> @@ -786,9 +780,8 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
>  	/* Experience has shown that the block buffer can only be used for
>  	   SMBus (not I2C) block transactions, even though the datasheet
>  	   doesn't mention this limitation. */
> -	if ((priv->features & FEATURE_BLOCK_BUFFER)
> -	 && command != I2C_SMBUS_I2C_BLOCK_DATA
> -	 && i801_set_block_buffer_mode(priv) == 0)
> +	if (priv->features & FEATURE_BLOCK_BUFFER &&

No, please preserve the parentheses. Mixing "&" and "&&" without
parentheses is highly confusing (to me at least, but I suspect I'm not
alone).

> +	    command != I2C_SMBUS_I2C_BLOCK_DATA)
>  		result = i801_block_transaction_by_block(priv, data,
>  							 read_write,
>  							 command);


-- 
Jean Delvare
SUSE L3 Support
