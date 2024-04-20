Return-Path: <linux-i2c+bounces-3029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B408AB9FA
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Apr 2024 08:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05C5C1C208D6
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Apr 2024 06:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771B110799;
	Sat, 20 Apr 2024 06:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cjgS4XEX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD847465;
	Sat, 20 Apr 2024 06:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713593762; cv=none; b=ooSsCkLwnNylHH81jZAxtLPcrxmA4OxaIcWi/2S+8mHGiKY4iCaE5JDLFS1BGEPSoahS3UenqdOLT3YSuFPWLskjZncpYZdxdyftOh6dsbGv2GU1clpK6hstqSnJ9NqTLRDqLj4Ma4/G1ojqmCA69D/7uDdLmzbvqyXzfDlBG8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713593762; c=relaxed/simple;
	bh=LC11vntnq2WrNJzqQ9ZGvDMLz5CIOstAK4aG/R3pSBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HF9OP0Li0RbZK+QmHg3wqEPgjCACh9oxdDgVBFT396elENg23ippCeCQFUEQfiVJpiQUQpAN/Wt0Ye6PnaKfSbGlEbze7LmcrYeuuI73o7DIlDBBTmUT5LOUiN7TWu1VZYtfYzRczfqkTKYHfMZDt1w0ZMYu3JfVHn/GTzcnfE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cjgS4XEX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F537C072AA;
	Sat, 20 Apr 2024 06:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713593761;
	bh=LC11vntnq2WrNJzqQ9ZGvDMLz5CIOstAK4aG/R3pSBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cjgS4XEX+6alg89rQuIGdMNZbyIldYwl0fwxEJjT61ci/x9/px5qJhbq/BSDHym7b
	 u6QELOgjqPGav1av8udBJHtbCEyx+ib5hX23zHGq18eA8OUQBABZ4iQXE0j31xJLhW
	 PjhiAXhTgSZuOMVGAwTlwm66nF91OYj6GuEuaftY=
Date: Sat, 20 Apr 2024 08:15:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Okazaki <dtokazaki@google.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	kernel-team@android.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] eeprom: at24: fix memory corruption race condition
Message-ID: <2024042042-subarctic-frightful-670e@gregkh>
References: <cd8ff4fc-f6bd-4834-b837-2a0d59c93648@web.de>
 <20240419191200.219548-1-dtokazaki@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419191200.219548-1-dtokazaki@google.com>

On Fri, Apr 19, 2024 at 07:12:00PM +0000, Daniel Okazaki wrote:
> If the eeprom is not accessible, an nvmem device will be registered, the
> read will fail, and the device will be torn down. If another driver
> accesses the nvmem device after the teardown, it will reference
> invalid memory.
> 
> Move the failure point before registering the nvmem device.
> 
> Signed-off-by: Daniel Okazaki <dtokazaki@google.com>
> Fixes: b20eb4c1f026 ("eeprom: at24: drop unnecessary label")
> ---
>  drivers/misc/eeprom/at24.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 572333ead5fb..4bd4f32bcdab 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -758,15 +758,6 @@ static int at24_probe(struct i2c_client *client)
>  	}
>  	pm_runtime_enable(dev);
>  
> -	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
> -	if (IS_ERR(at24->nvmem)) {
> -		pm_runtime_disable(dev);
> -		if (!pm_runtime_status_suspended(dev))
> -			regulator_disable(at24->vcc_reg);
> -		return dev_err_probe(dev, PTR_ERR(at24->nvmem),
> -				     "failed to register nvmem\n");
> -	}
> -
>  	/*
>  	 * Perform a one-byte test read to verify that the chip is functional,
>  	 * unless powering on the device is to be avoided during probe (i.e.
> @@ -782,6 +773,15 @@ static int at24_probe(struct i2c_client *client)
>  		}
>  	}
>  
> +	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
> +	if (IS_ERR(at24->nvmem)) {
> +		pm_runtime_disable(dev);
> +		if (!pm_runtime_status_suspended(dev))
> +			regulator_disable(at24->vcc_reg);
> +		return dev_err_probe(dev, PTR_ERR(at24->nvmem),
> +				     "failed to register nvmem\n");
> +	}
> +
>  	/* If this a SPD EEPROM, probe for DDR3 thermal sensor */
>  	if (cdata == &at24_data_spd)
>  		at24_probe_temp_sensor(client);
> -- 
> 2.44.0.769.g3c40516874-goog
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

