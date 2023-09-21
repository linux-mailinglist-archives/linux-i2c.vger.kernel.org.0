Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4C77A989D
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 19:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjIURum (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 13:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjIURuI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 13:50:08 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F6A5367E
        for <linux-i2c@vger.kernel.org>; Thu, 21 Sep 2023 10:16:55 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 123A3338A8;
        Thu, 21 Sep 2023 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695305553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i/+Xy0Z4c1I/QnQdR1kbavvxRcXeU3eI+I+BD174Wig=;
        b=gAYcc7elR66dNhTelBnHyndUGM5YZ6KHTBNn0X6bV6gjXGdxOuR5vhhnbEQAmx1ZLigAHc
        2HKg0JFZobp+fnL2a0+56HJTACddk3s6jPaLTQ0mbb/4cixyTS2Fs/I3cH1kBCg/VCsmk0
        /SkxQjW13bx4nbXwG4miQx0UkP9s32A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695305553;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i/+Xy0Z4c1I/QnQdR1kbavvxRcXeU3eI+I+BD174Wig=;
        b=Yn1CZUf7rw+g/aPNuN9nPVLXY7glkaCarZjPsBeje+bbdGu27jr0CtD96m8JnabkWFpQPk
        owb4Yj1zeO/ommDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5111139DB;
        Thu, 21 Sep 2023 14:12:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id svYuNlBPDGWKTwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 21 Sep 2023 14:12:32 +0000
Date:   Thu, 21 Sep 2023 16:12:31 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH RESUBMIT] i2c: i801: replace acpi_lock with I2C bus lock
Message-ID: <20230921161231.74244564@endymion.delvare>
In-Reply-To: <3ef0a090-13ef-4fa9-9b91-1b03abfd01f4@gmail.com>
References: <3ef0a090-13ef-4fa9-9b91-1b03abfd01f4@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 20 Sep 2023 09:33:01 +0200, Heiner Kallweit wrote:
> I2C core ensures in i2c_smbus_xfer() that the I2C bus lock is held when
> calling the smbus_xfer callback. That's i801_access() in our case.
> I think it's safe in general to assume that the I2C bus lock is held
> when the smbus_xfer callback is called.
> Therefore I see no need to define an own mutex.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> Patch was part of a broken-up previous series.
> ---
>  drivers/i2c/busses/i2c-i801.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 26f132277..a485dc84d 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -293,10 +293,9 @@ struct i801_priv {
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
> @@ -874,11 +873,8 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
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
> @@ -919,7 +915,6 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>  
>  	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
>  	pm_runtime_put_autosuspend(&priv->pci_dev->dev);
> -	mutex_unlock(&priv->acpi_lock);
>  	return ret;
>  }
>  
> @@ -1571,7 +1566,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  	 * further access from the driver itself. This device is now owned
>  	 * by the system firmware.
>  	 */
> -	mutex_lock(&priv->acpi_lock);
> +	i2c_lock_bus(&priv->adapter, I2C_LOCK_SEGMENT);
>  
>  	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
>  		priv->acpi_reserved = true;
> @@ -1591,7 +1586,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  	else
>  		status = acpi_os_write_port(address, (u32)*value, bits);
>  
> -	mutex_unlock(&priv->acpi_lock);
> +	i2c_unlock_bus(&priv->adapter, I2C_LOCK_SEGMENT);
>  
>  	return status;
>  }
> @@ -1651,7 +1646,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	priv->adapter.dev.parent = &dev->dev;
>  	ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev));
>  	priv->adapter.retries = 3;
> -	mutex_init(&priv->acpi_lock);
>  
>  	priv->pci_dev = dev;
>  	priv->features = id->driver_data;

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
