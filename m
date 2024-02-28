Return-Path: <linux-i2c+bounces-2046-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C180D86AF73
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 13:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3960AB25A92
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 12:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A181149DE0;
	Wed, 28 Feb 2024 12:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AT7JxTTJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48555149001
	for <linux-i2c@vger.kernel.org>; Wed, 28 Feb 2024 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709124635; cv=none; b=OY2GSudA76Svp+nlwBf5MEYsPgQO0WIbsOrFNb7UidB0+cv4avA+lLCriiExH6qewzjFEgj/pT1Hw+yC5RLweExq4YsMvwYXawpa7Cx/1zMQNTJ/FRLhidOlxIThFS5XvhxpcPTUqVzsvG3pz4HuAX2oNkGVNxsAJQ8XCucnjW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709124635; c=relaxed/simple;
	bh=j5ABAlktolX5vRtDzpTE52a1elGXJ19ATUIk5DI5WTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJhVUGkdK9UUHpDT1hvMj3YtnkWZD0UPIeQwWXx8+mgy/ett6yz9sa7+mkgDAa0QJ+zKQ/YqcjpwqCadA7WRCXXbJxAZmxtAY+9sHOYHzixzK4MZWhGNbApSkltPrgB1+ULDnydHAkVxSke2VO4zsQrEOqOjbs2Fd55sMMz+jmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AT7JxTTJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709124632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2xNRDhIuGHBjq6yEi4gfdXLq6JqoowvrAtd1O30NW0=;
	b=AT7JxTTJgnWaOjEHzweaaSMpX9ky7AQOxmbx0XIK6wnd773vBZsFHBGTv8ek9mR7DYq6hM
	sJp4MDoF/xM4ftdVVMaOAtrlWaO62L61IlENrEo+McZc5q80gWdNqgJY7CUz6Tp9ooq94o
	8B++x1j7j0ig+ZHVuwd2jEuJXEeT3wo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-NSCA-Sw1O_OPSo2RRVOIUQ-1; Wed, 28 Feb 2024 07:50:30 -0500
X-MC-Unique: NSCA-Sw1O_OPSo2RRVOIUQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5656f696a00so4646524a12.1
        for <linux-i2c@vger.kernel.org>; Wed, 28 Feb 2024 04:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709124629; x=1709729429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2xNRDhIuGHBjq6yEi4gfdXLq6JqoowvrAtd1O30NW0=;
        b=ItQJ9UkG3p7smo3zM7mvAyXoKdbv7qQAx4pnftd9jnbhqCQ0radlJqzBNWBli5zubm
         3l4DbrGAfFgXAsPaq1WvIl6GLtNgUIOFjdJRnkJgbw/1xCQNokdpZ8kUUM8SDN46qxGs
         cneZeg2zQ07rLGkyEX6kJOjB+5RzXosG6fcEFxF7v1X5/XqJbzJauOb2rL1Cq79EuBHK
         9/pPoO8INlXObmHJ/hON6C3qTyn2SRVSGfM7hsi0u1kowpaloMQTJSrbDshHUKWe0qgk
         KIFRiiU9PT1lGc4ebfOv5WlFs8DHtas0g9aKdrdUeyIffB+01kkKXcYse7Ihp/Qg+g07
         NTnA==
X-Forwarded-Encrypted: i=1; AJvYcCWp7E3ZwNLPwJ5UgB9QLpoF99OluV7DVyD+5LLWFyPPT0Z8GkAFK7iDiQ2JsE5L3yMjD/QWcalIYBQYst4nEGwvEDjU9fdBOBYL
X-Gm-Message-State: AOJu0Yxmcoz2hd5wq1nM+Xeuh/bd5PMMgdKZ26/skWxDn6pQ2AwWBfhK
	+IwlDg1jCjqaPh2jLnU12w+4BujsvE9wWivIj7crh1SGZcqpGPuDsDrM4sW+F/IBpqqfMmhy0Ck
	/g8krrnSZcHdjlFLjdbd/FeH5i9D5vheJFjxDVPUWC9Md9GuBxDIyPuTsnQ==
X-Received: by 2002:aa7:d958:0:b0:565:3574:c71e with SMTP id l24-20020aa7d958000000b005653574c71emr8511919eds.28.1709124629586;
        Wed, 28 Feb 2024 04:50:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWfl4elY2kENiIsJZ+yH38W5Gp3r0+RM/Ci214/isWgfZ4vpt5r9BfDo8e2ijofSkCkM/ubA==
X-Received: by 2002:aa7:d958:0:b0:565:3574:c71e with SMTP id l24-20020aa7d958000000b005653574c71emr8511909eds.28.1709124629203;
        Wed, 28 Feb 2024 04:50:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ev27-20020a056402541b00b005667ae231basm270280edb.40.2024.02.28.04.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 04:50:28 -0800 (PST)
