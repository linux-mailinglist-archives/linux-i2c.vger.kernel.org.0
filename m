Return-Path: <linux-i2c+bounces-4263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B368913514
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 18:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AC8BB23A68
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 16:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E566416FF48;
	Sat, 22 Jun 2024 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfy/2wyo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26401DDC5;
	Sat, 22 Jun 2024 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719074122; cv=none; b=jg7WEJut9L+W89jm+wFHWyaV/tkEnIHs5fARF50pXnbFPvYtScSt0tb51dNRqcKHRFGPG76tMkdjFOk/+cEgBuaJh4885NqIGfoZGxDSZVFBsSZM1b+O8FdSlfdlm7uVSLezOHjpFP7C2hHVSNOQ5bpK0D5W0eu9EHGf3PLL+Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719074122; c=relaxed/simple;
	bh=7LBPusU8uReZe5stg/Mn/ue2ly+TQldn0siBL1nXRQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctJf2IuoRyL7nsF+8vN4RXOc8cfosUBbKypQ+MCgG5slHvlI1b9UK8EUhCkm4BaVd5qzjGxfdN3hSptAQ6yBP4okovstbCM+f6xcYtX+FQXrKJDYWbDq8FqSZgjJ8bOFq8kwz3tEk/Zi4ZEn3YbZoYaX+QyJjfYwgwKuBIqgJu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfy/2wyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F15C3277B;
	Sat, 22 Jun 2024 16:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719074122;
	bh=7LBPusU8uReZe5stg/Mn/ue2ly+TQldn0siBL1nXRQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfy/2wyoyMPfZChjf5oQTydfhgXaJtwv19S8O1nF7MOU9jj/b06OoJjEr1yPU57VC
	 8YsYqVPef+oxJhvCd+a+tS7JjF7vYAWndqbmPtsuAHWS3qrtVCQH4koAMjBFGor3Ie
	 fZsZy9WAjmytwmCXofS1wsCKhJxuK8b7WRcC5f/z5i4IlR3Uim3v8dxW4TJM6ZyHBW
	 BeVyKi/LWb09djbcs2UzwMkPdZwVWH1h+eCwcPBpenGOJ8+V+968M8ofHetiIvJNGL
	 3o/eL5wMg1m9pJhbf/i8EyOtlcupmOwCkcrNJjRzKCvCQhj8iBCG0xrcGwvp02lU4Y
	 0odzzq4yfc+XA==
Received: by pali.im (Postfix)
	id C08E0BF5; Sat, 22 Jun 2024 18:35:18 +0200 (CEST)
Date: Sat, 22 Jun 2024 18:35:18 +0200
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
Message-ID: <20240622163518.rfm2wa2kzucy7in4@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali>
 <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali>
 <b76dc029-ded0-4911-92ee-ab46351105cc@redhat.com>
 <20240622151250.zvli73oxqmbsd3n4@pali>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240622151250.zvli73oxqmbsd3n4@pali>
User-Agent: NeoMutt/20180716

