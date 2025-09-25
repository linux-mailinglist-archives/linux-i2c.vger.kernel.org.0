Return-Path: <linux-i2c+bounces-13186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE637BA1A8C
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 23:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06CE81891606
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 21:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518222EA491;
	Thu, 25 Sep 2025 21:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTgHEwM3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FD227FB21
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 21:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836774; cv=none; b=F52TTpI+flUUhTb1HYk42yuzQjDdIYgHlP55b50rrLDYMr23LDhm6W/KiOWZSJK5dfLPH/gREZ+AW24xkrFtosWoifqgO9Q1QqxPgNeY3z62dxbhtAjcSrsuf4VCH5KXSz8sQzcEPH6IqpKxsqFRvAF6lW4NF7P0uT/C6TuWARE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836774; c=relaxed/simple;
	bh=jw4AgoZPRQFGh3biyZBcEMRiVCUFSYcUXqzTm/yIDkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdydsHuEpkHMZ1a63J7h//O5ndhli+6z/qRMKYlHIO1An5ULRPu4xkFlVeQGUV5r17OUhUHuIlJtNEf2uQDb7GP/LCOzOMGUIoL3nbVFpnwDSKx0DbygFXnMI8Ro/7i+QmFRUqMNmbd4zApLRaQ6y/dLKgifteFnDFfa9jwiGy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTgHEwM3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46dfd711172so12005525e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 14:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758836770; x=1759441570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jw4AgoZPRQFGh3biyZBcEMRiVCUFSYcUXqzTm/yIDkA=;
        b=MTgHEwM3CAnNT5IOqybGvfHf7sfUgs5YLEaWESDDfLZhOg0HO7DUU0Td/QtOVTmPZb
         MOv4Mt06RgAQEFH08AfIKddjTQt8MhRo/DUxSILI2Vynq8vOc6sOY08Dob6SPEIX2mhb
         JaZaa4dSt0FTY6cGQpATdCTzoYvKNySJiLl16sJoGsarz4GZN9nGk0ug+LbWNtukPm2w
         NFmeW6Pwx4B+9wvpptWh4u9l4erNr5ElZjyFZiLohszUmI0wTFtwOi5jwAwNBBIj1FiL
         we7BleCUuqTeqit2lLSx0PxP7cFbTEEuKUryrBaKAwvRYj3lbPYG66MB7PVNOMsLd8+D
         1fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758836770; x=1759441570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jw4AgoZPRQFGh3biyZBcEMRiVCUFSYcUXqzTm/yIDkA=;
        b=u4ApMMKjWYIU9/75ajn7DopQXKxb6G8LV4HR/VYgs1olXe5+gHt7EoAaZjWRrSWe8n
         iAWCfzjVg4gpzPtgopzUcXW4bGapo+7yhzDAVnroWu5lW0eig3jM793WF52moQWE39kK
         SxBKuZot7QZWhuYRCUhOpr5K8FyOfHODJPqAGDWEieLqIQ8WrRba815y8/KW3/H7Ebg0
         W9VZyf91IrYOUOQXWQoRHR9FF5qzWG69HNQT3stCEt8AU7/8IAoqAJjkMmZ+iXU4IQ7W
         V9c3hdkRec3MDTRXt1zznXKsU8/Qth+Wvqbz5QGyXbrl6AtT2zaTCXqtxrH+BWKxnGWa
         Ut6w==
X-Forwarded-Encrypted: i=1; AJvYcCVILRvGBzg3oRHIuzMi2sAkULKgOMxKOc172LkgXrg/el/KvomGJUsED0uFEbdkl/z2Me4Qx8Qr3B4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2zAIK2krvxt1U+bzUYRJC+6MIQosH1v0EAbpfbMD456suyGDz
	TuowIbHyM2Irj0ZziNiON3dnIgYhqcsZjfOJzdunRMLBdc8PrYlqEX5wAi7iPA==
