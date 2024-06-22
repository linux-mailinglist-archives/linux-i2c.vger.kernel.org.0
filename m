Return-Path: <linux-i2c+bounces-4253-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BF991346B
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 16:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91578B2298C
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 14:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B1E16F295;
	Sat, 22 Jun 2024 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ftKHFgyQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA7816E86E
	for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719066097; cv=none; b=WJ59Hx/Z9/c2FjzshifVQwkQTfD5AElxHXEuncivjCSI61H6SyXMtJqeRq+N782MLU/Yy4LHo/KVaxetESDD/jCu0XAbMOge7CoJbv5JVnj8b7VC31z0kdhRt6SvRFTQA01+zXL1gGCoY0+w3L+6VJBe0LbFc2uTvoCrqMSoVss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719066097; c=relaxed/simple;
	bh=Q1HSyFOe87RqTHoBjPgVIZg8ifNLeDsmBdusQK5rwKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1wcleLvrFSs95FUOIUBooLXDfp7fO+tqd+aRSXiVQyAA/Z1KDMQFB7KJCEUhYMcinLJq1+AIF2+DQI/pCOChGtw5lioGroF8PFNm2CkBQPO42wbVvfslSpXeCTEa3pIupS1WDa0ZbWEdRzbfxv45aeA2MnO2hdAVN8NpkJxFZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ftKHFgyQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719066094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0B5ArVEHgAF62aRHc5z36Mvy81HoBV1hNDzhJEyDGM=;
	b=ftKHFgyQeV9sjpeYtxy51x2HEtyetjZJnkX2OhPPnU+c+g6PNqsmuY/mVLSyDQk2kj6EWm
	0TfSQus0m+aqBAuLRxxdiGdyE3eTWH/3g4NhfK1tTCj+sLnZgJggi05ajYBZsj8iUNUax4
	oO1+m/V3fokMeCaLNWsg3BsCAgjZngw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-sE-0TiaoNgSu_NndyIchWw-1; Sat, 22 Jun 2024 10:21:32 -0400
X-MC-Unique: sE-0TiaoNgSu_NndyIchWw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6ef729b465so140253566b.1
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 07:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719066091; x=1719670891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0B5ArVEHgAF62aRHc5z36Mvy81HoBV1hNDzhJEyDGM=;
        b=FUi5GLzJoKN1NkyQ37qQY2OgeJmRjd3Tg/lzdA6eTyJizyA5pOJuLzUlCi1K/tbzcz
         d9W+y5U80TNg41j/0zo8memlA7LAS55REKc1cSepq3kb2z3q7bcV6DUZKWgPl7chyJP+
         h5iT5QWYZRfK4YvOZo2etyd6nFRxYiLKx0/FG3PIUgoop8dTV+yDngU1hwwXCXUbPlvY
         Eeqg2gDpOJiYuuZkwW6n+j31ureBvPplsTL8Bxwh3J0/IK0wryjdH2gXJBUalNsNhUgK
         5jIcM2jP1GRLeDLeGJbxSTocJthJrxJhk3gaUU3qougNK9+dRSX9qcOONqSH2GLNCwBj
         suuw==
X-Forwarded-Encrypted: i=1; AJvYcCWs5ZAcRyJ0u4eYXCCB0coGIqLQxMG8uaEtlBXaBMAYWuL6gXStxQ28fl7KHGKTJkSEcwI1+MA5G0fLsqQZ88i/NNJF5oE8FnDJ
X-Gm-Message-State: AOJu0Yy0wqxV7QDjR8mwNs4LDvpaY9HwfdU7yzHgvHDxZynLzPCC42NV
	cyfYIx++DQOPVB58z2gBS6fGLE0pupbb4faj8+lPSZ/CzOrUIL9hfeMT8PZ2atLI+h//IbWaHWm
	Z+CunZ7K9YjTuyqn+WrpjbBQl9hVjl1e0Bss22g9fRhNO9VgeW0MqPCSveg==
X-Received: by 2002:a17:907:a4c5:b0:a6f:b5ff:a6fd with SMTP id a640c23a62f3a-a6fb5ffab3cmr728978266b.12.1719066090962;
        Sat, 22 Jun 2024 07:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs3T9hSU2pbcAZvwc+koXaEYMbOjl0DbvomzqGa0zg81KYoYYbuAmffo7OpiaB+X4raBCQhg==
X-Received: by 2002:a17:907:a4c5:b0:a6f:b5ff:a6fd with SMTP id a640c23a62f3a-a6fb5ffab3cmr728977466b.12.1719066090466;
        Sat, 22 Jun 2024 07:21:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560632sm200510166b.160.2024.06.22.07.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 07:21:30 -0700 (PDT)
Message-ID: <fbc82ede-f23d-422e-ac76-7363e84764ee@redhat.com>
Date: Sat, 22 Jun 2024 16:21:28 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-7-hdegoede@redhat.com>
 <20240622133237.b5xsetcxnfu4vu6u@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622133237.b5xsetcxnfu4vu6u@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 6/22/24 3:32 PM, Pali Rohár wrote:
> On Friday 21 June 2024 14:25:01 Hans de Goede wrote:
>> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
>> of the accelerometer. So a DMI product-name to address mapping table
>> is used.
> 
> This is statement which I got from Dell for 10 years old Dell models.
> 
> I have already stated that poking of address in kernel is a big risk
> specially for all current and any future dell hardware. Hiding it just
> under the kernel parameter is still a risk, specially as neither its
> name, nor description say that it is dangerous:

I think you are overstating how dangerous this is. lm-sensors detect
scripts has been poking i2c addresses for years without problems (1) and
still does so till today.

Besides the kernel message telling users about this option does mention that
it is dangerous:

>> @@ -370,6 +511,7 @@ static int smo8800_probe(struct platform_device *device)
>>  	} else {
>>  		dev_warn(&device->dev,
>>  			 "lis3lv02d accelerometer is present on SMBus but its address is unknown, skipping registration\n");
>> +		dev_info(&device->dev, "Pass dell_smo8800.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
>>  		if (!smo8800->irq)
>>  			return -ENODEV;
>>  	}

> But anyway, why this code is being introduced?

Because users have been asking about an easier way to find the address for
not yet supported Dell models:

https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/

This is the whole reason why I started working on this patch-set in
the first place.

> Have you communicated
> with Dell about this problem?

Dell is on the Cc of this thread, as well as the previous v2 posting:

Cc: Dell.Client.Kernel@dell.com

Regards,

Hans


1) There were some problems more then a decade ago, but those were only
at specific addresses on some really old (by now) ThinkPads and for
the other case the i2c_safety_check() function was added.



