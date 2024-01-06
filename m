Return-Path: <linux-i2c+bounces-1190-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 780698260A5
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 17:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DA97B21B89
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 16:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340F68493;
	Sat,  6 Jan 2024 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c95FRdAR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB74F8831;
	Sat,  6 Jan 2024 16:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E50C433C8;
	Sat,  6 Jan 2024 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704559114;
	bh=TjwrNwZ8lUfky7WHmV+GMc9NZPKkTAiRV6Jb5OrwVQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c95FRdARmQ9/4bELt5BfAHzIRbVoFh0WfDKCPvsA3cMjPFBI5Jmei8SSMzwmRMKxE
	 LSXlzxr17Efla0kVPWW/6DY0o6/C9QN9PnqtOq3RgbiLh5hCDcsq996UjAZKC9ar7r
	 Q3A7jPnDdA3ORrxzCtUTeZ/3PTM6oJRStj9y4nZ6XKMnFrCTeMe6+sPMC2lFOlHjWC
	 ezCukF5niGH+xjs++y9Cp+P7dVeNmvY19NhGZGTo3QfMko0o+e7drZONUAK3ZtBEoj
	 EU5rOYWZLeYwDUDRNR4NWUhQ9BoKNt/GURQl4uqm46jqHH49Su434EDEEmXcd976n1
	 FBN2I6R8bb5Tg==
Received: by pali.im (Postfix)
	id 36F8988D; Sat,  6 Jan 2024 17:38:31 +0100 (CET)
Date: Sat, 6 Jan 2024 17:38:31 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240106163831.s26aegqm3u7xvood@pali>
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240106160935.45487-3-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 06 January 2024 17:09:29 Hans de Goede wrote:
> +/*
> + * Accelerometer's I2C address is not specified in DMI nor ACPI,
> + * so it is needed to define mapping table based on DMI product names.
> + */
> +static const struct {
> +	const char *dmi_product_name;
> +	unsigned short i2c_addr;
> +} dell_lis3lv02d_devices[] = {
> +	/*
> +	 * Dell platform team told us that these Latitude devices have
> +	 * ST microelectronics accelerometer at I2C address 0x29.
> +	 */
> +	{ "Latitude E5250",     0x29 },
> +	{ "Latitude E5450",     0x29 },
> +	{ "Latitude E5550",     0x29 },
> +	{ "Latitude E6440",     0x29 },
> +	{ "Latitude E6440 ATG", 0x29 },
> +	{ "Latitude E6540",     0x29 },
> +	/*
> +	 * Additional individual entries were added after verification.
> +	 */
> +	{ "Latitude 5480",      0x29 },
> +	{ "Vostro V131",        0x1d },
> +	{ "Vostro 5568",        0x29 },
> +};
> +
> +static void smo8800_instantiate_i2c_client(struct smo8800_device *smo8800)
> +{
> +	struct i2c_board_info info = { };
> +	struct i2c_adapter *adap = NULL;
> +	const char *dmi_product_name;
> +	u8 addr = 0;
> +	int i;
> +
> +	bus_for_each_dev(&i2c_bus_type, NULL, &adap, smo8800_find_i801);
> +	if (!adap)
> +		return;
> +
> +	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
> +	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {

Before doing this array iteration it is needed to check for Dell vendor
like it was before:

       if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
               return false;

Or put vendor name into the devices list and check for it (in case you
want to extend list also for non-Dell machines).

> +		if (strcmp(dmi_product_name,
> +			   dell_lis3lv02d_devices[i].dmi_product_name) == 0) {
> +			addr = dell_lis3lv02d_devices[i].i2c_addr;
> +			break;
> +		}
> +	}
> +
> +	if (!addr) {
> +		dev_warn(smo8800->dev,
> +			 "Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration\n");
> +		goto put_adapter;
> +	}
> +
> +	info.addr = addr;
> +	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
> +
> +	smo8800->i2c_dev = i2c_new_client_device(adap, &info);
> +	if (IS_ERR(smo8800->i2c_dev)) {
> +		dev_err_probe(smo8800->dev, PTR_ERR(smo8800->i2c_dev),
> +			      "registering accel i2c_client\n");
> +		smo8800->i2c_dev = NULL;
> +	} else {
> +		dev_info(smo8800->dev, "Registered %s accelerometer on address 0x%02x\n",
> +			 info.type, info.addr);
> +	}
> +put_adapter:
> +	i2c_put_adapter(adap);
> +}
> +
>  static int smo8800_probe(struct platform_device *device)
>  {
>  	int err;
> @@ -126,10 +237,12 @@ static int smo8800_probe(struct platform_device *device)
>  		return err;
>  	smo8800->irq = err;
>  
> +	smo8800_instantiate_i2c_client(smo8800);

Now after looking at this change again I see there a problem. If i2c-801
driver initialize i2c-801 device after this smo8800 is called then
accelerometer i2c device would not happen.

Also it has same problem if PCI i801 device is reloaded or reset.

With the current approach this was not an issue as during i801
initialization was smo i2c device automatically created and lis driver
was able to bind and initialize it at any time.

Before parent driver created its own direct children devices. After this
change, the child driver is trying to find who is the parent of its
device and injects its device to the parent in the device tree
hierarchy.

> +
>  	err = misc_register(&smo8800->miscdev);
>  	if (err) {
>  		dev_err(&device->dev, "failed to register misc dev: %d\n", err);
> -		return err;
> +		goto error_unregister_i2c_client;
>  	}
>  
>  	err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
> @@ -150,6 +263,8 @@ static int smo8800_probe(struct platform_device *device)
>  
>  error:
>  	misc_deregister(&smo8800->miscdev);
> +error_unregister_i2c_client:
> +	i2c_unregister_device(smo8800->i2c_dev);
>  	return err;
>  }
>  
> @@ -160,9 +275,9 @@ static void smo8800_remove(struct platform_device *device)
>  	free_irq(smo8800->irq, smo8800);
>  	misc_deregister(&smo8800->miscdev);
>  	dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
> +	i2c_unregister_device(smo8800->i2c_dev);
>  }
>  
> -/* NOTE: Keep this list in sync with drivers/i2c/busses/i2c-i801.c */
>  static const struct acpi_device_id smo8800_ids[] = {
>  	{ "SMO8800", 0 },
>  	{ "SMO8801", 0 },
> @@ -189,3 +304,5 @@ module_platform_driver(smo8800_driver);
>  MODULE_DESCRIPTION("Dell Latitude freefall driver (ACPI SMO88XX)");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Sonal Santan, Pali Rohár");
> +/* Ensure the i2c-801 driver is loaded for i2c_client instantiation */
> +MODULE_SOFTDEP("pre: i2c-i801");
> -- 
> 2.43.0
> 

