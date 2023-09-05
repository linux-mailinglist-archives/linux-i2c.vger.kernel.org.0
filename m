Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64C3C792832
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbjIEQTi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353789AbjIEIMu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 04:12:50 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EBA1AD
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 01:12:47 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id BC49E21847;
        Tue,  5 Sep 2023 08:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693901565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KI7CV59kLqZzSK9aW7F5+OliYvMxy+vHW0WU7SP1qO8=;
        b=mhowKY+rjfj9hDr64eBoYOC/pEYzUZYDAaJCvNp5sTDlha6uuBEL4Gt9xnktGcl5o+2LnF
        OOyNuekidt0z+/mLdNx4Ry/ciFL4JFfiBXFMp43BeQTJ46kf0VN0pqhG8jWuCkw1sn9AZv
        x3XQ4grFxC3Md9ieJHhtoYEij+rxuG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693901565;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KI7CV59kLqZzSK9aW7F5+OliYvMxy+vHW0WU7SP1qO8=;
        b=1C8rix/0V+bDq+oPCtOY5t8nJdqidMA9A9cHJWyKucS1QEBaDDJHL8CJjbIQ0YQ29cH7bl
        eKnaFa3exAcWuSAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F93513911;
        Tue,  5 Sep 2023 08:12:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 5LASIf3i9mSEBgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 05 Sep 2023 08:12:45 +0000
Date:   Tue, 5 Sep 2023 10:12:43 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i801: fix potential race in
 i801_block_transaction_byte_by_byte
Message-ID: <20230905101243.39920fe5@endymion.delvare>
In-Reply-To: <f056286a-1db9-b88c-6d36-a3358190b9c9@gmail.com>
References: <f056286a-1db9-b88c-6d36-a3358190b9c9@gmail.com>
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

On Sat, 02 Sep 2023 22:10:52 +0200, Heiner Kallweit wrote:
> Currently we set SMBHSTCNT_LAST_BYTE only after the host has started
> receiving the last byte. If we get e.g. preempted before setting
> SMBHSTCNT_LAST_BYTE, the host may be finished with receiving the byte
> before SMBHSTCNT_LAST_BYTE is set.
> Therefore change the code to set SMBHSTCNT_LAST_BYTE before writing
> SMBHSTSTS_BYTE_DONE for the byte before the last byte. Now the code
> is also consistent with what we do in i801_isr_byte_done().
> 
> Reported-by: Jean Delvare <jdelvare@suse.com>

Note for Wolfram: checkpatch says we should insert here:

Closes: https://lore.kernel.org/linux-i2c/20230828152747.09444625@endymion.delvare/

> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - remove incorrect Fixes tag
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


-- 
Jean Delvare
SUSE L3 Support
