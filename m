Return-Path: <linux-i2c+bounces-4243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BFE913429
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 15:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 749EC28427D
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 13:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3420916E877;
	Sat, 22 Jun 2024 13:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGHbrSIp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33DD9449;
	Sat, 22 Jun 2024 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719062215; cv=none; b=Qr2TzcwK2QSC703op1DAw61KPsq55+QbJUe5ETKgqyetGRX1ub5zaJDxq9g8cuOEhCm6pAfO9QeC13bf75zLFJhg5LXDVewt50lx2BhVUXdRIZ800L2cIw514L0RMcbxabZhBmBhm1fYxQL3ubD/BhvIOb7OMizfsnG2/IIdxzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719062215; c=relaxed/simple;
	bh=SlGMDLoiG74j1UhtBOuYdxLz6FbXG7ixVSSs0YVBBZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dhe1iftf2G87VLMdRpblLOR12vNVbB1DdoOHJOjOtYiyIu79RmK6w0MVtsvHtXNL9Y+nTlLi0sdvnln7Qne48zzWYE0lZZvaj402hNxlD4qDD44dneMqoSVNeSJds+qeV4He/yof9No3poG4LAfFzPvYhbDt14ysubDp3mHsAoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGHbrSIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B4EC3277B;
	Sat, 22 Jun 2024 13:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719062214;
	bh=SlGMDLoiG74j1UhtBOuYdxLz6FbXG7ixVSSs0YVBBZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGHbrSIpWAp2m9PVfuNb7A/mn1k+MRMuveFtOZGbOuHiSexxUyyFPz4zZEeS7uui0
	 ClTdeHPjPMTUdgFuQjuGw2nDoUko9bbUJO4u1PAJlLKxFOLqdJKfrus2dhNynCaZix
	 zwhynB2JuXntYSJ6CibFbmHiQ29LYCGkbARfmrAjQ1SfwXS0HU0R0v8+ji2AycwTmV
	 Hgy36oSJMYBaYWaZOFwWxSsSA11zDnuZsCKTsxb9Cx7vuuLhVBvAtV6Z0WfMN6REiU
	 CDDoydrlbf9hlGS1Cm7bxhVc4get2gom0tge2jVI4LT++DFqXaMpAwjSTOJ9Vh0LpR
	 VETv4fcFTb9aw==
Received: by pali.im (Postfix)
	id 8026B64C; Sat, 22 Jun 2024 15:16:50 +0200 (CEST)
Date: Sat, 22 Jun 2024 15:16:50 +0200
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
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240622131650.qxoxtp6aaitpar6a@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240621122503.10034-4-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Friday 21 June 2024 14:24:58 Hans de Goede wrote:
> It is not necessary to handle the Dell specific instantiation of
> i2c_client-s for SMO88xx ACPI devices without an ACPI I2cResource
> inside the generic i801 I2C adapter driver.
> 
> The kernel already instantiates platform_device-s for these ACPI devices
> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
> platform drivers.
> 
> Move the i2c_client instantiation from the generic i2c-i801 driver to
> the SMO88xx specific dell-smo8800 driver.

Why it has to be in dell-smo8800 driver? Code for registering lis3lv02d
and freefall code for smo88xx are basically independent.

lis3lv02d is for accelerometer axes and smo88xx is for freefall hardisk
detection. The only thing which have these "drivers" common is the ACPI
detection mechanism based on presence of SMO88?? identifiers from
acpi_smo8800_ids[] array.

I think it makes both "drivers" cleaner if they are put into separate
files as they are independent of each one.

What about moving it into drivers/platform/x86/dell/dell-lis3lv02d.c
instead (or similar name)? And just share list of ACPI ids via some
header file (or something like that).

