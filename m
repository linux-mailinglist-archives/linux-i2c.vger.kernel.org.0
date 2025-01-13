Return-Path: <linux-i2c+bounces-9060-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2977A0BDFD
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 17:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 299BE7A10C8
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 16:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B931FBBE8;
	Mon, 13 Jan 2025 16:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="alpyashe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D1117BA3
	for <linux-i2c@vger.kernel.org>; Mon, 13 Jan 2025 16:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786967; cv=none; b=U/4vPhpcAKZT43dKaksC0EVL0fQYJxIUtCnjTOL6kL1JEwJMIz7pk16+aM0PK3EnlDvkLuw1s7K5MouoOqeEFMvlUVeBsYT5e+dp8MCKdTGQ2ANa2ERTHLLDjV7JOr2IjTBZ2kxm2KUcUxwCDqQYYFmQCdwTk4RwvYjTI0G2UbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786967; c=relaxed/simple;
	bh=F7hp29fYxtqUB0Hf9fIChQCld83AcM1O5eMR1txTU70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfsMrSvfwuS9NZtpF1Dbzr3QOgOquXfn8KNhHse4CzDRs6wr5ePPhPZEaKxx2nGQgHLfVDBL+qriDDXY7q/6A1W3CSquxkTev234vkaqxsPeIVwR6rTyFHiLcV24pBZWPrt5NUs7EhDQE3IysMOmrULvqjqg2ip4bFwdHZidpo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=alpyashe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736786964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1dDnjAx6WR8D0Awi14BY7UNGjJg0wAKtVvr3i7T8hU=;
	b=alpyasheJJSmU7vOOxy60jQCDVX56VcnxjzgEVH+GZOwWizkztx4SaBG/vk8sqPjlkK9nT
	8xhEI/aoyzMrdIhBeh1nbGuQvXv/Y34X6i1qdDPUXcY6IbGVuFIEPMuVFCl1p8VpredMAA
	CEseu4LKRYe7YOE/uP4XYUQrb/GLBf8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-n8fIdzS9MniEWY-6BcA7Lw-1; Mon, 13 Jan 2025 11:49:23 -0500
X-MC-Unique: n8fIdzS9MniEWY-6BcA7Lw-1
X-Mimecast-MFC-AGG-ID: n8fIdzS9MniEWY-6BcA7Lw
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa691c09772so413411166b.1
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jan 2025 08:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736786962; x=1737391762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1dDnjAx6WR8D0Awi14BY7UNGjJg0wAKtVvr3i7T8hU=;
        b=sthiTzrrjK+MwTCYSbKXEt1VBltHCZd9weyldr15R/+8FkK+lo/34FVkJY4LYhIXZh
         AoVf7+HT3kYXEz7gk0/GuBsW+yUXjgzQy3Mm76A1xW+clTHKBIVy2CKp1v4LzCW9ipUu
         AqHYxa4nB0jxEiqO5TToBZZv3jqYeshjzZjJ7GtDxdhiqxd4K7vHAdvrKQXJ6h5LLyNj
         oV2D0btjU3dSoLDxxIRODNhYO/lxWyL5wNUro3KZ6ofp4S6/G+AVEI1prERlqX3+jzgM
         nntZUE/OjnR+viBrftos7xnqQcnIVZ7QsfThR9CFy+iGTJu8Njg08/54j1X0kJROnDX/
         keBw==
X-Forwarded-Encrypted: i=1; AJvYcCUe56ewNDQWkBfqonUm6K2OuJODy/93Atj1fKhzalj95hULs5019N0iXmhvVsDqRnYyeV0RpdU3siw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEYlXhAhUre+m29sTLdUZdrp4PfTWi6ooLs6DHcNupuSVe+KOe
	1++CK5vNNhk9bFrZkQIDeO5lKbBeIWK95LSihzH+365rnZI4vibeWS+zCUQL4AAzS3pGTceG7Rd
	eIXxu9byPrPDJtdBeMU0sEFVicXVQ5NnXVNgmL1fO0WqbsaXaKD585gfS8Q==
X-Gm-Gg: ASbGncun4JCb02U9w21tySMfX0u/7hO4uyqIpZZMY0hbUc1xXVa36s3D8AYlJZWVqSu
	3r9qIBDlrhFPDpTkoQrBU9DDvhSHbOivb9QHCfptAo4KXKgHggsamUKmQTjtUzikpY1V9CIqi5V
	PtsdboRD7lVbINq/FbisJtmhez70Gvr0ciEF1VwS3xhWZGYueGehK39DPFFN2UaA9KLHhHTvAT9
	cn6BRtT9k4Aayph5YMxqbG8RDexNi+oU5ZW19JaJ93cnH/Cqwgx0RDvJduJTygPrpjuKvmj/H7a
	sTbqtc4ugi8NQqlqW1GYoIeNXEIsNjvCnWug9vs/GvrDHkLMvBMbmwi8+wuQWlsR3gCDO0SYzRq
	dfFo+KMLFlpxUyt9AGjRxGrVOZEca2L0=
