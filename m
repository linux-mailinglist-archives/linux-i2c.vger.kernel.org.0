Return-Path: <linux-i2c+bounces-4654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC13292827E
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 09:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04C451C23E1B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 07:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376D1144D13;
	Fri,  5 Jul 2024 07:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V19dC79v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4B9143894
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jul 2024 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720163437; cv=none; b=ULIOxYXWc0gFx8Oe0jMAb78nPhmPlpuGHZItNhtyZCdQIcuN3l9A/8oHnCVKuiRPBWswupNJceN9ib+SaLft6V1ZQlyzrNYQy0IabXk1vUPsW6GxYR+mBzq5Y4djcVpbESgbTDhtgDbdiOpACzJebAYygDslo7p9QrzFG70nUok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720163437; c=relaxed/simple;
	bh=1nMddftKdpnDP0X7aCCH1ArTl3o3jqzVnCTw6hOORN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P6LoUeYTgD48l1Wd9eJnv2eQxWFu6SNCGzK9YqBlEteSsIJWyfQ+23hlSdvK01f8WmwIIpMceIGyZhyRuy61kjUqPi23ufvG3GP0OhYF6MSP9wuVhVTxiOVEet9rqZbz2MhSf3hAnBFJrs2e/eXdLdHfv28HMOGf6fJgsuhkIx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V19dC79v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720163433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqiFgHsVqj2MOxTGHjtVg9cbGDLNX96hL+N/xqbD5gE=;
	b=V19dC79vVaF5Qaz6SzMoGjVag8i212l0FwsZnAaWk/3PhAxykIndNSoFfERb6toPXubXHL
	7+N+jnWJ6MQzAg1V/H7POcNLS7H7vCHZF6gz5gsxAQZMcyJuQmwCwuLVifhBpmsDMBpTi7
	9VuCX6EdMkiLmyVhEYw8/FUHLp99f8I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-qOlCi-jWN4C9TRJMGxnVGA-1; Fri, 05 Jul 2024 03:10:31 -0400
X-MC-Unique: qOlCi-jWN4C9TRJMGxnVGA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-58c08df32e7so1105553a12.2
        for <linux-i2c@vger.kernel.org>; Fri, 05 Jul 2024 00:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720163430; x=1720768230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqiFgHsVqj2MOxTGHjtVg9cbGDLNX96hL+N/xqbD5gE=;
        b=b7x8FzYXGwQMB4f+/+AHn1D7o2yIy+FSlOQ5d45W0eD3KIxxgLJndCacTnpdvdiu+T
         LEZnTe3PczyCGWriNjZn++8Cl7kGhU9gGNqf+Mbx5tAVFLnQy9ZP3MYGFN0yLeVphz2I
         C0nww0iVY3OM7BOe30SkqGSZS/X69pDmpLKOt2uXhCt4bRLCuDvOLEuB8aA83iDSWVEo
         wMcc/q8Rl7TMTknQRT2KdhpJ6qFJsYVO97/JIVM0vsi5DA53miRqJO6DfuPiY1dRI6Gw
         oi2r4yewt16pQu1hnu4Aujh7z2cBNmOR9U84UWziVULBZaZXPh/Zk12Jtmmg80fK8smH
         deFA==
X-Forwarded-Encrypted: i=1; AJvYcCUegv6frrRYu7HplPmVKOAJa+qe/z9HG7iQEdvm/m+48a893YYKSdQHlusbuJlyPcDtUWD3lBS+rh4bRea9hrqUaft4xKqxn6Ud
X-Gm-Message-State: AOJu0YxFbbeZhUfFPteu/rs68XfbSDEPseBczI8vQRGtBO99d1Fp1GO7
	F7+EaPBW4tSinl4PsRT46mRtQlTdVA/X7DJ+fNUzynl2a8C1yXX72kRt7v0m9NJTIqOr87dKe4t
	PIe5U0J5GBIHHK/BF+gWLf59GY+iixyw6RRuwfscXQBeY8rfGlBxlorggSw==
X-Received: by 2002:aa7:c889:0:b0:58b:db7c:93cd with SMTP id 4fb4d7f45d1cf-58e5cd17427mr2204811a12.36.1720163429744;
        Fri, 05 Jul 2024 00:10:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwq2AR24siofhy5MW/93mW8jKB7HwcHUqwiMZzZ0uidPzWQLvoe7V3iaiBeLX65mqbe1CbPA==
X-Received: by 2002:aa7:c889:0:b0:58b:db7c:93cd with SMTP id 4fb4d7f45d1cf-58e5cd17427mr2204791a12.36.1720163429164;
        Fri, 05 Jul 2024 00:10:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58fefca76d0sm225005a12.2.2024.07.05.00.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 00:10:28 -0700 (PDT)
Message-ID: <a5d98a55-c014-4019-b40e-c832500bcf5a@redhat.com>
Date: Fri, 5 Jul 2024 09:10:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240704125643.22946-1-hdegoede@redhat.com>
 <20240704125643.22946-7-hdegoede@redhat.com>
 <20240704213701.gtkgfnmahgeridir@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240704213701.gtkgfnmahgeridir@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 7/4/24 11:37 PM, Pali Rohár wrote:
