Return-Path: <linux-i2c+bounces-5312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD5994F241
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 18:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D816F28396E
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 16:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823C917994F;
	Mon, 12 Aug 2024 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hc1BNdKW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076F27473
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 16:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723478431; cv=none; b=nZF7Qh22Bb2hvLRYbcH+Mg7QOX7Yed4lNMVJ2Dc+DqnN8vbi7/+Xrpdct4s1T0VgSs7abwKXCZeiehw71bh/hAGIRQYJAaffwWyB/TuNjRoUC7Y+Gtm1Ebzc1xgSykEzEfNE0lRC3rQVK6TXOCAzEpiZUzlm3KzchybvIFHFZMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723478431; c=relaxed/simple;
	bh=LBMcTtgEQGxFX641bMhxxGyPQ6TpqdKbwfhNnktHFpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmIyZWBpVgSlMPoSJDGA56nORccx7fIdcymkx4lSz59Zi7AbzcT/z0gcqZrNdY4gpPsHknvyllGXA0uJex+Pzayl8zY9eTGdH3JqMVjoZ9RbhJHf1XPzyGjtMK3cx58A1VMaoh9kkw6EY89r9FG8DbDndEl6UttoSPgQCZ9eONQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hc1BNdKW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723478428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aCjfCE/5ugfX8NCZ+9pGookJgcS2x7h/ooQyXNL61y4=;
	b=hc1BNdKWyDCyGvKsDgDt3Hg+1dvyFb676kWJYsS7PN3Tn8u5LWjNoSaf8cZqy5oPg0Iqb1
	+l68fQYuZoeM0zyda9tm4TFSqSixoq1MZ2BBieBxs2ta5nhcqAhO4O6wlQF9i0RUoQy8Jf
	0QeGCyuu2i4a07OTGtHWjRxiWbg4m84=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-UwU0ZfOJNCi73_awJGtQSw-1; Mon, 12 Aug 2024 12:00:24 -0400
X-MC-Unique: UwU0ZfOJNCi73_awJGtQSw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2f14b6f64d3so41900141fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 09:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723478422; x=1724083222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCjfCE/5ugfX8NCZ+9pGookJgcS2x7h/ooQyXNL61y4=;
        b=SsA6zQFgqsXfu4Tawdkm8krS8BTPYnu3znPYaDR18PARPG/SPr+W+BHUG+fIBR2y2X
         MguGL6FDYvLeDYGTSWr6DczshP7mX7ESMGVj+WGqaELGgl8AizoCar5X8FTEt4lKQyPj
         QZWU0DMH6tpMFkjeixUQ/LJxXz6kEI77J7rrHOM6VKSxqepBR4QYs7e801gbPhxNlHyB
         VnP/N3w9ehYt6w+rgxPcpOfMBseLSyqhbBCGBRnmwBEp4z8aiM8YiV9AnCYCqYAzsVXR
         wIw0hrD8n4EJlHPlWmxeBmUmnKUsStjSVxMvx7k5rjkqUI0OrKT86DGFlgKJqpN1FBQ0
         4Y4g==
X-Forwarded-Encrypted: i=1; AJvYcCWrdjD7CNzIRHafGjfgyGzlHKMjarwA3QjNwqHaVz4Ev3AAkwLE+Q2wdoePS9N+c4pIz4W+ezt/RnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz23nMSQhF+Upj5vihfdRZD7jss4vfRIcAoQUoBc/z/zgK/Vcl3
	MDqmgO1HUinHc4s9HeHo1N0dVf6jyggz+1Y/I0Mwk9Fr/gJBVpJxZ08zdOG200jWn4x12we+CW5
	kKhilZXaTi8Ku8Ft3SxiwsSaxyRDn6pn4JkMpyDaZfzCQAYyKP5MyKmE+Lw==
X-Received: by 2002:a05:6512:33cb:b0:52e:eacd:bc05 with SMTP id 2adb3069b0e04-532136a4efdmr340671e87.61.1723478422196;
        Mon, 12 Aug 2024 09:00:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp80GLThiR3tlHa9/PsbFmgOZMY8q0CE3u1d/qWUz8W32apuaSJibZIFNMUl+Je7JK2w79tw==
