Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A83117900E0
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 18:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244909AbjIAQpC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 12:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238689AbjIAQpB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 12:45:01 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8668AE70
        for <linux-i2c@vger.kernel.org>; Fri,  1 Sep 2023 09:44:58 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 37D501F45F;
        Fri,  1 Sep 2023 16:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693586697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0YpBJs0MGrjyDipEFg/eao/CUQmQLbBORir76HPEtsY=;
        b=UNTm8DPdq4R9PiJmmP457+B3EzfdTXudDDUPOUTuw5143gGZdshb94WTGq3cdEfC/UTOoW
        sdQCbxvaI0pmat8PQR76DT34+kPWyvDP6D6zhDj+0aJmZX+MpF8FKmE05QmuLHuMVxdG3Z
        yGoyGhWibE1sTaIhFZH/Hutr1z+qOTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693586697;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0YpBJs0MGrjyDipEFg/eao/CUQmQLbBORir76HPEtsY=;
        b=nkL25nRsnm+5jMiai6TmE8rjTp40SjFM9zGjxHNIxzJHBqF45E8qMK4x9MyrpNsyowN1Iq
        v41vJyhMT2c/crCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C4BF1358B;
        Fri,  1 Sep 2023 16:44:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ThtUAAkV8mT3IwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 01 Sep 2023 16:44:57 +0000
Date:   Fri, 1 Sep 2023 18:44:55 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Daniel Kurtz <djkurtz@chromium.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
Message-ID: <20230901184455.54effcea@endymion.delvare>
In-Reply-To: <679ddcf8-b03d-15eb-e914-bdbaa3f5b890@gmail.com>
References: <679ddcf8-b03d-15eb-e914-bdbaa3f5b890@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Tue, 29 Aug 2023 08:25:23 +0200, Heiner Kallweit wrote:
> Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
> receiving the last byte. If we get e.g. preempted before setting
> SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
> before SMBHSTCNT_LAST_BYTE is set.
> Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
> SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
> is also consistent with what we do in i801_isr_byte_done().
> 
> Fixes: efa3cb15ad8b ("i2c-i801: Refactor use of LAST_BYTE in i801_block_transaction_byte_by_byte")

I don't think this is true. This patch refactored the code but didn't
change the logic. The bug existed before already. As far as I see, the
race condition already existed when the kernel switched to git, so
there's no point in having a Fixes statement.

> Reported-by: Jean Delvare <jdelvare@suse.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 7a0ccc584..8acf09539 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -679,15 +679,11 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>  		return result ? priv->status : -ETIMEDOUT;
>  	}
>  
> -	for (i = 1; i <= len; i++) {
> -		if (i == len && read_write == I2C_SMBUS_READ)
> -			smbcmd |= SMBHSTCNT_LAST_BYTE;
> -		outb_p(smbcmd, SMBHSTCNT(priv));
> -
> -		if (i == 1)
> -			outb_p(inb(SMBHSTCNT(priv)) | SMBHSTCNT_START,
> -			       SMBHSTCNT(priv));
> +	if (len == 1 && read_write == I2C_SMBUS_READ)
> +		smbcmd |= SMBHSTCNT_LAST_BYTE;
> +	outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
>  
> +	for (i = 1; i <= len; i++) {
>  		status = i801_wait_byte_done(priv);
>  		if (status)
>  			return status;
> @@ -710,9 +706,12 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>  			data->block[0] = len;
>  		}
>  
> -		/* Retrieve/store value in SMBBLKDAT */
> -		if (read_write == I2C_SMBUS_READ)
> +		if (read_write == I2C_SMBUS_READ) {
>  			data->block[i] = inb_p(SMBBLKDAT(priv));
> +			if (i == len - 1)
> +				outb_p(smbcmd | SMBHSTCNT_LAST_BYTE, SMBHSTCNT(priv));
> +		}
> +
>  		if (read_write == I2C_SMBUS_WRITE && i+1 <= len)
>  			outb_p(data->block[i+1], SMBBLKDAT(priv));
>  

Looks good and tested OK.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
