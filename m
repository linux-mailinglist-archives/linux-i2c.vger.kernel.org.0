Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DEE43CCCC
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Oct 2021 16:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237584AbhJ0Oz5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Oct 2021 10:55:57 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:59368 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237296AbhJ0Oz5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Oct 2021 10:55:57 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id F08EF1FD47;
        Wed, 27 Oct 2021 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635346410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vkE8iBVkc8th3Pv8Y209ELrMbiqvDor6pXRAhEH6nlU=;
        b=tmZRkgCoLbhdJZUm49ja73tpCkfEViOMnm0nV0+TlwBgbSkQiIEp9BvF3mN2w0AvVuw+t2
        liYDv+d607F5CuJvpkQy/JGer1+RGWTLtPt9MMNa4zT6VBmlJavJf/vVpDHTm7nbt3SKbu
        aWZ7fogP+2SqZrkF4m2wyf4oGlWhJ6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635346410;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vkE8iBVkc8th3Pv8Y209ELrMbiqvDor6pXRAhEH6nlU=;
        b=7F3C/na/j5MRk5h+O/FoPLGHqtVHy+5EIAko+GaF1TOOltZN3eXuLmfzRjuABkATt7680R
        mgxmIVQVVghJbjCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACA8113D55;
        Wed, 27 Oct 2021 14:53:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id q6ScJ+pneWHQVQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 27 Oct 2021 14:53:30 +0000
Date:   Wed, 27 Oct 2021 16:53:29 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] i2c: i801: Fix incorrect and needless software PEC
 disabling
Message-ID: <20211027165329.475918a2@endymion>
In-Reply-To: <20211026143916.1272115-1-jarkko.nikula@linux.intel.com>
References: <20211026143916.1272115-1-jarkko.nikula@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 26 Oct 2021 17:39:16 +0300, Jarkko Nikula wrote:
> Commit a6b8bb6a813a ("i2c: i801: Fix handling SMBHSTCNT_PEC_EN")
> attempts to disable software PEC by clearing the SMBHSTCNT_PEC_EN (bit 7)
> in the SMBus Host Control register (I/O SMBHSTCNT) but incorrectly
> clears it in the PCI Host Configuration register (PCI SMBHSTCFG).
> 
> This clearing is actually needless since after above commit the
> SMBHSTCNT_PEC_EN is never set and the register is initialized with known
> values.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Oops, sorry for missing this and duplicating your work. I noticed the
bug while reviewing your other change and wrote a fix without realizing
you were already working on it.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

> ---
> I didn't add Fixes tag and Cc stable@vger.kernel.org since I don't see
> this causes any real issues. A few platforms I checked the PCI Host
> Configuration register bit 7 was reserved 0.

I checked the datasheets too and came to the same conclusion, but added
the Fixes tag still, because the new fix is definitely safe and we have
no idea if the broken fix was actually harmless as it must have seen
very little deployment at this point (kernel 5.15 isn't out yet).
Better safe than sorry.

> ---
>  drivers/i2c/busses/i2c-i801.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 115660dce722..b6048a571543 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1657,7 +1657,6 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
>  	unsigned char hstcfg = priv->original_hstcfg;
>  
>  	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
> -	hstcfg &= ~SMBHSTCNT_PEC_EN;	/* Disable software PEC */
>  	hstcfg |= SMBHSTCFG_HST_EN;
>  	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
>  }


-- 
Jean Delvare
SUSE L3 Support
