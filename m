Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA11546501
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 13:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237201AbiFJLDb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 07:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348986AbiFJLD3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 07:03:29 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EA7382346
        for <linux-i2c@vger.kernel.org>; Fri, 10 Jun 2022 04:03:27 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 273A21F8F1;
        Fri, 10 Jun 2022 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1654859006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+1rJ83BmhAOhpg/uh3Bh7xcwUk8Nh/w1gHPUMb1Dp/0=;
        b=ujmiB050Es/zfAazEw8ZvNGQmQR+uciI0QuzIbUtmnPdYJEv6ayY3vpDFcDqE8S9NiUfrG
        ZABQp82pYr0Bs7iF2pEqnSv+suAZEkQZj4yt8vniRISgHYcSIPVBA80k9QODYti5SbepJ6
        IZMiPszslcyg4d6XJtsaq/TE1IJHtPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1654859006;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+1rJ83BmhAOhpg/uh3Bh7xcwUk8Nh/w1gHPUMb1Dp/0=;
        b=8ZtbwEx3VEqVFq7pGMGvKabEx8iWWkbMtbHYT3NDrXAVuYUbX+f69S8VaR+L8i7b1FsaK9
        o4Ns68JhOGiJifDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01BF013941;
        Fri, 10 Jun 2022 11:03:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id i51zOv0ko2KCCwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 10 Jun 2022 11:03:25 +0000
Date:   Fri, 10 Jun 2022 13:03:24 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: i801: add i801_single_transaction(),
 complementing i801_block_transaction()
Message-ID: <20220610130324.1ab2725d@endymion.delvare>
In-Reply-To: <eba39e4d-fb5f-c9d3-0d51-001f8d584d51@gmail.com>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
        <eba39e4d-fb5f-c9d3-0d51-001f8d584d51@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Fri, 15 Apr 2022 18:58:03 +0200, Heiner Kallweit wrote:
> This patch factors out non-block pre/post processing to a new function
> i801_single_transaction(), complementing existing function
> i801_block_transaction(). This makes i801_access() better readable.

I like the idea, but I have objections about some implementation
details, see below.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 95 +++++++++++++++++++++--------------
>  1 file changed, 58 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index bf77f8640..8c2245f38 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -771,6 +771,62 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
>  	return result;
>  }
>  
> +/* Single transaction function */

The term "single transaction" is a bit misleading. Block transactions
are also single transactions, in the sense that there's one start
condition at the beginning and one stop condition at the end. I'd
rather call non-block transactions "single value transactions" or
"simple transactions".

