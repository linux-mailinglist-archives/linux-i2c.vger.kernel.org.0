Return-Path: <linux-i2c+bounces-4314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CB1915666
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 20:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 825F51C220A2
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 18:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31E61A00CE;
	Mon, 24 Jun 2024 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHiP0qV+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5B9182B2;
	Mon, 24 Jun 2024 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719253270; cv=none; b=eRwy5GLgk1dqyq4TDzcJZCir3SukiclhPeXJ1FRERW4p4m8jcf/4vpVRUbU8ZOF2P5CKacz7lKExUofdFveLUY4Ja/eNbmh7nPQ2qaliW/X5Jq1G+d5vXhVYJ5gTUTcr4vet67a8J+SQ/mdK1ahNouIdTFOdSQ5UN4YUqTTdW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719253270; c=relaxed/simple;
	bh=8SS3PTiEzJvS3BEMYA+st0N1rzQ7BIjTVKfy8klb84w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkb/FfqPP1VfzMOPV7EMGtDz9DKxF0rz7Apb97zPcwtNVahe9gGFjKtjG44wABcX3rxfspth0eU9P+5frFTlOUwElZLR/M65PBJvkTcvGmVm/yq9nU1xc6e2hMMLbU1Jm4lQyK0wMptGvmtSNM6/EUWnnCR2ZXbsE6HlG/Lh2Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHiP0qV+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C60C2BBFC;
	Mon, 24 Jun 2024 18:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719253270;
	bh=8SS3PTiEzJvS3BEMYA+st0N1rzQ7BIjTVKfy8klb84w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mHiP0qV+gJtfYnDKrMPl1gCiGm3ID55mPgAHbTYz36d/UgBv1kM0aCjzQrAaZSNZt
	 XZWnmN14mbJUoBKmr+eTl3+fuEGhWQHckyRyMeUNkmTHCnk9dGzwuxAz6P8BEDzrAY
	 KK0s6ITcYnfw3IBeG91SYPnL64mxVSB95TWlrfKS/+Ho8nlh/UzLdhKNpxwk8LsPXb
	 tyR5TPoCLWwQZ8hoo00rp6bzzr74couq6S9PgdQ5VDHEYU8+D1Ix7En00YL3cBaxnx
	 UuRXCDS+GAnJN6w4VIjf1kQVsW9aguHWRjGMkgQUGNEhSuwRKkLSu1ywKOHvW9UbHi
	 +LkUzhVWnZ00Q==
Received: by pali.im (Postfix)
	id 92070BF4; Mon, 24 Jun 2024 20:21:06 +0200 (CEST)
Date: Mon, 24 Jun 2024 20:21:06 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
Message-ID: <20240624182106.r5upljyt46jv2mgm@pali>
References: <20240624111519.15652-1-hdegoede@redhat.com>
 <20240624111519.15652-7-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624111519.15652-7-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Monday 24 June 2024 13:15:18 Hans de Goede wrote:
> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
> of the accelerometer. So a DMI product-name to address mapping table
> is used.
> 
> At support to have the kernel probe for the i2c-address for modesl
> which are not on the list.
> 
> The new probing code sits behind a new probe_i2c_addr module parameter,
> which is disabled by default because probing might be dangerous.
> 
> Link: https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

My comments from the previous version still apply there. There is no
dangerous warning neither in parameter name and its description, there
is no warning once the parameter was specified. And there is missing
information from Dell how it is going to be handled for new
machines. So first ask Dell about the current state and future.

