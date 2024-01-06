Return-Path: <linux-i2c+bounces-1176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E73C825FDB
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 15:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CDAF1F2283A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 14:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B022979EA;
	Sat,  6 Jan 2024 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hPBLB/ie"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCC579CF
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jan 2024 14:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704551425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbTYYXwrsU4dpBxr8Dcb8srnnsmA/L3mJJmAD71+57Y=;
	b=hPBLB/ie1oIcabfpadm1WLIAdDo7Pdzx2jApKRm34tAS+aEHrOQWRVyZC6uezFi7KEK7PU
	bYvtgzCTUd/SnzbIKmdWRfOEIOb+Aeg921xB0mEDWQQ+I4hRxGDc2aPtlEqfAcmuAwLt9R
	cKwpfk5pOliOaJSa0cwCBe8rO5a6cSQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-iDv4Yiu_OHugiFy5Nvxwhg-1; Sat, 06 Jan 2024 09:30:24 -0500
X-MC-Unique: iDv4Yiu_OHugiFy5Nvxwhg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a28f6b75283so15666666b.1
        for <linux-i2c@vger.kernel.org>; Sat, 06 Jan 2024 06:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704551423; x=1705156223;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hbTYYXwrsU4dpBxr8Dcb8srnnsmA/L3mJJmAD71+57Y=;
        b=RfFnvdOayi/ncvtQJ0/4eBdd5QYp8g0/jOUKW7FmMKiotjPyVtioRJFYasdzvAC7Ms
         tJNZjyb2Wc5V5WuDYb86zvtgiVdKiB3AgBRtkw7wRunmbAcnUbQbLKmApvNM/ei+/v20
         syLany+KHXSNBj2VMY+IorU9O+Jk0anOJD6VqhXZh2Yk7zaEgiWzGzPoWRWpMxpVSNep
         3vmFcYo7QkI30ydXtlXqN2dnVlua0LpceScFQzL+7WzErvz0/HbcQ6IgB6p4KZHn1rUC
         HwSn2vX0veTSacZk71+OqiEtu7LW4DbZTAf5ljnABcZQLrJhmx3wdjTRWR13kxGF/aV9
         rLSA==
X-Gm-Message-State: AOJu0Yz4uosSpu0kfo2d5PY7H9ObTOLp9ZOsVyWgjSUNRfUyWVmoo/Sy
	FHD4BX4ltqlvf6fk35V5AJpWkW2+HgSrzcNptv6E5m2G9xAEPo+YLpqjRX4ObN6ejkY7sI0vFR2
	aun4KL4hRdZZeDVd9tjybCD8b+Pjn
X-Received: by 2002:a17:906:2dd4:b0:a28:cfc9:a639 with SMTP id h20-20020a1709062dd400b00a28cfc9a639mr366066eji.44.1704551423303;
        Sat, 06 Jan 2024 06:30:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUD4q79ITVQggMi3k+Z8sQU8R9KfT0Jpug2EDB/oS7TT4ZaVSMQKlRUgsJEZH5SH6/V/yOcg==
X-Received: by 2002:a17:906:2dd4:b0:a28:cfc9:a639 with SMTP id h20-20020a1709062dd400b00a28cfc9a639mr366058eji.44.1704551423024;
        Sat, 06 Jan 2024 06:30:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bo6-20020a170906d04600b00a28956cf75esm2011776ejb.130.2024.01.06.06.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jan 2024 06:30:22 -0800 (PST)
Message-ID: <07e68a50-a4ef-41b7-a254-34907a090e0c@redhat.com>
Date: Sat, 6 Jan 2024 15:30:21 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] platform/x86: dell-smo8800: Add support for probing
 for the accelerometer i2c address
Content-Language: en-US, nl
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Eric Piel <eric.piel@tremplin-utc.net>, Paul Menzel <pmenzel@molgen.mpg.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
 Marius Hoch <mail@mariushoch.de>, Kai Heng Feng
 <kai.heng.feng@canonical.com>, Wolfram Sang <wsa@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-7-hdegoede@redhat.com>
 <20231224220742.5cv2a7tdd4f2k4mt@pali>
 <8b3946e0-7eb5-4e1f-9708-1f6cfda95e1a@redhat.com>
 <20240105185159.yle5fwcqywplpppj@pali>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240105185159.yle5fwcqywplpppj@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/5/24 19:51, Pali Rohár wrote:
> On Friday 05 January 2024 17:36:03 Hans de Goede wrote:
>> Hi Pali,
>>
>> On 12/24/23 23:07, Pali Rohár wrote:
>>> On Sunday 24 December 2023 22:36:22 Hans de Goede wrote:
>>>> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
>>>> of the accelerometer. So a DMI product-name to address mapping table
>>>> is used.
>>>>
>>>> At support to have the kernel probe for the i2c-address for modesl
>>>> which are not on the list.
>>>>
>>>> The new probing code sits behind a new probe_i2c_addr module parameter,
>>>> which is disabled by default because probing might be dangerous.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> I would really like to hear Dell opinion about this change, and if there
>>> is really no way to get i2c address. Could you ask Dell people about it?
>>> Always it is better to use official / vendor provided steps of hardware
>>> detection, instead of inventing something new / own which would be there
>>> for a long time...
>>
>> Unfortunately I no longer have any contacts inside Dell for
>> this and given Dell's non response in the original thread
>> which started this I'm not hopefull for help from Dell here.
> 
> Well, writing an email to hundred of receivers, or writing 10 or more
> emails at the same time is nowadays an example how to get your email
> into spam box in lot of companies.
> 
>> Also there original reaction indicated that the info is not
>> available in ACPI, so probing + extending the DMI match
>> list seems to be the only way.
> 
> I have verified this statement years ago and therefore it applies only
> for old models (about 10 years old). So using this statement is not
> valid for new models anymore.

The latest Dell model which I have which still has a SM088xx ACPI
device is a Dell XPS 15 9550 from ~2016 this one still only has
an interrupt resource for the SMO8810 ACPI device and no 
I2cSerialBus[V2] resource.

On my Dell XPS 15 9550 the SMO8810 ACPI device is disabled,
still the accelerometer is actually there, but the IRQ is not setup
by the BIOS. So it can only work as an accelerometer and not
for /dev/freefall, likely because my model has the big battery
which covers the room for a 2.5" sata disk, so the freefall
function is disabled in the BIOS.

I have a patch series to still make the accelerometer work
on the XPS 15 9550 even though it is disabled in the BIOS,
but first lets get this series merged and then I'll send
the XPS 15 9550 series to be applied on top later.

Regards,

Hans