Message-ID: <ef071afc-8768-4aab-aaee-4c3c3c317c0e@redhat.com>
Date: Wed, 28 Feb 2024 13:50:27 +0100
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
To: Andy Shevchenko <andy.shevchenko@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, Jean Delvare <jdelvare@suse.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Andi Shyti <andi.shyti@kernel.org>,
 eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
 Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
 <ZdNBGSJ28AcdpC7f@smile.fi.intel.com> <20240227210429.l5o52wuexqqmrpol@pali>
 <CAHp75VeGaKws35x4u-mrmWP2Rd55T6VcR9OjNfh+PsF_M9GR-g@mail.gmail.com>
 <20240227215000.gbmn4n2uzd3hyk3b@pali>
 <CAHp75Ve5S3S0MPuW1v8q3Dx8sbDZH_LCT8a_p7hwojF2aKS8CQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve5S3S0MPuW1v8q3Dx8sbDZH_LCT8a_p7hwojF2aKS8CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/27/24 23:37, Andy Shevchenko wrote:
> On Tue, Feb 27, 2024 at 11:50 PM Pali Rohár <pali@kernel.org> wrote:
>> On Tuesday 27 February 2024 23:19:19 Andy Shevchenko wrote:
>>> On Tue, Feb 27, 2024 at 11:04 PM Pali Rohár <pali@kernel.org> wrote:
> 
> ...
> 
>>> I'm wondering why we need all this. We have notifiers when a device is
>>> added / removed. We can provide a board_info for the device and attach
>>> it to the proper adapter, no?
>>
>> I do not know how flexible are notifiers. Can notifier call our callback
>> when new "struct i2c_adapter *adapter" was instanced?
> 
> You can follow notifications of *an* I2C adapter being added /
> removed. With that, you can filter which one is that. Based on that
> you may attach a saved (at __init as you talked about in the reply to
> Hans) board_info with all necessary information.
> 
> Something like this (combined)
> https://elixir.bootlin.com/linux/latest/source/drivers/ptp/ptp_ocp.c#L4515
> https://elixir.bootlin.com/linux/latest/source/drivers/input/mouse/psmouse-smbus.c#L194

drivers/platform/x86/touchscreen_dmi.c actually already does something
like this for i2c-clients. The problem is that this brings probe-ordering
problems with it. If the i801 driver is loaded before the dell-smo8800
driver then the notifiers will not trigger since the i2c-adapter has
already been created (1).

So we would still need a "cold-plug" manual scan in smo8800_probe()
anyways at which point we might as well just return -EPROBE_DEFER
when the adapter is not there.

As for Pali's suggestion of having the i2c-i801 code call a symbol
exported by dell-smo8800 that will cause the dell-smo8800 driver
to load on all x86 devices with an i2c-i801 controller (pretty
much all of them). Slowing the boot and eating memory.

So IMHO just doing the scan for the i2c-i801 adapter as already
done in this version of the patch-set, extended with returning
-EPROBE_DEFER if it is not found is the best solution.

Yes this means losing the i2c_client for the lis3lv02d device
if the i2c-i801 driver is manually unbound or rmmod-ed. But that
requires explicit root user action and putting just the i801
driver back in place again also requires implicit root action.

IMHO it is acceptable that in this exceptional case, which
normal users will never hit, a rmmod + modprobe of dell-smo8800
is required to re-gain the lis3lv02d i2c_client.

Regards,

Hans


1) touchscreen_dmi is builtin only because of this and we really
want to avoid adding more of that. Actually thinking more about this
it would be nice to modify touchscreen_dmi to use a mix of registering
the notifier + doing a scan after registering it for matching devices
which are already present, so that touchscreen_dmi can become a module
auto-loaded using the DMI info which it already contains.











> 
>>>> With this simple change all dell smo8800 code would be in its subdir
>>>> drivers/platform/x86/dell/ and i2c-i801.c would get rid of smo code.
>>>>
>>>> This approach does not change any functionality, so should be absolutely
>>>> safe.
>>>>
>>>> Future changes will be done only in drivers/platform/x86/dell/ subdir,
>>>> touching i801 would not be needed at all.
>>>
>>> Still these exported functions are not the best solution we can do,
>>> right? We should be able to decouple them without need for the custom
>>> APIs.
>>
>> Well, what I described here is a simple change which get rid of the one
>> problem: i2c-i801.c contains SMO88xx related code and changing SMO88xx
>> logic (like adding a new device id) requires touching unrelated
>> i2c-i801.c source file.
> 
> `get rid of one problem` --> `replace one by another (but maybe less
> critical, dunno) problem`. The new one is the spread of custom APIs
> for a single user, which also requires an additional, shared header
> file and all hell with the Kconfig dependencies.
> 
>> I like small changes which can be easily reviewed and address one
>> problem. Step by step. That is why I proposed it here.
>>
>> For decoupling it is needed to get newly instanced adapter (if the
>> mentioned notifier is able to tell this information) and also it is
>> needed to check if the adapter is the i801.
> 
> Yes.
> 
> 