On Saturday 22 June 2024 17:12:50 Pali Rohár wrote:
> On Saturday 22 June 2024 16:26:13 Hans de Goede wrote:
> > Hi Pali,
> > 
> > On 6/22/24 4:20 PM, Pali Rohár wrote:
> > > On Saturday 22 June 2024 16:06:01 Hans de Goede wrote:
> > >> Hi Pali,
> > >>
> > >> On 6/22/24 3:16 PM, Pali Rohár wrote:
> > >>> On Friday 21 June 2024 14:24:58 Hans de Goede wrote:
> > >>>> It is not necessary to handle the Dell specific instantiation of
> > >>>> i2c_client-s for SMO88xx ACPI devices without an ACPI I2cResource
> > >>>> inside the generic i801 I2C adapter driver.
> > >>>>
> > >>>> The kernel already instantiates platform_device-s for these ACPI devices
> > >>>> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
> > >>>> platform drivers.
> > >>>>
> > >>>> Move the i2c_client instantiation from the generic i2c-i801 driver to
> > >>>> the SMO88xx specific dell-smo8800 driver.
> > >>>
> > >>> Why it has to be in dell-smo8800 driver? Code for registering lis3lv02d
> > >>> and freefall code for smo88xx are basically independent.
> > >>>
> > >>> lis3lv02d is for accelerometer axes and smo88xx is for freefall hardisk
> > >>> detection. The only thing which have these "drivers" common is the ACPI
> > >>> detection mechanism based on presence of SMO88?? identifiers from
> > >>> acpi_smo8800_ids[] array.
> > >>>
> > >>> I think it makes both "drivers" cleaner if they are put into separate
> > >>> files as they are independent of each one.
> > >>>
> > >>> What about moving it into drivers/platform/x86/dell/dell-lis3lv02d.c
> > >>> instead (or similar name)? And just share list of ACPI ids via some
> > >>> header file (or something like that).
> > >>
> > >> Interesting idea, but that will not work, only 1 driver can bind to
> > >> the platform_device instantiated by the ACPI code for the SMO88xx ACPI device.
> > > 
> > > And it is required to bind lis3 device to ACPI code? What is needed is
> > > just to check if system matches DMI strings and ACPI strings. You are
> > > not binding device to DMI strings, so I think there is no need to bind
> > > it neither to ACPI strings.
> > 
> > The driver needs to bind to something ...
> 
> Why?
> 
> Currently in i2c-i801.c file was called just
> register_dell_lis3lv02d_i2c_device() function and there was no binding
> to anything, no binding to DMI structure and neither no binding to ACPI
> structures.
> 
> And if I'm looking correctly at your new function
> smo8800_instantiate_i2c_client() it does not bind device neither.
> And smo8800_i2c_bus_notify() does not depend on binding.
> 
> So I do not see where is that binding requirement.

Now I have tried to do it, to move code into dell-lis3lv02d.c file.

Below is example how it could look like. I reused most of your code.
I have not tested it. It is just an idea.


#include <linux/acpi.h>
#include <linux/dmi.h>
#include <linux/i2c.h>
#include <linux/module.h>
#include <linux/notifier.h>
#include <linux/workqueue.h>

static struct work_struct dell_lis3lv02d_i2c_work;
static struct i2c_client *dell_lis3lv02d_i2c_dev;
static unsigned short dell_lis3lv02d_i2c_addr;

static int dell_lis3lv02d_find_i801(struct device *dev, void *data)
{
	struct i2c_adapter *adap, **adap_ret = data;

	adap = i2c_verify_adapter(dev);
	if (!adap)
		return 0;

	if (!strstarts(adap->name, "SMBus I801 adapter"))
		return 0;

	*adap_ret = i2c_get_adapter(adap->nr);
	return 1;
}

static void dell_lis3lv02d_instantiate_i2c_client(struct work_struct *work)
{
	struct i2c_board_info info = { };
	struct i2c_adapter *adap = NULL;
	struct i2c_client *client;

	if (dell_lis3lv02d_i2c_dev)
		return;

	bus_for_each_dev(&i2c_bus_type, NULL, &adap, dell_lis3lv02d_find_i801);
	if (!adap)
		return;

	info.addr = dell_lis3lv02d_i2c_addr;
	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);

	client = i2c_new_client_device(adap, &info);
	if (IS_ERR(client)) {
		pr_err("error %ld registering %s i2c_client\n",
			PTR_ERR(client), info.type);
		return;
	}

	dell_lis3lv02d_i2c_dev = client;

	pr_err("registered %s i2c_client on address 0x%02x\n",
		info.type, info.addr);
}

static int dell_lis3lv02d_i2c_bus_notify(struct notifier_block *nb,
					 unsigned long action, void *data)
{
	struct device *dev = data;
	struct i2c_client *client;
	struct i2c_adapter *adap;

	switch (action) {
	case BUS_NOTIFY_ADD_DEVICE:
		adap = i2c_verify_adapter(dev);
		if (!adap)
			break;

		if (strstarts(adap->name, "SMBus I801 adapter"))
			queue_work(system_long_wq, &dell_lis3lv02d_i2c_work);
		break;
	case BUS_NOTIFY_REMOVED_DEVICE:
		client = i2c_verify_client(dev);
		if (!client)
			break;

		if (dell_lis3lv02d_i2c_dev == client) {
			pr_debug("accelerometer i2c_client removed\n");
			dell_lis3lv02d_i2c_dev = NULL;
		}
		break;
	default:
		break;
	}

	return 0;
}