> Moving the i2c_client instantiation here has the following advantages:
> 
> 1. This moves the SMO88xx ACPI device quirk handling away from the generic
> i2c-i801 module which is loaded on all Intel x86 machines to the SMO88xx
> specific dell-smo8800 module where it belongs.
> 
> 2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) table
> between the i2c-i801 and dell-smo8800 drivers.
> 
> 3. This allows extending the quirk handling by adding new code and related
> module parameters to the dell-smo8800 driver, without needing to modify
> the i2c-i801 code.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note the goto out_put_adapter, which can be avoided by moving the DMI check
> up, is there deliberately as preparation for adding support to probe for
> the i2c address in case there is no DMI match.
> ---
> Changes in v3:
> - Use an i2c bus notifier so that the i2c_client will still be instantiated if
>   the i801 i2c_adapter shows up later or is re-probed (removed + added again)
> - Switch to standard dmi_system_id matching to check both sys-vendor +
>   product-name DMI fields
> - Use unique i2c_adapter->name prefix for primary i2c_801 controller
>   to avoid needing to duplicate PCI ids for extra IDF i2c_801 i2c_adapter-s
> - Drop MODULE_SOFTDEP("pre: i2c-i801"), this is now no longer necessary
> - Rebase on Torvalds master for recent additions of extra models in
>   the dell_lis3lv02d_devices[] list
> 
> Changes in v2:
> - Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
> - Add a comment documenting the IDF PCI device ids
> ---
>  drivers/i2c/busses/i2c-i801.c            | 124 -------------
>  drivers/platform/x86/dell/dell-smo8800.c | 214 ++++++++++++++++++++++-
>  2 files changed, 213 insertions(+), 125 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 5ac5bbd60d45..db8d31411148 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1153,127 +1153,6 @@ static void dmi_check_onboard_devices(const struct dmi_header *dm, void *adap)
>  	}
>  }
>  
> -/* NOTE: Keep this list in sync with drivers/platform/x86/dell-smo8800.c */
> -static const char *const acpi_smo8800_ids[] = {
> -	"SMO8800",
> -	"SMO8801",
> -	"SMO8810",
> -	"SMO8811",
> -	"SMO8820",
> -	"SMO8821",
> -	"SMO8830",
> -	"SMO8831",
> -};
> -
> -static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
> -					     u32 nesting_level,
> -					     void *context,
> -					     void **return_value)
> -{
> -	struct acpi_device_info *info;
> -	acpi_status status;
> -	char *hid;
> -	int i;
> -
> -	status = acpi_get_object_info(obj_handle, &info);
> -	if (ACPI_FAILURE(status))
> -		return AE_OK;
> -
> -	if (!(info->valid & ACPI_VALID_HID))
> -		goto smo88xx_not_found;
> -
> -	hid = info->hardware_id.string;
> -	if (!hid)
> -		goto smo88xx_not_found;
> -
> -	i = match_string(acpi_smo8800_ids, ARRAY_SIZE(acpi_smo8800_ids), hid);
> -	if (i < 0)
> -		goto smo88xx_not_found;
> -
> -	kfree(info);
> -
> -	*return_value = NULL;
> -	return AE_CTRL_TERMINATE;
> -
> -smo88xx_not_found:
> -	kfree(info);
> -	return AE_OK;
> -}
> -
> -static bool is_dell_system_with_lis3lv02d(void)
> -{
> -	void *err = ERR_PTR(-ENOENT);
> -
> -	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
> -		return false;
> -
> -	/*
> -	 * Check that ACPI device SMO88xx is present and is functioning.
> -	 * Function acpi_get_devices() already filters all ACPI devices
> -	 * which are not present or are not functioning.
> -	 * ACPI device SMO88xx represents our ST microelectronics lis3lv02d
> -	 * accelerometer but unfortunately ACPI does not provide any other
> -	 * information (like I2C address).
> -	 */
> -	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &err);
> -
> -	return !IS_ERR(err);
> -}
> -
> -/*
> - * Accelerometer's I2C address is not specified in DMI nor ACPI,
> - * so it is needed to define mapping table based on DMI product names.
> - */
> -static const struct {
> -	const char *dmi_product_name;
> -	unsigned short i2c_addr;
> -} dell_lis3lv02d_devices[] = {
> -	/*
> -	 * Dell platform team told us that these Latitude devices have
> -	 * ST microelectronics accelerometer at I2C address 0x29.
> -	 */
> -	{ "Latitude E5250",     0x29 },
> -	{ "Latitude E5450",     0x29 },
> -	{ "Latitude E5550",     0x29 },
> -	{ "Latitude E6440",     0x29 },
> -	{ "Latitude E6440 ATG", 0x29 },
> -	{ "Latitude E6540",     0x29 },
> -	/*
> -	 * Additional individual entries were added after verification.
> -	 */
> -	{ "Latitude 5480",      0x29 },
> -	{ "Precision 3540",     0x29 },
> -	{ "Vostro V131",        0x1d },
> -	{ "Vostro 5568",        0x29 },
> -	{ "XPS 15 7590",        0x29 },
> -};
> -
> -static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
> -{
> -	struct i2c_board_info info;
> -	const char *dmi_product_name;
> -	int i;
> -
> -	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
> -	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
> -		if (strcmp(dmi_product_name,
> -			   dell_lis3lv02d_devices[i].dmi_product_name) == 0)
> -			break;
> -	}
> -
> -	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
> -		dev_warn(&priv->pci_dev->dev,
> -			 "Accelerometer lis3lv02d is present on SMBus but its"
> -			 " address is unknown, skipping registration\n");
> -		return;
> -	}
> -
> -	memset(&info, 0, sizeof(struct i2c_board_info));
> -	info.addr = dell_lis3lv02d_devices[i].i2c_addr;
> -	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
> -	i2c_new_client_device(&priv->adapter, &info);
> -}
> -
>  /* Register optional slaves */
>  static void i801_probe_optional_slaves(struct i801_priv *priv)
>  {
> @@ -1293,9 +1172,6 @@ static void i801_probe_optional_slaves(struct i801_priv *priv)
>  	if (dmi_name_in_vendors("FUJITSU"))
>  		dmi_walk(dmi_check_onboard_devices, &priv->adapter);
>  
> -	if (is_dell_system_with_lis3lv02d())
> -		register_dell_lis3lv02d_i2c_device(priv);
> -
>  	/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
>  #ifdef CONFIG_I2C_I801_MUX
>  	if (!priv->mux_pdev)
> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
> index f7ec17c56833..cd2e48405859 100644
> --- a/drivers/platform/x86/dell/dell-smo8800.c
> +++ b/drivers/platform/x86/dell/dell-smo8800.c
> @@ -4,20 +4,26 @@
>   *
>   *  Copyright (C) 2012 Sonal Santan <sonal.santan@gmail.com>
>   *  Copyright (C) 2014 Pali Rohár <pali@kernel.org>
> + *  Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
>   *
>   *  This is loosely based on lis3lv02d driver.
>   */
>  
>  #define DRIVER_NAME "smo8800"
>  
> +#include <linux/device/bus.h>
> +#include <linux/dmi.h>
>  #include <linux/fs.h>
> +#include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/miscdevice.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/notifier.h>
>  #include <linux/platform_device.h>
>  #include <linux/uaccess.h>
> +#include <linux/workqueue.h>
>  
>  struct smo8800_device {
>  	u32 irq;                     /* acpi device irq */
> @@ -25,6 +31,9 @@ struct smo8800_device {
>  	struct miscdevice miscdev;   /* for /dev/freefall */
>  	unsigned long misc_opened;   /* whether the device is open */
>  	wait_queue_head_t misc_wait; /* Wait queue for the misc dev */
> +	struct notifier_block i2c_nb;/* i2c bus notifier */
> +	struct work_struct i2c_work; /* Work for instantiating lis3lv02d i2c_client */
> +	struct i2c_client *i2c_dev;  /* i2c_client for lis3lv02d */
>  	struct device *dev;          /* acpi device */
>  };
>  
> @@ -103,6 +112,184 @@ static const struct file_operations smo8800_misc_fops = {
>  	.release = smo8800_misc_release,
>  };
>  
> +/*
> + * Accelerometer's I2C address is not specified in DMI nor ACPI,
> + * so it is needed to define mapping table based on DMI product names.
> + */
> +static const struct dmi_system_id smo8800_lis3lv02d_devices[] = {
> +	/*
> +	 * Dell platform team told us that these Latitude devices have
> +	 * ST microelectronics accelerometer at I2C address 0x29.
> +	 */
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5250"),
> +		},
> +		.driver_data = (void *)0x29L,
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5450"),
> +		},
> +		.driver_data = (void *)0x29L,
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5550"),
> +		},
> +		.driver_data = (void *)0x29L,
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440"),
> +		},
> +		.driver_data = (void *)0x29L,
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440 ATG"),
> +		},
> +		.driver_data = (void *)0x29L,
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6540"),
> +		},
> +		.driver_data = (void *)0x29L,
> +	},
> +	/*
> +	 * Additional individual entries were added after verification.
> +	 */
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude 5480"),
> +		},
> +		.driver_data = (void *)0x29L,
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Precision 3540"),
> +		},
> +		.driver_data = (void *)0x29L,
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
> +		},
> +		.driver_data = (void *)0x1dL,
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 5568"),
> +		},
> +		.driver_data = (void *)0x29L,
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 7590"),
> +		},
> +		.driver_data = (void *)0x29L,

