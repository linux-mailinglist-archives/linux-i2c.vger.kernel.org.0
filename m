Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFDD34EDF5
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 18:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhC3Qdo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 12:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbhC3QdO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 12:33:14 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C13C061764;
        Tue, 30 Mar 2021 09:33:14 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id E14F21F4512D
Subject: Re: [PATCH 10/12] platform/chrome: chromeos_laptop - Prepare complete
 software nodes
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benson Leung <bleung@chromium.org>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-11-heikki.krogerus@linux.intel.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <7e3b0ed4-c646-c58b-7afc-035b274716e4@collabora.com>
Date:   Tue, 30 Mar 2021 18:33:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210329105047.51033-11-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heikki,

Thank you for your patch.

On 29/3/21 12:50, Heikki Krogerus wrote:
> The older device property API is going to be removed soon
> and that will affect also I2C subystem. Supplying complete
> software nodes instead of only the properties in them for
> the I2C devices.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/platform/chrome/chromeos_laptop.c | 100 +++++++++++++---------
>  1 file changed, 60 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/platform/chrome/chromeos_laptop.c b/drivers/platform/chrome/chromeos_laptop.c
> index 472a03daa8693..4e14b4d6635d7 100644
> --- a/drivers/platform/chrome/chromeos_laptop.c
> +++ b/drivers/platform/chrome/chromeos_laptop.c
> @@ -52,12 +52,15 @@ struct i2c_peripheral {
>  	enum i2c_adapter_type type;
>  	u32 pci_devid;
>  
> +	const struct property_entry *properties;
> +
>  	struct i2c_client *client;
>  };
>  
>  struct acpi_peripheral {
>  	char hid[ACPI_ID_LEN];
> -	const struct property_entry *properties;
> +	struct software_node swnode;
> +	struct i2c_client *client;
>  };
>  
>  struct chromeos_laptop {
> @@ -68,7 +71,7 @@ struct chromeos_laptop {
>  	struct i2c_peripheral *i2c_peripherals;
>  	unsigned int num_i2c_peripherals;
>  
> -	const struct acpi_peripheral *acpi_peripherals;
> +	struct acpi_peripheral *acpi_peripherals;
>  	unsigned int num_acpi_peripherals;
>  };
>  
> @@ -161,7 +164,7 @@ static void chromeos_laptop_check_adapter(struct i2c_adapter *adapter)
>  
>  static bool chromeos_laptop_adjust_client(struct i2c_client *client)
>  {
> -	const struct acpi_peripheral *acpi_dev;
> +	struct acpi_peripheral *acpi_dev;
>  	struct acpi_device_id acpi_ids[2] = { };
>  	int i;
>  	int error;
> @@ -175,8 +178,7 @@ static bool chromeos_laptop_adjust_client(struct i2c_client *client)
>  		memcpy(acpi_ids[0].id, acpi_dev->hid, ACPI_ID_LEN);
>  
>  		if (acpi_match_device(acpi_ids, &client->dev)) {
> -			error = device_add_properties(&client->dev,
> -						      acpi_dev->properties);
> +			error = device_add_software_node(&client->dev, &acpi_dev->swnode);
>  			if (error) {
>  				dev_err(&client->dev,
>  					"failed to add properties: %d\n",
> @@ -184,6 +186,8 @@ static bool chromeos_laptop_adjust_client(struct i2c_client *client)
>  				break;
>  			}
>  
> +			acpi_dev->client = client;
> +
>  			return true;
>  		}
>  	}
> @@ -193,15 +197,28 @@ static bool chromeos_laptop_adjust_client(struct i2c_client *client)
>  
>  static void chromeos_laptop_detach_i2c_client(struct i2c_client *client)
>  {
> +	struct acpi_peripheral *acpi_dev;
>  	struct i2c_peripheral *i2c_dev;
>  	int i;
>  
> -	for (i = 0; i < cros_laptop->num_i2c_peripherals; i++) {
> -		i2c_dev = &cros_laptop->i2c_peripherals[i];
> +	if (has_acpi_companion(&client->dev))
> +		for (i = 0; i < cros_laptop->num_acpi_peripherals; i++) {
> +			acpi_dev = &cros_laptop->acpi_peripherals[i];
>  
> -		if (i2c_dev->client == client)
> -			i2c_dev->client = NULL;
> -	}
> +			if (acpi_dev->client == client) {
> +				acpi_dev->client = NULL;
> +				return;
> +			}
> +		}
> +	else
> +		for (i = 0; i < cros_laptop->num_i2c_peripherals; i++) {
> +			i2c_dev = &cros_laptop->i2c_peripherals[i];
> +
> +			if (i2c_dev->client == client) {
> +				i2c_dev->client = NULL;
> +				return;
> +			}
> +		}
>  }
>  
>  static int chromeos_laptop_i2c_notifier_call(struct notifier_block *nb,
> @@ -302,28 +319,26 @@ static struct i2c_peripheral chromebook_pixel_peripherals[] __initdata = {
>  		.board_info	= {
>  			I2C_BOARD_INFO("atmel_mxt_ts",
>  					ATMEL_TS_I2C_ADDR),
> -			.properties	=
> -				chromebook_atmel_touchscreen_props,
>  			.flags		= I2C_CLIENT_WAKE,
>  		},
>  		.dmi_name	= "touchscreen",
>  		.irqflags	= IRQF_TRIGGER_FALLING,
>  		.type		= I2C_ADAPTER_PANEL,
>  		.alt_addr	= ATMEL_TS_I2C_BL_ADDR,
> +		.properties	= chromebook_atmel_touchscreen_props,
>  	},
>  	/* Touchpad. */
>  	{
>  		.board_info	= {
>  			I2C_BOARD_INFO("atmel_mxt_tp",
>  					ATMEL_TP_I2C_ADDR),
> -			.properties	=
> -				chromebook_pixel_trackpad_props,
>  			.flags		= I2C_CLIENT_WAKE,
>  		},
>  		.dmi_name	= "trackpad",
>  		.irqflags	= IRQF_TRIGGER_FALLING,
>  		.type		= I2C_ADAPTER_VGADDC,
>  		.alt_addr	= ATMEL_TP_I2C_BL_ADDR,
> +		.properties	= chromebook_pixel_trackpad_props,
>  	},
>  	/* Light Sensor. */
>  	{
> @@ -414,8 +429,6 @@ static struct i2c_peripheral acer_c720_peripherals[] __initdata = {
>  		.board_info	= {
>  			I2C_BOARD_INFO("atmel_mxt_ts",
>  					ATMEL_TS_I2C_ADDR),
> -			.properties	=
> -				chromebook_atmel_touchscreen_props,
>  			.flags		= I2C_CLIENT_WAKE,
>  		},
>  		.dmi_name	= "touchscreen",
> @@ -423,6 +436,7 @@ static struct i2c_peripheral acer_c720_peripherals[] __initdata = {
>  		.type		= I2C_ADAPTER_DESIGNWARE,
>  		.pci_devid	= PCI_DEVID(0, PCI_DEVFN(0x15, 0x2)),
>  		.alt_addr	= ATMEL_TS_I2C_BL_ADDR,
> +		.properties	= chromebook_atmel_touchscreen_props,
>  	},
>  	/* Touchpad. */
>  	{
> @@ -498,12 +512,16 @@ static struct acpi_peripheral samus_peripherals[] __initdata = {
>  	/* Touchpad */
>  	{
>  		.hid		= "ATML0000",
> -		.properties	= samus_trackpad_props,
> +		.swnode		= {
> +			.properties = samus_trackpad_props,
> +		},
>  	},
>  	/* Touchsceen */
>  	{
>  		.hid		= "ATML0001",
> -		.properties	= chromebook_atmel_touchscreen_props,
> +		.swnode		= {
> +			.properties = chromebook_atmel_touchscreen_props,
> +		},
>  	},
>  };
>  DECLARE_ACPI_CROS_LAPTOP(samus);
> @@ -512,12 +530,16 @@ static struct acpi_peripheral generic_atmel_peripherals[] __initdata = {
>  	/* Touchpad */
>  	{
>  		.hid		= "ATML0000",
> -		.properties	= chromebook_pixel_trackpad_props,
> +		.swnode		= {
> +			.properties = chromebook_pixel_trackpad_props,
> +		},
>  	},
>  	/* Touchsceen */
>  	{
>  		.hid		= "ATML0001",
> -		.properties	= chromebook_atmel_touchscreen_props,
> +		.swnode		= {
> +			.properties = chromebook_atmel_touchscreen_props,
> +		},
>  	},
>  };
>  DECLARE_ACPI_CROS_LAPTOP(generic_atmel);
> @@ -743,12 +765,11 @@ chromeos_laptop_prepare_i2c_peripherals(struct chromeos_laptop *cros_laptop,
>  		if (error)
>  			goto err_out;
>  
> -		/* We need to deep-copy properties */
> -		if (info->properties) {
> -			info->properties =
> -				property_entries_dup(info->properties);
> -			if (IS_ERR(info->properties)) {
> -				error = PTR_ERR(info->properties);
> +		/* Create primary fwnode for the device - copies everything */
> +		if (i2c_dev->properties) {
> +			info->fwnode = fwnode_create_software_node(i2c_dev->properties, NULL);
> +			if (IS_ERR(info->fwnode)) {
> +				error = PTR_ERR(info->fwnode);
>  				goto err_out;
>  			}
>  		}
> @@ -760,8 +781,8 @@ chromeos_laptop_prepare_i2c_peripherals(struct chromeos_laptop *cros_laptop,
>  	while (--i >= 0) {
>  		i2c_dev = &cros_laptop->i2c_peripherals[i];
>  		info = &i2c_dev->board_info;
> -		if (info->properties)
> -			property_entries_free(info->properties);
> +		if (!IS_ERR_OR_NULL(info->fwnode))
> +			fwnode_remove_software_node(info->fwnode);
>  	}
>  	kfree(cros_laptop->i2c_peripherals);
>  	return error;
> @@ -801,11 +822,11 @@ chromeos_laptop_prepare_acpi_peripherals(struct chromeos_laptop *cros_laptop,
>  		*acpi_dev = *src_dev;
>  
>  		/* We need to deep-copy properties */
> -		if (src_dev->properties) {
> -			acpi_dev->properties =
> -				property_entries_dup(src_dev->properties);
> -			if (IS_ERR(acpi_dev->properties)) {
> -				error = PTR_ERR(acpi_dev->properties);
> +		if (src_dev->swnode.properties) {
> +			acpi_dev->swnode.properties =
> +				property_entries_dup(src_dev->swnode.properties);
> +			if (IS_ERR(acpi_dev->swnode.properties)) {
> +				error = PTR_ERR(acpi_dev->swnode.properties);
>  				goto err_out;
>  			}
>  		}
> @@ -821,8 +842,8 @@ chromeos_laptop_prepare_acpi_peripherals(struct chromeos_laptop *cros_laptop,
>  err_out:
>  	while (--i >= 0) {
>  		acpi_dev = &acpi_peripherals[i];
> -		if (acpi_dev->properties)
> -			property_entries_free(acpi_dev->properties);
> +		if (!IS_ERR_OR_NULL(acpi_dev->swnode.properties))
> +			property_entries_free(acpi_dev->swnode.properties);
>  	}
>  
>  	kfree(acpi_peripherals);
> @@ -833,21 +854,20 @@ static void chromeos_laptop_destroy(const struct chromeos_laptop *cros_laptop)
>  {
>  	const struct acpi_peripheral *acpi_dev;
>  	struct i2c_peripheral *i2c_dev;
> -	struct i2c_board_info *info;
>  	int i;
>  
>  	for (i = 0; i < cros_laptop->num_i2c_peripherals; i++) {
>  		i2c_dev = &cros_laptop->i2c_peripherals[i];
> -		info = &i2c_dev->board_info;
> -
>  		i2c_unregister_device(i2c_dev->client);
> -		property_entries_free(info->properties);
>  	}
>  
>  	for (i = 0; i < cros_laptop->num_acpi_peripherals; i++) {
>  		acpi_dev = &cros_laptop->acpi_peripherals[i];
>  
> -		property_entries_free(acpi_dev->properties);
> +		if (acpi_dev->client)
> +			device_remove_software_node(&acpi_dev->client->dev);
> +
> +		property_entries_free(acpi_dev->swnode.properties);
>  	}
>  
>  	kfree(cros_laptop->i2c_peripherals);
> 
