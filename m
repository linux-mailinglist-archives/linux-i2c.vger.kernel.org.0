Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E370C4570E5
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 15:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235180AbhKSOmX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Nov 2021 09:42:23 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:43280 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbhKSOmX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Nov 2021 09:42:23 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D3185212CA;
        Fri, 19 Nov 2021 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637332760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e4nzpNjJHHkOebYPOoWg+xqJ3i9tS/e3nzrCqD+YpT4=;
        b=GJuCtR1+9J0kIuTscxQL32XeZ0IwN0ZR+qwRFn0ZQ6II70doZOyAvWxcJOmmtW+7Gm7LkI
        bYQgVqnt188/tqlLyrui1M3F/0M5Fk5phyLnZIE5A2xoBHROl84LmgVNHd8Oj6A9HgljDK
        Ns33nmkzful5RusqjMRnUPoNxIxd+wE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637332760;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e4nzpNjJHHkOebYPOoWg+xqJ3i9tS/e3nzrCqD+YpT4=;
        b=MmB0QjQYeabWkCevcerrWLwg2dWtMNRZwuBxGfcMxpNadPmZChjLV79HvvbDdV5El/XY+t
        ldV5HDbInMv0hUBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B043713B32;
        Fri, 19 Nov 2021 14:39:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id FHVrKBi3l2HmBwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 19 Nov 2021 14:39:20 +0000
Date:   Fri, 19 Nov 2021 15:39:18 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i801: Remove i801_set_block_buffer_mode
Message-ID: <20211119153918.492ea41d@endymion>
In-Reply-To: <f6e13674-7f86-529f-10e2-6b34bc5f8f6c@gmail.com>
References: <f6e13674-7f86-529f-10e2-6b34bc5f8f6c@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 18 Nov 2021 23:58:17 +0100, Heiner Kallweit wrote:
> If FEATURE_BLOCK_BUFFER is set then bit SMBAUXCTL_E32B is supported
> and there's no benefit in reading it back. Origin of this check
> seems to be 14 yrs ago when people were not completely sure which
> chip versions support the block buffer mode.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - made commit message less offending ;)
> - re-added parentheses to a & b && c expression
> ---
>  drivers/i2c/busses/i2c-i801.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 05187457f..f5c1589da 100644
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
> @@ -791,9 +785,8 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
>  	/* Experience has shown that the block buffer can only be used for
>  	   SMBus (not I2C) block transactions, even though the datasheet
>  	   doesn't mention this limitation. */
> -	if ((priv->features & FEATURE_BLOCK_BUFFER)
> -	 && command != I2C_SMBUS_I2C_BLOCK_DATA
> -	 && i801_set_block_buffer_mode(priv) == 0)
> +	if ((priv->features & FEATURE_BLOCK_BUFFER) &&
> +	    command != I2C_SMBUS_I2C_BLOCK_DATA)
>  		result = i801_block_transaction_by_block(priv, data,
>  							 read_write,
>  							 command);

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