X-Received: by 2002:a05:6512:33cb:b0:52e:eacd:bc05 with SMTP id 2adb3069b0e04-532136a4efdmr340641e87.61.1723478421613;
        Mon, 12 Aug 2024 09:00:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd187f4e19sm2195651a12.20.2024.08.12.09.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 09:00:21 -0700 (PDT)
Message-ID: <3a4f4c6c-3069-412e-9c71-b4e0308fccd4@redhat.com>
Date: Mon, 12 Aug 2024 18:00:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240805133708.160737-1-hdegoede@redhat.com>
 <20240805133708.160737-5-hdegoede@redhat.com>
 <CAHp75VeCVCqmG0Px8_EyztS6ZeBbhU0Nbtru5mkQxKNeR6pynQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeCVCqmG0Px8_EyztS6ZeBbhU0Nbtru5mkQxKNeR6pynQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

Thank you for the reviews.

On 8/5/24 10:48 PM, Andy Shevchenko wrote:
> On Mon, Aug 5, 2024 at 3:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Various Dell laptops have an lis3lv02d freefall/accelerometer sensor.
>> The lis3lv02d chip has an interrupt line as well as an I2C connection to
>> the system's main SMBus.
>>
>> The lis3lv02d is described in the ACPI tables by an SMO88xx ACPI device,
>> but the SMO88xx ACPI fwnodes are incomplete and only list an IRQ resource.
>>
>> So far this has been worked around with some SMO88xx specific quirk code
>> in the generic i2c-i801 driver, but it is not necessary to handle the Dell
>> specific instantiation of i2c_client-s for SMO88xx ACPI devices there.
>>
>> The kernel already instantiates platform_device-s for these with an
>> acpi:SMO88xx modalias. The drivers/platform/x86/dell/dell-smo8800.c
>> driver binds to this platform device but this only deals with
>> the interrupt resource. Add a drivers/platform/x86/dell/dell-lis3lv02d.c
>> which will matches on the same acpi:SMO88xx modaliases and move
>> the i2c_client instantiation from the generic i2c-i801 driver there.
>>
>> Moving the i2c_client instantiation has the following advantages:
>>
>> 1. This moves the SMO88xx ACPI device quirk handling away from the generic
>> i2c-i801 module which is loaded on all Intel x86 machines to a module
>> which will only be loaded when there is an ACPI SMO88xx device.
>>
>> 2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) table
>> between the i2c-i801 and dell-smo8800 drivers.
>>
>> 3. This allows extending the quirk handling by adding new code and related
>> module parameters to the dell-lis3lv02d driver, without needing to modify
>> the i2c-i801 code.
> 
> ...
> 
>> +static void instantiate_i2c_client(struct work_struct *work)
>> +{
>> +       struct i2c_board_info info = { };
>> +       struct i2c_adapter *adap = NULL;
>> +
>> +       if (i2c_dev)
>> +               return;
>> +
>> +       bus_for_each_dev(&i2c_bus_type, NULL, &adap, find_i801);
>> +       if (!adap)
>> +               return;
> 
> May i2c_for_each_dev() be used here?

The main difference between i2c_for_each_dev() and
bus_for_each_dev() is that i2c_for_each_dev() holds
the i2c core mutex while it is calling the passed
in callback.

And find_i801() calls i2c_get_adapter() which also
takes the i2c core mutex, so i2c_for_each_dev()
cannot be used here since then things deadlock.

> 
>> +       info.addr = i2c_addr;
>> +       strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
>> +
>> +       i2c_dev = i2c_new_client_device(adap, &info);
>> +       if (IS_ERR(i2c_dev)) {
>> +               pr_err("error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
>> +               i2c_dev = NULL;
>> +       } else {
>> +               pr_debug("registered lis3lv02d on address 0x%02x\n", info.addr);
>> +       }
>> +
>> +       i2c_put_adapter(adap);
>> +}
> 
> ...
> 
>> +static int __init match_acpi_device_ids(struct device *dev, const void *data)
>> +{
>> +       const struct acpi_device_id *ids = data;
> 
> Wondering if this is needed. Can the compiler implicitly cast const
> void * to the const something * ?

I have just tried this and the compiler is happy with the ids variable
dropped, so I'll use that for v8.

Regards,

Hans





