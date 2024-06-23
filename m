Return-Path: <linux-i2c+bounces-4280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621FF913B87
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 16:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89EFAB23355
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 14:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5873181BA4;
	Sun, 23 Jun 2024 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N7Ppi8nX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5C4181BA5
	for <linux-i2c@vger.kernel.org>; Sun, 23 Jun 2024 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719150411; cv=none; b=Hbq7YYj9vzhp6USsYFgOZKC8waiul3qiEiI5Aa4Tmq/CuS+++LdRUXvv7ArZ83YM9fu54IKd9k0I2R8IQyDame0RYmDwrEjZf7sZxy967ANC1l8g6dZdHViSwepRyDT5N+zepaibSWBij28Q735AigBHjxTmnR0N3+e+34hEHMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719150411; c=relaxed/simple;
	bh=NOB/53+QTNKxbBHesQc3h3rlOj82qCSMMPZ8PONlgPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LR3jPWC1fL6FvkjAaO7tCeOlHIFCo76hYn6KnAYKDJ/o7RYQvs5KlN7i1jlVL2coxZ+lrs5ZldDb7HvIKdV99t91Tr1s0PZOAMwEZWEComZHkFAMkk75Nr4Xqr3X/poLFbxkKHwDs+vNuMKDBVxxYfGO+4xGyls3u2ub5IPsjnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N7Ppi8nX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719150409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YYVBYDi1rQu6r1OHUmvhKLDBmrisC75Dj2UL2USoAy8=;
	b=N7Ppi8nXGddXidmzYM+Qp2x7FMRnmOKmgCyu0hcYPR1cFQ1z69PpAIY8vxfpP2LP57A+nq
	Ie8IuQh3Mij9jp2by7utXGkTS9KhtpF9FHYA0bpUM8k4bkHW90ViPAdDA5sQvUyDeMNxK2
	OvS4rnCvuUYAvqPbeY2Pe3wWPiVFVOc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-qz0cLgJKN4ur1yBywOO0Kg-1; Sun, 23 Jun 2024 09:46:47 -0400
X-MC-Unique: qz0cLgJKN4ur1yBywOO0Kg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ec0397ff31so26644921fa.3
        for <linux-i2c@vger.kernel.org>; Sun, 23 Jun 2024 06:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719150406; x=1719755206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYVBYDi1rQu6r1OHUmvhKLDBmrisC75Dj2UL2USoAy8=;
        b=s83BpeedlmIiDTy0xEkMgjVthsFqHoa8T8EuU+AWrmsDuFkarhYmd1EZE+ySceOZld
         RX9r9XGUC1HvNPLBI/6zGVi02NL/ls+2lJuUbAnvLX6A4hjT5g1g5MBJ53zhIZUjWEJU
         7LiQkpTuFa5J+ZDQtUIy6xmQc0wLwrb352EzrJ/W7a6ZjDwHvqe7Mo/36mugUpXzWBuv
         FQcMYbwU1kSjZ7gf/auRiuiv84ZoayMFzafjtGbQZ5qhU29NjDsOCas0es8fLL0sTUaZ
         gWgsloj+XxCEq3RtEftUGId2E0Qo/lE+ej6qLWRC4o6EQtKsHd/QoJ358evm+N4FSqZJ
         ZVSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCxBrgCi9WX09Y1fLO7XjF+H4FCl6IatI4FkzBdERLCeWDzv1qhr8wOqZ/rRp3F50Gij8KlexSz8VBAt5xod9s8y90sm/yxaAf
X-Gm-Message-State: AOJu0Yx5oQ12bvhiTZxIiROdBf0c3hVShVVuuUZdqvf9Z0P1zx3U7uo8
	I61KhN6zCioBV4+QX93u97fPptIum8gja0a5P497NbX6m4B4v1DQaePtp61D6zLhYTftFITtyR5
	UE+uFdDwyZ+zjqCJFLaHfyLUgbtlTrBI2bo01AMEUZw080R2UnlxTSJ6qMw==
X-Received: by 2002:a2e:9001:0:b0:2ec:56ce:d51f with SMTP id 38308e7fff4ca-2ec5931d31emr19208201fa.20.1719150406166;
        Sun, 23 Jun 2024 06:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVAIEKdFPWZMOgucGr8UWuBfPpiXjtXyvCnkzxakLqCkbqvFD3VNOeWtmisNu3P6nqmETmPg==
X-Received: by 2002:a2e:9001:0:b0:2ec:56ce:d51f with SMTP id 38308e7fff4ca-2ec5931d31emr19207971fa.20.1719150405714;
        Sun, 23 Jun 2024 06:46:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303da3cbsm3518028a12.16.2024.06.23.06.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 06:46:45 -0700 (PDT)
Message-ID: <3205096e-d0b5-45d5-bb3c-05abf0cf9c77@redhat.com>
Date: Sun, 23 Jun 2024 15:46:44 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali>
 <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali> <20240622162627.gs3esrwgjbmarpxl@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622162627.gs3esrwgjbmarpxl@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/22/24 6:26 PM, Pali Rohár wrote:
> On Saturday 22 June 2024 16:20:15 Pali Rohár wrote:
>>>>> +	{
>>>>> +		.matches = {
>>>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 7590"),
>>>>> +		},
>>>>> +		.driver_data = (void *)0x29L,
>>>>
>>>> At least for me, casting i2c address to LONG and then to pointer looks
>>>> very strange. If I look at this code without knowing what the number
>>>> 0x29 means I would not figure out that expression "(void *)0x29L" is i2c
>>>> address.
>>>>
>>>> Is not there a better way to write i2c address? E.g. ".i2c_addr = 0x29"
>>>> instead of ".something = (void *)0x29L" to make it readable?
>>>
>>> struct dmi_system_id is an existing structure and we cannot just go adding
>>> fields to it. driver_data is intended to tie driver specific data to
>>> each DMI match, often pointing to some struct, so it is a void *, but
>>
>> Yes, I know it.
>>
>>> in this case we only need a single integer, so we store that in the
>>> pointer. That is is the address becomes obvious when looking at the code
>>> which consumes the data.
>>
>> Ok, this makes sense. Anyway, is explicit void* cast and L suffix
>> required?
> 
> I have checked compilers and L suffix is not needed. No error or warning
> is generated without L.
> 
> Explicit cast is needed as without it compiler generates warning.

The L definitely is necessary to avoid a warning about casting an
integer to a pointer of different size. Without the L the integer
constant will alway be 32 bits which triggers the different size
warning on architectures with 64 bit pointers.

Regards,

Hans


