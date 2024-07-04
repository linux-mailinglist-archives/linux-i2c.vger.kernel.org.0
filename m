Return-Path: <linux-i2c+bounces-4639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ED7927CAA
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 19:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 300C2285C38
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 17:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A47413B7BC;
	Thu,  4 Jul 2024 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RzOW4nsg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA806A039
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jul 2024 17:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720115675; cv=none; b=SXMsCYiw33kF74pB7Gk/+Bm7U2ayEhsOKWLCFh5P4VITj7DTCkeVYyBT6BHJhRJxzfbBsCFT3u1fDn4tqfkVHmHV6yTox2x8ameS+ryVfk39mCDBQGCJ7y3vNMvUXF1FHoiw11b1o4BSCa4Nb/9kjYiMzTR3AGtgLRdO0VdoQzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720115675; c=relaxed/simple;
	bh=6SaPzJpUtXiCNBBN3+a19/4lywW7X41/zCENazn0ZuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q73XYFbGIZtLjYfWiz+7sZdnf+Au2FzdyLqMoUJa1uhvA1pHzT8tdZIzU08w2FurwAWPdw2xMD3Ry3h+Fr4k+mqIrm33VFDBAQFMWGKIev7Nbul7MfennH19J0vs2OCCSv9Q2TkQRRPxX8bsdZK7vYzB9gvXUj7zeAwe4w9X7Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RzOW4nsg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720115671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p0OVI1ptK3bSWX9XuQZbjaE6FaTzDZuFRxPxWsvuR8o=;
	b=RzOW4nsgLhcK2YXT1bJjDas8Qk3d2VetM2TKGCi03dWqg300fu+sCBXw12Uoj6wcqxX6oC
	N3DX1u3WCjmz1hQrhJ4evfdXXdv/KAhKLjfUQH4zi9vrMdzcKep1oXtPoco4v9Yw0cwhR7
	ycy39/y3sYv4st8P9K9IBgQBac2draU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-SG5MrFhsMCqUlrqeWHmABg-1; Thu, 04 Jul 2024 13:54:29 -0400
X-MC-Unique: SG5MrFhsMCqUlrqeWHmABg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a77bd20b09aso60380366b.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Jul 2024 10:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720115669; x=1720720469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0OVI1ptK3bSWX9XuQZbjaE6FaTzDZuFRxPxWsvuR8o=;
        b=p+aeoMrPrujCDZXwJ3gikDPq2W624UIY/bpRhfOvuB8KrE6/d6Ie3ECyL/xp8SxNQH
         FSH+b9JfoQlFsp5aWa14lVShpcSQigwAb7WE2kxg7Vm6vd8ihs3j4UTex/+MBvL3f2Fe
         ItDTJW8Z2tT0TuM8BFeYtfJPzhkv7T8AwO606+YhSM6PlVI7odoFm+r2MWCC6hi2Ehow
         IQ/blibJonEXbpmDBFKc3iXWZCJSkVKyUDpjYM1TAVhx5p/Vrdi3dA9T1n0LCm+CZu1g
         6Sn2GOhefJ39VJKK9OOFhapekqFI3mv1tl6u3KjjVt8uYeiGFVMFB+A6BWD205NIWQ4A
         6Zww==
X-Forwarded-Encrypted: i=1; AJvYcCVj6Jyt11VMiUb0v/hyqqwWpv7/mv7j0VV3SB6dRb1+cgH+LcQq+vlmdeyrxZxgimYCjE6yFq3fQrbFkB4g2dGwqzdTxMJ9O/3K
X-Gm-Message-State: AOJu0YxaXg/1a72/9JVP2boCr4g6iL7Lg3KKfeEEDFNQS2rH6dTXAWLV
	N//tkekyy5jp3pFpnzyfCWlbc5Pt39IZ5GwCXY5sJ4jUC6JmgMTUC+uazmqF+AnR4gQLVVRCdIA
	Ib+j1qKsCUsQnlbD+pL2o7HvRtyS+H73gyaYOBJRSmjG45jCH4sigtouCJA==
X-Received: by 2002:a17:906:4794:b0:a75:3c1d:f9c9 with SMTP id a640c23a62f3a-a77ba4690e7mr166357866b.28.1720115668744;
        Thu, 04 Jul 2024 10:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIaHVEMgR3On7nbwmlnWYURIUoemqKks+AS875LqsZN1Y+C07apyttEGqFq2Ys3ge4Ospd5w==
X-Received: by 2002:a17:906:4794:b0:a75:3c1d:f9c9 with SMTP id a640c23a62f3a-a77ba4690e7mr166356266b.28.1720115668287;
        Thu, 04 Jul 2024 10:54:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08d138sm615353166b.158.2024.07.04.10.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 10:54:27 -0700 (PDT)
