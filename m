Return-Path: <linux-i2c+bounces-4624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAB39273D0
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 12:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DF8E1C23CA2
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 10:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F361A38FE;
	Thu,  4 Jul 2024 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kj5l7uPk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B1F174EC0
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jul 2024 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088254; cv=none; b=Ed469CgVN4uuXCTsZhx3ScofLbsvV/0HAZBxhUQzVPayQH3RSLX/ubPkOrdpAxm4JVagUzZuismna6ZFtl3PXFl8f+uh5K4x3emQSxpsM4nl0ykZ33dVp4hLL8M8n81YVOGbPqfK6D2cBL5Bj/KIq4kGnu5k2TYZGUDmA1zyiu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088254; c=relaxed/simple;
	bh=OVAdnK7qZNL7vYn6UtaIpIv67UHFpId9C03SwmEpcc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHjXNSPDrZU3ARnlV4yIF7rq2833FetBTlVCmKXvZHVYd0uj7liIJhdKy1V+IFUV9dPa15AMWXxwxkyWWTHen8KanRd+av9hi9qEqC+O1tCmvcaatcBNMlQ3jU1STnleLWVorE2sMyHHSpqbBMXmicfsy+o2NOilj56pKPinMXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kj5l7uPk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720088251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlT0R3nrYXnf+mqAUv6TAp28eO+w9RkmXxxcdlJWWpw=;
	b=Kj5l7uPkDPZ94cNd2rnM7o91J+zXemdKzMvwi/PS3Yy6F6Kq6hSgz04RsBZYhMTZsYUKzA
	/a8CmsEvfsJHlO15HWLZdUtB7cZxBArtuvMZd7YrYuI1r862pBszwwirMhEPEgAnbbjAGA
	1IysUrIYxktr7Jcf7UBZRh7Jkjv8ri4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-SRw3jWywM8KRUdfHKSjLsw-1; Thu, 04 Jul 2024 06:17:29 -0400
X-MC-Unique: SRw3jWywM8KRUdfHKSjLsw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a706f279c56so41721366b.3
        for <linux-i2c@vger.kernel.org>; Thu, 04 Jul 2024 03:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720088249; x=1720693049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlT0R3nrYXnf+mqAUv6TAp28eO+w9RkmXxxcdlJWWpw=;
        b=MwpumBxUMsxf2PaYNBQmGpJpeve2Bi0nlNBgs2IeWFKV2Z7PR5cH6MCPVMZTuHWODS
         9w2aa++8KnZYevXHdb2ppTX9eJmbrlEqkBSg9tWDhX3WEjH9R9SylodAKD8LXKpXrjvc
         flKEB3lSZ+/JBNE2zjAzWGO1KLEqYu8eNtT2+YRmtZorckBefcvQVxb+VYwP7Yto++gG
         qt2SmOJ7+4ej21aIJAIm/5Txkbzd1ociytVHKEupT4Q03aaJg1RQvQozhUE3MuLU02ml
         Kei1RsR9letytgKamrv6MDBoQHXzeWkNNc21L2I7pr1GHT1qKXJhuYcMGTwHjB8iaMda
         0Zcg==
X-Forwarded-Encrypted: i=1; AJvYcCXPeQQdb3DPlCX7YtwQUAY1u1rbxbS9zfDUhLNfR/wtDIuuEzWncj+bPV5YJMbRXm8TuQL+fEajHbZtW+WKH39bLl+OcjtIbLpP
X-Gm-Message-State: AOJu0YxNWSHPmBBhSnWGdY4tTMS+fTr0DZ1LwG+W6Kn7CasRp75DZ3tT
	nxB0EVbjJ+2O209iLRkW641eJPPzrOUk3jwVM2XGC6EIYc9tO+GbRCBHpFzGdkpvbjLH0y8Inp7
	jcZNDsDkcONe1OasWzjvlbHHMqKSP9WHtuN7jWgtJ2VwzNF7b8LCSnQL0Og==
