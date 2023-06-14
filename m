Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0ECE730AC6
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 00:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236673AbjFNWdV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 18:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236967AbjFNWdT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 18:33:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D476294F
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 15:32:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 48E44640B3
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 22:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEEFC433C0;
        Wed, 14 Jun 2023 22:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686781912;
        bh=+Q3GBb4xodW+WXuOUyt5Zvd3WwlF8ixc56HANYhLbfg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XIracav8GU64rGLLJCsjhUZGfO5RHs/3Mp/FiHEpXxzSO0+1kLvOmkvvpfPQEmVkJ
         ykjm/o7DoGoNy+Gwd1zFtDTRmnq4tpFZPihFA0vP8LpJWpJGUZCBF6GZFRUcf+8hkI
         i+zsQudYeJOfVxLvvzkXqGIiBPMYPL3wJhcJ8LjUDddUFDS/BiQcTTcD+Uf7SC7Amm
         7F4ScNvzqTp/85iUOBaPhPoUfiNh4o3FA871q9VdOktNqLY31j7OKWGNwSmNJpjVB5
         S6F1SBQ4duVplfAntBt6BrcW3m8vKwogpQU8LlqFY6Yz/RwEVQwhid3iJ/KXdL2teC
         80SV01e+KYzYQ==
Date:   Thu, 15 Jun 2023 00:31:49 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 2/4] i2c: i801: Replace acpi_lock with I2C bus lock
Message-ID: <20230614223149.r375pmbbnhyte6jl@intel.intel>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <8f88906f-c7da-eb3a-2f14-0f4d46202517@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f88906f-c7da-eb3a-2f14-0f4d46202517@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sat, Mar 04, 2023 at 10:33:05PM +0100, Heiner Kallweit wrote:
> I2C core ensures in i2c_smbus_xfer() that the I2C bus lock is held when
> calling the smbus_xfer callback. That's i801_access() in our case.
> I think it's safe in general to assume that the I2C bus lock is held
> when the smbus_xfer callback is called.
> Therefore I see no need to define an own mutex.

I think it makes sense... unless I missed something I don't see
anything else being racy in i801_access().

Have you checked i801_acpi_io_handler()?

Andi

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
> -- 
> 2.39.2
> 
> 
