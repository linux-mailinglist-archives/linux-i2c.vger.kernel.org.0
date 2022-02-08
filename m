Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20344ADCA8
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 16:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354735AbiBHP3t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 10:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235109AbiBHP3s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 10:29:48 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EC9C061576;
        Tue,  8 Feb 2022 07:29:47 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 55FFC1F383;
        Tue,  8 Feb 2022 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644334186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RefxbU951jlfBz7uIMcFk+7I0WDLMgFTTEu0GfJJxIc=;
        b=EJjHrjSGzZxeKgTcgWAfXnys77d5lTsvC4y9X6h5H+hj10/m5CR2HmfqbGvQlVOpJ4eidA
        5BYmNCjNMNz3LsOl0UU9BMYVwz8PdMKrxEwUvCpyQM86GbfWkZ+vIQm82WZe6yArPgVMUc
        qA/1wjSie8CB5RJzbQSH9/M/J5WVEc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644334186;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RefxbU951jlfBz7uIMcFk+7I0WDLMgFTTEu0GfJJxIc=;
        b=UPVg8xY0uNxI/UbSRDsH4x52GSrGeUgd/FVnlZawSTwSmtwLJJv5NRWmrXE/JuwERkDVd8
        SLqjwEwtO8rblMDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CDC2013C99;
        Tue,  8 Feb 2022 15:29:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Rp2wMGmMAmIxJwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 08 Feb 2022 15:29:45 +0000
Date:   Tue, 8 Feb 2022 16:29:44 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <sudheesh.mavila@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Basavaraj.Natikar@amd.com>, <Shyam-sundar.S-k@amd.com>,
        <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v4 5/9] i2c: piix4: Move SMBus port selection into
 function
Message-ID: <20220208162944.3207577c@endymion.delvare>
In-Reply-To: <20220130184130.176646-6-terry.bowman@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
        <20220130184130.176646-6-terry.bowman@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 30 Jan 2022 12:41:26 -0600, Terry Bowman wrote:
> Move port selection code into a separate function. Refactor is in
> preparation for following MMIO changes.
> 
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> ---
>  drivers/i2c/busses/i2c-piix4.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index eab06e9e5fdf..32a30af5778a 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -699,6 +699,19 @@ static void piix4_imc_wakeup(void)
>  	release_region(KERNCZ_IMC_IDX, 2);
>  }
>  
> +static int piix4_sb800_port_sel(u8 port)
> +{
> +	u8 smba_en_lo, val;
> +
> +	outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
> +	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
> +
> +	val = (smba_en_lo & ~piix4_port_mask_sb800) | port;
> +	if (smba_en_lo != val)
> +		outb_p(val, SB800_PIIX4_SMB_IDX + 1);
> +
> +	return (smba_en_lo & piix4_port_mask_sb800);
> +}
>  /*
>   * Handles access to multiple SMBus ports on the SB800.
>   * The port is selected by bits 2:1 of the smb_en register (0x2c).
> @@ -715,8 +728,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>  	unsigned short piix4_smba = adapdata->smba;
>  	int retries = MAX_TIMEOUT;
>  	int smbslvcnt;
> -	u8 smba_en_lo;
> -	u8 port;
> +	u8 prev_port;
>  	int retval;
>  
>  	retval = piix4_sb800_region_request(&adap->dev);
> @@ -776,18 +788,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>  		}
>  	}
>  
> -	outb_p(piix4_port_sel_sb800, SB800_PIIX4_SMB_IDX);
> -	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
> -
> -	port = adapdata->port;
> -	if ((smba_en_lo & piix4_port_mask_sb800) != port)
> -		outb_p((smba_en_lo & ~piix4_port_mask_sb800) | port,
> -		       SB800_PIIX4_SMB_IDX + 1);
> +	prev_port = piix4_sb800_port_sel(adapdata->port);
>  
>  	retval = piix4_access(adap, addr, flags, read_write,
>  			      command, size, data);
>  
> -	outb_p(smba_en_lo, SB800_PIIX4_SMB_IDX + 1);
> +	piix4_sb800_port_sel(prev_port);
>  
>  	/* Release the semaphore */
>  	outb_p(smbslvcnt | 0x20, SMBSLVCNT);

Hmm, this gets pretty inefficient. You set SB800_PIIX4_SMB_IDX to
piix4_port_sel_sb800 twice and compare the new port with the previous
port twice, even though the result will inevitably be the same. The
original code would just unconditionally restore the original port
value, which was also not always needed, but was cheaper in the end.

I can't really think of a better way though, so, so be it :-(

I wonder why we insist on restoring the port though. When you read
multiple values from the same bus (and I2C device drivers do that a
lot, obviously) you end up switching ports a lot for no good reason. I
looked at the git history and it has been that way since support for
the multiplexed buses was added back in 2015. There's a mutex
protecting that section of code anyway, so I don't think restoring the
port buys us anything we did not already have. The only benefit I can
see is to leave the port setting in its original state on suspend and
shutdown (and we know by experience that it can be important to the
BIOS) but then we should just do it in the suspend and remove
functions, instead of after every transfer.

-- 
Jean Delvare
SUSE L3 Support