X-Received: by 2002:a17:907:930b:b0:ab2:dc73:34bd with SMTP id a640c23a62f3a-ab2dc733505mr1465801666b.48.1736786961805;
        Mon, 13 Jan 2025 08:49:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFqmpdX7SC0CIT5zFlctdW9JguhsetLprQskvO/O/JEnSA8nb03EQto3+gsz+LnmpQfDXdzg==
X-Received: by 2002:a17:907:930b:b0:ab2:dc73:34bd with SMTP id a640c23a62f3a-ab2dc733505mr1465799766b.48.1736786961406;
        Mon, 13 Jan 2025 08:49:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c964dc9dsm527471466b.178.2025.01.13.08.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 08:49:20 -0800 (PST)
Message-ID: <2b2a3d16-039c-4cdf-94b9-41d074558d97@redhat.com>
Date: Mon, 13 Jan 2025 17:49:19 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
To: Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Prasanth Ksr <prasanth.ksr@dell.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20241209183557.7560-1-hdegoede@redhat.com>
 <20241209183557.7560-5-hdegoede@redhat.com>
 <ee90da14-024e-4563-00ff-9b525e700106@linux.intel.com>
 <67d6480a-6613-47a1-bf7d-b52532a5278c@redhat.com>
 <049555a0-ad65-7aad-2a7c-fc2047629010@linux.intel.com>
 <Z4Uy4FYgynLP3ZAp@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z4Uy4FYgynLP3ZAp@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 13-Jan-25 4:36 PM, Andy Shevchenko wrote:
> On Mon, Jan 13, 2025 at 05:17:43PM +0200, Ilpo Järvinen wrote:
>> On Sat, 21 Dec 2024, Hans de Goede wrote:
>>> On 17-Dec-24 5:48 PM, Ilpo Järvinen wrote:
>>>> On Mon, 9 Dec 2024, Hans de Goede wrote:
> 
> ...
> 
>>>> So what was the result of the private inquiry to Dell?
>>>
>>> On July 5th I send the following email to Prasanth Ksr
>>> <prasanth.ksr@dell.com> which is the only dell.com address I could
>>> find in MAINTAINERS other then Dell.Client.Kernel@dell.com which
>>> does not seem to be monitored very actively:
>>>
>>> """
>>> Hello Prasanth,
>>>
>>> I'm contacting you about a question lis3lv02d freelfall sensors /
>>> accelerometers used on many (older) Dell laptop models. There
>>> has been a question about this last December and a patch-set
>>> trying to address part of this with Dell.Client.Kernel@dell.com
>>> in the Cc but no-one seems to be responding to that email address
>>> which is why I'm contacting you directly:
>>>
>>> https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
>>> https://lore.kernel.org/platform-driver-x86/20240704125643.22946-1-hdegoede@redhat.com/
>>>
>>> If you are not the right person to ask these questions to, then
>>> please forward this email to the right person.
>>>
>>> The lis3lv02d sensors are I2C devices and are described in the ACPI
>>> tables with an SMO88xx ACPI device node. The problem is that these
>>> ACPI device nodes do not have an ACPI I2cResouce in there resource
>>> (_CRS) list, so the I2C address of the sensor is unknown.
>>>
>>> When support was first added for these Dell provided a list of
>>> model-name to I2C address mappings for the then current generation
>>> of laptops, see:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-i801.c#n1227
>>>
>>> And later the community added a few more mappings.
>>>
>>> Paul Menzel, the author of the email starting the discussion on this:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-i801.c#n1227
>>>
>>> did a search for the kernel message which is printed when an SMO88xx
>>> ACPI device is found but the i2c-address is unknown and Paul found
>>> many models are missing from the mapping table (see Paul's email).
>>>
>>> Which leads us to the following questions:
>>>
>>> 1. Is there another, uniform (so not using a model name table)
>>> way to find out the I2C address of the SMO88xx freefall sensor
>>> from the ACPI or SMBIOS tables ?
>>>
>>> 2. If we need to keep using the model-name to I2C-address mapping
>>> table can you help us complete it by providing the sensor's I2C
>>> address for all models Paul has found where this is currently missing ?
>>>
>>> Regards,
>>>
>>> Hans
>>> """
>>>
>>> Pali and Paul Menzel where in the Cc of this email.
>>>
>>>> Did they respond?
>>>
>>> I got a reply from Prasanth that they would forward my request to the
>>> correct team. Then I got on off-list reply to the v6 patch-set from
>>> David Wang from Dell with as relevant content "We are working on it."
>>>
>>>> Did they provide useful info?
>>>
>>> No further info was received after the "We are working on it." email.
>>
>> Hi Hans,
>>
>> So you didn't try to remind them after that at all?
>>
>> This kind of sounds a low priority item they just forgot to do and might have
>> had an intention to follow through.
> 
> Talking from my experience with other companies that could have done something
> better I dare to say that this entire buzz for them is no-priority at all, like
> "no money stuff", hence no attention given. That said, I believe ping won't
> change anything here, however I agree that it _was_ worth to try to acquire any
> response from them.

Basically what Andy says above.

Note that Dell's client team has been on the Cc for all the versions of
this patch-set many of which were posted after the "We are working on it." email.

For completeness sake I have just send a request for a status update on
this to Prasanth and David from Dell.

In the mean time it would be good IMO to merge v11 of this patch, if we
get useful info from Dell after all we can modify the driver for this
later.

Regards,

Hans



