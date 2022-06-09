Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85A3544E18
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 15:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234919AbiFINxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 09:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbiFINxa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 09:53:30 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438C721D491
        for <linux-i2c@vger.kernel.org>; Thu,  9 Jun 2022 06:53:29 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E952521AB8;
        Thu,  9 Jun 2022 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1654782807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kjj9oBK5U4epfI85IK8fs/EXU4M+NJx1pYviQGfy+XI=;
        b=I2bYrLcFxI2I3UN0eQmmCh/SM/O+S9Z5D1rxGIDMCZ07lxWmeUQkr+jk7de/PeASYh9Qq9
        +qetT0+k7d2uBxZZ8E5loao71wfOqTgnNqOJzP4H/4RUCIR6Ez39nt3JIj50uQId3xFdnI
        9MPEQKzgkz3LJOTBGe4xvsZuk8MlfCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1654782807;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kjj9oBK5U4epfI85IK8fs/EXU4M+NJx1pYviQGfy+XI=;
        b=2+EXvya49MMFkXzfi1gcKWKig9N2NC8Fhy4+xmjXcDCtYAHgznmc5+epPtRj2TxHlpcKNF
        TNSQtzBFrcSs9aCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C98B213456;
        Thu,  9 Jun 2022 13:53:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Zh+IL1f7oWKHYgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 09 Jun 2022 13:53:27 +0000
Date:   Thu, 9 Jun 2022 15:53:26 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 5/8] i2c: i801: add helper i801_set_hstadd()
Message-ID: <20220609155326.30147f58@endymion.delvare>
In-Reply-To: <e07379b5-609c-fd2b-3e66-f79c984c3a55@gmail.com>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
 <e07379b5-609c-fd2b-3e66-f79c984c3a55@gmail.com>
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

On Fri, 15 Apr 2022 18:57:21 +0200, Heiner Kallweit wrote:
> Factor out setting SMBHSTADD to a helper. The current code makes the
> assumption that constant I2C_SMBUS_READ has bit 0 set, that's not ideal.

This isn't an "assumption". The values of I2C_SMBUS_WRITE and
I2C_SMBUS_READ were chosen to match the bit position and values in the
I2C protocol. Maybe it should have been made clearer by defining them
as hexadecimal values instead of decimal values. Nevertheless, I find
it unfortunate to not use this fact to optimize the code, see below.

> Therefore let the new helper explicitly check for I2C_SMBUS_READ.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 41 ++++++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a9737f14d..bf77f8640 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -771,6 +771,14 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
>  	return result;
>  }
>  
> +static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
> +{
> +	addr <<= 1;
> +	if (read_write == I2C_SMBUS_READ)
> +		addr |= 0x01;
> +	outb_p(addr, SMBHSTADD(priv));

This can be written:

	outb_p((addr << 1) | read_write, SMBHSTADD(priv));

Net result -48 bytes of (x86_64) binary code. That's basically what the
original code was doing, minus the useless masking.

> +}
> +
>  /* Return negative errno on error. */
>  static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  		       unsigned short flags, char read_write, u8 command,
> @@ -795,28 +803,24 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  
>  	switch (size) {
>  	case I2C_SMBUS_QUICK:
> -		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
> -		       SMBHSTADD(priv));
> +		i801_set_hstadd(priv, addr, read_write);
>  		xact = I801_QUICK;
>  		break;
>  	case I2C_SMBUS_BYTE:
> -		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
> -		       SMBHSTADD(priv));
> +		i801_set_hstadd(priv, addr, read_write);
>  		if (read_write == I2C_SMBUS_WRITE)
>  			outb_p(command, SMBHSTCMD(priv));
>  		xact = I801_BYTE;
>  		break;
>  	case I2C_SMBUS_BYTE_DATA:
> -		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
> -		       SMBHSTADD(priv));
> +		i801_set_hstadd(priv, addr, read_write);
>  		outb_p(command, SMBHSTCMD(priv));
>  		if (read_write == I2C_SMBUS_WRITE)
>  			outb_p(data->byte, SMBHSTDAT0(priv));
>  		xact = I801_BYTE_DATA;
>  		break;
>  	case I2C_SMBUS_WORD_DATA:
> -		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
> -		       SMBHSTADD(priv));
> +		i801_set_hstadd(priv, addr, read_write);
>  		outb_p(command, SMBHSTCMD(priv));
>  		if (read_write == I2C_SMBUS_WRITE) {
>  			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
> @@ -825,7 +829,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  		xact = I801_WORD_DATA;
>  		break;
>  	case I2C_SMBUS_PROC_CALL:
> -		outb_p((addr & 0x7f) << 1, SMBHSTADD(priv));
> +		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
>  		outb_p(command, SMBHSTCMD(priv));
>  		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
>  		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
> @@ -833,8 +837,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  		read_write = I2C_SMBUS_READ;
>  		break;
>  	case I2C_SMBUS_BLOCK_DATA:
> -		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
> -		       SMBHSTADD(priv));
> +		i801_set_hstadd(priv, addr, read_write);
>  		outb_p(command, SMBHSTCMD(priv));
>  		block = 1;
>  		break;
> @@ -845,10 +848,11 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  		 * However if SPD Write Disable is set (Lynx Point and later),
>  		 * the read will fail if we don't set the R/#W bit.
>  		 */
> -		outb_p(((addr & 0x7f) << 1) |
> -		       ((priv->original_hstcfg & SMBHSTCFG_SPD_WD) ?
> -			(read_write & 0x01) : 0),
> -		       SMBHSTADD(priv));
> +		if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
> +			i801_set_hstadd(priv, addr, read_write);
> +		else
> +			i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);

Preserving the use of the ternary operator makes the generated binary
smaller once again:

		i801_set_hstadd(priv, addr,
				(priv->original_hstcfg & SMBHSTCFG_SPD_WD) ?
				read_write : I2C_SMBUS_WRITE);

Net result -11 bytes of (x86_64) binary code.

> +
>  		if (read_write == I2C_SMBUS_READ) {
>  			/* NB: page 240 of ICH5 datasheet also shows
>  			 * that DATA1 is the cmd field when reading */
> @@ -858,11 +862,8 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  		block = 1;
>  		break;
>  	case I2C_SMBUS_BLOCK_PROC_CALL:
> -		/*
> -		 * Bit 0 of the slave address register always indicate a write
> -		 * command.
> -		 */
> -		outb_p((addr & 0x7f) << 1, SMBHSTADD(priv));
> +		/* Needs to be flagged as write transaction */
> +		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
>  		outb_p(command, SMBHSTCMD(priv));
>  		block = 1;
>  		break;


-- 
Jean Delvare
SUSE L3 Support
