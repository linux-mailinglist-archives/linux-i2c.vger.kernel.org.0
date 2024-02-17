Return-Path: <linux-i2c+bounces-1848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B47858EC2
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Feb 2024 11:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9A0E1C20F9C
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Feb 2024 10:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A7D487BF;
	Sat, 17 Feb 2024 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LMRgw/ij"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A674535884
	for <linux-i2c@vger.kernel.org>; Sat, 17 Feb 2024 10:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708166010; cv=none; b=XfmbTzPhz4/DIdVFTGwe4cV+Z9xv63TImTnuIOV5Joa9yOfmrixhqHMpB0wOWofOH+PaaAgyNPB5JeGOJBQhhCFs4kC5pFu/5o3Zxoxnmiyd8v3xmMbYf88gw1bKTdlxIgH759lzUBF3+GmpFgGRbnamGZz0Byoc72dxrdKU5WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708166010; c=relaxed/simple;
	bh=BAwzhRsDCszvGkCZpbQAxpfMlN2n3GfPPVFq0MCB2Fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLz5ulBOxk54hS7sLy6VjKFdbHbntM38hvUtL2OvkLJcxXELUzPGNTe065bwg4RsA4HH+IL5OA5k7Kiwa6UsHWyscXQKX0bl++bBfmhYPmB0fuPHPuEhK4slMIX4IjwIO2EJXOMXSutXJLwrKYq3O9amfcuVPg/U6y/BF60Zu40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LMRgw/ij; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708166007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SOPLsffXfXpiI5OFL9Rz24HEghEnIzQEHLm/BPE3AJ8=;
	b=LMRgw/ije9KqiJ9DLAQWeR6KCYs3vHKRd0FmR/VsrGCcl5wZNFLmobL1EqKyae0ht+b/SP
	gjaPql317ZWgdCVwDg/32eg8lBPFdRk7S3GDOj5XKUNUBVo8iLdf4vlAKyIOhtTm3k2vTo
	nt12+BwZuL2Rtc2LV4p6D1FULz0TJ80=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-b1rEynMNPWaUjlpsVt7Wjg-1; Sat, 17 Feb 2024 05:33:24 -0500
X-MC-Unique: b1rEynMNPWaUjlpsVt7Wjg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a2f71c9f5d2so122067266b.2
        for <linux-i2c@vger.kernel.org>; Sat, 17 Feb 2024 02:33:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708166003; x=1708770803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SOPLsffXfXpiI5OFL9Rz24HEghEnIzQEHLm/BPE3AJ8=;
        b=Prm3k5Kyc8yxdRRlks7vNAOJ/WtGZ1nuS52JMuOJHnDNxVA9n8LqCZfbqldcQnKud3
         UPQWnQqibnO5yJChAoTR+vOya2E1qTk69gD4X5qE5/aYZ7txSGUwdblsEBNuSp74+iIS
         Z93brTg075eNAq6BrtBtX48g9Ktym2tEjMLHTCrA5xfKURWyUwQauzup18kiElaaTBes
         muqk98n8WnfJJotXQ803DXyZkW9S3C0inNDqUHe9wr71oRN9kavtBV73hnnyp8LgT7lV
         4xo9B1IfMPAtFrpSCW8XGXNukoUZXMfWIqCa1ge/OgRCA8kXyw2jgB8tg1H3LkMSM1w5
         /KXg==
X-Forwarded-Encrypted: i=1; AJvYcCXrSu+p4Hpb3kUl5nBjq5JWvYJDa4YA+kIGk42JCARQtX/wQs2XGJ+6qR9TasS6w+Mz8pFv3KAguHHigkYa2oh5GAPBTPwTRk4I
X-Gm-Message-State: AOJu0YxfNe2OAWqMwazwTP1NhggXyycVHK8q/EziiXNTb1e3bPcKCVNY
	6T+30npK219TUfqXzcZYuLHYbhpf+u2Ny5Nub8oKR9gjLSRyA1uzmIWQrLW6WAhOvm32Na6k5Lp
	Cf9FijvGxzJCafOqIdslxU4GmAOfBKdWxnrcL2i6uUrqYX0whetpF6A77aQvSxdgGwA==
X-Received: by 2002:a17:906:c198:b0:a3e:34e8:626f with SMTP id g24-20020a170906c19800b00a3e34e8626fmr473211ejz.66.1708166003478;
        Sat, 17 Feb 2024 02:33:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHONzQ4K+GjU2Z5J175Qz7NyRRB4awOxiXjVKAtjliHoLdxNrn+46pvSb8HNB6gPfi69ZapgA==
