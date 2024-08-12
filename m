Return-Path: <linux-i2c+bounces-5311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE094F226
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 17:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEE7A1C21F82
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 15:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8261184551;
	Mon, 12 Aug 2024 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b42P5Lp7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074E918453F
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723478115; cv=none; b=O2pEm0rWeoLRnAqSFxFU5LAeZkJiYjICKS8APhUDFV2IinLvzxtgitiN5uV22Un1zoogLdCjo1aMu/s52TO7FWzao6dGTEQoJx0yEdZ5N0DkKuw5YIr1QwsYFA2qLIg0E2jMjeywxL/Gsk1n2U+KYj/3QkqeQaoI6Kmnc3lqpHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723478115; c=relaxed/simple;
	bh=SRJlBYgKdbjbfkFsJdCuB6Omo8OpSx3PFgBhr5GhngI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4l7i9fstNxAof4bl6wW0RWBA1osJ9zdcraBhmdbHeq8/qbJO8Da01stgLyOiOzeNOCP6v4CkBxyzAIlUTYY8J9aVnotYx6TRkp9NfjU8/p3tjsbS+TbRZ964LCjdE3v+VEV0PjNAB+cPKKc8AvOnwQSlcGyALeZvLq4uQGSyRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b42P5Lp7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723478112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cJBlz3I4RKTfnRNVjY03fZZ8bEJDc4HBraykC9tuV2o=;
	b=b42P5Lp7OtxSvLyVIPs/E55K/VPi7CuVjA/bRm39pisOh2fb2fJwP3rhBF/3jnHYANPHoI
	NSMKsMdEAkELNwrK6OAtzoBhFUOP/pVRQdjuR60ru3vuOlTGihzWl/ejEsvMK3IwmXyCIy
	UQSVzqGhT7eE4nXh0WrZ14fjnHApiwA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-9Ai6tWc8NYCT3YBBrRHNqw-1; Mon, 12 Aug 2024 11:55:11 -0400
X-MC-Unique: 9Ai6tWc8NYCT3YBBrRHNqw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5bb9bfa4b10so1641581a12.3
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 08:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723478110; x=1724082910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJBlz3I4RKTfnRNVjY03fZZ8bEJDc4HBraykC9tuV2o=;
        b=Ts4byeueXEjzdcE35n4ij4Y+LxbFip0n6RQ+l0NoZOp1CEDQTsX1bAElhpp08IQP8i
         rCfboKIKobhBao6xSqsMb6KgwMaG7+Dz9KvZ7t90uiXPmhFZNZP4UOUQJPKmMuSMUB9t
         toJv4n2Out0ODGu3lMDTOfI7E65c3dtJOjvsLJoWfC/maGJmKBlbRfl3FGAyIoENwRGp
         A5hMtf/nHUiiJcN+cNBgZSF/C49q8E2SNsHJ6tRzPFcIzIVnK0VL4StFWkyVAe0rtIhI
         yctsZQReYgZ7G8kAch74Gl+lPOVlcFRgOJI/s0VzdDcF7mCtQ7N/xIqzikICHVrlZMg0
         00xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxjow+cSihBklAPH2ZdbuhnRWngNDX2JQ6WDzWgW++iNH+fPwiYbIj50diUf/I26rdUuAHz7EvCss=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLfO/zCOE/ETOwSqlza7nafnbgEGZvwMgPVYKZ/NAb9DzSEgDX
	hqNcvEX8tgDFbQERwm53+TNC9PTVqmXnrWf67v0HHd5Bu3I1hOC/ID5FKV4m1rh4mjBdSl40zKU
	Sj0fczutv1c8EySG+2GiZ8CSaElDNhT+GzdET/t/H1JUhe+fn2KK1J0sEJg==
X-Received: by 2002:a05:6402:50cc:b0:599:4d01:1fb6 with SMTP id 4fb4d7f45d1cf-5bd44c26d93mr592057a12.16.1723478110268;
        Mon, 12 Aug 2024 08:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJrTWXUj1gJVwGkiVTFKT2siN0axioe9Cfakkl00HL7PFN0UoW/Ze1YeGwWMz0lET9tnzNlg==
X-Received: by 2002:a05:6402:50cc:b0:599:4d01:1fb6 with SMTP id 4fb4d7f45d1cf-5bd44c26d93mr592025a12.16.1723478109695;
        Mon, 12 Aug 2024 08:55:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb0e4984sm240822666b.84.2024.08.12.08.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 08:55:09 -0700 (PDT)
Message-ID: <3e483c97-a92a-4229-ae38-2e599b0f474d@redhat.com>
Date: Mon, 12 Aug 2024 17:55:08 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] platform/x86: dell-smo8800: Move SMO88xx
 acpi_device_ids to dell-smo8800-ids.h
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240805133708.160737-1-hdegoede@redhat.com>
 <20240805133708.160737-4-hdegoede@redhat.com>
 <CAHp75VckqF6==cJ7xoXXn3hr9kzYn7+oHqYZq01S5HEe9eK_-Q@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VckqF6==cJ7xoXXn3hr9kzYn7+oHqYZq01S5HEe9eK_-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/5/24 10:27 PM, Andy Shevchenko wrote:
> On Mon, Aug 5, 2024 at 3:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Move the SMO88xx acpi_device_ids to a new dell-smo8800-ids.h header,
>> so that these can be shared with the new dell-lis3lv02d code.
> 
> ...
> 
>> +#ifndef _DELL_SMO8800_IDS_H_
>> +#define _DELL_SMO8800_IDS_H_
>> +
>> +#include <linux/mod_devicetable.h>
>> +
>> +static const struct acpi_device_id smo8800_ids[] = {
>> +       { "SMO8800" },
>> +       { "SMO8801" },
>> +       { "SMO8810" },
>> +       { "SMO8811" },
>> +       { "SMO8820" },
>> +       { "SMO8821" },
>> +       { "SMO8830" },
>> +       { "SMO8831" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, smo8800_ids);
> 
> The macro definition is in module.h.

Ok, I've added a #include for that for v8.

Regards,

Hans



