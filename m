Return-Path: <linux-i2c+bounces-2111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB9B86F02D
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 12:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77318282871
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 11:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DC41428F;
	Sat,  2 Mar 2024 11:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EFBTAEM8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFD01119A
	for <linux-i2c@vger.kernel.org>; Sat,  2 Mar 2024 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709377367; cv=none; b=XbuECpsTBRpLfouL+ukLpnmO5Ai03fNAYbPTfxbtGf4dro5TyMnbz9CV7ZbIZ/F5tuOuP/Jm03vaum854EmmlzdzqlBlAgREmfxAPf32g8Y1a1LcOYcNJq3TOeBR+biCyI7CTrLnFVM16md3Trb/WrKlKhmGEkHizja8Xuyn0pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709377367; c=relaxed/simple;
	bh=gwg0wkLgPwatUR6Cr8me0rviKYD2dzIT9TWTyM19OmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6zKgwQEQeZXUPIGzH5hu9gawB74b6jgZZ2hpOMoGI97+vw3Xv+YgJFhQXU34aBqHq4IHOsHjHl2uRfeO8OtY9SIzWxdYwxm8vRfj7665Tho7Gpn8OfR5VWU32iU7rNO0TEyaOi2TZbheJRjfr/WasnF1XYNzf4bZYq5YrnDvrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EFBTAEM8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709377364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZmorp+/y8W+5J76sZjqmYrQkhEc4WjDCVm2zeYwwsw=;
	b=EFBTAEM8mIwviypeAQs4QsqNPn9+IX8haPXX4E3KM+eaXGC7nJtYEBixNmxzzpvhf62aKV
	t9ZwzFRVDAUOQwru2VJovFXnR2tSuXRjdEJvhv1DhZjbwUqi1xi010jCqhH8/XyfPThZiq
	9uWok/fjYmSrYmh9mpML5qtUkFGl2PA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-0te_IESVM1CbyHIUZrIvVw-1; Sat, 02 Mar 2024 06:02:43 -0500
X-MC-Unique: 0te_IESVM1CbyHIUZrIvVw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a44ac26990eso86434366b.3
        for <linux-i2c@vger.kernel.org>; Sat, 02 Mar 2024 03:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709377362; x=1709982162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZmorp+/y8W+5J76sZjqmYrQkhEc4WjDCVm2zeYwwsw=;
        b=klC0hC0T9I1YhqbeGfWt/36n7WhgmKI7NDSVF4CvAAbOQl83dhGl6vAy1J/Z+ejfPr
         naQ3+HGjNe7vtTB238iySXFH/ofIyB0/4UbgSn+yChASBeea3Nzk+KxAefk3aqSLXrhk
         bdyd8+h4b+DLfL6mPu+kIpMIPPTPSOcrrAsFySI8rshrIfKnBvTwHWVYWkZuGI73U95V
         TgWtQ1C9+TeRUCcwRAgthViu4gUVNXh3nzLlNlBhYNrQ/njE6dyhbyWd+oViRAP0tRBJ
         POUGH6rCT5ASqaaHUNkb5/H6I2M9o4s3EeZGWi6IqtYvkuYW1LkqZIxEO/EmDgVTtxq7
         rxfw==
X-Forwarded-Encrypted: i=1; AJvYcCVCPuxiELdZMgZ4B+r/vZhlH7WnbusyF6YbhVBdmKwuBuy4hgn6Vn7PG9LJgyDDJf+VlzIzQCuHnITj2nrmN7JwBE0+xTdq0gCi
X-Gm-Message-State: AOJu0YwiZVU5lm+k7sI58hfZ8ct78mB1kNHUqM1SQLiJ2TYvTqOemuUz
	/3Te/4nNqLcwUIgkLwwvhGzEiDO61PhIwHbGG3ENJyzrk7QN2rl2kFB2eH0/yPya1Lub5/373KC
	2qC1+67jxaTA1stlTohz0NUOYCcM09NTIbjLwQjjFC0f57KWMvE9M850nmQ==
X-Received: by 2002:a17:906:350c:b0:a43:fac5:8e87 with SMTP id r12-20020a170906350c00b00a43fac58e87mr2651914eja.65.1709377361928;
        Sat, 02 Mar 2024 03:02:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3J15yq9DlBdz0QgEulHOjqjtmjStaEU3NIyAQ27Fe/sJ39PofeXslZeLoMv6rZtKaGBx0Wg==
