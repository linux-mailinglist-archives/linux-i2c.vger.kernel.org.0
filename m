Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEDD973FD15
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jun 2023 15:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjF0NqL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jun 2023 09:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjF0NqK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jun 2023 09:46:10 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BE1211C
        for <linux-i2c@vger.kernel.org>; Tue, 27 Jun 2023 06:46:08 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 600AC1F459;
        Tue, 27 Jun 2023 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687873567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gss0CBDiiNwIGrOU+IfYfRHowhrGuLT3AEqEV6SL80k=;
        b=aPKuSUgys6ttXnz+EnTvEcJrHX80CA+BJCdg629WNmDI2C5UXfrz5TyKD2ynQVIW5sUXKE
        EHHbOSdsL7g7xPHo6j5OIbwdintnV17jYxScAadIYyoQ5Q6Ur/bQyETSqBw6XhoVuzJPSK
        YLwwCY2MmO43tFZY1b289KmJgSHiRfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687873567;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gss0CBDiiNwIGrOU+IfYfRHowhrGuLT3AEqEV6SL80k=;
        b=bnbY2cCMEWbTV68uJ4o2hwFaBy4AbwUe+2FWSxe/3QYqf1V8xQgRw04oihyJvnsAhXkK72
        PA0vQJgNnoQ4H8Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3984013276;
        Tue, 27 Jun 2023 13:46:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id EX9MDB/ommQ9dQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 27 Jun 2023 13:46:07 +0000
Date:   Tue, 27 Jun 2023 15:46:06 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/4] i2c: i801: Improve
 i801_block_transaction_byte_by_byte
Message-ID: <20230627154606.1488423f@endymion.delvare>
In-Reply-To: <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
        <6686b692-0caf-734e-18cd-7879810b29cd@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
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

Hi Heiner, Andi,

On Sat, 04 Mar 2023 22:36:34 +0100, Heiner Kallweit wrote:
> Here we don't have to write SMBHSTCNT in each iteration of the loop.
> Bit SMBHSTCNT_START is internally cleared immediately, therefore
> we don't have to touch the value of SMBHSTCNT until the last byte.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 7641bd0ac..e1350a8cc 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -677,11 +677,11 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>  	for (i = 1; i <= len; i++) {
>  		if (i == len && read_write == I2C_SMBUS_READ)
>  			smbcmd |= SMBHSTCNT_LAST_BYTE;
> -		outb_p(smbcmd, SMBHSTCNT(priv));
>  
>  		if (i == 1)
> -			outb_p(inb(SMBHSTCNT(priv)) | SMBHSTCNT_START,
> -			       SMBHSTCNT(priv));
> +			outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
> +		else if (smbcmd & SMBHSTCNT_LAST_BYTE)
> +			outb_p(smbcmd, SMBHSTCNT(priv));
>  
>  		status = i801_wait_byte_done(priv);
>  		if (status)

I tested this and it works, but I don't understand how.

I thought that writing to SMBHSTCNT was what was telling the host
controller to proceed with the next byte. If writing to SMBHSTCNT for
each byte isn't needed, then what causes the next byte to be processed?
Does this happen as soon as SMBHSTSTS_BYTE_DONE is written? If so, then
what guarantees that we set SMBHSTCNT_LAST_BYTE *before* the last byte
is actually processed?

-- 
Jean Delvare
SUSE L3 Support
