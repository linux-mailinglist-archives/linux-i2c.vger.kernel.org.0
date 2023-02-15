Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48E03697F2F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 16:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjBOPNw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 10:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBOPNw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 10:13:52 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344A583F7
        for <linux-i2c@vger.kernel.org>; Wed, 15 Feb 2023 07:13:51 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id BCD062006E;
        Wed, 15 Feb 2023 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676474029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5VrO/qsMpaeCPuiLJ1sjV35bFbOQlkSHRIFtE8JFomk=;
        b=PAdREp60lRUoGVKKiquiRuy76DAAGUAwm7aeNX1T9ADjrwsdNgfRIWRTC9O4ZFd0wSwDzU
        AwEAru3ijG+OrLA7IHuDJVV94ru4cBu/DvYVUmxjTiDannBMLJANJFJDBcKC5icQKB71L2
        etYwQaR+K2wl3R2HgUErUaIEWZL7ieU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676474029;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5VrO/qsMpaeCPuiLJ1sjV35bFbOQlkSHRIFtE8JFomk=;
        b=4kEP6oYL953tfuwh3G54FlA3FgK+5IJ+yKz+srvUrOULqgYsfhok4h3yZvRzT9wQzpZnTW
        +X9CH8gBxUSQRQAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90DE413483;
        Wed, 15 Feb 2023 15:13:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id TJluIa327GMoHAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 15 Feb 2023 15:13:49 +0000
Date:   Wed, 15 Feb 2023 16:13:47 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 07/10] i2c: i801: centralize configuring non-block
 commands in i801_simple_transaction
Message-ID: <20230215161347.07f9c009@endymion.delvare>
In-Reply-To: <2fca168d-9f31-1c50-ebde-3e4023d84423@gmail.com>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
 <2fca168d-9f31-1c50-ebde-3e4023d84423@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Mon, 19 Dec 2022 19:20:55 +0100, Heiner Kallweit wrote:
> Currently configuring command register settings is disributed over multiple
> functions. At first cetralize this for non-block commands in

Typo: cetralize -> centralize.

> i801_simple_transaction().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)

I'm happy with the idea (well I kind of suggested it in the first
place, so...), and pleased to see that the diffstats confirm it was a
good idea.

> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index d7182f7c8..0d49e9587 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -738,35 +738,47 @@ static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
>  
>  /* Single value transaction function */
>  static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
> -				   char read_write, int command)
> +				   u8 addr, u8 hstcmd, char read_write, int command)

See my review of patch 5 about how I don't like some of the parameter
names. But I realize now that this problem predates your patches,
functions i801_block_transaction_by_block() and
i801_block_transaction_byte_by_byte() already carry the confusion. So
I'm fine leaving it as is for now, maybe we can clean it up later
driver-wide.

>  {
>  	int xact, ret;
>  
>  	switch (command) {
>  	case I2C_SMBUS_QUICK:
> +		i801_set_hstadd(priv, addr, read_write);
>  		xact = I801_QUICK;
>  		break;
>  	case I2C_SMBUS_BYTE:
> +		i801_set_hstadd(priv, addr, read_write);
> +		if (read_write == I2C_SMBUS_WRITE)
> +			outb_p(hstcmd, SMBHSTCMD(priv));
>  		xact = I801_BYTE;
>  		break;
>  	case I2C_SMBUS_BYTE_DATA:
> +		i801_set_hstadd(priv, addr, read_write);
>  		if (read_write == I2C_SMBUS_WRITE)
>  			outb_p(data->byte, SMBHSTDAT0(priv));
> +		outb_p(hstcmd, SMBHSTCMD(priv));
>  		xact = I801_BYTE_DATA;
>  		break;
>  	case I2C_SMBUS_WORD_DATA:
> +		i801_set_hstadd(priv, addr, read_write);
>  		if (read_write == I2C_SMBUS_WRITE) {
>  			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
>  			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
>  		}
> +		outb_p(hstcmd, SMBHSTCMD(priv));
>  		xact = I801_WORD_DATA;
>  		break;
>  	case I2C_SMBUS_PROC_CALL:
> +		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
>  		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
>  		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
> +		outb_p(hstcmd, SMBHSTCMD(priv));
> +		read_write = I2C_SMBUS_READ;
>  		xact = I801_PROC_CALL;
>  		break;
>  	default:
> +		pci_err(priv->pci_dev, "Unsupported transaction %d\n", command);
>  		return -EOPNOTSUPP;
>  	}

The split between patches 7 and 8 isn't really clean, as you have dead
code here at this step, which will only become active with the next
patch. I'm willing to let it go though.

>  
> @@ -857,25 +869,10 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  
>  	switch (size) {
>  	case I2C_SMBUS_QUICK:
> -		i801_set_hstadd(priv, addr, read_write);
> -		break;
>  	case I2C_SMBUS_BYTE:
> -		i801_set_hstadd(priv, addr, read_write);
> -		if (read_write == I2C_SMBUS_WRITE)
> -			outb_p(command, SMBHSTCMD(priv));
> -		break;
>  	case I2C_SMBUS_BYTE_DATA:
> -		i801_set_hstadd(priv, addr, read_write);
> -		outb_p(command, SMBHSTCMD(priv));
> -		break;
>  	case I2C_SMBUS_WORD_DATA:
> -		i801_set_hstadd(priv, addr, read_write);
> -		outb_p(command, SMBHSTCMD(priv));
> -		break;
>  	case I2C_SMBUS_PROC_CALL:
> -		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
> -		outb_p(command, SMBHSTCMD(priv));
> -		read_write = I2C_SMBUS_READ;
>  		break;
>  	case I2C_SMBUS_BLOCK_DATA:
>  		i801_set_hstadd(priv, addr, read_write);
> @@ -922,7 +919,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  	if (block)
>  		ret = i801_block_transaction(priv, data, read_write, size);
>  	else
> -		ret = i801_simple_transaction(priv, data, read_write, size);
> +		ret = i801_simple_transaction(priv, data, addr, command, read_write, size);
>  
>  	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
>  	 * time, so we forcibly disable it after every transaction.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
