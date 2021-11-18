Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABD024565C8
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 23:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbhKRWkm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 17:40:42 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:42208 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbhKRWkl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 17:40:41 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5A9391FD39;
        Thu, 18 Nov 2021 22:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637275060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TyqWDF/UjpEj2nXVSWe7GdbzH2MOiMAsAZZ7nvmXC3Y=;
        b=bQnnSYEEiQvcuUXfy1XehEcYB6idhFC/k8i2qR4r1czdt41bLF0v+4NKsf5q7J8FOk7435
        zADeEGM82p9Hbm+SDR8wOPmolxVJ7rmf6t9RQntYgkiZGFTcWu1coTdMyGxsCXOseeeKca
        BrPSkkMxvLv/I1P/IoD7GX+LbnEEhko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637275060;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TyqWDF/UjpEj2nXVSWe7GdbzH2MOiMAsAZZ7nvmXC3Y=;
        b=oPwEDenImhEK0D6hZLv8hkZiSLHzXZDcbphRyalj8DL+VZyLe9LV8wkxad+kFBAr9vD/Ff
        CazgLuNHDaXqGtBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F84713524;
        Thu, 18 Nov 2021 22:37:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id LaDiBLTVlmHBNgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 18 Nov 2021 22:37:40 +0000
Date:   Thu, 18 Nov 2021 23:37:38 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Remove i801_set_block_buffer_mode
Message-ID: <20211118233738.6a01f1d9@endymion>
In-Reply-To: <57eaa7c7-61a8-a428-04ba-7d455aab49f0@gmail.com>
References: <ab295fad-3f5a-5cc9-14fe-5bfaea8099a9@gmail.com>
        <20211118112308.62e3c2b3@endymion>
        <57eaa7c7-61a8-a428-04ba-7d455aab49f0@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 18 Nov 2021 21:58:02 +0100, Heiner Kallweit wrote:
> On 18.11.2021 11:23, Jean Delvare wrote:
> > On Thu, 11 Nov 2021 22:43:35 +0100, Heiner Kallweit wrote:  
> >> If FEATURE_BLOCK_BUFFER is set I don't see how setting this bit could
> >> fail. Reading it back seems to be overly paranoid. Origin of this
> >> check seems to be 14 yrs ago when people were not completely sure
> >> which chip versions support block buffer mode.  
> > 
> > Your reading of the history is correct, although "overly paranoid"
> > might be a somewhat exaggerated statement. When you modify a driver
> > used by millions and have been bitten by undocumented restrictions in
> > the same area, being cautious not to cause a regression doesn't seem
> > that bad to me.  
> 
> Indeed my statement could be read as: The guys back then didn't know
> what they were doing. It definitely wasn't meant this way.

That would be me ;-) well not alone but I remember participating.

And no worry, I did not take it personally, I just wanted to give some
more background.

> > What was wrong in that approach, I would think retrospectively, is that
> > i801_set_block_buffer_mode() should have been made verbose on failure,
> > so that we learned over time if any chipset actually failed to support
> > the feature in question. Because 14 years later we in fact still don't
> > know if the test was needed or not.
>
> ICH4 spec mentions the block buffer mode and it's hard to imagine
> (even though not impossible) that single later versions dropped
> this feature.

The history of computer hardware is paved with examples of exactly this
or even more unexpected changes. I no longer take anything for granted.

Plus the ICH4 itself was probably the problem, I seem to recall none of
us had any sample to test the new code on it, and freshly added
features are sometimes subject to hardware errata.

But looking at it now, the most surprising really is that we thought
the extra, probably unneeded check would help. It might as well be that
the bit *would* be set properly but not do anything, or not what was
documented. So all in all I suppose we should have just let it fail if it
had too, and come up with a workaround later if actually needed. It was
deliciously naive from us to believe we could anticipate *how* the
hardware would fail if it did. Oh well :-)

> > I'm fine with your change nevertheless, it should be fine, and if
> > anything breaks then we'll fix it.
> > 
> > I'll test it on my system later today.

For the record, I did, and it worked :-)

> >> (...)
> >> @@ -786,9 +780,8 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
> >>  	/* Experience has shown that the block buffer can only be used for
> >>  	   SMBus (not I2C) block transactions, even though the datasheet
> >>  	   doesn't mention this limitation. */
> >> -	if ((priv->features & FEATURE_BLOCK_BUFFER)
> >> -	 && command != I2C_SMBUS_I2C_BLOCK_DATA
> >> -	 && i801_set_block_buffer_mode(priv) == 0)
> >> +	if (priv->features & FEATURE_BLOCK_BUFFER &&  
> > 
> > No, please preserve the parentheses. Mixing "&" and "&&" without
> > parentheses is highly confusing (to me at least, but I suspect I'm not
> > alone).
> >   
> Shall I send a v2 with an adjusted commit message and these
> parentheses re-added?
> 
> >> +	    command != I2C_SMBUS_I2C_BLOCK_DATA)
> >>  		result = i801_block_transaction_by_block(priv, data,
> >>  							 read_write,
> >>  							 command);  

Yes please!

-- 
Jean Delvare
SUSE L3 Support
