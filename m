Return-Path: <linux-i2c+bounces-4628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11CA9274AD
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 13:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44F0CB22A7D
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 11:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15AD1AC44E;
	Thu,  4 Jul 2024 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WlRPGV3z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD481AC43F
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jul 2024 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720091498; cv=none; b=OOQU5iGSEROWJGDeYI9GC/0J5nCXk5hvltEa+oCTW/cTfl+aix5ipzYJ0mhr/w5Zda1U4wLY89mAKHLTzPk7qDSHwFsJvV/MVKlkfZRiI1CIsx9DR0qWzT8Nltewx91s5aJOgb7Hkx3X+QtyWBctOZ+pcGINSdUwmdjjfvN5BfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720091498; c=relaxed/simple;
	bh=WQw8r9RJjwmIUuDYeWbYNYJyy4f+vfYAzcLrra92Ov4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ax+C5sEfYnCdHfJwuUjl6fHIo3B04zp8w+0avJ6+NGL5qBLLz+lUOuQzRJRpw50sn3aN49Wcog9ubo0xYy+XPmMXCpTdgCgmK2s4hNcCcFL0g6afbITqUSae2S6ur3a97ojGF7p5BL2nYJU5AQevTIFC1HYT3oNw6sVVmP61rgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WlRPGV3z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720091495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCDrq3It9x4jpjk0zpE93u7BjKvqdC4Uvp72686GGSw=;
	b=WlRPGV3z8WRPBQf797IJtN+wIfBPjZzQpzJmG+XzEJISA0+kuqumjAJPlAEGiIN+79wrf+
	GPxXkgKLG8wkhXDpDsw6xHygDoFOsHmcysN4JvpnPmchJZRS+zHjrPQi33M8LQXDWFvaQO
	d1VufFja0/uGeB9b1cfpJJRxe9L9mfA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-mPiZya5qMIywtq93h37ZTA-1; Thu, 04 Jul 2024 07:11:34 -0400
X-MC-Unique: mPiZya5qMIywtq93h37ZTA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-58b0dce2704so476001a12.1
        for <linux-i2c@vger.kernel.org>; Thu, 04 Jul 2024 04:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091493; x=1720696293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCDrq3It9x4jpjk0zpE93u7BjKvqdC4Uvp72686GGSw=;
        b=hHtgKKlR6BpkQgRhx7Ywr0mKfr8bcLVy4vV8YoYd0+JBiIqV6W5js9jwRzUxI/Ixoz
         VU3WLhxR0qMLlKozRGK55BlfRByma/K+CAPLccJEEU6SrrSwF1SgR47jvpIqT3+wI5kw
         X41xuKaQZXnDMS3UXScGwTVhmqX7DZlu1vhs3yNIHV6Bs/w7v0p40YbRQQgjXIMyhxBk
         x3/cAuwoGcZ5NswH84B9VtWrCZmI574MKtILa8MXjNTvr/V/Q37osTMn70lr8rVPCa3S
         uSMbJrnd59U1qQM2qVWBMpfWtHMIPAZWUCgiqgRhahCgrI6VRX4LnzNvs9Ejt2Q/nRrz
         LteA==
X-Forwarded-Encrypted: i=1; AJvYcCUHbzidxLMEpFI5GNmTjunxo8aIhFKnZGlYPE1dN0KVDzNb8LBiUg56DxMCyO+9nYl+en4lBpbdXOMRmUHp2U++QYLUIjIH2gLw
X-Gm-Message-State: AOJu0YzwErFKNIXUR1BKNSOpIYL8FbtXWiNcOHvHaM4Mj5xzzs1WRcDL
	v6BW+W89/m57X9NjIG7LfPAE8PhgyU//uWOcBur6k1KHpzCS85SKRMu2ja3wkL3NPvZ6YV20taj
	TlX8QK4yHgBfZHinuJftGVWlDCRPkBoAUsscflyr0c7QZUC8uLDdqLHdO1w==
X-Received: by 2002:a05:6402:2548:b0:585:c001:c1b5 with SMTP id 4fb4d7f45d1cf-58e5a6f21bemr1048651a12.5.1720091493371;
        Thu, 04 Jul 2024 04:11:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8N946DgTJMPpq4lGmomXjiNhzaw7NQNW9STH0s63UPb3KH0LnSYptLnDIj7MndtV5BQPjIQ==
X-Received: by 2002:a05:6402:2548:b0:585:c001:c1b5 with SMTP id 4fb4d7f45d1cf-58e5a6f21bemr1048627a12.5.1720091492841;
        Thu, 04 Jul 2024 04:11:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324fe5dsm8340783a12.36.2024.07.04.04.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 04:11:32 -0700 (PDT)
Message-ID: <2fbbdbce-7c88-4d0d-a0c2-f05db67f0f63@redhat.com>
Date: Thu, 4 Jul 2024 13:11:31 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>
Cc: eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
 Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240703110512.21401-1-hdegoede@redhat.com>
 <20240703110512.21401-7-hdegoede@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240703110512.21401-7-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 7/3/24 1:05 PM, Hans de Goede wrote:
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

The discussion about i2c probing in the v4 patch-ser thread made me look
at how the i2c-core handles the probing now a days and it now actually
has a helper to do exactly what this patch is doing, scan a couple of
addresses and instantiate an i2c_client on the first address where
the device is found: i2c_new_scanned_device().

So I plan to do a v6 of the series, updating this patch to use this
helper instead of using DIY code.

Regards,

Hans



> ---
>  drivers/platform/x86/dell/dell-lis3lv02d.c | 136 ++++++++++++++++++++-
>  1 file changed, 133 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
> index ab02ad93758a..5e4b24ec02f1 100644
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
> @@ -57,6 +59,121 @@ static u8 i2c_addr;
>  static struct i2c_client *i2c_dev;
>  static bool notifier_registered;
>  
> +static bool probe_i2c_addr;
> +module_param(probe_i2c_addr, bool, 0444);
> +MODULE_PARM_DESC(probe_i2c_addr, "Probe the i801 I2C bus for the accelerometer on models where the address is unknown, this may be dangerous.");
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
> -	info.addr = i2c_addr;
> +	if (i2c_addr) {
> +		info.addr = i2c_addr;
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
> @@ -167,12 +295,14 @@ static int __init dell_lis3lv02d_init(void)
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
> -	i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
> +	if (lis3lv02d_dmi_id)
> +		i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
>  
>  	/*
>  	 * Register i2c-bus notifier + queue initial scan for lis3lv02d


