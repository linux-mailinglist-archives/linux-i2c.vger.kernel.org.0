Return-Path: <linux-i2c+bounces-4593-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D4592487B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 21:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5755428B832
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 19:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD331CE08F;
	Tue,  2 Jul 2024 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDsG/4K4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5786E5ED;
	Tue,  2 Jul 2024 19:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719949182; cv=none; b=ZVZqhIV4xBVPEtu4U7Z3cIUTx3iwsso3vgvzL7n6i1FRzWblM5XXHUncrjFnzhcDtLEGzjdNVax3sLJCIC0IhptuWhbDcQHYjuKf8Prejw+uoOsKbXnkGDYt6Dde/Kaz6kGlmf1EoC5+spJFNN2lEemKD1p9cstYYTaCBoy7jKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719949182; c=relaxed/simple;
	bh=oRlSI9t2p3jGFJ880LK9WDLLsE0d6mzD6XkeeFAK5Pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otPNzx5Nr7SOGPT9imMFRn4xXS/t5tcAKcBovIxnf+99o/8Uy+4QtVxEnaA/2DniHKhHdM3T6S/3rZjMOMgsAEHTNmM4+VimT0JeO4J3vfK6aZ/eB+5iCe561WG3RskYpdquUai6Wtb0i77sYnOhRxhYvnDPYA5BhbDGlyztSkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDsG/4K4; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2c2d25b5432so2750536a91.2;
        Tue, 02 Jul 2024 12:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719949181; x=1720553981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=S8RmM/nQ903jD1e784juDC9He5+yPgPg+HlP+Yxh+mY=;
        b=RDsG/4K4Hen4/TkA9to5zweFgNQiZHKqThyNSZkq6m+zAaI/dh7DahX9VvskSmTjd0
         b5gZgabHvN/7/vGAWGrgqm99srKzbyO+z+VbsC6sMG2UUJEspbx1FRCxjHbw/ZbNXPNA
         JR1Q+nv41hZLPJnpr1MgMUXnZ7hwCURD5RUi3drag/u9Cc8jMHpbekNJAOmqp1byt959
         gZ4Q4oHQbXUGZYKtFnlswqGpdpS6rkYt7D8qHjeACyGO2i9i1lwTTBgb3MdWHvtXR6fe
         bvvuq82WY8oGzZATnDewXXloTuXJlXvAHvKdr0tbshjQBxSf2Hl6PQ7mAdkBRqjXJGTw
         XtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719949181; x=1720553981;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8RmM/nQ903jD1e784juDC9He5+yPgPg+HlP+Yxh+mY=;
        b=ET5VNSiQoR5bFskL1wo+mqm6Oy3D72VzJ91J+U6kU8OcEvoffMhT89MOEReWm3lVTT
         YFlC9VbfFb2ot025fAoCEl9vPeHBthcr//Rr1+Vmdb/7RI/jhARnedkX8jqCSiklDwsj
         Kx0bZ9TB62OvXlVeWR16W042rF/ofvMKGcUfbyBm78Hr/5E24etAL23PY1DJRJLUm8TC
         81wtVEXjrPIfTAOWyjD2rITxAPHZSm3mcs9Rq88m9k9ZHjskJ6I4onBt97/u07dND/66
         jg+ZI/SrI/K1ibYfUHUlNYsG6xX5JFNXpj6PBAQBLtn4TbbAcv4XjsxAiPDvRpfWwldK
         uJsw==
X-Forwarded-Encrypted: i=1; AJvYcCWSMlnwQ2vqCT7jNAMqWtCj4He3GnHV+feP0mNsQQG0DNLc6Fnf4K9BmsrcFMcAEXxNeUYUnQ2bVV8kSwDSSqXa9FlX+Qk0ahHpe1pok+5sSAtaTSkNiwBTPMAImxun7ZRl5RqO2uWfIWrh5K01o+tBkCwlzo3+rs560OV0G+xUZIC3a335Tp/pkuoGRfv59kVMqN8tinP/ELLlzHF6d1t8DXuiUlg3YdQytQbMNPG1ELveHs1ADD1u3PIR
X-Gm-Message-State: AOJu0Yy/aEA4M8b0ufnWsDk68jGY4QzDsCLdepsiHSzIvKPYMKcSlnc7
	5tBU40Ji4F5qZbIfRjnq8lLSyK1btKFiu5I+c11iuQt0ufjrqAz1
X-Google-Smtp-Source: AGHT+IERdVtlgKLMdAMQSFOlOPmsLrxNuImG3ycfTmId0OWD4i32DoVyGKXhjOqTzMWyCCtp4yaYmw==
X-Received: by 2002:a17:90b:2287:b0:2c7:70ba:3efe with SMTP id 98e67ed59e1d1-2c93d7097c6mr5833019a91.17.1719949180632;
        Tue, 02 Jul 2024 12:39:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce4668esm9297079a91.21.2024.07.02.12.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 12:39:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <da649c17-2237-430f-80c9-253cef47deb6@roeck-us.net>
Date: Tue, 2 Jul 2024 12:39:38 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon: add MP5920 driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Alex Vdovydchenko <xzeol@yahoo.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sean Anderson <sean.anderson@linux.dev>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240702115252.981416-1-xzeol@yahoo.com>
 <20240702115252.981416-3-xzeol@yahoo.com>
 <956582ec-0205-46c3-b4dd-820aa150c03d@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <956582ec-0205-46c3-b4dd-820aa150c03d@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/2/24 12:00, Thomas Weißschuh wrote:
> On 2024-07-02 14:52:51+0000, Alex Vdovydchenko wrote:
>> Add support for MPS Hot-Swap controller mp5920. This driver exposes
>> telemetry and limit value readings and writings.
>>
>> Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
>> ---
>>   Documentation/hwmon/index.rst  |  1 +
>>   Documentation/hwmon/mp5920.rst | 91 +++++++++++++++++++++++++++++++++
>>   drivers/hwmon/pmbus/Kconfig    |  9 ++++
>>   drivers/hwmon/pmbus/Makefile   |  1 +
>>   drivers/hwmon/pmbus/mp5920.c   | 93 ++++++++++++++++++++++++++++++++++
>>   5 files changed, 195 insertions(+)
>>   create mode 100644 Documentation/hwmon/mp5920.rst
>>   create mode 100644 drivers/hwmon/pmbus/mp5920.c
> 
> The entry in MAINTAINERS seems to be missing.
> 

That isn't mandatory; checkpatch asks for it, but I prefer not to have it
in the first place if the submitter doesn't really plan to maintain it.

> Otherwise:
> 
> Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
> 

Thanks,
Guenter


