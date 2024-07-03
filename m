Return-Path: <linux-i2c+bounces-4603-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF20925AED
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 13:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2FCE1C2482E
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 11:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B99190696;
	Wed,  3 Jul 2024 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d/bYlj8v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22C5173326
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jul 2024 10:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003979; cv=none; b=fwZsgh770NedTStwy8RhIheF9GN9H++SfCgiPstZmNNCjAFlTnscgyHefU5ui07sODrGycD243fCs3cvPOJ9WulLtTIvqeMPvRcvvJUBoyhvU7uet5ozTYkOjEaZ5FqBY6vTJL58857iW8QOWZV/APU2m9rFeHcBMSyOIhE/elQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003979; c=relaxed/simple;
	bh=rrWKqQcCwgANyB6RXLpsvUtv9wlMZXIpBeuNTiU5knE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tx/dwO5Nf9bd7XbepIpSnnQoFd+aWi/r6NHrUlkJ/GM/EQKixVOUpKGfNN0DqIbQbS5nL1yq+K/vPP7mQlCEVDG9D29v+E03//bbGKKc0HlPusB4iBRD2UiwlrWlkDi+e7NlifMXwM5l39Se/6mIuz9a5i0eAuppbwjh7r7mhGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d/bYlj8v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720003976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KKGCyrXLUd3Y2e4WplnadPN0ks17a7YcKmTt/1KijD0=;
	b=d/bYlj8vLexXdpcnpvfUw8/xrV+DMKleMwlVJpOgUjA/z35T0paTCFYtlCng4yhhJ+FaGV
	8zW0ef6c0OD17NJX4O96NPe00Rk4aPZXHrNKYYxcS+hmGlaLWk8upIjAG3mrmv/rrhS6SO
	KIoVKdSAgUfsbTBhfHN4+sAYFNIpJRM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-EiQKjxo7MyWEhOOtXXOG8Q-1; Wed, 03 Jul 2024 06:52:55 -0400
X-MC-Unique: EiQKjxo7MyWEhOOtXXOG8Q-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-58c4f94b57cso827698a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 03 Jul 2024 03:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003974; x=1720608774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKGCyrXLUd3Y2e4WplnadPN0ks17a7YcKmTt/1KijD0=;
        b=tUvwdHKWXdaMdoh5BEM6prOC+5IiGH7N2SCgBkCXkHctMPOoVdIRKS3cYltojMy62L
         9kMEPX3UwVTUrJH1qNgsumoV/KgJJCgsQB84Od2SfsC35R2liHI4TY1ldCtGROt2qLyY
         t96ozmnTAYaFa76zRZdUPUpQWyBHk8rtoCw6FGG9nn7Sd0GwvI3z678jmrQa2MFlGc4y
         7/QsmtJ8k9t361n1kxRczXlIsT7SL0PA4ner5jeKN1QQIfsq9E+JglhZzX1KI8rt/Pql
         /h11uX8/ux+7e6opHaDaR/vVK2mojx8snRhCFIYMgHtMchAOlNYn4K/S149kwYa7Xb1C
         J/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTcT/h40v6KvS0bC6hQj6hYHc/UuqcAjfpUsnHuy1NL7p0hoRqEeT2JxK2DrWc7pjuRq5gu3o/be8fTBVQePHJoDeTVKyw8rNo
X-Gm-Message-State: AOJu0Yym/fvhqmejZAnYNOm8dl7LF/cT2yTn8yJ4zYuXwWiyZl58TPA8
	ebkw0ol6GkGssX+KAxq5gVIaSNrzk1Vo/8B0N20cGWjOLkfmdyje5ED6oyYJMm28uI89zIr2YZD
	jSXokQWHiImIrosNzcG0J09JpGgb12/NnGmRDh1WzsCTOHPSyvSEbcJWoQA==
X-Received: by 2002:a05:6402:26d3:b0:57d:4b7:a8d8 with SMTP id 4fb4d7f45d1cf-5879f5a2b52mr9497708a12.25.1720003974396;
        Wed, 03 Jul 2024 03:52:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZyHRI4ZlxwpgAGUfTfLeU+aaM5z/uRUDheXnAfD3EY0kmhOop+337i+vFYMRZPoFx1f7Uvg==
