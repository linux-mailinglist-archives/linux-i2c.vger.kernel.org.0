Return-Path: <linux-i2c+bounces-4604-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69DD925BB1
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 13:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D88EC1C25846
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2024 11:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D22C1946B8;
	Wed,  3 Jul 2024 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8WfKxvN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66B61946AD
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jul 2024 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004288; cv=none; b=WmQRO69fS5HzM8ZnHfttyHlJAcXCib6iVX+UpjZPKZ57/QaLaMdM8OfT3y0jnk7Fr1Fv+kTzKy9NGovIIkqoBmGfki25dCyuEldfJr+QBmuzpqzs8nYvXs62UT0l2kvQW3RQW+xkz0Kn9OtwlEu157957v/Xs2f8Eo5ZK5RYgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004288; c=relaxed/simple;
	bh=31O4MI1qbEZRHg5azxrIZyeSMMRy0hxOIQBWbe5bO/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NyKfqT7SIgcGM/2fDjvvNatNSzG3og04yRrX1fUyD/F3/6HqQ4QgFmhRLBDuLu14a4hEGoJcDwNvlzb+u5/8ElFSD5BAiqaAEn/e5hLr+SmCh7wqa+lxZJO2wilr4N3LoTtX5ZgVCBgSz+kyKlagaI/hKhrNX/khOAsplxr1zjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8WfKxvN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720004285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmWsAoG+lkXZowuDnJDAqFgCeapVjUys75g9nC6TYW8=;
	b=D8WfKxvNUODuxy30Fy0E9x5RLf0TYSUdPTHqZkHiKgnq6xHlLT+iiK5Z7pHsmsQyDN9are
	1i1WPPX/l6sLdkFo37mg35sN4dIrVonvLv7Eeb2y5Quz+IQeXM6/1QGA+dG3767RdolW3V
	h/Q1Pd1IChRgbGb4Xd0GKWqMLreNKwc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-czxicz3aNniF3_f48VR7lg-1; Wed, 03 Jul 2024 06:58:04 -0400
X-MC-Unique: czxicz3aNniF3_f48VR7lg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-57cbaa7be59so2082198a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 03 Jul 2024 03:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004283; x=1720609083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wmWsAoG+lkXZowuDnJDAqFgCeapVjUys75g9nC6TYW8=;
        b=Wbt11KrauGjb1BPI1rEXFte6fABZTb53DyvLvwGPBelzq8et9pXHh6GWAeR5ZfIah3
         ZORCjPJG2pii0Mt4ds4yxtgUTy58zxrYPbqRhLNHNIsyT+mPILn8AKx0697RpxnRio5c
         M3ooACoQzGUqcEapSeRnXpcIjSSJN8Q5/2/QoKCuR2Q9J3dZPycoQgjWgkesxqVY8B81
         Nv0Ynl6q165dCDDYfKwkqtJAIW3/iaRQIGR7u/CsjeAYnG/ZyErolDREhW1kN+pKVTT2
         EWGcSQeK3PQYbX4v8G2Fa8Ttv8NTkFeeKeXM3TKNkD3sbtO5qLz/jqJtlSWHSw8S7+5l
         9hbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Oasz1uK17/WTUv7/ioZagWX5aobP0KNZbnnPOoA7vMpcoO/jFMLaXiZTyD8QH1ln8NGwv0hJVH9jUEG8qOwh/VBIApEtEZ1M
X-Gm-Message-State: AOJu0YyR6y0sJySV9MGW+H2uPfg7a5qN9mMo3XOXruMuyXmaI6W0bgQb
	XC6/2nPeZEZmDsiR4yqcmsMj+cA0vHoP9TX0FkewCaOtQmjK/q6DA94FHbLNriC04djFal83vN7
	lkLFr04CxAsws4Oe25+TPEUyUEdEuJbL8AoLHmEkbSDIWuVBsBqNgCQhMDw==
X-Received: by 2002:a17:906:590:b0:a72:6ff6:b932 with SMTP id a640c23a62f3a-a75144a27f1mr622401066b.51.1720004283226;
        Wed, 03 Jul 2024 03:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBlfqzjAaMyJIf6auxmROjQBDOa8a+YzkHWXo8dsZDzHLeKzoRHXUqB+oF/vrYfMCOe4Szcg==
X-Received: by 2002:a17:906:590:b0:a72:6ff6:b932 with SMTP id a640c23a62f3a-a75144a27f1mr622399766b.51.1720004282780;
        Wed, 03 Jul 2024 03:58:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf5a612sm500246966b.51.2024.07.03.03.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:58:02 -0700 (PDT)
Message-ID: <a6a554d1-2cdb-4e34-ac07-2778d534b558@redhat.com>
Date: Wed, 3 Jul 2024 12:58:01 +0200
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240624182812.fa6akymygv3qolug@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/24/24 8:28 PM, Pali Rohár wrote:
> On Monday 24 June 2024 13:15:12 Hans de Goede wrote:
>> Hans de Goede (6):
>>   i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
>>   i2c: i801: Use a different adapter-name for IDF adapters
>>   platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to
>>     dell-smo8800-ids.h
>>   platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
>>     from i2c-i801 to dell-lis3lv02d
>>   platform/x86: dell-smo8800: Add a couple more models to
>>     lis3lv02d_devices[]
>>   platform/x86: dell-smo8800: Add support for probing for the
>>     accelerometer i2c address
> 
> Patches 1-5 looks good. There are just a few minor things, but you can add
> Reviewed-by: Pali Rohár <pali@kernel.org>

Thank you.

> For patch 6 as I mentioned previously I'm strictly against this change
> until somebody goes and politely ask Dell about the current situation of
> the discovering of accelerometer's i2c address.

Dell is on the Cc and not responding...

> And if there is no other
> option than start discussion if Dell can include this information into
> DMI / ACPI / WMI or other part of firmware data which they can send from
> BIOS/UEFI to operating system.

AFAIK newer Dell laptops don't have a freefall sensor anymore since
everything has moved to nvme. Even the bigger laptops seems to simply
have multiple nvme slots rather then room for a 2.5" HDD. Note I did not
research this, this is is my observation from 3 newer Dell laptops which
I have access to.

Regards,

Hans




>>  drivers/i2c/busses/i2c-i801.c                | 133 +-------
>>  drivers/i2c/i2c-core-base.c                  |  18 +-
>>  drivers/platform/x86/dell/Makefile           |   1 +
>>  drivers/platform/x86/dell/dell-lis3lv02d.c   | 331 +++++++++++++++++++
>>  drivers/platform/x86/dell/dell-smo8800-ids.h |  26 ++
>>  drivers/platform/x86/dell/dell-smo8800.c     |  16 +-
>>  6 files changed, 379 insertions(+), 146 deletions(-)
>>  create mode 100644 drivers/platform/x86/dell/dell-lis3lv02d.c
>>  create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h
>>
>> -- 
>> 2.45.1
>>
> 