// TODO: move this array into dell-smo8800.h header file
static const char *const acpi_smo8800_ids[] __initconst = {
	"SMO8800",
	"SMO8801",
	"SMO8810",
	"SMO8811",
	"SMO8820",
	"SMO8821",
	"SMO8830",
	"SMO8831",
};

static acpi_status __init check_acpi_smo88xx_device(acpi_handle obj_handle,
					     u32 nesting_level,
					     void *context,
					     void **return_value)
{
	struct acpi_device_info *info;
	acpi_status status;
	char *hid;
	int i;

	status = acpi_get_object_info(obj_handle, &info);
	if (ACPI_FAILURE(status))
		return AE_OK;

	if (!(info->valid & ACPI_VALID_HID))
		goto smo88xx_not_found;

	hid = info->hardware_id.string;
	if (!hid)
		goto smo88xx_not_found;

	i = match_string(acpi_smo8800_ids, ARRAY_SIZE(acpi_smo8800_ids), hid);
	if (i < 0)
		goto smo88xx_not_found;

	kfree(info);

	*return_value = NULL;
	return AE_CTRL_TERMINATE;

smo88xx_not_found:
	kfree(info);
	return AE_OK;
}

static bool __init has_acpi_smo88xx_device(void)
{
	void *err = ERR_PTR(-ENOENT);

	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &err);
	return !IS_ERR(err);
}

/*
 * Accelerometer's I2C address is not specified in DMI nor ACPI,
 * so it is needed to define mapping table based on DMI product names.
 */
static const struct dmi_system_id dell_lis3lv02d_devices[] __initconst = {
	/*
	 * Dell platform team told us that these Latitude devices have
	 * ST microelectronics accelerometer at I2C address 0x29.
	 */
	{
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5250"),
		},
		.driver_data = (void *)0x29,
	},
	{
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5450"),
		},
		.driver_data = (void *)0x29,
	},
	{
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5550"),
		},
		.driver_data = (void *)0x29,
	},
	{
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440"),
		},
		.driver_data = (void *)0x29,
	},
	{
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440 ATG"),
		},
		.driver_data = (void *)0x29,
	},
	{
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6540"),
		},
		.driver_data = (void *)0x29,
	},
	/*
	 * Additional individual entries were added after verification.
	 */
	{
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude 5480"),
		},
		.driver_data = (void *)0x29,
	},
	{
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Precision 3540"),
		},
		.driver_data = (void *)0x29,
	},
	{
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
		},
		.driver_data = (void *)0x1d,
	},
	{
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 5568"),
		},
		.driver_data = (void *)0x29,
	},
	{
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 7590"),
		},
		.driver_data = (void *)0x29,
	},
	{ }
};
MODULE_DEVICE_TABLE(dmi, dell_lis3lv02d_devices);

static struct notifier_block dell_lis3lv02d_i2c_nb = {
	.notifier_call = dell_lis3lv02d_i2c_bus_notify,
};

static int __init dell_lis3lv02d_init(void)
{
	const struct dmi_system_id *lis3lv02d_dmi_id;
	int err;

	if (!has_acpi_smo88xx_device())
		return -ENODEV;

	lis3lv02d_dmi_id = dmi_first_match(dell_lis3lv02d_devices);
	if (!lis3lv02d_dmi_id)
		return -ENODEV;

	dell_lis3lv02d_i2c_addr = (uintptr_t)lis3lv02d_dmi_id->driver_data;

	err = bus_register_notifier(&i2c_bus_type, &dell_lis3lv02d_i2c_nb);
	if (err)
		return err;

	INIT_WORK(&dell_lis3lv02d_i2c_work, dell_lis3lv02d_instantiate_i2c_client);
	queue_work(system_long_wq, &dell_lis3lv02d_i2c_work);

	return 0;
}

static void __exit dell_lis3lv02d_exit(void)
{
	bus_unregister_notifier(&i2c_bus_type, &dell_lis3lv02d_i2c_nb);
	cancel_work_sync(&dell_lis3lv02d_i2c_work);
	if (dell_lis3lv02d_i2c_dev)
		i2c_unregister_device(dell_lis3lv02d_i2c_dev);
}

module_init(dell_lis3lv02d_init);
module_exit(dell_lis3lv02d_exit);

MODULE_LICENSE("GPL");