X-Received: by 2002:a05:6402:26d3:b0:57d:4b7:a8d8 with SMTP id 4fb4d7f45d1cf-5879f5a2b52mr9497691a12.25.1720003973950;
        Wed, 03 Jul 2024 03:52:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58d50c4dad9sm291977a12.10.2024.07.03.03.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:52:53 -0700 (PDT)
Message-ID: <5f1a518e-5262-42fa-a21a-e54d8cb1bee1@redhat.com>
Date: Wed, 3 Jul 2024 12:52:52 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240624111519.15652-1-hdegoede@redhat.com>
 <20240624111519.15652-7-hdegoede@redhat.com>
 <20240624182106.r5upljyt46jv2mgm@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240624182106.r5upljyt46jv2mgm@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 6/24/24 8:21 PM, Pali Rohár wrote:
> On Monday 24 June 2024 13:15:18 Hans de Goede wrote:
>> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
>> of the accelerometer. So a DMI product-name to address mapping table
>> is used.
>>
>> At support to have the kernel probe for the i2c-address for modesl
>> which are not on the list.
>>
>> The new probing code sits behind a new probe_i2c_addr module parameter,
>> which is disabled by default because probing might be dangerous.
>>
>> Link: https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> My comments from the previous version still apply there. There is no
> dangerous warning neither in parameter name and its description, there
> is no warning once the parameter was specified.

I have added the same "this may be dangerous" text from:

  pr_info("Pass dell_lis3lv02d.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");

to the MODULE_PARM_DESC() now too (for v5).

> And there is missing
> information from Dell how it is going to be handled for new
> machines. So first ask Dell about the current state and future.

As mentioned before Dell is on the Cc. And I no longer have any direct
contacts inside Dell. If you know anyone inside Dell feel free to email
them about this.

Regards,

Hans



