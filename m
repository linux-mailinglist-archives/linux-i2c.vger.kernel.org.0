Return-Path: <linux-i2c+bounces-4245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A896913430
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 15:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA6EAB22C26
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 13:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A895F16EB6F;
	Sat, 22 Jun 2024 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNOjjFli"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E6482492;
	Sat, 22 Jun 2024 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719063161; cv=none; b=R9aV49SNEz0WVRx7y19NYAkOnWcl1+sejWdgLBONfuhQdasxsmHnhe2kIcIC5768o3XpjdHnD5bPncmPwrZ4pQThDjWNc95xjtBs34XYBjSWwVy8PAHIWnAckKghVGErd9tgx919gO8/FYkDr6dMbaNNJDJ4/UxdHFwOu8CjKG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719063161; c=relaxed/simple;
	bh=UsI7DtPhAH24sCtEn38xtTefdjo8zVjhTDCD4JLAMLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTKju6lippak7qntQEYN2mD6m/zhP+/W51Vg4OqooE2df55btFxcKc7quC98zvtSyB3nzmqDS3fQjYNPqCHtG6OcEBZlhA83M5lNHZ4NVurgcAMhFqkcwmpDxq4mLsGFBb2PM1ZSngtD4Xho8xSlhZoCBOnJ5QobLg6gT6c6p2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNOjjFli; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79517C3277B;
	Sat, 22 Jun 2024 13:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719063160;
	bh=UsI7DtPhAH24sCtEn38xtTefdjo8zVjhTDCD4JLAMLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNOjjFli24Pm5DtTJEfxRy4uUfTfsg7cpPwzNh9VrSlwByi9NyYjhjwEvRKeuzC4W
	 SeP1n3bckEx3tXgEv+9jCJ2XjLA3ZhR+ySV/l/Ely5UkWMAgrVQfBHC2qIYMqUeHYP
	 DySESRpOliNcfWMilWZhz1tXsIoN3m3VEEMzpmo7Tdsr+g6B51lCE/UVmdeYB4FOM2
	 CWroS/9mlo8Jasi1VwZpw76uPXmRilGtZ3RPCe70m7gBOiWNpXS9LLMU0Ql0uxMmj7
	 CIIO/veYOnSE7Tde/RZV65Z95Zkiq0yh7GpaoApXP5CsK2E6LGNdViVYdBcjpmLNhe
	 V+rjbvQ46+wyg==
Received: by pali.im (Postfix)
	id AAAC464C; Sat, 22 Jun 2024 15:32:37 +0200 (CEST)