> +static int i801_single_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
> +				   char read_write, int command)
> +{
> +	int xact, ret;
> +
> +	switch (command) {
> +	case I2C_SMBUS_QUICK:
> +		xact = I801_QUICK;
> +		break;
> +	case I2C_SMBUS_BYTE:
> +                xact = I801_BYTE;
> +                break;

Previous 2 lines are indented with spaces instead of tabs.

> +	case I2C_SMBUS_BYTE_DATA:
> +		if (read_write == I2C_SMBUS_WRITE)
> +			outb_p(data->byte, SMBHSTDAT0(priv));
> +		xact = I801_BYTE_DATA;
> +		break;
> +	case I2C_SMBUS_WORD_DATA:
> +		if (read_write == I2C_SMBUS_WRITE) {
> +			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
> +			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
> +		}
> +		xact = I801_WORD_DATA;
> +		break;
> +	case I2C_SMBUS_PROC_CALL:
> +		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
> +		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
> +		xact = I801_PROC_CALL;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;

That's never going to happen.

Generally speaking, I'm worried about having the same switch/case
construct here that we already have in i801_access. Looks to me like we
are doing half of the work here and the other half there and I fail to
see the rationale for splitting the work like that. I mean, I see how
it solves the asymmetry between the block and non-block code paths, but
the result doesn't look appealing. From a performance perspective it's
questionable too.

What prevents us from doing all the work on either side? Maybe we
should move more code into i801_single_transaction (possibly in a
subsequent patch)?

> +	}
> +
> +	ret = i801_transaction(priv, xact);
> +

Traditionally no blank line here.

> +	if (ret || read_write == I2C_SMBUS_WRITE)
> +		return ret;
> +
> +	switch (command) {
> +	case I2C_SMBUS_BYTE:
> +	case I2C_SMBUS_BYTE_DATA:
> +		data->byte = inb_p(SMBHSTDAT0(priv));
> +		break;
> +	case I2C_SMBUS_WORD_DATA:
> +	case I2C_SMBUS_PROC_CALL:
> +		data->word = inb_p(SMBHSTDAT0(priv)) +
> +			     (inb_p(SMBHSTDAT1(priv)) << 8);
> +		break;
> +	default:
> +		break;

Default case is not needed.

> +	}
> +
> +	return 0;
> +}
> +
>  static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
>  {
>  	addr <<= 1;
> @@ -784,9 +840,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  		       unsigned short flags, char read_write, u8 command,
>  		       int size, union i2c_smbus_data *data)
>  {
> -	int hwpec;
> -	int block = 0;
> -	int ret, xact;
> +	int hwpec, ret, block = 0;
>  	struct i801_priv *priv = i2c_get_adapdata(adap);
>  
>  	mutex_lock(&priv->acpi_lock);
> @@ -804,36 +858,23 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  	switch (size) {
>  	case I2C_SMBUS_QUICK:
>  		i801_set_hstadd(priv, addr, read_write);
> -		xact = I801_QUICK;
>  		break;
>  	case I2C_SMBUS_BYTE:
>  		i801_set_hstadd(priv, addr, read_write);
>  		if (read_write == I2C_SMBUS_WRITE)
>  			outb_p(command, SMBHSTCMD(priv));
> -		xact = I801_BYTE;
>  		break;
>  	case I2C_SMBUS_BYTE_DATA:
>  		i801_set_hstadd(priv, addr, read_write);
>  		outb_p(command, SMBHSTCMD(priv));
> -		if (read_write == I2C_SMBUS_WRITE)
> -			outb_p(data->byte, SMBHSTDAT0(priv));
> -		xact = I801_BYTE_DATA;
>  		break;
>  	case I2C_SMBUS_WORD_DATA:
>  		i801_set_hstadd(priv, addr, read_write);
>  		outb_p(command, SMBHSTCMD(priv));
> -		if (read_write == I2C_SMBUS_WRITE) {
> -			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
> -			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
> -		}
> -		xact = I801_WORD_DATA;
>  		break;
>  	case I2C_SMBUS_PROC_CALL:
>  		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
>  		outb_p(command, SMBHSTCMD(priv));
> -		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
> -		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
> -		xact = I801_PROC_CALL;
>  		read_write = I2C_SMBUS_READ;
>  		break;
>  	case I2C_SMBUS_BLOCK_DATA:
> @@ -883,7 +924,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  	if (block)
>  		ret = i801_block_transaction(priv, data, read_write, size);
>  	else
> -		ret = i801_transaction(priv, xact);
> +		ret = i801_single_transaction(priv, data, read_write, size);
>  
>  	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
>  	   time, so we forcibly disable it after every transaction. Turn off
> @@ -891,26 +932,6 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  	if (hwpec || block)
>  		outb_p(inb_p(SMBAUXCTL(priv)) &
>  		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
> -
> -	if (block)
> -		goto out;
> -	if (ret)
> -		goto out;
> -	if ((read_write == I2C_SMBUS_WRITE) || (xact == I801_QUICK))
> -		goto out;
> -
> -	switch (xact) {
> -	case I801_BYTE:	/* Result put in SMBHSTDAT0 */
> -	case I801_BYTE_DATA:
> -		data->byte = inb_p(SMBHSTDAT0(priv));
> -		break;
> -	case I801_WORD_DATA:
> -	case I801_PROC_CALL:
> -		data->word = inb_p(SMBHSTDAT0(priv)) +
> -			     (inb_p(SMBHSTDAT1(priv)) << 8);
> -		break;
> -	}
> -
>  out:
>  	/*
>  	 * Unlock the SMBus device for use by BIOS/ACPI,


-- 
Jean Delvare
SUSE L3 Support
