Return-Path: <linux-i2c+bounces-8681-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B44C9FA03F
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 12:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6360F188586C
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 11:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731AA1EE7C1;
	Sat, 21 Dec 2024 11:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EFeOxUeg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16336163
	for <linux-i2c@vger.kernel.org>; Sat, 21 Dec 2024 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734779003; cv=none; b=PbhFJj0uUMpha3VPuYVlVbhOc4+9C0CXpe1DZz2JRuPcxrKm5iuMBNAif5s5cRSCLZHO3Mkv5tAjeA59FZ06bmoYleVERq0+Z2I9SmD3qErkORXhTAkh4MCPiur8DdG3BeLTFvdIe/TCxmU/MtNSDy0YcDtjvuBbSLioc+P02gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734779003; c=relaxed/simple;
	bh=SKPbDjyOcxDK4mmwxLOSgRkp/Fzh+Wyl+eOWTiUSg90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oR4CHconP7H6xNUH8FHkP8dwtR0rL45IcEetEH+Di6roDMHntf8qzUTfdYIGl/eZQOqm/Fy7F6aY4gvfqasl2xuxBbMFNWMlby8c5Abzi/NdFAIbASeXFt7Nw0hLuY1eTHQYZ3ZL/caBlYdcP2dK/kHuA/Uj5wbC0XEH2xgXKDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EFeOxUeg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734778998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WILxFlMOJsukozwcWOASBfRQqMo2akgVSUnyOiuZ5aY=;
	b=EFeOxUegSA/ipUQXren+p1ryD7EUtS9V1XrL08CsYNH/iTRL/fQ4rmyt8aa4Y5fKGMDqA6
	MUKkwiIf2+C8vIMrnRUyKGfwX49Yf+jfZ0VABhxoi1wdW968IzlJ7IIzPIgsa2ilywSXTA
	6+tP66W0vpi7JqSckBagz8/lER0wne8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-KuSU0PuiPmaSDoPpeahJMg-1; Sat, 21 Dec 2024 06:03:17 -0500
X-MC-Unique: KuSU0PuiPmaSDoPpeahJMg-1
X-Mimecast-MFC-AGG-ID: KuSU0PuiPmaSDoPpeahJMg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa66ab24344so240666066b.3
        for <linux-i2c@vger.kernel.org>; Sat, 21 Dec 2024 03:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734778996; x=1735383796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WILxFlMOJsukozwcWOASBfRQqMo2akgVSUnyOiuZ5aY=;
        b=gGH4VcyLi0luwkV7bJYpFXi1PKhH9xX3bVgR/T6lVv0bZPdigoLMjL4eg/jd9C+zsS
         dimvW71iqu6Nwq/2yEH5+X9wV0n20OYhKQAyDZCpHszBjStmmrL6L2xD4nE2aR8H+lVX
         XBgBxWOO13l39QhOzhlHHmxbj/TQ8Bj3AnwhzrDzgSSADmMdphxBIiEKP7tTj8s2wBy/
         RJ9COB9P1YB9RMzNBtAX1I5rC7UJkvdBXQ6pWo6k91BKN7v8R3fCWbtciIXW/u3qDZn0
         V93mAbkW1+DTfy8E3cLOg3GumRZTcxRCTef9eHOQixUGZmICC1KhIq1omvrHMNq/3v/k
         GfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOmSC+Zu4+4NY10O8cVfNcF0kLhvh1LbN0guue0DuJZBrn+KFNM7bTgKUoMZDI4ousPsK52oyGs4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGKtnCBdCJsGH768QGiVY2Gve6XLEvaZQwcmoSon6oQQ8ALUh
	rZ1sg8MmIyS3Gabg0XWNSWKUTFdV7N9y4y9msAyEEBYpsaeGTnWyFV5YWI9njEtZJahN88ZyIrO
	ClXPBwyBjFNGG5jxh6y7jov98cnqbtQ3vHwM6n/YbXmpnjF0eaPeKR1e7VA==
X-Gm-Gg: ASbGncsnnCWFtuqYqeDvIAHg8/TDNRgchOO5C5aK2hnYYNmKy9waXczVv8WC9Sv8WJz
	ilu8hmd1Vxh31ECPlLlNfam+rw9uCksnbe4kEqFIlwRls720AK/tM8A9ZURGsogdnhv2JtCFmIp
	vseUbYq3Ezpm42BZmjUyWPj7XscYtDBJnqSgNTwMQ8P5fJsEA3RpzooadpCBvNVW5dXJzj9QaNr
	8/gGPPFeJXhvjopFbz8z1ymkZv9YAvYUJyI+TsAYe1iTx5z0668gPP+dqbmT903qcbz+/skNVPr
	yt5aJpXQ/EucpL2Qdml6sb9TDAYVeTT6NGrFsXkWtelXnznK/+s1s64bOF25c/UH1ysJNMTAa1e
	KD+O9GaFwBe6c0ITgsX2ZRB/zb6wcBHI=
X-Received: by 2002:a17:907:3e90:b0:aa6:abb2:be12 with SMTP id a640c23a62f3a-aac3354ff4dmr438770266b.37.1734778995664;
        Sat, 21 Dec 2024 03:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8m0Ko6YmD6CVAx9CA80ifTguiom5EDW119fL8BYcEjRwqz5tyQrVxm4//8m3++KmjsOXkkQ==
