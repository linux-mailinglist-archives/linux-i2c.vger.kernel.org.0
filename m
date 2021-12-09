Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6E346E8D4
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 14:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237605AbhLINNj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 08:13:39 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:35412 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbhLINNj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 08:13:39 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0F784210FE;
        Thu,  9 Dec 2021 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639055405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MIat0hguBMM5JaJfYwk4CWG78Dw2Mf1UxsEG6ZEyIOA=;
        b=Rk8/GtHV5EMVlsRxXZB91+ctDJI7Dl0+SCu+n1zT4FojwG7HmMwWBgFyiFLNcLujkAnK83
        kzY1JIKt25LK0WGXzO7lOXk3nRJAlPlGX5vKLzTQiKwGy+Vp1i1B86hgFY7fjhJvZphZKm
        ncApSEl8lfoJTQ43FpttMq9URru7Gcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639055405;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MIat0hguBMM5JaJfYwk4CWG78Dw2Mf1UxsEG6ZEyIOA=;
        b=fA7Wi1c3JmBlHDNNwmlIdVpQf0mnmXbL02No4mTtDl1jxFopTa9lY8yFYsykUyhndVoYMe
        UKqTaAiTaavcoXAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB39B13343;
        Thu,  9 Dec 2021 13:10:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id zAwgMywAsmEHeQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 09 Dec 2021 13:10:04 +0000
Date:   Thu, 9 Dec 2021 14:10:03 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3] i2c: i801: Don't clear status flags twice in
 interrupt mode
Message-ID: <20211209141003.7b406f2f@endymion>
In-Reply-To: <bd0def53-4e63-61eb-c0bb-9975a308cb1a@gmail.com>
References: <bd0def53-4e63-61eb-c0bb-9975a308cb1a@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 04 Dec 2021 21:04:40 +0100, Heiner Kallweit wrote:
> In interrupt mode we clear the status flags twice, in the interrupt
> handler and in i801_check_post(). Remove clearing the status flags
> from i801_check_post() and handle polling mode by using the
> SMBus unlocking write to also clear the status flags if still set.
> To be precise: One could still argue that the status flags are
> cleared twice in interrupt mode, but it comes for free.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - clear status flags also in i801_wait_byte_done()
> - remove outdated comment at i801_check_post()
> v3:
> - merge unlocking SMBus and clearing status flags
> - avoid the complexity added with v2
> ---
>  drivers/i2c/busses/i2c-i801.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 930c6edbe..128a25de7 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -372,11 +372,6 @@ static int i801_check_pre(struct i801_priv *priv)
>  	return 0;
>  }
>  
> -/*
> - * Convert the status register to an error code, and clear it.
> - * Note that status only contains the bits we want to clear, not the
> - * actual register value.
> - */
>  static int i801_check_post(struct i801_priv *priv, int status)
>  {
>  	int result = 0;
> @@ -401,7 +396,6 @@ static int i801_check_post(struct i801_priv *priv, int status)
>  		    !(status & SMBHSTSTS_FAILED))
>  			dev_err(&priv->pci_dev->dev,
>  				"Failed terminating the transaction\n");
> -		outb_p(STATUS_FLAGS, SMBHSTSTS(priv));
>  		return -ETIMEDOUT;
>  	}
>  
> @@ -440,9 +434,6 @@ static int i801_check_post(struct i801_priv *priv, int status)
>  		dev_dbg(&priv->pci_dev->dev, "Lost arbitration\n");
>  	}
>  
> -	/* Clear status flags except BYTE_DONE, to be cleared by caller */
> -	outb_p(status, SMBHSTSTS(priv));
> -
>  	return result;
>  }
>  
> @@ -939,8 +930,11 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  	}
>  
>  out:
> -	/* Unlock the SMBus device for use by BIOS/ACPI */
> -	outb_p(SMBHSTSTS_INUSE_STS, SMBHSTSTS(priv));
> +	/*
> +	 * Unlock the SMBus device for use by BIOS/ACPI,
> +	 * and clear status flags if not done already.
> +	 */
> +	outb_p(SMBHSTSTS_INUSE_STS | STATUS_FLAGS, SMBHSTSTS(priv));
>  
>  	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
>  	pm_runtime_put_autosuspend(&priv->pci_dev->dev);

Looks good to me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>


-- 
Jean Delvare
SUSE L3 Support
