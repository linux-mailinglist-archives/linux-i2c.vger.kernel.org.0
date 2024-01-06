Return-Path: <linux-i2c+bounces-1170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59067825F6A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 13:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBC66283D7E
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 12:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE016FC8;
	Sat,  6 Jan 2024 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PHKZQSDy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898707496
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jan 2024 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704543191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SJwHL0gnGivLO6oy/SpfbK1U9/fXgdjOFm8COmcetDU=;
	b=PHKZQSDyTJjKsb3tkq07aRSIdTFXPpoPVpGhHqxV/J45a6cyDX8eZlnmreT8F4sjP+kzjO
	hJW+dzJP0cnznXdPirI9qbV8KpYR0vvXQvHibyn7hKFMiJ3bYRBWgEPTT0g1S+xQQ1w49y
	2WFKoQ8Qs3WYa44C4w47NykTrB9Oafc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-si142YiaM_qj4r5EeJhKCw-1; Sat, 06 Jan 2024 07:13:04 -0500
X-MC-Unique: si142YiaM_qj4r5EeJhKCw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40d85858180so2928595e9.0
        for <linux-i2c@vger.kernel.org>; Sat, 06 Jan 2024 04:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704543183; x=1705147983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJwHL0gnGivLO6oy/SpfbK1U9/fXgdjOFm8COmcetDU=;
        b=u3gmJeOVoqQFTJv+JMGSQ5P6S8TLyMSjIYLD7NNqNDxta9tsp0hYt3INQ5lm1Gp3Zm
         rDI1AB6idaK6JpZuoD06gr8nQVwhPNb1O9lTGedDygJMogZpPsmgYGNqXI6cmsl5YzrF
         kkOIpq46KQkS9x84JTxgdD1LyEfVVYhNtxfOTWNfGtHO4mQoR1mnctfF+y92EAeHF7qM
         b5KFeLDddtpXuwROco+LRuEZOfv1kVqPvLBNFnvncERgBX5pB898xo7MNqOw0b4H76hX
         BuwViVoy2Aivi3GD2XGq2Jl0mpeaTmaVEDWXL/PHOZZ+c3M3cYvKL/sVuw+htwcA2j1w
         d0rg==
X-Gm-Message-State: AOJu0YyJYDzQigJg8X4EwzSlSKovJX5VDwxpI10plTWVCuEUin6j10qw
	RovxZWRCg3XDViUaCrRCJUR0tohn95DVQOh3SzNH7nPxti96rRdqqhPMk9GavYutmuOOtUHhDyS
	uMdOXQigscU8DtE4X5VpE3f60/pwM
X-Received: by 2002:a05:600c:1e1c:b0:40d:887e:fc8a with SMTP id ay28-20020a05600c1e1c00b0040d887efc8amr481774wmb.101.1704543183707;
        Sat, 06 Jan 2024 04:13:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGFCfVmwmTWnvOVFKVy59z1/GbNtLf57o0fcmJm5/Cm82FpRJpOq0WBvg2Rs1ICCqy/8y6Cg==
X-Received: by 2002:a05:600c:1e1c:b0:40d:887e:fc8a with SMTP id ay28-20020a05600c1e1c00b0040d887efc8amr481764wmb.101.1704543183366;
        Sat, 06 Jan 2024 04:13:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id wk16-20020a170907055000b00a2a13835f4csm215437ejb.167.2024.01.06.04.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jan 2024 04:13:02 -0800 (PST)
Message-ID: <821bfe95-8ace-4f6d-acdc-5771cb72b276@redhat.com>
Date: Sat, 6 Jan 2024 13:13:01 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Eric Piel <eric.piel@tremplin-utc.net>, Paul Menzel <pmenzel@molgen.mpg.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
 Marius Hoch <mail@mariushoch.de>, Kai Heng Feng
 <kai.heng.feng@canonical.com>, Wolfram Sang <wsa@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-4-hdegoede@redhat.com>
 <20231224215502.dq6a2sq2hdfrpwof@pali>
 <a37ddb76-c93e-4422-80eb-11dae0985093@redhat.com>
 <20240105182603.2bpvszkl7u7n4xyj@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240105182603.2bpvszkl7u7n4xyj@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/5/24 19:26, Pali Rohár wrote:
> On Friday 05 January 2024 17:31:32 Hans de Goede wrote:
>> Hi Pali,
>>
>> On 12/24/23 22:55, Pali Rohár wrote:
>>> On Sunday 24 December 2023 22:36:19 Hans de Goede wrote:
>>>> +static int smo8800_find_i801(struct device *dev, void *data)
>>>> +{
>>>> +	static const u16 i801_idf_pci_device_ids[] = {
>>>> +		0x1d70, /* Patsburg (PCH) */
>>>> +		0x1d71, /* Patsburg (PCH) */
>>>> +		0x1d72, /* Patsburg (PCH) */
>>>> +		0x8d7d, /* Wellsburg (PCH) */
>>>> +		0x8d7e, /* Wellsburg (PCH) */
>>>> +		0x8d7f, /* Wellsburg (PCH) */
>>>> +	};
>>>
>>> I'm not happy with seeing another hardcoded list of device ids in the
>>> driver. Are not we able to find compatible i801 adapter without need to
>>> hardcode this list there in smo driver?
>>
>> I agree that having this hardcoded is not ideal.
>>
>> The problem is that for a couple of generations (Patsburg is for
>> Sandy Bridge and Ivybridge and Wellsburg is for Haswell and Broadwell)
>> intel had multiple i2c-i801 controllers / I2C-busses in the PCH
>> and the i2c_client needs to be instantiated on the primary
>> i2c-i801 (compatible) controller.
>>
>> Luckily Intel has only done this for these 2 generations PCH
>> all older and newer PCHs only have 1 i2c-i801 I2C bus.
>>
>> So even though having this hardcoded is not ideal,
>> the list should never change since it is only for
>> this 2 somewhat old PCH generations and new generations
>> are not impacted. So I believe that this is the best
>> solution.
> 
> I see. Seems that this is the best solution which we have.
> 
> Anyway, is not possible to use pci_dev_driver() to find i801 driver and
> from it takes that list of devices which have FEATURE_IDF flag? I have
> looked at the code only quickly and maybe it could be possible. Just an
> idea.

That is an interesting idea, but ...

that would mean interpreting the driver_data set by the i2c-i801
driver inside the dell-smo8800 code, so this would basically rely on
the meaning of that driver_data never changing. I would rather just
duplicate the 6 PCI ids and decouple the 2 drivers.

Regards,

Hans




>>>> +	struct i2c_adapter *adap, **adap_ret = data;
>>>> +	struct pci_dev *pdev;
>>>> +	int i;
>>>> +
>>>> +	adap = i2c_verify_adapter(dev);
>>>> +	if (!adap)
>>>> +		return 0;
>>>> +
>>>> +	if (!strstarts(adap->name, "SMBus I801 adapter"))
>>>> +		return 0;
>>>> +
>>>> +	/* The parent of an I801 adapter is always a PCI device */
>>>> +	pdev = to_pci_dev(adap->dev.parent);
>>>> +	for (i = 0; i < ARRAY_SIZE(i801_idf_pci_device_ids); i++) {
>>>> +		if (pdev->device == i801_idf_pci_device_ids[i])
>>>> +			return 0; /* Only register client on main SMBus channel */
>>>> +	}
>>>> +
>>>> +	*adap_ret = i2c_get_adapter(adap->nr);
>>>> +	return 1;
>>>> +}
>>>
>>
> 


