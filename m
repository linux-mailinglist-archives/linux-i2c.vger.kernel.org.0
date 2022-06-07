Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC44253FEDC
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jun 2022 14:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243780AbiFGMev (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jun 2022 08:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243779AbiFGMev (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jun 2022 08:34:51 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90998B0A4F
        for <linux-i2c@vger.kernel.org>; Tue,  7 Jun 2022 05:34:49 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 3151B21BCA;
        Tue,  7 Jun 2022 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1654605288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0f6JnjTlePvTQac+2xQGciz//fjNBEftVE/KLpcCp90=;
        b=cT2VZMYNnqQD7q7pt61ip24FYlJbkQdE+U5SUT4b+k0WolDPAgWVFw/Hqsbkg+GfxMpu5g
        V6Ek/tvH6igEXd5RptzmG25SjOT3qeTf3r4lTrO9h4hrKSlPZLa/82z7jNX2+G/zlSmMKV
        07yccdROtQX2rrmRdfMQuBIlRTrlKVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1654605288;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0f6JnjTlePvTQac+2xQGciz//fjNBEftVE/KLpcCp90=;
        b=19xzphpaavLnMJCa8yUcckJ538d4/dGFC84ZGx6qUxJUZvP1GyVgrt2eTyeNND/Nu+ApMK
        tLFd6v0x9jbI4PCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11D6B13A88;
        Tue,  7 Jun 2022 12:34:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 5ujEAuhFn2KfDQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 07 Jun 2022 12:34:48 +0000
Date:   Tue, 7 Jun 2022 14:34:47 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/8] i2c: i801: improve interrupt handler
Message-ID: <20220607143447.58058154@endymion.delvare>
In-Reply-To: <05bec021-6958-0157-b825-619ac21ddd41@gmail.com>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
        <05bec021-6958-0157-b825-619ac21ddd41@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner, 

On Fri, 15 Apr 2022 18:54:32 +0200, Heiner Kallweit wrote:
> Not sure if it can happen, but better play safe: If SMBHSTSTS_BYTE_DONE
> and an error flag is set, then don't trust the result and skip calling
> i801_isr_byte_done(). In addition clear status bit SMBHSTSTS_BYTE_DONE
> in the main interrupt handler, this allows to simplify the code a
> little.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ff706349b..c481f121d 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -556,9 +556,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
>  		/* Write next byte, except for IRQ after last byte */
>  		outb_p(priv->data[++priv->count], SMBBLKDAT(priv));
>  	}
> -
> -	/* Clear BYTE_DONE to continue with next byte */
> -	outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
>  }
>  
>  static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
> @@ -588,7 +585,6 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
>   *      BUS_ERR - SMI# transaction collision
>   *      FAILED - transaction was canceled due to a KILL request
>   *    When any of these occur, update ->status and signal completion.
> - *    ->status must be cleared before kicking off the next transaction.
>   *
>   * 2) For byte-by-byte (I2C read/write) transactions, one BYTE_DONE interrupt
>   *    occurs for each byte of a byte-by-byte to prepare the next byte.
> @@ -613,23 +609,18 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
>  	}
>  
>  	status = inb_p(SMBHSTSTS(priv));
> -	if (status & SMBHSTSTS_BYTE_DONE)
> +	if ((status & SMBHSTSTS_BYTE_DONE) && !(status & STATUS_ERROR_FLAGS))

Isn't this better written

	if ((status & (SMBHSTSTS_BYTE_DONE | STATUS_ERROR_FLAGS)) == SMBHSTSTS_BYTE_DONE)

? At least my compiler generates smaller binary code.

>  		i801_isr_byte_done(priv);
>  
>  	/*
> -	 * Clear remaining IRQ sources: Completion of last command, errors
> -	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
> -	 * assertion independently of the interrupt generation being blocked
> -	 * or not so clear it always when the status is set.
> -	 */
> -	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS | SMBHSTSTS_SMBALERT_STS;
> -	if (status)
> -		outb_p(status, SMBHSTSTS(priv));
> -	status &= ~SMBHSTSTS_SMBALERT_STS; /* SMB_ALERT not reported */
> -	/*
> -	 * Report transaction result.
> -	 * ->status must be cleared before the next transaction is started.
> +	 * Clear IRQ sources: SMB_ALERT status is set after signal assertion
> +	 * independently of the interrupt generation being blocked or not
> +	 * so clear it always when the status is set.
>  	 */
> +	status &= STATUS_FLAGS | SMBHSTSTS_SMBALERT_STS;
> +	outb_p(status, SMBHSTSTS(priv));

You are making the call to outb_p() unconditional. Is this under the
assumption that at least one of the bits must be set, so the condition
was always met?

> +
> +	status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
>  	if (status) {
>  		priv->status = status;
>  		complete(&priv->done);

Tested OK on my system, looks good overall, nice simplification.

-- 
Jean Delvare
SUSE L3 Support
