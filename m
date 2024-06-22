Return-Path: <linux-i2c+bounces-4251-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CA8913466
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 16:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 208C01C21482
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 14:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510D116F29F;
	Sat, 22 Jun 2024 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FcmVfFGo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0816EC10
	for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719065659; cv=none; b=p7/C04o5TshYnOtHeY78meZSsunm+UsJzgfmSEvR9XU2alTi2lHN5AyfpGlb793yXCyw1A50Fv9tYUA0S9KcrKaVbQzWXLWoQEGWEgOtJOFxibRoDvE5Z3Qtd7NwvXKDJrniUuP5+AGzH0Tzr40v4eC88zjjwp2hsegkKgPCnis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719065659; c=relaxed/simple;
	bh=bjjWtE1HfAGpKIxBAzkbVUiw4+m+VpMWuLQ7WIoZLr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2fwJqNTGhl57N67znWYWOt7syz8zhgiwCSXhWY4M1CP8wGF33XvJFPEON5OSZ1NVPAhbe2SgHa3M6r6F4mTt54Hw2XY7zFDuvR1bAui8KGMO0/OSinI1H2glKPobtJAFxUmkiIZ52tfJCaDZVpe8dSanb4mQjCzhB9T5njpzNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FcmVfFGo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719065656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jefkse+YJLfMRACzSCpdZsIfvSgvEArCEvw1saKbEUM=;
	b=FcmVfFGoSYtrnxB6aik+4re/clN374UzCO1il2ZolhUDi+Pn4yvozkCfh5cK/Q9pEVU4GI
	vNocmDm5XqvbmYWUw1pH73tqw2Y6IXYz4TvLeQEmIs2AGcG9wfTulX6HKd2jpQZbdeeU72
	gvxLdExToC+A10S82aBmI8lAbApAGPs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-3BsHxCUINp2XOQF5od1ENA-1; Sat, 22 Jun 2024 10:14:14 -0400
X-MC-Unique: 3BsHxCUINp2XOQF5od1ENA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ec5100480bso10012921fa.0
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 07:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719065653; x=1719670453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jefkse+YJLfMRACzSCpdZsIfvSgvEArCEvw1saKbEUM=;
        b=vhIvXXpIY3OrXPbUTdDjZalst3WAwFP/o12T3//QaNGyoZoegwNGHI+EsSH/1eUo/9
         0jvfsyMsX0a7spld3/EAYZIMTSBN1iWJoAa53mUW+3nWt6GOOAU5ELpZnhde2Upw7S6n
         FZ+XoDP0eccGpUMmHEYPdRWdmJ9afiZdDMdJ/MhFoEAuqjDP1PN9fW1Q/Buuzzh00yIG
         dcIVVFasf2UkNkzEf6CR/OCPaX9J6FstQiuV5paDufNyS4WGvPg6pfpe+Oi2asMLGl5/
         AIBpVY3Wv+DmEb6h+KrFQUCsnUq205+BZDesvXCnfaP7T/+IBqeXGlTNSro5Tp8iSHuv
         +wiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrX2wEcD5/vGUKKZ8KieX90oYxckhI9+WumWoYFnVH5xCUJ1fEgmA7c/03j7L0T9vHhwDj4rqWQ8Z4aQqiploKzYWAp+jkF4C2
X-Gm-Message-State: AOJu0YwWkru/xaTOfRvWwQuPA+JF548QDQosNal67VaMchRkbaa5sWqw
	EoWo4aLhu+ymw1P2R6jOL/ID1vPK8INV+5xA2sEA7Cbi9/jtJHgP3K9PYLXJjQBZfyDMSLIgcTI
	nJF9Z5k3rB4LPQBevTGQ00lVJ2UXJy1+lfcRLU1rZKzaQUF5GxMvduhrNu9llD52ZXw==
X-Received: by 2002:a05:651c:1047:b0:2ec:5a25:16e9 with SMTP id 38308e7fff4ca-2ec5a25170dmr2004151fa.34.1719065652834;
        Sat, 22 Jun 2024 07:14:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdykNcrqGNc8tLze2UYXQLADvWxfEbtliL6F40iAozjMKRXp5Of1RWs4dFpZUTIRp4rufmxQ==