X-Received: by 2002:a17:906:4089:b0:a6f:c4d6:4874 with SMTP id a640c23a62f3a-a77ba4c5901mr68283566b.34.1720088248726;
        Thu, 04 Jul 2024 03:17:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpKZlcN8XcdRzunHRiWvrB3S55awbA8deGgY/lPpq+WC6xO4AUEmAmv5iin6AEJslhPN7Ngg==
X-Received: by 2002:a17:906:4089:b0:a6f:c4d6:4874 with SMTP id a640c23a62f3a-a77ba4c5901mr68281766b.34.1720088248336;
        Thu, 04 Jul 2024 03:17:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a75390ca05fsm270961866b.92.2024.07.04.03.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 03:17:27 -0700 (PDT)
Message-ID: <991b1de6-10fc-4917-8e1c-442a71adf04e@redhat.com>
Date: Thu, 4 Jul 2024 12:17:27 +0200
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240703184121.t2wh5sb5ki2kwots@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 7/3/24 8:41 PM, Pali Rohár wrote:
> On Wednesday 03 July 2024 12:58:01 Hans de Goede wrote:
>> Hi,
>>
>> On 6/24/24 8:28 PM, Pali Rohár wrote:
>>> On Monday 24 June 2024 13:15:12 Hans de Goede wrote:
>>>> Hans de Goede (6):
>>>>   i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
>>>>   i2c: i801: Use a different adapter-name for IDF adapters
>>>>   platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to
>>>>     dell-smo8800-ids.h
>>>>   platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
>>>>     from i2c-i801 to dell-lis3lv02d
>>>>   platform/x86: dell-smo8800: Add a couple more models to
>>>>     lis3lv02d_devices[]
>>>>   platform/x86: dell-smo8800: Add support for probing for the
>>>>     accelerometer i2c address
>>>
>>> Patches 1-5 looks good. There are just a few minor things, but you can add
>>> Reviewed-by: Pali Rohár <pali@kernel.org>
>>
>> Thank you.
>>
>>> For patch 6 as I mentioned previously I'm strictly against this change
>>> until somebody goes and politely ask Dell about the current situation of
>>> the discovering of accelerometer's i2c address.
>>
>> Dell is on the Cc and not responding...
> 
> And what do you expecting here? That somebody on the group address
> specified in CC list would react to all your tons of messages? Not
> mentioning the fact that you did not even ask anything.

You keep on repeating this since I first posted this patch
in December last year, but as I already wrote back then:

https://lore.kernel.org/platform-driver-x86/8b3946e0-7eb5-4e1f-9708-1f6cfda95e1a@redhat.com/

"Unfortunately I no longer have any contacts inside Dell"

And Paul Menzel reached out back to gkh back then asking
if Greg had any contacts in he did not have any contacts
either.

Dell.Client.Kernel@dell.com is the official address listed
for Dell drivers under drivers/platform/x86 .

> This is not how things works.

The email address which I'm using is *THE* one which Dell has
provided for contacting about Dell pdx86 drivers. I really
don't know what else you expect me to do here.

You just keep repeating that Dell should be contacted about
this and multiple people (me and Andy) have already pointed
out that Dell does not have any other contact info. Repeating
the same remark over and over does not change things.

As I mentioned in my other email too, if you think you can do
better feel free to try and contact Dell your self, something
which you could already have done the first time you mentioned
this in December 2023, back when I already said I don't have
any other contact info for Dell.

> If you do not change your attitude here then I highly doubt that
> somebody will respond to you.
> 
> I have feeling that you are doing it on purpose just because you do not
> want to do anything, and trying to find some kind of proof that nobody
> is responding to you, to convince others for merge your last hack change.

This is just plain hurtful I do not believe I have ever done
anything to earn this level of distrust from you.

I am hurt that you cannot at least show the common decency to
assume good intentions from my side.

Regards,

Hans