X-Gm-Gg: ASbGncvBSaEBc6O26m5ZVja07NpoehlO3VaIcqu17rW4nZUwBcfSThmFo3LE0sgqvEf
	uA9btl14uHS80HONm4sDg0pFYalshlFgPKgTWU7/fafZk0SYdN72fzh75JjM8ZXYaKBGbUCeR51
	G5ME5NmLCYP2SbDBGtzshhoGS/1/9OTOYXS6OCUtQPfTEb0iG2JTlCaVHlpI40yF5XWLipPmF9m
	pP29g3JS36M3jJpy2wMCh4h/3V4A+iuUztov2mQ7ewKpBxCu+WpGGyok4ak0TYmJUP7U65AenG/
	p+KyIblzQj0D7+CXndjwSlXSX2aiRFtdVUo7Af3jTMIq31vdvL419v+hw0t/87owBbsoWWc12z+
	JW7xjbjRN547f+2pzwBnTBHpAF++ptQct+FquUOH1dPpxwI2v0Rnj64MBxCTObkfDZnoY8ftFfC
	6sg5+6PTWi+Sea/S5L
X-Google-Smtp-Source: AGHT+IE2xAcSQuVcodr/7hBVP7bq8EdfLJE4Esmkq4G3jP1jFOI8kOHeGuKLezUsQ9xVBsjiAJFyig==
X-Received: by 2002:a05:600c:1c24:b0:46e:3686:a2dd with SMTP id 5b1f17b1804b1-46e3686a524mr43098075e9.11.1758836770122;
        Thu, 25 Sep 2025 14:46:10 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f10e:2c01:2019:a9e4:7f02:ec05? ([2001:9e8:f10e:2c01:2019:a9e4:7f02:ec05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32b5504csm26022235e9.0.2025.09.25.14.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 14:46:09 -0700 (PDT)
Message-ID: <476cd546-1bde-4ff0-a785-2e6fa21b79d4@gmail.com>
Date: Thu, 25 Sep 2025 23:46:08 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/12] i2c: rtl9300: use regmap fields and API for
 registers
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Markus Stockhausen
 <markus.stockhausen@gmx.de>, Sven Eckelmann <sven@narfation.org>,
 Harshal Gohel <hg@simonwunderlich.de>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
 <20250831100457.3114-5-jelonek.jonas@gmail.com> <aNW0jiJQHcS-FKwr@shikoro>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <aNW0jiJQHcS-FKwr@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 25.09.25 23:30, Wolfram Sang wrote:
> On Sun, Aug 31, 2025 at 10:04:49AM +0000, Jonas Jelonek wrote:
>> Adapt the RTL9300 I2C controller driver to use more of the regmap
>> API, especially make use of reg_field and regmap_field instead of macros
>> to represent registers. Most register operations are performed through
>> regmap_field_* API then.
>>
>> Handle SCL selection using separate chip-specific functions since this
>> is already known to differ between the Realtek SoC families in such a
>> way that this cannot be properly handled using just a different
>> reg_field.
>>
>> This makes it easier to add support for newer generations or to handle
>> differences between specific revisions within a series. Just by
>> defining a separate driver data structure with the corresponding
>> register field definitions and linking it to a new compatible.
>>
>> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
>> Tested-by: Sven Eckelmann <sven@narfation.org>
>> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
>> Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> I wanted to apply the rest of this series but applying fails. Can you
> kindly rebase it to 6.17-rc5 or later?
>

I just noticed that it seems like an already applied patch got lost [1].
This was supposed to be merged to Andi's i2c/i2c-host [2] and actually was
there until the first three patches of this series got merged.

Since I had already issue a few days ago trying to rebase the remaining
patches, this might be the cause it also fails for you?

Best,
Jonas Jelonek

[1] https://lore.kernel.org/linux-i2c/20250810-i2c-rtl9300-multi-byte-v5-5-cd9dca0db722@narfation.org/
[2] https://lore.kernel.org/linux-i2c/a422shurtl3xrvnh2ieynqq2kw5awqnmall2wjdpozx336m26i@54ekftmkwvrv/


