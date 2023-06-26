Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED67473E718
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 19:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjFZR76 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 13:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbjFZR7z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 13:59:55 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD71183
        for <linux-i2c@vger.kernel.org>; Mon, 26 Jun 2023 10:59:54 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 1574F1F8AC;
        Mon, 26 Jun 2023 17:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1687802393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R7jXnQJJLbMOsuBV4nfWimuSYR7MWc+iGxoZPRd7UZk=;
        b=QiRF3UF5RBX6NUf9IoVnhOzCAkD3SL1BcXR1jQvFDvsf88rJ2peZr4qSwYvoNeoB9212zp
        xCXUBYFTn/z+kgXqaURt+kv71ULbRz2QYzU4sdmVJsY/fVARQDZGSJ5nG1K915dGpNCCRE
        GLHxTkHW3SEliVL+DYkhWLs4juba6/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1687802393;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R7jXnQJJLbMOsuBV4nfWimuSYR7MWc+iGxoZPRd7UZk=;
        b=NPwzdI/jYlEXhwGzJ1OQd3+1oi0FjoRObXTn7HpDSmfwMrSitBPyLhzfsaNixNxv5emr0M
        ZKSMOx2kNyvy2QDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9B8A13483;
        Mon, 26 Jun 2023 17:59:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Muz1NhjSmWRzaAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 26 Jun 2023 17:59:52 +0000
Date:   Mon, 26 Jun 2023 19:59:51 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/4] i2c: i801: Replace acpi_lock with I2C bus lock
Message-ID: <20230626195951.1695cda6@endymion.delvare>
In-Reply-To: <8f88906f-c7da-eb3a-2f14-0f4d46202517@gmail.com>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
        <8f88906f-c7da-eb3a-2f14-0f4d46202517@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
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

On Sat, 04 Mar 2023 22:33:05 +0100, Heiner Kallweit wrote:
> I2C core ensures in i2c_smbus_xfer() that the I2C bus lock is held when
> calling the smbus_xfer callback. That's i801_access() in our case.
> I think it's safe in general to assume that the I2C bus lock is held
> when the smbus_xfer callback is called.
> Therefore I see no need to define an own mutex.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index d6a0c3b53..7641bd0ac 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -289,10 +289,9 @@ struct i801_priv {
>  
>  	/*
>  	 * If set to true the host controller registers are reserved for
> -	 * ACPI AML use. Protected by acpi_lock.
> +	 * ACPI AML use.
>  	 */
>  	bool acpi_reserved;
> -	struct mutex acpi_lock;
>  };
>  
>  #define FEATURE_SMBUS_PEC	BIT(0)
> @@ -871,11 +870,8 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  	int hwpec, ret;
>  	struct i801_priv *priv = i2c_get_adapdata(adap);
>  
> -	mutex_lock(&priv->acpi_lock);
> -	if (priv->acpi_reserved) {
> -		mutex_unlock(&priv->acpi_lock);
> +	if (priv->acpi_reserved)
>  		return -EBUSY;
> -	}
>  
>  	pm_runtime_get_sync(&priv->pci_dev->dev);
>  
> @@ -916,7 +912,6 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  
>  	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
>  	pm_runtime_put_autosuspend(&priv->pci_dev->dev);
> -	mutex_unlock(&priv->acpi_lock);
>  	return ret;
>  }
>  
> @@ -1566,7 +1561,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  	 * further access from the driver itself. This device is now owned
>  	 * by the system firmware.
>  	 */
> -	mutex_lock(&priv->acpi_lock);
> +	i2c_lock_bus(&priv->adapter, I2C_LOCK_SEGMENT);
>  
>  	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
>  		priv->acpi_reserved = true;
> @@ -1586,7 +1581,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  	else
>  		status = acpi_os_write_port(address, (u32)*value, bits);
>  
> -	mutex_unlock(&priv->acpi_lock);
> +	i2c_unlock_bus(&priv->adapter, I2C_LOCK_SEGMENT);
>  
>  	return status;
>  }
> @@ -1640,7 +1635,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	priv->adapter.dev.parent = &dev->dev;
>  	ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev));
>  	priv->adapter.retries = 3;
> -	mutex_init(&priv->acpi_lock);
>  
>  	priv->pci_dev = dev;
>  	priv->features = id->driver_data;

Looks reasonable, I also can't see any reason why that wouldn't work.
But locking and power management can be tricky of course. I'll test
this for some time, but I don't think my system actually suffers from
this ACPI resource conflict, so this most probably won't be testing
much in practice.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
