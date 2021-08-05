Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8713E1077
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 10:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbhHEIjf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 04:39:35 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:46290 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbhHEIje (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 04:39:34 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D04D01FE36;
        Thu,  5 Aug 2021 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628152759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ecG1GgfkPMj3bF2HdF5gVLTvEGDqgGiAeFGjEqEAKeg=;
        b=Zije4YBOr6xmgz8LX6+6WCKAgNuqlCFQR5rbj837Zh/cyeMDDZ3P+XhHt1dgjf2o+wWqPj
        KP69MeAIdQfEKv7keGzyt34keLd1JUg4FmWcK7x2xF81PL9ribx3eFTCCqPBGDnPimTmTu
        OH9EULIE++e0M7SEDhBhyQcnVMX9zZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628152759;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ecG1GgfkPMj3bF2HdF5gVLTvEGDqgGiAeFGjEqEAKeg=;
        b=mKhRsoDuFmLGYvPIaD9ETjg3T+NCUHtL0F9TXN8Z2FMgzg1x/l5h8qUHQT9KpMIyTx+7VI
        A4/t+xir3EGC88DQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9E7D213785;
        Thu,  5 Aug 2021 08:39:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id Z//aI7ejC2EFUQAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 05 Aug 2021 08:39:19 +0000
Date:   Thu, 5 Aug 2021 10:39:18 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 02/10] i2c: i801: Improve disabling runtime pm
Message-ID: <20210805103918.7122774b@endymion>
In-Reply-To: <4390254d-fe68-2c7f-c67b-a894cdddd7ae@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <4390254d-fe68-2c7f-c67b-a894cdddd7ae@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 01 Aug 2021 16:17:48 +0200, Heiner Kallweit wrote:
> Setting the autosuspend delay to a negative value disables runtime pm in
> a little bit smarter way, because we need no cleanup when removing the
> driver. Note that this is safe when reloading the driver, because the
> call to pm_runtime_set_autosuspend_delay() in probe() will reverse the
> effect. See update_autosuspend() for details.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 362e74761..bdb619bc0 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1628,7 +1628,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  		 * BIOS is accessing the host controller so prevent it from
>  		 * suspending automatically from now on.
>  		 */
> -		pm_runtime_get_sync(&pdev->dev);
> +		pm_runtime_set_autosuspend_delay(&pdev->dev, -1);

Surprisingly, very few drivers use this. But this indeed looks correct.

>  	}
>  
>  	if ((function & ACPI_IO_MASK) == ACPI_READ)
> @@ -1668,11 +1668,6 @@ static void i801_acpi_remove(struct i801_priv *priv)
>  
>  	acpi_remove_address_space_handler(adev->handle,
>  		ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler);
> -
> -	mutex_lock(&priv->acpi_lock);
> -	if (priv->acpi_reserved)
> -		pm_runtime_put(&priv->pci_dev->dev);
> -	mutex_unlock(&priv->acpi_lock);
>  }
>  #else
>  static inline int i801_acpi_probe(struct i801_priv *priv) { return 0; }

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
