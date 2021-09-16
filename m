Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64CB40D44C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Sep 2021 10:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234835AbhIPILP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Sep 2021 04:11:15 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:36548 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhIPILO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Sep 2021 04:11:14 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 137F722335;
        Thu, 16 Sep 2021 08:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1631779793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G5PWB8fyjc/ZvOhLzUPjFuQtwty9WDLDIN4Ledq7nK0=;
        b=W2vAAOiyQLiINpbEM/tiFNpBXMsO2FVcNezxbFTcquMIdWpa267dS6oIe3jeWMrcVJnMPJ
        nIOWsextRvntdqZvV9zAEQu7nQmP7lB+pwjfxaG5LD7ZDOkRPsMljfztQ/Y0Zi88BSB5Y2
        MWj8yri6j++AocLWJ02iwwEwKnIYlO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1631779793;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G5PWB8fyjc/ZvOhLzUPjFuQtwty9WDLDIN4Ledq7nK0=;
        b=Az46pu0cvU9FbdPIsquIPhwmed5EUrXpOtdtsDoCkWgnVnGqU01j9SBnosf0b7s/lAcnok
        28GkvW8tArGiPgBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C866213A23;
        Thu, 16 Sep 2021 08:09:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id NX5kLtD7QmEbKgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 16 Sep 2021 08:09:52 +0000
Date:   Thu, 16 Sep 2021 10:09:44 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-acpi@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH RESEND] i2c: i801: Stop using
 pm_runtime_set_autosuspend_delay(-1)
Message-ID: <20210916100944.2ab29898@endymion>
In-Reply-To: <515c9685-bad2-86e0-1be6-f9f63578b864@gmail.com>
References: <515c9685-bad2-86e0-1be6-f9f63578b864@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Tue, 07 Sep 2021 22:33:02 +0200, Heiner Kallweit wrote:
> The original change works as intended, but Andy pointed in [0] that now
> userspace could re-enable RPM via sysfs, even though we explicitly want
> to disable it. So effectively revert the original patch, just with small
> improvements:
> - Calls to pm_runtime_allow()/pm_runtime_forbid() don't have to be
>   balanced, so we can remove the call to pm_runtime_forbid() in
>   i801_remove().
> - priv->acpi_reserved is accessed after i801_acpi_remove(), and according
>   to Robert [1] the custom handler can't run any longer. Therefore we
>   don't have to take priv->acpi_lock.
> 
> [0] https://www.spinics.net/lists/linux-i2c/msg52730.html
> [1] https://lore.kernel.org/linux-acpi/BYAPR11MB32561D19A0FD9AB93E2B1E5287D39@BYAPR11MB3256.namprd11.prod.outlook.com/T/#t
> 
> Fixes: 4e60d5dd10cd ("i2c: i801: Improve disabling runtime pm")
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> - Resend because I missed to cc linux-i2c list
> ---
>  drivers/i2c/busses/i2c-i801.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 1f929e6c3..f3c79942c 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1623,7 +1623,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  		 * BIOS is accessing the host controller so prevent it from
>  		 * suspending automatically from now on.
>  		 */
> -		pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
> +		pm_runtime_get_sync(&pdev->dev);
>  	}
>  
>  	if ((function & ACPI_IO_MASK) == ACPI_READ)
> @@ -1890,9 +1890,6 @@ static void i801_remove(struct pci_dev *dev)
>  {
>  	struct i801_priv *priv = pci_get_drvdata(dev);
>  
> -	pm_runtime_forbid(&dev->dev);
> -	pm_runtime_get_noresume(&dev->dev);
> -
>  	i801_disable_host_notify(priv);
>  	i801_del_mux(priv);
>  	i2c_del_adapter(&priv->adapter);
> @@ -1901,6 +1898,10 @@ static void i801_remove(struct pci_dev *dev)
>  
>  	platform_device_unregister(priv->tco_pdev);
>  
> +	/* if acpi_reserved is set then usage_count is incremented already */
> +	if (!priv->acpi_reserved)
> +		pm_runtime_get_noresume(&dev->dev);
> +
>  	/*
>  	 * do not call pci_disable_device(dev) since it can cause hard hangs on
>  	 * some systems during power-off (eg. Fujitsu-Siemens Lifebook E8010)

Thanks for following up. I'm not familiar with power management so I'll
trust you, Andy and Robert on that.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