At least for me, casting i2c address to LONG and then to pointer looks
very strange. If I look at this code without knowing what the number
0x29 means I would not figure out that expression "(void *)0x29L" is i2c
address.

Is not there a better way to write i2c address? E.g. ".i2c_addr = 0x29"
instead of ".something = (void *)0x29L" to make it readable?

Also does the whole device table has to be such verbose with lot of
duplicated information (which probably also increase size of every linux
image which includes this driver into it)? Previously there was a very
compact structure on few lines:

| static const struct {
| 	const char *dmi_product_name;
| 	unsigned short i2c_addr;
| } dell_lis3lv02d_devices[] = {
| 	/*
| 	 * Dell platform team told us that these Latitude devices have
| 	 * ST microelectronics accelerometer at I2C address 0x29.
| 	 */
| 	{ "Latitude E5250",     0x29 },
| 	{ "Latitude E5450",     0x29 },
| 	{ "Latitude E5550",     0x29 },
| 	{ "Latitude E6440",     0x29 },
| 	{ "Latitude E6440 ATG", 0x29 },
| 	{ "Latitude E6540",     0x29 },

> +	},
> +	{ }
> +};
> +
> +static int smo8800_find_i801(struct device *dev, void *data)
> +{
> +	struct i2c_adapter *adap, **adap_ret = data;
> +
> +	adap = i2c_verify_adapter(dev);
> +	if (!adap)
> +		return 0;
> +
> +	if (!strstarts(adap->name, "SMBus I801 adapter"))
> +		return 0;
> +
> +	*adap_ret = i2c_get_adapter(adap->nr);
> +	return 1;
> +}
> +
> +static void smo8800_instantiate_i2c_client(struct work_struct *work)
> +{
> +	struct smo8800_device *smo8800 =
> +		container_of(work, struct smo8800_device, i2c_work);
> +	const struct dmi_system_id *lis3lv02d_dmi_id;
> +	struct i2c_board_info info = { };
> +	struct i2c_adapter *adap = NULL;
> +
> +	if (smo8800->i2c_dev)
> +		return;
> +
> +	bus_for_each_dev(&i2c_bus_type, NULL, &adap, smo8800_find_i801);
> +	if (!adap)
> +		return;
> +
> +	lis3lv02d_dmi_id = dmi_first_match(smo8800_lis3lv02d_devices);
> +	if (!lis3lv02d_dmi_id)
> +		goto out_put_adapter;
> +
> +	info.addr = (long)lis3lv02d_dmi_id->driver_data;
> +	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
> +
> +	smo8800->i2c_dev = i2c_new_client_device(adap, &info);
> +	if (IS_ERR(smo8800->i2c_dev)) {
> +		dev_err(smo8800->dev, "error %ld registering %s i2c_client\n",
> +			PTR_ERR(smo8800->i2c_dev), info.type);
> +		smo8800->i2c_dev = NULL;
> +	} else {
> +		dev_dbg(smo8800->dev, "registered %s i2c_client on address 0x%02x\n",
> +			info.type, info.addr);
> +	}
> +
> +out_put_adapter:
> +	i2c_put_adapter(adap);
> +}
> +
> +static int smo8800_i2c_bus_notify(struct notifier_block *nb,
> +				  unsigned long action, void *data)
> +{
> +	struct smo8800_device *smo8800 =
> +		container_of(nb, struct smo8800_device, i2c_nb);
> +	struct device *dev = data;
> +	struct i2c_client *client;
> +	struct i2c_adapter *adap;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +		adap = i2c_verify_adapter(dev);
> +		if (!adap)
> +			break;
> +
> +		if (strstarts(adap->name, "SMBus I801 adapter"))
> +			queue_work(system_long_wq, &smo8800->i2c_work);
> +		break;
> +	case BUS_NOTIFY_REMOVED_DEVICE:
> +		client = i2c_verify_client(dev);
> +		if (!client)
> +			break;
> +
> +		if (smo8800->i2c_dev == client) {
> +			dev_dbg(smo8800->dev, "accelerometer i2c_client removed\n");
> +			smo8800->i2c_dev = NULL;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>  static int smo8800_probe(struct platform_device *device)
>  {
>  	int err;
> @@ -118,8 +305,10 @@ static int smo8800_probe(struct platform_device *device)
>  	smo8800->miscdev.minor = MISC_DYNAMIC_MINOR;
>  	smo8800->miscdev.name = "freefall";
>  	smo8800->miscdev.fops = &smo8800_misc_fops;
> +	smo8800->i2c_nb.notifier_call = smo8800_i2c_bus_notify;
>  
>  	init_waitqueue_head(&smo8800->misc_wait);
> +	INIT_WORK(&smo8800->i2c_work, smo8800_instantiate_i2c_client);
>  
>  	err = misc_register(&smo8800->miscdev);
>  	if (err) {
> @@ -147,8 +336,26 @@ static int smo8800_probe(struct platform_device *device)
>  
>  	dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
>  		 smo8800->irq);
> +
> +	if (dmi_check_system(smo8800_lis3lv02d_devices)) {
> +		/*
> +		 * Register i2c-bus notifier + queue initial scan for lis3lv02d
> +		 * i2c_client instantiation.
> +		 */
> +		err = bus_register_notifier(&i2c_bus_type, &smo8800->i2c_nb);
> +		if (err)
> +			goto error_free_irq;
> +
> +		queue_work(system_long_wq, &smo8800->i2c_work);
> +	} else {
> +		dev_warn(&device->dev,
> +			 "lis3lv02d accelerometer is present on SMBus but its address is unknown, skipping registration\n");
> +	}
> +
>  	return 0;
>  
> +error_free_irq:
> +	free_irq(smo8800->irq, smo8800);
>  error:
>  	misc_deregister(&smo8800->miscdev);
>  	return err;
> @@ -158,12 +365,17 @@ static void smo8800_remove(struct platform_device *device)
>  {
>  	struct smo8800_device *smo8800 = platform_get_drvdata(device);
>  
> +	if (dmi_check_system(smo8800_lis3lv02d_devices)) {
> +		bus_unregister_notifier(&i2c_bus_type, &smo8800->i2c_nb);
> +		cancel_work_sync(&smo8800->i2c_work);
> +		i2c_unregister_device(smo8800->i2c_dev);
> +	}
> +
>  	free_irq(smo8800->irq, smo8800);
>  	misc_deregister(&smo8800->miscdev);
>  	dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
>  }
>  
> -/* NOTE: Keep this list in sync with drivers/i2c/busses/i2c-i801.c */
>  static const struct acpi_device_id smo8800_ids[] = {
>  	{ "SMO8800", 0 },
>  	{ "SMO8801", 0 },
> -- 
> 2.45.1
> 