X-Received: by 2002:a17:907:3e90:b0:aa6:abb2:be12 with SMTP id a640c23a62f3a-aac3354ff4dmr438767766b.37.1734778995229;
        Sat, 21 Dec 2024 03:03:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f01285esm270277166b.141.2024.12.21.03.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 03:03:14 -0800 (PST)
Message-ID: <67d6480a-6613-47a1-bf7d-b52532a5278c@redhat.com>
Date: Sat, 21 Dec 2024 12:03:13 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Prasanth Ksr <prasanth.ksr@dell.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20241209183557.7560-1-hdegoede@redhat.com>
 <20241209183557.7560-5-hdegoede@redhat.com>
 <ee90da14-024e-4563-00ff-9b525e700106@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ee90da14-024e-4563-00ff-9b525e700106@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

Thank you for taking a look a this patch.

On 17-Dec-24 5:48 PM, Ilpo Järvinen wrote:
> On Mon, 9 Dec 2024, Hans de Goede wrote:
> 
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
> So what was the result of the private inquiry to Dell?

On July 5th I send the following email to Prasanth Ksr
<prasanth.ksr@dell.com> which is the only dell.com address I could
find in MAINTAINERS other then Dell.Client.Kernel@dell.com which
does not seem to be monitored very actively:

"""
Hello Prasanth,

I'm contacting you about a question lis3lv02d freelfall sensors /
accelerometers used on many (older) Dell laptop models. There
has been a question about this last December and a patch-set
trying to address part of this with Dell.Client.Kernel@dell.com
in the Cc but no-one seems to be responding to that email address
which is why I'm contacting you directly:

https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
https://lore.kernel.org/platform-driver-x86/20240704125643.22946-1-hdegoede@redhat.com/

If you are not the right person to ask these questions to, then
please forward this email to the right person.

The lis3lv02d sensors are I2C devices and are described in the ACPI
tables with an SMO88xx ACPI device node. The problem is that these
ACPI device nodes do not have an ACPI I2cResouce in there resource
(_CRS) list, so the I2C address of the sensor is unknown.

When support was first added for these Dell provided a list of
model-name to I2C address mappings for the then current generation
of laptops, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-i801.c#n1227

And later the community added a few more mappings.

Paul Menzel, the author of the email starting the discussion on this:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-i801.c#n1227

did a search for the kernel message which is printed when an SMO88xx
ACPI device is found but the i2c-address is unknown and Paul found
many models are missing from the mapping table (see Paul's email).

Which leads us to the following questions:

1. Is there another, uniform (so not using a model name table)
way to find out the I2C address of the SMO88xx freefall sensor
from the ACPI or SMBIOS tables ?

2. If we need to keep using the model-name to I2C-address mapping
table can you help us complete it by providing the sensor's I2C
address for all models Paul has found where this is currently missing ?

Regards,

Hans
"""

Pali and Paul Menzel where in the Cc of this email.

> Did they respond?

I got a reply from Prasanth that they would forward my request to the
correct team. Then I got on off-list reply to the v6 patch-set from
David Wang from Dell with as relevant content "We are working on it."

> Did they provide useful info?

No further info was received after the "We are working on it." email.

>> Changes in v8:
>> - Use dev_err() / dev_dbg() where possible using &adap->dev as the device
>>   for logging
>>
>> Changes in v6:
>> - Use i2c_new_scanned_device() instead of re-inventing it
>>
>> Changes in v5:
>> - Add "this may be dangerous warning" to MODULE_PARM_DESC(probe_i2c_addr)
>> ---
>>  drivers/platform/x86/dell/dell-lis3lv02d.c | 53 ++++++++++++++++++++--
>>  1 file changed, 49 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
>> index d2b34e10c5eb..8d9dc59c7d8c 100644
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
>> @@ -57,6 +59,39 @@ static u8 i2c_addr;
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
>> +	dev_info(&adap->dev, "Probing for lis3lv02d on address 0x%02x\n", addr);
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
>> +		dev_warn(&adap->dev, "Unknown who-am-i register value 0x%02x\n",
>> +			 smbus_data.byte);
>> +		return 0; /* Not found */
>> +	}
>> +
>> +	dev_dbg(&adap->dev, "Detected lis3lv02d on address 0x%02x\n", addr);
>> +	return 1; /* Found */
>> +}
>> +
>>  static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
>>  {
>>  	/*
>> @@ -97,10 +132,18 @@ static void instantiate_i2c_client(struct work_struct *work)
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
>>  		dev_err(&adap->dev, "error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
>>  		i2c_dev = NULL;
>> @@ -169,12 +212,14 @@ static int __init dell_lis3lv02d_init(void)
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
> 
> If somebody enables this parameter and it successfully finds a device, 
> shouldn't the user be instructed to report the info so that new entries 
> can be added and the probe parameter is no longer needed in those case?

Ah, IIRC that used to be there, but I guess that was lost when
I switched from DIY probing code to using the i2c_new_scanned_device()
helper for this in v6 of the series.

I'll prepare a v10 of this patch changing:

        dev_dbg(&adap->dev, "Detected lis3lv02d on address 0x%02x\n", addr);

to:

        dev_info(&adap->dev, "Detected lis3lv02d on address 0x%02x, please report this upstream to platform-driver-x86@vger.kernel.org so that a quirk can be added\n",
		 addr);

to address this.

Regards,

Hans