X-Received: by 2002:a05:651c:1047:b0:2ec:5a25:16e9 with SMTP id 38308e7fff4ca-2ec5a25170dmr2004041fa.34.1719065652345;
        Sat, 22 Jun 2024 07:14:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3048b7bbsm2457092a12.53.2024.06.22.07.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 07:14:11 -0700 (PDT)
Message-ID: <9736d178-ae8b-4e70-9b9f-7933d285f74c@redhat.com>
Date: Sat, 22 Jun 2024 16:14:11 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-3-hdegoede@redhat.com>
 <20240622124644.hndwwp44sfbiiq7o@pali>
 <8c45cc19-2164-46ea-a388-de23885c3323@redhat.com>
 <20240622140840.n5733l4ere26gnra@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622140840.n5733l4ere26gnra@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 6/22/24 4:08 PM, Pali Rohár wrote:
> On Saturday 22 June 2024 15:56:03 Hans de Goede wrote:
>> Hi,
>>
>> On 6/22/24 2:46 PM, Pali Rohár wrote:
>>> On Friday 21 June 2024 14:24:57 Hans de Goede wrote:
>>>> On chipsets with a second 'Integrated Device Function' SMBus controller use
>>>> a different adapter-name for the second IDF adapter.
>>>>
>>>> This allows platform glue code which is looking for the primary i801
>>>> adapter to manually instantiate i2c_clients on to differentiate
>>>> between the 2.
>>>>
>>>> This allows such code to find the primary i801 adapter by name, without
>>>> needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-i801.c | 9 +++++++--
>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>>>> index d2d2a6dbe29f..5ac5bbd60d45 100644
>>>> --- a/drivers/i2c/busses/i2c-i801.c
>>>> +++ b/drivers/i2c/busses/i2c-i801.c
>>>> @@ -1760,8 +1760,13 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>>>  
>>>>  	i801_add_tco(priv);
>>>>  
>>>> -	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>>>> -		"SMBus I801 adapter at %04lx", priv->smba);
>>>> +	if (priv->features & FEATURE_IDF)
>>>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>>>> +			"SMBus I801 IDF adapter at %04lx", priv->smba);
>>>> +	else
>>>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>>>> +			"SMBus I801 adapter at %04lx", priv->smba);
>>>> +
>>>
>>> User visible name is identifier for user / human.
>>>
>>> If somebody is going to read this code in next 10 years then can ask
>>> question why to have different name for IDF FEATURE and not also for
>>> other features? And can come to conclusion to unify all names to be
>>> same (why not? it is user identifier).
>>
>> That is a good point, I'll add a comment about this for the next
>> version.
>>
>>> Depending on user names between different kernel subsystem is fragile,
>>> specially for future as rename can happen.
>>
>> Relying no devices names to find devices is standard practice. E.g.
>> this is how 99% of the platform drivers bind to platform devices
>> by the driver and the device having the same name.
> 
> But here it is adapter name which is more likely description, not the
> device name which is used for binding.

It is still matching on a name.

>>> If you are depending on FEATURE_IDF flag then check for the flag
>>> directly, and not hiding the flag by serializing it into the user
>>> visible name (char[] variable) and then de-serializing it in different
>>> kernel subsystem. If the flag is not exported yet then export it via
>>> some function or other API.
>>
>> Exporting this through some new function is non trivial and adds
>> extra dependencies between modules, causing issues when one is builtin
>> and the other is build as a module.
> 
> Access to "struct i801_priv *" is not possible? For example via
> dev_get_drvdata() on "struct device *" which you have in
> smo8800_find_i801()?
> 
> Because if it is possible then you can create an inline function in some
> shared header file which access this flag. Not perfect (as accessing
> private data is not the best thing) but can avoid dependences between
> modules.

Prodding inside another drivers private driver struct is a big nono
and much much more fragile then the name checking.

Regards,

Hans