> ---
>  drivers/platform/x86/dell/dell-lis3lv02d.c | 133 ++++++++++++++++++++-
>  1 file changed, 131 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
> index a7409db0505b..173615fd2646 100644
> --- a/drivers/platform/x86/dell/dell-lis3lv02d.c
> +++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
> @@ -15,6 +15,8 @@
>  #include <linux/workqueue.h>
>  #include "dell-smo8800-ids.h"
>  
> +#define LIS3_WHO_AM_I 0x0f
> +
>  #define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr)                 \
>  	{                                                                \
>  		.matches = {                                             \
> @@ -57,6 +59,121 @@ static const struct dmi_system_id *lis3lv02d_dmi_id;
>  static struct i2c_client *i2c_dev;
>  static bool notifier_registered;
>  
> +static bool probe_i2c_addr;
> +module_param(probe_i2c_addr, bool, 0444);
> +MODULE_PARM_DESC(probe_i2c_addr, "Probe the i801 I2C bus for the accelerometer on models where the address is unknown");
> +
> +/*
> + * This is the kernel version of the single register device sanity checks from
> + * the i2c_safety_check function from lm_sensors sensor-detect script:
> + * This is meant to prevent access to 1-register-only devices,
> + * which are designed to be accessed with SMBus receive byte and SMBus send
> + * byte transactions (i.e. short reads and short writes) and treat SMBus
> + * read byte as a real write followed by a read. The device detection
> + * routines would write random values to the chip with possibly very nasty
> + * results for the hardware. Note that this function won't catch all such
> + * chips, as it assumes that reads and writes relate to the same register,
> + * but that's the best we can do.
> + */
> +static int i2c_safety_check(struct i2c_adapter *adap, u8 addr)
> +{
> +	union i2c_smbus_data smbus_data;
> +	int err;
> +	u8 data;
> +
> +	/*
> +	 * First receive a byte from the chip, and remember it. This
> +	 * also checks if there is a device at the address at all.
> +	 */
> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
> +			     I2C_SMBUS_BYTE, &smbus_data);
> +	if (err < 0)
> +		return err;
> +
> +	data = smbus_data.byte;
> +
> +	/*
> +	 * Receive a byte again; very likely to be the same for
> +	 * 1-register-only devices.
> +	 */
> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
> +			     I2C_SMBUS_BYTE, &smbus_data);
> +	if (err < 0)
> +		return err;
> +
> +	if (smbus_data.byte != data)
> +		return 0; /* Not a 1-register-only device. */
> +
> +	/*
> +	 * Then try a standard byte read, with a register offset equal to
> +	 * the read byte; for 1-register-only device this should read
> +	 * the same byte value in return.
> +	 */
> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, data,
> +			     I2C_SMBUS_BYTE_DATA, &smbus_data);
> +	if (err < 0)
> +		return err;
> +
> +	if (smbus_data.byte != data)
> +		return 0; /* Not a 1-register-only device. */
> +
> +	/*
> +	 * Then try a standard byte read, with a slightly different register
> +	 * offset; this should again read the register offset in return.
> +	 */
> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, data ^ 0x01,
> +			     I2C_SMBUS_BYTE_DATA, &smbus_data);
> +	if (err < 0)
> +		return err;
> +
> +	if (smbus_data.byte != (data ^ 0x01))
> +		return 0; /* Not a 1-register-only device. */
> +
> +	/*
> +	 * Apparently this is a 1-register-only device, restore the original
> +	 * register value and leave it alone.
> +	 */
> +	i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_WRITE, data,
> +		       I2C_SMBUS_BYTE, NULL);
> +	pr_warn("I2C safety check for address 0x%02x failed, skipping\n", addr);
> +	return -ENODEV;
> +}
> +
> +static int detect_lis3lv02d(struct i2c_adapter *adap, u8 addr,
> +			    struct i2c_board_info *info)
> +{
> +	union i2c_smbus_data smbus_data;
> +	int err;
> +
> +	pr_info("Probing for lis3lv02d on address 0x%02x\n", addr);
> +	err = i2c_safety_check(adap, addr);
> +	if (err < 0)
> +		return err;
> +
> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
> +			     I2C_SMBUS_BYTE_DATA, &smbus_data);
> +	if (err < 0) {
> +		pr_warn("Failed to read who-am-i register: %d\n", err);
> +		return err;
> +	}
> +
> +	/* valid who-am-i values are from drivers/misc/lis3lv02d/lis3lv02d.c */
> +	switch (smbus_data.byte) {
> +	case 0x32:
> +	case 0x33:
> +	case 0x3a:
> +	case 0x3b:
> +		break;
> +	default:
> +		pr_warn("Unknown who-am-i register value 0x%02x\n", smbus_data.byte);
> +		return -ENODEV;
> +	}
> +
> +	pr_debug("Detected lis3lv02d on address 0x%02x\n", addr);
> +	info->addr = addr;
> +	return 0;
> +}
> +
>  static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
>  {
>  	/*
> @@ -93,7 +210,17 @@ static void instantiate_i2c_client(struct work_struct *work)
>  	if (!adap)
>  		return;
>  
> -	info.addr = (long)lis3lv02d_dmi_id->driver_data;
> +	if (lis3lv02d_dmi_id) {
> +		info.addr = (long)lis3lv02d_dmi_id->driver_data;
> +	} else {
> +		/* First try address 0x29 (most used) and then try 0x1d */
> +		if (detect_lis3lv02d(adap, 0x29, &info) != 0 &&
> +		    detect_lis3lv02d(adap, 0x1d, &info) != 0) {
> +			pr_warn("failed to probe for lis3lv02d I2C address\n");
> +			goto out_put_adapter;
> +		}
> +	}
> +
>  	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
>  
>  	i2c_dev = i2c_new_client_device(adap, &info);
> @@ -104,6 +231,7 @@ static void instantiate_i2c_client(struct work_struct *work)
>  		pr_debug("registered lis3lv02d on address 0x%02x\n", info.addr);
>  	}
>  
> +out_put_adapter:
>  	i2c_put_adapter(adap);
>  }
>  static DECLARE_WORK(i2c_work, instantiate_i2c_client);
> @@ -166,8 +294,9 @@ static int __init dell_lis3lv02d_init(void)
>  	put_device(dev);
>  
>  	lis3lv02d_dmi_id = dmi_first_match(lis3lv02d_devices);
> -	if (!lis3lv02d_dmi_id) {
> +	if (!lis3lv02d_dmi_id && !probe_i2c_addr) {
>  		pr_warn("accelerometer is present on SMBus but its address is unknown, skipping registration\n");
> +		pr_info("Pass dell_lis3lv02d.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
>  		return 0;
>  	}
>  
> -- 
> 2.45.1
> 