Message-ID: <8328c997-590f-4785-b1dc-8714633ef31c@redhat.com>
Date: Thu, 4 Jul 2024 19:54:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] i2c-i801 / dell-lis3lv02d: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240624111519.15652-1-hdegoede@redhat.com>
 <20240624182812.fa6akymygv3qolug@pali>
 <a6a554d1-2cdb-4e34-ac07-2778d534b558@redhat.com>
 <20240703184121.t2wh5sb5ki2kwots@pali>
 <991b1de6-10fc-4917-8e1c-442a71adf04e@redhat.com>
 <20240704155433.pe3j3bclr3ukn2w5@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240704155433.pe3j3bclr3ukn2w5@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 7/4/24 5:54 PM, Pali Rohár wrote:
> On Thursday 04 July 2024 12:17:27 Hans de Goede wrote:
>> Hi Pali,
>>
>> On 7/3/24 8:41 PM, Pali Rohár wrote:
>>> On Wednesday 03 July 2024 12:58:01 Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 6/24/24 8:28 PM, Pali Rohár wrote:
>>>>> On Monday 24 June 2024 13:15:12 Hans de Goede wrote:
>>>>>> Hans de Goede (6):
>>>>>>   i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
>>>>>>   i2c: i801: Use a different adapter-name for IDF adapters
>>>>>>   platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to
>>>>>>     dell-smo8800-ids.h
>>>>>>   platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
>>>>>>     from i2c-i801 to dell-lis3lv02d
>>>>>>   platform/x86: dell-smo8800: Add a couple more models to
>>>>>>     lis3lv02d_devices[]
>>>>>>   platform/x86: dell-smo8800: Add support for probing for the
>>>>>>     accelerometer i2c address
>>>>>
>>>>> Patches 1-5 looks good. There are just a few minor things, but you can add
>>>>> Reviewed-by: Pali Rohár <pali@kernel.org>
>>>>
>>>> Thank you.
>>>>
>>>>> For patch 6 as I mentioned previously I'm strictly against this change
>>>>> until somebody goes and politely ask Dell about the current situation of
>>>>> the discovering of accelerometer's i2c address.
>>>>
>>>> Dell is on the Cc and not responding...
>>>
>>> And what do you expecting here? That somebody on the group address
>>> specified in CC list would react to all your tons of messages? Not
>>> mentioning the fact that you did not even ask anything.
>>
>> You keep on repeating this since I first posted this patch
>> in December last year, but as I already wrote back then:
> 
> Yes, because you have not done anything and you are just repeating those
> nonsenses. What are you expecting? You are either doing all this on
> purpose or you are just lazy and think that somebody (e.g. me) would do
> this stuff.
> 
>> https://lore.kernel.org/platform-driver-x86/8b3946e0-7eb5-4e1f-9708-1f6cfda95e1a@redhat.com/
>>
>> "Unfortunately I no longer have any contacts inside Dell"
>>
>> And Paul Menzel reached out back to gkh back then asking
>> if Greg had any contacts in he did not have any contacts
>> either.
>>
>> Dell.Client.Kernel@dell.com is the official address listed
>> for Dell drivers under drivers/platform/x86 .
> 
> Perfect. And may you explain why you have not tried to contact them with
> addressed requests of exact information of what you need and ask for
> help? You wrote tons of emails with zero value.
> 
>>> This is not how things works.
>>
>> The email address which I'm using is *THE* one which Dell has
>> provided for contacting about Dell pdx86 drivers. I really
>> don't know what else you expect me to do here.
>>
>> You just keep repeating that Dell should be contacted about
>> this and multiple people (me and Andy) have already pointed
>> out that Dell does not have any other contact info. Repeating
>> the same remark over and over does not change things.
>>
>> As I mentioned in my other email too, if you think you can do
>> better feel free to try and contact Dell your self, something
> 
> I'm not your servant and I'm not going to play role of your secretary.
> 
>> which you could already have done the first time you mentioned
>> this in December 2023, back when I already said I don't have
>> any other contact info for Dell.
> 
> Could you stop complaining? I'm really not interested in your stories
> why you are not wanted to do anything.
> 
>>> If you do not change your attitude here then I highly doubt that
>>> somebody will respond to you.
>>>
>>> I have feeling that you are doing it on purpose just because you do not
>>> want to do anything, and trying to find some kind of proof that nobody
>>> is responding to you, to convince others for merge your last hack change.
>>
>> This is just plain hurtful I do not believe I have ever done
>> anything to earn this level of distrust from you.
> 
> Then read your message again. Now it is more clear that you are doing
> it on purpose.
> 
>> I am hurt that you cannot at least show the common decency to
>> assume good intentions from my side.
> 
> I hope that I do not have to explain you how to find contact address in
> MAINTAINERS file, how to write an addressed email for target audience,
> how to formulate questions and how to ask for information. And how to do
> it in _one_ message.

Really? Doubling down after insulting me (calling my integrity into
question) ?

So be it, I will simply not be responding to you in this thread anymore.

Regards,

Hans