> On Thursday 04 July 2024 14:56:43 Hans de Goede wrote:
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
> NAK.
> 
> This is a hack

This is not a hack, notice the existing i2c_new_scanned_device() i2c-core
function exists for a reason. As I have tried to explain before scanning
for i2c-devices if we don't know the address is something which the kernel
has been doing for a long time already.

Current kernels scan for i2c devices on pretty much any Intel PC in the form
of i2c_register_spd() running.

>, which should be avoided as specified in previous
> discussions (e.g. it can cause regression for future or also existing
> products).

You have provided 0 proof or even any hypothesis / speculations how this can
cause regressions. Al you have done is said this may cause regressions
without providing any details as to how you believe this would cause
regressions please provide details.

Also the new code is only activated if a new module option is st. By default
this options is not set, so this cannot cause any regressions since it
does not change anything for end users unless they explicitly enable it.

You have made it plenty clear that you don't like this approach, but
claiming it can cause regressions when by default it does not do anything
is just dishonest.

> Author refused to improve the code,

Really? I have gone out of my way to please you, I've moved all of the i2c
handling to a separate file because you asked for this, adding a text to
both the kernel message informing users about the module-parameter to
probe and the module-param help text that this may be dangerous.

Also after I last discussion I moved to i2c_new_scanned_device() instead
of DIY code. There is a reason why this patch-set is at v6 and it is not
because I'm refusing to improve it.

> also refused to ask vendor about the
> details and proper implementation and author also refused to do any
> future discussion about it.

As I have explained countless times I have no contacts inside Dell
to ask about this. If e.g. Mario was still at Dell I would have asked
Mario about this immediately back when the discussion started.

Besides the Dell.Client.Kernel@dell.com which no-one seems to be
reading, there is only one other @dell.com address in all of MAINTAINERS:
Prasanth Ksr <prasanth.ksr@dell.com>

To put an end to this whole discussion about contacting Dell I'll email
them with you (Pali) in the Cc. I don't expect much to come from this
but we will see.

> Based on this state, this patch 6/6 should not be merged at all.

Lets move forward with merging patches 1-5 and wait to see if we get
any response from Dell. But I do very much want to move forward
with this if contacting Dell does not result in another solution
to allow users to easily find out what the i2c-address is.

Regards,

Hans


> 
>> ---
>> Changes in v6:
>> - Use i2c_new_scanned_device() instead of re-inventing it
>>
>> Changes in v5:
>> - Add "this may be dangerous warning" to MODULE_PARM_DESC(probe_i2c_addr)
>> ---
>>  drivers/platform/x86/dell/dell-lis3lv02d.c | 52 ++++++++++++++++++++--
>>  1 file changed, 48 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
>> index ab02ad93758a..21390e6302a0 100644
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
>> @@ -57,6 +59,38 @@ static u8 i2c_addr;
>>  static struct i2c_client *i2c_dev;
>>  static bool notifier_registered;
>>  
>> +static bool probe_i2c_addr;
>> +module_param(probe_i2c_addr, bool, 0444);
>> +MODULE_PARM_DESC(probe_i2c_addr, "Probe the i801 I2C bus for the accelerometer on models where the address is unknown, this may be dangerous.");
>> +
>> +static int detect_lis3lv02d(struct i2c_adapter *adap, unsigned short addr)
>> +{
>> +	union i2c_smbus_data smbus_data;
>> +	int err;
>> +
>> +	pr_info("Probing for lis3lv02d on address 0x%02x\n", addr);
>> +
>> +	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
>> +			     I2C_SMBUS_BYTE_DATA, &smbus_data);
>> +	if (err < 0)
>> +		return 0; /* Not found */
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
>> +		return 0; /* Not found */
>> +	}
>> +
>> +	pr_debug("Detected lis3lv02d on address 0x%02x\n", addr);
>> +	return 1; /* Found */
>> +}
>> +
>>  static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
>>  {
>>  	/*
>> @@ -93,10 +127,18 @@ static void instantiate_i2c_client(struct work_struct *work)
>>  	if (!adap)
>>  		return;
>>  
>> -	info.addr = i2c_addr;
>>  	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
>>  
>> -	i2c_dev = i2c_new_client_device(adap, &info);
>> +	if (i2c_addr) {
>> +		info.addr = i2c_addr;
>> +		i2c_dev = i2c_new_client_device(adap, &info);
>> +	} else {
>> +		/* First try address 0x29 (most used) and then try 0x1d */
>> +		static const unsigned short addr_list[] = { 0x29, 0x1d, I2C_CLIENT_END };
>> +
>> +		i2c_dev = i2c_new_scanned_device(adap, &info, addr_list, detect_lis3lv02d);
>> +	}
>> +
>>  	if (IS_ERR(i2c_dev)) {
>>  		pr_err("error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
>>  		i2c_dev = NULL;
>> @@ -167,12 +209,14 @@ static int __init dell_lis3lv02d_init(void)
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
>> -	i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
>> +	if (lis3lv02d_dmi_id)
>> +		i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
>>  
>>  	/*
>>  	 * Register i2c-bus notifier + queue initial scan for lis3lv02d
>> -- 
>> 2.45.1
>>
> 