Date: Sat, 22 Jun 2024 15:32:37 +0200
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
Subject: Re: [PATCH v3 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
Message-ID: <20240622133237.b5xsetcxnfu4vu6u@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-7-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122503.10034-7-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Friday 21 June 2024 14:25:01 Hans de Goede wrote:
> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
> of the accelerometer. So a DMI product-name to address mapping table
> is used.

This is statement which I got from Dell for 10 years old Dell models.

I have already stated that poking of address in kernel is a big risk
specially for all current and any future dell hardware. Hiding it just
under the kernel parameter is still a risk, specially as neither its
name, nor description say that it is dangerous.

But anyway, why this code is being introduced? Have you communicated
with Dell about this problem?

> At support to have the kernel probe for the i2c-address for modesl
> which are not on the list.
> 
> The new probing code sits behind a new probe_i2c_addr module parameter,
> which is disabled by default because probing might be dangerous.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/dell/dell-smo8800.c | 152 ++++++++++++++++++++++-
>  1 file changed, 147 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
> index 4c79b2599d96..d64d200e927a 100644
> --- a/drivers/platform/x86/dell/dell-smo8800.c
> +++ b/drivers/platform/x86/dell/dell-smo8800.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #define DRIVER_NAME "smo8800"
> +#define LIS3_WHO_AM_I 0x0f
>  
>  #include <linux/device/bus.h>
>  #include <linux/dmi.h>
> @@ -25,6 +26,10 @@
>  #include <linux/uaccess.h>
>  #include <linux/workqueue.h>
>  
> +static bool probe_i2c_addr;
> +module_param(probe_i2c_addr, bool, 0444);
> +MODULE_PARM_DESC(probe_i2c_addr, "Probe the i801 I2C bus for the accelerometer on models where the address is unknown");
> +
>  struct smo8800_device {
>  	u32 irq;                     /* acpi device irq */
>  	atomic_t counter;            /* count after last read */
> @@ -225,6 +230,130 @@ static const struct dmi_system_id smo8800_lis3lv02d_devices[] = {
>  	{ }
>  };
>  
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
> +static int i2c_safety_check(struct device *dev, struct i2c_adapter *adap, u8 addr)
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
> +	dev_warn(dev, "I2C safety check for address 0x%02x failed, skipping\n", addr);
> +	return -ENODEV;
> +}
> +
> +static int smo8800_detect_accel(struct smo8800_device *smo8800,
> +				struct i2c_adapter *adap, u8 addr,
> +				struct i2c_board_info *info, bool probe)
> +{
> +	union i2c_smbus_data smbus_data;
> +	const char *type;
> +	int err;
> +
> +	if (probe) {
> +		dev_info(smo8800->dev, "Probing for accelerometer on address 0x%02x\n", addr);
> +		err = i2c_safety_check(smo8800->dev, adap, addr);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
> +			     I2C_SMBUS_BYTE_DATA, &smbus_data);
> +	if (err < 0) {
> +		dev_warn(smo8800->dev, "Failed to read who-am-i register: %d\n", err);
> +		return err;
> +	}
> +
> +	/* who-am-i register mappings from drivers/misc/lis3lv02d/lis3lv02d.c */
> +	switch (smbus_data.byte) {
> +	case 0x32:
> +		type = "lis331dlh";
> +		break;
> +	case 0x33:
> +		type = "lis2de12"; /* LIS3DC / HP3DC in drivers/misc/lis3lv02d/lis3lv02d.c */
> +		break;
> +	case 0x3a:
> +		type = "lis3lv02dl_accel";
> +		break;
> +	case 0x3b:
> +		type = "lis302dl";
> +		break;
> +	default:
> +		dev_warn(smo8800->dev, "Unknown who-am-i register value 0x%02x\n",
> +			 smbus_data.byte);
> +		return -ENODEV;
> +	}
> +
> +	dev_dbg(smo8800->dev, "Detected %s accelerometer on address 0x%02x\n", type, addr);
> +	strscpy(info->type, "lis3lv02d", I2C_NAME_SIZE);
> +	info->addr = addr;
> +	return 0;
> +}
> +
>  static int smo8800_find_i801(struct device *dev, void *data)
>  {
>  	struct i2c_adapter *adap, **adap_ret = data;
> @@ -247,6 +376,7 @@ static void smo8800_instantiate_i2c_client(struct work_struct *work)
>  	const struct dmi_system_id *lis3lv02d_dmi_id;
>  	struct i2c_board_info info = { };
>  	struct i2c_adapter *adap = NULL;
> +	int err;
>  
>  	if (smo8800->i2c_dev)
>  		return;
> @@ -256,11 +386,22 @@ static void smo8800_instantiate_i2c_client(struct work_struct *work)
>  		return;
>  
>  	lis3lv02d_dmi_id = dmi_first_match(smo8800_lis3lv02d_devices);
> -	if (!lis3lv02d_dmi_id)
> +	if (lis3lv02d_dmi_id) {
> +		info.addr = (long)lis3lv02d_dmi_id->driver_data;
> +		/* Always detect the accel-type, this also checks the accel is actually there */
> +		err = smo8800_detect_accel(smo8800, adap, info.addr, &info, false);
> +		if (err)
> +			goto out_put_adapter;
> +	} else if (probe_i2c_addr) {
> +		/* First try address 0x29 (most used) and then try 0x1d */
> +		if (smo8800_detect_accel(smo8800, adap, 0x29, &info, true) != 0 &&
> +		    smo8800_detect_accel(smo8800, adap, 0x1d, &info, true) != 0) {
> +			dev_warn(smo8800->dev, "failed to probe for lis3lv02d I2C address\n");
> +			goto out_put_adapter;
> +		}
> +	} else {
>  		goto out_put_adapter;
> -
> -	info.addr = (long)lis3lv02d_dmi_id->driver_data;
> -	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
> +	}
>  
>  	smo8800->i2c_dev = i2c_new_client_device(adap, &info);
>  	if (IS_ERR(smo8800->i2c_dev)) {
> @@ -357,7 +498,7 @@ static int smo8800_probe(struct platform_device *device)
>  			 smo8800->irq);
>  	}
>  
> -	if (dmi_check_system(smo8800_lis3lv02d_devices)) {
> +	if (dmi_check_system(smo8800_lis3lv02d_devices) || probe_i2c_addr) {
>  		/*
>  		 * Register i2c-bus notifier + queue initial scan for lis3lv02d
>  		 * i2c_client instantiation.
> @@ -370,6 +511,7 @@ static int smo8800_probe(struct platform_device *device)
>  	} else {
>  		dev_warn(&device->dev,
>  			 "lis3lv02d accelerometer is present on SMBus but its address is unknown, skipping registration\n");
> +		dev_info(&device->dev, "Pass dell_smo8800.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
>  		if (!smo8800->irq)
>  			return -ENODEV;
>  	}
> -- 
> 2.45.1
> 