X-Received: by 2002:a17:906:c198:b0:a3e:34e8:626f with SMTP id g24-20020a170906c19800b00a3e34e8626fmr473199ejz.66.1708166003069;
        Sat, 17 Feb 2024 02:33:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ch22-20020a170906c2d600b00a3d943558b8sm854287ejb.134.2024.02.17.02.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 02:33:22 -0800 (PST)
Message-ID: <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
Date: Sat, 17 Feb 2024 11:33:21 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Content-Language: en-US, nl
To: Jean Delvare <jdelvare@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240213173050.0cf4a58f@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jean,

On 2/13/24 17:30, Jean Delvare wrote:
> Hi Pali, Hans,
> 
> On Sun, 7 Jan 2024 18:10:55 +0100, Pali Rohár wrote:
>> On Saturday 06 January 2024 17:09:29 Hans de Goede wrote:
>>> It is not necessary to handle the Dell specific instantiation of
>>> i2c_client-s for SMO8xxx ACPI devices without an ACPI I2cResource
>>> inside the generic i801 I2C adapter driver.
>>>
>>> The kernel already instantiates platform_device-s for these ACPI devices
>>> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
>>> platform drivers.
>>>
>>> Move the i2c_client instantiation from the generic i2c-i801 driver to
>>> the Dell specific dell-smo8800 driver.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>> Changes in v2:
>>> - Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
>>> - Add a comment documenting the IDF PCI device ids
>>> ---
>>>  drivers/i2c/busses/i2c-i801.c            | 126 +----------------------
>>>  drivers/platform/x86/dell/dell-smo8800.c | 121 +++++++++++++++++++++-
>>>  2 files changed, 123 insertions(+), 124 deletions(-)  
>>
>> I'm looking at this change again and I'm not not sure if it is a good
>> direction to do this movement. (...)
> 
> Same feeling here. Having to lookup the parent i2c bus, which may or
> may not be present yet, doesn't feel good.
> 
> I wouldn't object if everybody was happy with the move and moving the
> code was solving an actual issue, but that doesn't seem to be the case.

I thought you would actually like getting this somewhat clunky code
which basically works around the hw not being properly described in
the ACPI tables out of the generic i2c-i801 code.

I didn't get around to answer's Pali's concerns yet, so let me
start by addressing those since you indicate that you share Pali's
concerns:

Pali wrote:
> Now after looking at this change again I see there a problem. If i2c-801
> driver initialize i2c-801 device after this smo8800 is called then
> accelerometer i2c device would not happen.

That is a good point (which Jean also points out). But this can simply
be fixed by making the dell-smo8800's probe() method return -EPROBE_DEFER
if the i2c-i801 i2c-bus is not present yet (all designs using the
dell-smo8800 driver will have an i2c-bus so waiting for this to show
up should not cause regressions).

If we can agree to move forward this series I'll fix this.

Pali wrote:
> Also it has same problem if PCI i801 device is reloaded or reset.

The i801 device is not hotplugable, so normally this will never
happen. If the user manually unbinds + rebinds the i2c-i801 driver
them the i2c_client for the smo88xx device will indeed get removed
and not re-added. But this will normally never happen and if
a user is manually poking things then the user can also unbind +
rebind the dell-mso8800 driver after the i2c-i801 rebind.
So I don't really see this as an issue.

With those remarks addressed let me try to explain why I think
that moving this to the dell-smo8800 code is a good idea:

1. It is a SMO88xx ACPI device specific kludge and as such IMHO
thus belongs in the driver for the SMO88xx ACPI platform_device.

The i2c-i801 driver gets loaded on every x86 system and it is
undesirable to have this extra code and the DMI table in RAM
on all those other systems.

2. Further changes in this series, like adding support for
probing for the i2c address of the lis3lv02d device on models
not yet in the DMI table, will add a bunch of more code specific
to SMO88xx ACPI devices. Making the problem of having SMO88xx
specific code in the generic i2c-i801 driver even bigger.
The current amount of SMO88xx specific code in the
generic i2c-i801 driver might be considered acceptable but I'm
afraid that the amount of code after this series will not be
acceptable.

3. Some of the changes in this series are harder to implement inside
the i2c-i801 code, like optionally instantiating an i2c_client for
the IIO st_accel driver (*) so that the accelerometer gets presented
to userspace as a standard IIO device like all modern accelerometer
drivers do.

This requires setting i2c_client.irq and that IRQ comes from
the SMO88xx ACPI device. So this would require the i2c-i801 code
to lookup the ACPI device and get the IRQ from there. Where as
in the SMO88xx ACPI platform_device driver the IRQ is readily
available.

TL;DR: IMHO all this SMO88xx quirk/glue handling belongs in
the SMO88xx specific dell-smo8800 driver rather then in
the generic i2c-i801 code.

Regards,

Hans


*) Instead of an i2c_client for the somewhat weird (but still
default for backward compat) drivers/misc/lis3lv02d/lis3lv02d.c
driver








