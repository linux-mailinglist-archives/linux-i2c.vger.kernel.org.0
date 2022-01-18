Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651574925F9
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 13:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238498AbiARMrI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 07:47:08 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:57004 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238770AbiARMrI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 07:47:08 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3E5171F3B5;
        Tue, 18 Jan 2022 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1642510027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nwm/d+PC60BwEQTUx8lZFZZBsDOffN2d9AZQb+jJnrg=;
        b=T3VNPuUTeIsk4iXCcsS8XmnhKXdkSVeSKrxn1vGb0iHx7fmvaV9Gia/KlPBv3SVSFzbR8S
        JVWhEvqILElPE2sFBK32JbGacpASYq/k6+TLbNiQQW17JCLlLc6UQmfcqH2LVJ5UGir5CT
        qiPAwGE0C5KSQeEzBvqtlFFhyWPkjjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1642510027;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nwm/d+PC60BwEQTUx8lZFZZBsDOffN2d9AZQb+jJnrg=;
        b=MBRVyuuhRfSCAl3qLYo2yOXGv68hPoPc6+w4/bqit8LW9UWUPowSRFmzFFoVLvd18f7VZI
        K9OCUjlJexrX1rDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D704613A42;
        Tue, 18 Jan 2022 12:47:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ++HlMcq25mFnfAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 18 Jan 2022 12:47:06 +0000
Date:   Tue, 18 Jan 2022 13:47:05 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Alex Henrie <alexh@vpitech.com>
Cc:     linux-i2c@vger.kernel.org, marcan@marcan.st, wsa@kernel.org,
        alexhenrie24@gmail.com
Subject: Re: [PATCH] i2c: i801: Add module parameter to inhibit BIOS access
Message-ID: <20220118134705.6ae5b0a4@endymion>
In-Reply-To: <20220111233151.8484-1-alexh@vpitech.com>
References: <20220111233151.8484-1-alexh@vpitech.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alex,

On Tue, 11 Jan 2022 16:31:51 -0700, Alex Henrie wrote:
> This parameter can only be set before the module is loaded (e.g. by
> passing i2c_i801.block_acpi=1 on the kernel command line).

Before I consider applying this, you'll have to provide a rationale of
why this is needed. Preventing the BIOS from accessing the SMBus is
pretty dangerous, and I can't really think of a situation where you
would want to do that.

Plus, if there's really a reason for doing that, I'd rather have it
implemented as an option in the BIOS itself, than in the kernel driver.

Furthermore, please run ./scripts/checkpatch.pl on your patches and fix
every reported issue before you post them.

> Signed-off-by: Alex Henrie <alexh@vpitech.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 63 +++++++++++++++++++++++++++--------
>  1 file changed, 49 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 41446f9cc52d..615fd1185b61 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -288,6 +288,11 @@ struct i801_priv {
>  	 * ACPI AML use. Protected by acpi_lock.
>  	 */
>  	bool acpi_reserved;
> +	/*
> +	 * If set to true ACPI AML tried to use SMBus but block_acpi was
> +	 * set. Protected by acpi_lock.
> +	 */
> +	bool acpi_blocked;
>  	struct mutex acpi_lock;
>  };
>  
> @@ -320,6 +325,11 @@ MODULE_PARM_DESC(disable_features, "Disable selected driver features:\n"
>  	"\t\t  0x10  don't use interrupts\n"
>  	"\t\t  0x20  disable SMBus Host Notify ");
>  
> +static bool block_acpi;
> +module_param(block_acpi, bool, S_IRUGO);
> +MODULE_PARM_DESC(block_acpi, "Prevent ACPI AML from accessing SMBus. "
> +	"[0] = allow ACPI access, 1 = deny ACPI access");

I've not seen the square brackets convention for marking the default
value used anywhere else in the kernel. For consistency, please instead
add "(default)" after the default setting.

> +
>  /* Make sure the SMBus host is ready to start transmitting.
>     Return 0 if it is, -EBUSY if it is not. */
>  static int i801_check_pre(struct i801_priv *priv)
> @@ -1616,23 +1626,48 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  	acpi_status status;
>  
>  	/*
> -	 * Once BIOS AML code touches the OpRegion we warn and inhibit any
> -	 * further access from the driver itself. This device is now owned
> -	 * by the system firmware.
> +	 * If BIOS AML code tries to touches the OpRegion we have two options:

Spelling: touches -> touch

> +	 * Warn and inhibit any further access from the driver, or warn and
> +	 * inhibit all access from the BIOS.
>  	 */
>  	mutex_lock(&priv->acpi_lock);
>  
> -	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
> -		priv->acpi_reserved = true;
> -
> -		dev_warn(&pdev->dev, "BIOS is accessing SMBus registers\n");
> -		dev_warn(&pdev->dev, "Driver SMBus register access inhibited\n");
> -
> -		/*
> -		 * BIOS is accessing the host controller so prevent it from
> -		 * suspending automatically from now on.
> -		 */
> -		pm_runtime_get_sync(&pdev->dev);
> +	if (i801_acpi_is_smbus_ioport(priv, address)) {
> +		if (block_acpi) {
> +			/*
> +			 * Refuse to allow the BIOS to use SMBus. SMBus does
> +			 * have a lock bit in the status register that in theory
> +			 * can be used to safely share the SMBus between the
> +			 * BIOS and the kernel, but some badly behaved BIOS
> +			 * implementations don't use it. In that case, the only

It's not really fair to blame the BIOS, considering that the driver
doesn't use it (yet) either. A patch was proposed months ago actually,
reviewing it is still on my to-do list. Could that be an alternative to
your patch?

> +			 * way to ensure continued safe access from the driver
> +			 * is to cripple the BIOS.
> +			 */
> +			if (!priv->acpi_blocked) {
> +				dev_warn(&pdev->dev,
> +					 "BIOS tried to access SMBus registers\n");
> +				dev_warn(&pdev->dev,
> +					 "BIOS SMBus register access inhibited\n");
> +				priv->acpi_blocked = true;
> +			}
> +			mutex_unlock(&priv->acpi_lock);
> +			return -EPERM;
> +		}
> +		if (!priv->acpi_reserved) {
> +			/* This device is now owned by the system firmware. */
> +			priv->acpi_reserved = true;
> +
> +			dev_warn(&pdev->dev,
> +				 "BIOS is accessing SMBus registers\n");
> +			dev_warn(&pdev->dev,
> +				 "Driver SMBus register access inhibited\n");
> +
> +			/*
> +			 * BIOS is accessing the host controller so prevent it
> +			 * from suspending automatically from now on.
> +			 */
> +			pm_runtime_get_sync(&pdev->dev);
> +		}
>  	}
>  
>  	if ((function & ACPI_IO_MASK) == ACPI_READ)


-- 
Jean Delvare
SUSE L3 Support
