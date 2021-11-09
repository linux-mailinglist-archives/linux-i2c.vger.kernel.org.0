Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FDD44B011
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 16:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbhKIPMT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 10:12:19 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:37242 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbhKIPMS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 10:12:18 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 16D181FDBC;
        Tue,  9 Nov 2021 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636470572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vYWuBZYd+BqqJRUPc9GT1/D4dCq/bJSaNpxXmhervuk=;
        b=IDOpQaH6y4cjp6NhGCSFeFU+RTlm8py3gO0uH9NNI7s/dY6rwPSSLqKirep4M5BEJO4TRu
        Bnft2oxw7UiPG8AMTOf7631WrEkbNZkbC2VUm0L1eKsM9Oq4RFp4ObZPJKz+lpU/u4Hrcd
        lmCuyccbdxlhE8zoEi9BDKs/iZjxO0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636470572;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vYWuBZYd+BqqJRUPc9GT1/D4dCq/bJSaNpxXmhervuk=;
        b=h4LAIj+45jEeTOii0BbbFJm+v2j1xG/5wm9ls0C69pDCCbhTU5LdGAGOd53mVaCQ30zMU0
        8snzOFNNKzd7a0AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E422A13A6A;
        Tue,  9 Nov 2021 15:09:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id eKEONSuPimGdDAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 09 Nov 2021 15:09:31 +0000
Date:   Tue, 9 Nov 2021 16:09:30 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: i2c: i801: Don't silently correct invalid transfer size
Message-ID: <20211109160930.6f052ff2@endymion>
In-Reply-To: <a5e9b8b5-82af-96a1-b983-d98c2fa140f9@gmail.com>
References: <a5e9b8b5-82af-96a1-b983-d98c2fa140f9@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sun, 07 Nov 2021 22:57:00 +0100, Heiner Kallweit wrote:
> If an invalid block size is provided, reject it instead of silently
> changing it to a supported value. Especially critical I see the case of
> a write transfer with block length 0. In this case we have no guarantee
> that the byte we would write is valid. When silently reducing a read to
> 32 bytes then we don't return an error and the caller may falsely
> assume that we returned the full requested data.
> 
> If this change should break any (broken) caller, then I think we should
> fix the caller.

Fully agreed.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 2c48691d2..638198b4b 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -761,6 +761,11 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
>  	int result = 0;
>  	unsigned char hostc;
>  
> +	if (read_write == I2C_SMBUS_READ && command == I2C_SMBUS_BLOCK_DATA)
> +		data->block[0] = I2C_SMBUS_BLOCK_MAX;
> +	else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
> +		return -EPROTO;
> +
>  	if (command == I2C_SMBUS_I2C_BLOCK_DATA) {
>  		if (read_write == I2C_SMBUS_WRITE) {
>  			/* set I2C_EN bit in configuration register */
> @@ -774,16 +779,6 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
>  		}
>  	}
>  
> -	if (read_write == I2C_SMBUS_WRITE
> -	 || command == I2C_SMBUS_I2C_BLOCK_DATA) {
> -		if (data->block[0] < 1)
> -			data->block[0] = 1;
> -		if (data->block[0] > I2C_SMBUS_BLOCK_MAX)
> -			data->block[0] = I2C_SMBUS_BLOCK_MAX;
> -	} else {
> -		data->block[0] = 32;	/* max for SMBus block reads */
> -	}
> -
>  	/* Experience has shown that the block buffer can only be used for
>  	   SMBus (not I2C) block transactions, even though the datasheet
>  	   doesn't mention this limitation. */

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
