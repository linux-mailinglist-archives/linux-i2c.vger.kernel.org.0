Return-Path: <linux-i2c+bounces-1167-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A33F825B32
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 20:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C7001F240B5
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 19:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DCC35F11;
	Fri,  5 Jan 2024 19:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f/CwHZXM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A88E1DFC6
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 19:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704484009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOEnOX2pJ+H1waqPV9ScITyx38AZTEtZThhmoeJCxMQ=;
	b=f/CwHZXMkkraDQnvtCDwXy7au0OwBeiTGYL8vAIOYLB4fAmNq+l/ZqynKUSkcsoFyL0Mg0
	oBZCftS9fv4BJrs9KMqMRcJrVpyrwlTcCRRa1rFUCnicPVa3eGCvGgeepo5x1o39Ogd881
	7mkYFwMZE/MwFAFD4GafGPq51uq6p9o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-dHAQXyTcNripsj27CN2ekg-1; Fri, 05 Jan 2024 14:46:48 -0500
X-MC-Unique: dHAQXyTcNripsj27CN2ekg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a28f771661fso87453466b.2
        for <linux-i2c@vger.kernel.org>; Fri, 05 Jan 2024 11:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704484006; x=1705088806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOEnOX2pJ+H1waqPV9ScITyx38AZTEtZThhmoeJCxMQ=;
        b=PaGa0kPuh2qav7qsN456zf1PMi5A+CKEKREI5tGLo5/pISBeuNjbFjpAsvc79quVWL
         a586ABhtxU6eah//jzll54SoVmlYBWnhjna8GJv/EuzPDZNrEpZ9WQdzVIQzCMUSRwIv
         Jv6jGnix16CeneC+jXrjjMoCLLMgpAnpZC/IMmVOAsfMJfimxupKD/bgBZVFVV81J0ud
         LnglobEWtDSjgoGIHPfeYpKH0ki3Mks7VL3sVn1lngTA2CCKBiBjhG1bsLqznrIDCbFS
         QtFb7lt5hatx9suMxE7NiGyxMo+RmzahwgLbqWEIe7c5ZxA8YryBQ9w0r9UfbxaP4+ea
         NURQ==
X-Gm-Message-State: AOJu0YySAspwlc8HYP7TQEpa5EIB4xvrJRWqmJLZ2S0mUkmM7C5pe7h6
	6QAscXE6mgR1zRF4LtXYEg278Tv8XaLxvmZUM/lJCSY4Zfkx3Aq2uJfxJbq3FF+LUTQl7Ot9GsX
	o5poUe0zRYPoBPBbUQKzPD0rFtOui
X-Received: by 2002:a17:906:44c:b0:a28:ac26:b5e5 with SMTP id e12-20020a170906044c00b00a28ac26b5e5mr883138eja.187.1704484006712;
        Fri, 05 Jan 2024 11:46:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETQGydSFZB5YNaVzceDkyQSiv99KminlQ0t6M7LA31PB5tLoTSBQqSGJqi0E0aTVFQ3g9DxQ==
X-Received: by 2002:a17:906:44c:b0:a28:ac26:b5e5 with SMTP id e12-20020a170906044c00b00a28ac26b5e5mr883125eja.187.1704484006435;
        Fri, 05 Jan 2024 11:46:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t9-20020a170906608900b00a2689e28445sm1187209ejj.106.2024.01.05.11.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 11:46:45 -0800 (PST)
Message-ID: <228bd84a-9d74-45ab-8e00-38109ee5e8df@redhat.com>
Date: Fri, 5 Jan 2024 20:46:45 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] platform/x86: dell-smo8800: Instantiate an i2c_client
 for the IIO st_accel driver
Content-Language: en-US, nl
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Eric Piel <eric.piel@tremplin-utc.net>, Paul Menzel <pmenzel@molgen.mpg.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
 Marius Hoch <mail@mariushoch.de>, Kai Heng Feng
 <kai.heng.feng@canonical.com>, Wolfram Sang <wsa@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-6-hdegoede@redhat.com>
 <20231224220321.vqzb4q3ut3dz3rl2@pali>
 <c3d903e8-6611-43e9-ab31-44e92371b0c3@redhat.com>
 <CAHp75VdoSaVMkyzFdKJYu17=YZNVFubUdWAC6tm5TqN3Ccvj3A@mail.gmail.com>
 <CAHp75VfAS=xkoLz63qozsMXyT2ByJSkwYfsYRfU69NxEyysLKA@mail.gmail.com>
 <20240105192034.f2zoholvmbogw7ko@pali>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240105192034.f2zoholvmbogw7ko@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/5/24 20:20, Pali Rohár wrote:
> On Friday 05 January 2024 21:04:59 Andy Shevchenko wrote:
>> On Fri, Jan 5, 2024 at 8:37 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Fri, Jan 5, 2024 at 6:34 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> On 12/24/23 23:03, Pali Rohár wrote:
>>>>> On Sunday 24 December 2023 22:36:21 Hans de Goede wrote:
>>
>> ...
>>
>>>> But AFAIK / AFAICT there are no actual userspace consumers of
>>>> /dev/freefall so removing it should not be an issue.
>>>
>>> IIRC/AFAIK there is at least one (simple) computer game using it as a joystick.
>>
>> Okay, I can't google for it and now I realised that it was my x60s,
>> which has no freefall, but another interface to it. In any case the
>> side effect of that googling is this (maybe more, I just took this one
>> as example):
>> https://github.com/linux-thinkpad/hdapsd/blob/master/README.md
>>
>> So, dropping it will break at least this tool.
>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
> 
> Yes, this is that correct one. I forget the name of this daemon.
> 
> Just to note /dev/freefall does not provide axes state, it just send
> signal to process when interrupt is triggered. Process than park disk
> heads.
> 
> Axes state are/were exported throw /dev/js* interface and those games
> uses just js interface. I remember Tux Racer.
> 
> Interrupt on HP and Dell is triggered only when laptop fall is detected,
> so games did not used it (hopefully!)

Ok, so I clearly need to change the module parameter so that we stick with
the drivers/char/misc/lis3lv02d driver as default and offer using
the i2c-client-id which results in loading the iio driver instead as
an option enabled by a module parameter.

I'll fix this for v2.

Regards,

Hans