X-Received: by 2002:a17:906:350c:b0:a43:fac5:8e87 with SMTP id r12-20020a170906350c00b00a43fac58e87mr2651887eja.65.1709377361515;
        Sat, 02 Mar 2024 03:02:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ty24-20020a170907c71800b00a42eb84c7c2sm2622616ejc.142.2024.03.02.03.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 03:02:40 -0800 (PST)
Message-ID: <4892abd0-6523-4955-be5e-4e585a276297@redhat.com>
Date: Sat, 2 Mar 2024 12:02:39 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Jean Delvare <jdelvare@suse.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Andi Shyti <andi.shyti@kernel.org>,
 eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
 Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org
References: <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
 <ZdNBGSJ28AcdpC7f@smile.fi.intel.com> <20240227210429.l5o52wuexqqmrpol@pali>
 <CAHp75VeGaKws35x4u-mrmWP2Rd55T6VcR9OjNfh+PsF_M9GR-g@mail.gmail.com>
 <20240227215000.gbmn4n2uzd3hyk3b@pali>
 <CAHp75Ve5S3S0MPuW1v8q3Dx8sbDZH_LCT8a_p7hwojF2aKS8CQ@mail.gmail.com>
 <ef071afc-8768-4aab-aaee-4c3c3c317c0e@redhat.com>
 <20240229204612.3cmeqdjixmvif3yw@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240229204612.3cmeqdjixmvif3yw@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/29/24 21:46, Pali Rohár wrote:
> On Wednesday 28 February 2024 13:50:27 Hans de Goede wrote:
>> Hi,
>>
>> On 2/27/24 23:37, Andy Shevchenko wrote:
>>> On Tue, Feb 27, 2024 at 11:50 PM Pali Rohár <pali@kernel.org> wrote:
>>>> On Tuesday 27 February 2024 23:19:19 Andy Shevchenko wrote:
>>>>> On Tue, Feb 27, 2024 at 11:04 PM Pali Rohár <pali@kernel.org> wrote:
>>>
>>> ...
>>>
>>>>> I'm wondering why we need all this. We have notifiers when a device is
>>>>> added / removed. We can provide a board_info for the device and attach
>>>>> it to the proper adapter, no?
>>>>
>>>> I do not know how flexible are notifiers. Can notifier call our callback
>>>> when new "struct i2c_adapter *adapter" was instanced?
>>>
>>> You can follow notifications of *an* I2C adapter being added /
>>> removed. With that, you can filter which one is that. Based on that
>>> you may attach a saved (at __init as you talked about in the reply to
>>> Hans) board_info with all necessary information.
>>>
>>> Something like this (combined)
>>> https://elixir.bootlin.com/linux/latest/source/drivers/ptp/ptp_ocp.c#L4515
>>> https://elixir.bootlin.com/linux/latest/source/drivers/input/mouse/psmouse-smbus.c#L194
>>
>> drivers/platform/x86/touchscreen_dmi.c actually already does something
>> like this for i2c-clients. The problem is that this brings probe-ordering
>> problems with it. If the i801 driver is loaded before the dell-smo8800
>> driver then the notifiers will not trigger since the i2c-adapter has
>> already been created (1).
>>
>> So we would still need a "cold-plug" manual scan in smo8800_probe()
>> anyways at which point we might as well just return -EPROBE_DEFER
>> when the adapter is not there.
> 
> And that it example why the current existing solution is better, it does
> not have such problems like the proposed.
> 
>> As for Pali's suggestion of having the i2c-i801 code call a symbol
>> exported by dell-smo8800
> 
> I did not suggest that! Please do not make false statements about me.

In: https://lore.kernel.org/platform-driver-x86/20240227210429.l5o52wuexqqmrpol@pali/

You write:

"Location of the quirks can be moved outside of the i2c-i801.c source
code relatively easily without need to change the way how parent--child
relationship currently works.

Relevant functions is_dell_system_with_lis3lv02d() and
register_dell_lis3lv02d_i2c_device() does not use internals of
i2c-i801 and could be moved into new file, lets say
drivers/platform/x86/dell/dell-smo8800-plat.c"

Ok I see now you suggest moving the code to a new file,
sorry for misreading that.

But the point is that moving the code does not help because
since there is a symbol used from the new code it will still
get loaded on all machines were the i2c-i801.c driver gets
loaded. So it will still be taking up RAM and increases
boot time (loading an extra module consumes time) on machines
which do not have any SMO88xx devices.

And that point is still valid even independent of the code
is moved to the existing dell-smo8800 module or to a new
dell-smo8800-plat module.

Regards,

Hans