>> ---
>>  drivers/platform/x86/dell/dell-lis3lv02d.c | 133 ++++++++++++++++++++-
>>  1 file changed, 131 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
>> index a7409db0505b..173615fd2646 100644
>> --- a/drivers/platform/x86/dell/dell-lis3lv02d.c
>> +++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
>> @@ -15,6 +15,8 @@
>>  #include <linux/workqueue.h>
>>  #include "dell-smo8800-ids.h"
>>  
>> +#define LIS3_WHO_AM_I 0x0f
>> +
>>  #define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr)                 \
>>  	{                                                                \
>>  		.matches = {                                             \
>> @@ -57,6 +59,121 @@ static const struct dmi_system_id *lis3lv02d_dmi_id;
>>  static struct i2c_client *i2c_dev;
>>  static bool notifier_registered;
>>  
>> +static bool probe_i2c_addr;
>> +module_param(probe_i2c_addr, bool, 0444);
>> +MODULE_PARM_DESC(probe_i2c_addr, "Probe the i801 I2C bus for the accelerometer on models where the address is unknown");
>> +
>> +/*
>> + * This is the kernel version of the single register device sanity checks from
>> + * the i2c_safety_check function from lm_sensors sensor-detect script:
>> + * This is meant to prevent access to 1-register-only devices,
>> + * which are designed to be accessed with SMBus receive byte and SMBus send
>> + * byte transactions (i.e. short reads and short writes) and treat SMBus
>> + * read byte as a real write followed by a read. The device detection
>> + * routines would write random values to the chip with possibly very nasty
>> + * results for the hardware. Note that this function won't catch all such
>> + * chips, as it assumes that reads and writes relate to the same register,
>> + * but that's the best we can do.
>> + */
>> +static int i2c_safety_check(struct i2c_adapter *adap, u8 addr)
>> +{
>> +	union i2c_smbus_data smbus_data;
>> +	int err;
>> +	u8 data;
>> +
>> +	/*
>> +	 * First receive a byte from the chip, and remember it. This
>> +	 * also checks if there is a device at the address at all.
>> +	 */
>> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
>> +			     I2C_SMBUS_BYTE, &smbus_data);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	data = smbus_data.byte;
>> +
>> +	/*
>> +	 * Receive a byte again; very likely to be the same for
>> +	 * 1-register-only devices.
>> +	 */
>> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, 0,
>> +			     I2C_SMBUS_BYTE, &smbus_data);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	if (smbus_data.byte != data)
>> +		return 0; /* Not a 1-register-only device. */
>> +
>> +	/*
>> +	 * Then try a standard byte read, with a register offset equal to
>> +	 * the read byte; for 1-register-only device this should read
>> +	 * the same byte value in return.
>> +	 */
>> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, data,
>> +			     I2C_SMBUS_BYTE_DATA, &smbus_data);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	if (smbus_data.byte != data)
>> +		return 0; /* Not a 1-register-only device. */
>> +
>> +	/*
>> +	 * Then try a standard byte read, with a slightly different register
>> +	 * offset; this should again read the register offset in return.
>> +	 */
>> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, data ^ 0x01,
>> +			     I2C_SMBUS_BYTE_DATA, &smbus_data);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	if (smbus_data.byte != (data ^ 0x01))
>> +		return 0; /* Not a 1-register-only device. */
>> +
>> +	/*
>> +	 * Apparently this is a 1-register-only device, restore the original
>> +	 * register value and leave it alone.
>> +	 */
>> +	i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_WRITE, data,
>> +		       I2C_SMBUS_BYTE, NULL);
>> +	pr_warn("I2C safety check for address 0x%02x failed, skipping\n", addr);
>> +	return -ENODEV;
>> +}
>> +
>> +static int detect_lis3lv02d(struct i2c_adapter *adap, u8 addr,
>> +			    struct i2c_board_info *info)
>> +{
>> +	union i2c_smbus_data smbus_data;
>> +	int err;
>> +
>> +	pr_info("Probing for lis3lv02d on address 0x%02x\n", addr);
>> +	err = i2c_safety_check(adap, addr);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
>> +			     I2C_SMBUS_BYTE_DATA, &smbus_data);
>> +	if (err < 0) {
>> +		pr_warn("Failed to read who-am-i register: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	/* valid who-am-i values are from drivers/misc/lis3lv02d/lis3lv02d.c */
>> +	switch (smbus_data.byte) {
>> +	case 0x32:
>> +	case 0x33:
>> +	case 0x3a:
>> +	case 0x3b:
>> +		break;
>> +	default:
>> +		pr_warn("Unknown who-am-i register value 0x%02x\n", smbus_data.byte);
>> +		return -ENODEV;
>> +	}
>> +
>> +	pr_debug("Detected lis3lv02d on address 0x%02x\n", addr);
>> +	info->addr = addr;
>> +	return 0;
>> +}
>> +
>>  static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
>>  {
>>  	/*
>> @@ -93,7 +210,17 @@ static void instantiate_i2c_client(struct work_struct *work)
>>  	if (!adap)
>>  		return;
>>  
>> -	info.addr = (long)lis3lv02d_dmi_id->driver_data;
>> +	if (lis3lv02d_dmi_id) {
>> +		info.addr = (long)lis3lv02d_dmi_id->driver_data;
>> +	} else {
>> +		/* First try address 0x29 (most used) and then try 0x1d */
>> +		if (detect_lis3lv02d(adap, 0x29, &info) != 0 &&
>> +		    detect_lis3lv02d(adap, 0x1d, &info) != 0) {
>> +			pr_warn("failed to probe for lis3lv02d I2C address\n");
>> +			goto out_put_adapter;
>> +		}
>> +	}
>> +
>>  	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
>>  
>>  	i2c_dev = i2c_new_client_device(adap, &info);
>> @@ -104,6 +231,7 @@ static void instantiate_i2c_client(struct work_struct *work)
>>  		pr_debug("registered lis3lv02d on address 0x%02x\n", info.addr);
>>  	}
>>  
>> +out_put_adapter:
>>  	i2c_put_adapter(adap);
>>  }
>>  static DECLARE_WORK(i2c_work, instantiate_i2c_client);
>> @@ -166,8 +294,9 @@ static int __init dell_lis3lv02d_init(void)
>>  	put_device(dev);
>>  
>>  	lis3lv02d_dmi_id = dmi_first_match(lis3lv02d_devices);
>> -	if (!lis3lv02d_dmi_id) {
>> +	if (!lis3lv02d_dmi_id && !probe_i2c_addr) {
>>  		pr_warn("accelerometer is present on SMBus but its address is unknown, skipping registration\n");
>> +		pr_info("Pass dell_lis3lv02d.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
>>  		return 0;
>>  	}
>>  
>> -- 
>> 2.45.1
>>
> 


