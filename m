Return-Path: <linux-i2c+bounces-4246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB5091344B
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 15:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E94A52832CF
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 13:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F60E16F282;
	Sat, 22 Jun 2024 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="avp4JVn7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D50A16F0FE
	for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 13:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719064572; cv=none; b=Xw/d4irbKNDbNFYRQ78chkySxFcTeyoWMBF9Fykws1YEBXYeC5M/86Y2DTLZkWQXpqdoGAu7KCWzgXnG0alPf9MmK320NbK8bNYrNREYtqcge1VpkPn0PwD5ALmb3jApQlQC6uT1aFD/HmwguX7r4zJcaX4087aessNEZPKHlvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719064572; c=relaxed/simple;
	bh=PghcEPuZ3T4nU92bbiup9DUwT//ssGBUXV8nMFGxKE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t//9+qwQ3lo9zMNIb7R6zg4K+v3lGpT5Xrh6GoEDA8uC/iupyy8wc1imNcK0LIVRV4DyKj+UD+pD/czChj3MxGu0yFDSG6fUJxeFtpshJLQYsNZ5y+faQcSqPQ0HAG7aR8s2rzbNDpEekVhNLDbyLxAqSmTMLSqE49NiEooFfAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=avp4JVn7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719064569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GUVwfHEkM7gqsu8oDdsML+qBRX6RggkpKKDG0pmSM3Y=;
	b=avp4JVn7Ho050jFL8cANfbaQ4UBoek2W4KRso//yMKK9E2ulRHF7IaW+RrL8IOWCC4wa/H
	vDRVKh5vsf4mCnbAeupTXN5KZYQeRw0bc2uGlMmhoGhHgcYQxvQWOp25Z025r5XWUpg7AI
	6C/R2wMEsTOiplYQGwcJFYOgln9+fTA=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-yGCfnW3ZO--3vst-jD6JwA-1; Sat, 22 Jun 2024 09:56:06 -0400
X-MC-Unique: yGCfnW3ZO--3vst-jD6JwA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52cdb097139so1004862e87.2
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 06:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719064565; x=1719669365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUVwfHEkM7gqsu8oDdsML+qBRX6RggkpKKDG0pmSM3Y=;
        b=m2dIaekW/pIeRSrydIJ/RtpB9q7cjgxvU0ssBz/OOjjNQoT/GvJ5E8ey+n7+xGLeUM
         Jz6JWm8dViZwLM/CW6L3yPWOxR79wX4Qc8qAsVrjjQ/ejQ9iOhLX7bf8LUcLkGM5D0Ym
         AR04OtCDVgnC3m+hEiJuPeNqQk1mejwup6LsLQT/hbBxJ23H0xA9NKFccb4G5wc0c/kU
         ABoYvBk+AOz9h3bUHBOEVZxCtTZLP3hiX6MwZTgNqemGHxNV6uEkUOTxEiaCydICEStt
         H21pSIsReUwybfddbGco2vk504KxFuKlF8tzXClI52ISeSIDk4Of75/6UN4LBQOlVc5P
         cYfw==
X-Forwarded-Encrypted: i=1; AJvYcCVJkSScQZHxXmgfcNbCm0YXmyR22E70vuEwqNq6QKkDs6189NERl5kPI+LAV1WAWiHauwzsxQEtkOq4obZV51PyMkQ3gqcpolCM
X-Gm-Message-State: AOJu0YwXp1xwfeAvISqSeIkQPR3BfWN0xa5oTUgrLAheXfzWQ4qioP0G
	AK+u+mBtbUXRwK5LkX3dkwh9xNl8WiXTI6zc/i2rivyi1JZEHRWcx5vyi5eIQEsf9+89VHGKt4p
	adrqTrMpQR4+a3bcFPBqhV5lHYrqJ5ByS0zDXy6Rx2GdKg+6Y9sjQu77+JhurHkbWAA==
X-Received: by 2002:a05:6512:34da:b0:52c:dba2:4f1 with SMTP id 2adb3069b0e04-52cdba2057dmr2327443e87.48.1719064564916;
        Sat, 22 Jun 2024 06:56:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg7Y/CkWsSPCRxmQpnXN/KE6mAyBWO/lyyB1jVqQdwo2pviDX36pPTZpFD1Y3Bt98bI1pPYg==
X-Received: by 2002:a05:6512:34da:b0:52c:dba2:4f1 with SMTP id 2adb3069b0e04-52cdba2057dmr2327427e87.48.1719064564440;
        Sat, 22 Jun 2024 06:56:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724377a1c3sm16330966b.19.2024.06.22.06.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 06:56:03 -0700 (PDT)
Message-ID: <8c45cc19-2164-46ea-a388-de23885c3323@redhat.com>
Date: Sat, 22 Jun 2024 15:56:03 +0200
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622124644.hndwwp44sfbiiq7o@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/22/24 2:46 PM, Pali Rohár wrote:
> On Friday 21 June 2024 14:24:57 Hans de Goede wrote:
>> On chipsets with a second 'Integrated Device Function' SMBus controller use
>> a different adapter-name for the second IDF adapter.
>>
>> This allows platform glue code which is looking for the primary i801
>> adapter to manually instantiate i2c_clients on to differentiate
>> between the 2.
>>
>> This allows such code to find the primary i801 adapter by name, without
>> needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index d2d2a6dbe29f..5ac5bbd60d45 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1760,8 +1760,13 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>  
>>  	i801_add_tco(priv);
>>  
>> -	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>> -		"SMBus I801 adapter at %04lx", priv->smba);
>> +	if (priv->features & FEATURE_IDF)
>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>> +			"SMBus I801 IDF adapter at %04lx", priv->smba);
>> +	else
>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>> +			"SMBus I801 adapter at %04lx", priv->smba);
>> +
> 
> User visible name is identifier for user / human.
> 
> If somebody is going to read this code in next 10 years then can ask
> question why to have different name for IDF FEATURE and not also for
> other features? And can come to conclusion to unify all names to be
> same (why not? it is user identifier).

That is a good point, I'll add a comment about this for the next
version.

> Depending on user names between different kernel subsystem is fragile,
> specially for future as rename can happen.

Relying no devices names to find devices is standard practice. E.g.
this is how 99% of the platform drivers bind to platform devices
by the driver and the device having the same name.

> If you are depending on FEATURE_IDF flag then check for the flag
> directly, and not hiding the flag by serializing it into the user
> visible name (char[] variable) and then de-serializing it in different
> kernel subsystem. If the flag is not exported yet then export it via
> some function or other API.

Exporting this through some new function is non trivial and adds
extra dependencies between modules, causing issues when one is builtin
and the other is build as a module.

The name check OTOH allows the modules to be less tightly coupled
and there is plenty of precedence for using a name check here.

Regards,

Hans



>>  	err = i2c_add_adapter(&priv->adapter);
>>  	if (err) {
>>  		platform_device_unregister(priv->tco_pdev);
>> -- 
>> 2.45.1
>>
> 


