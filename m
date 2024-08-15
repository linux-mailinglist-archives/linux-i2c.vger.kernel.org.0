Return-Path: <linux-i2c+bounces-5414-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A48D9527F5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 04:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA9CE284CB9
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 02:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC1418C0C;
	Thu, 15 Aug 2024 02:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLntNyF8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72281D545;
	Thu, 15 Aug 2024 02:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723690135; cv=none; b=Os2nkBxczEtYRaywWzGmJR/mv0dMSOs5LtpcLHl3b139F07vWpt7vp4w8rUAAiEpS12CALVpdVbBFhw1lZc58UxHfKILu9Y3SSsYYl8UHxJzBa16DsodhpVY4oRj1kUKZXw8dMPDFsPpjDFeOwgJjr4EZnzcyXypSTPqKGOjKJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723690135; c=relaxed/simple;
	bh=7YgrMjgbwT51znGzx7ufGwTZoiiaul/lJvU7eBt/PNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoPHqTfBn26fXPqs9z7M3hjAsYPt5NTkg7RU99sSV2ooFvbhf/zr0GOhwwsJfhFgtvF90FUE8HVBmOEoELwgdDWDoU7anr8ZC92+Ix7EJ1PwdyfPHg8z+ZGAyL2i6lwvqmszgaTfjiE9BWONLYQr5Z2NaQbZEQpRmfp/18LqRXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLntNyF8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efd530a4eso755493e87.0;
        Wed, 14 Aug 2024 19:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723690132; x=1724294932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KM4b13RYywCcnj/MdbumSY4sdp76gBr182hgjo/KifE=;
        b=ZLntNyF8J7OUEoNRFylN1UqsEqDC5TYE0hJI2fzLw/98HV5pACew8IngiHMXHRKud9
         lBumD852MY36nsuQ79HnhQaxL8XyP/NrksZGJjAXJR7LnJFEjN7VzL2V7mLFgYuS3tic
         PDf2KRnoF6GEyd0Pd24iOGQZyrHdxMRxmHvNiVNaan+5Yk2udpSwAsBPCXOjjopM4ve9
         rJjWQJpRFo9uzE+nr3c3Q00Z6suWyOqkcVojpnjvoODjhsA8XJFSk+c6Fd6RH1mb/Wb/
         iHZHKzbMiT7EOhKu8N4NGfmruKIFe5qweqD/gfD7tDFaQkPcFN+4dw0DSJAuJMqPYWDK
         lfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723690132; x=1724294932;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KM4b13RYywCcnj/MdbumSY4sdp76gBr182hgjo/KifE=;
        b=mqhAuWtlhGNuTtG8BRRBgJqxD4DENFd1Mh0yrZkX3sZypUnQt2jo0F28gRNNmdl5mF
         ZZdiBEehHVqspbKKxcfEGOB9RgV/iw3OCfsTZ6269bo5s4S2e1w9j8V0Za1EE9InJsnh
         jjCbLvYy7ViX7eal+xOvMH6SqXq17VPC1KtnMsA9fL5f/bmkErNiE98MFM/qjDSs27+2
         GldRlrL4GPf4sq2eWnozcO1wmfMlEE4ZrGa18Jb7CGnE60PCb9QhImjX8+UdZ7Z99u+F
         GR8CPDzAXBXALrsaO2GxBbVoY4fa6NqWLEeW7dvQxZh5USArA5nTqRUblLxuVAKQKT1l
         Q63w==
X-Forwarded-Encrypted: i=1; AJvYcCVKl0pytem1cpNsY95LyRZJswDlkeZO/vOOiH13pGzscPekmzIKgueZrkqO3qu2OSomdxfQvVrNjcjdfHr9T8xaJPh3oUJ+Gm4QPxSLeCGkpMvIQFMF3NO6dVWoaPsLU4wpUpNTjzU2Ytr1GMp9mm+cqf3jt65twnlUIBaYXaWQBR577oA=
X-Gm-Message-State: AOJu0YyN5Jxn8C2ayVESkK6g2c1Ykk+3oYp6kerGw8ViCn9hyRBR9/mf
	cZNyS+MNeGRILwQ6iFfqmaZUWXE3ADs9jB4jRyZ+fTXgkfqguvoY
X-Google-Smtp-Source: AGHT+IEr1i/vm3eBteZERpQheyk8o3WQ9vige+idzo8CUktN71Bt/kzDz/V1i4oPHbjHqRKqvO/CwQ==
X-Received: by 2002:a05:6512:3c89:b0:52c:d905:9645 with SMTP id 2adb3069b0e04-532eda79383mr2940822e87.13.1723690131468;
        Wed, 14 Aug 2024 19:48:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-149-85.dynamic.spd-mgts.ru. [109.252.149.85])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a8383935909sm30261666b.112.2024.08.14.19.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 19:48:50 -0700 (PDT)
Message-ID: <6c48f84c-f6da-4f4b-add5-71ec4ea6b963@gmail.com>
Date: Thu, 15 Aug 2024 05:48:48 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] Do not mark ACPI devices as irq safe
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, dmitry.osipenko@collabora.com,
 Andi Shyti <andi.shyti@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com,
 Michael van der Westhuizen <rmikey@meta.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240808121447.239278-1-leitao@debian.org>
 <ff4haeeknghdr5pgpp3va7opnrx5ivlpaw5ppboqrq75733iul@zy4c7mu3foma>
 <CAHp75VdbRexEx90ybaFsiPhg8O0CzvpkWT1ER31GnP-y8a1e+w@mail.gmail.com>
 <ZrtgfkzuCbNju3i9@gmail.com> <cf2d6ff5-dfea-4e25-8eee-e4e8c9cb1e7e@gmail.com>
 <CAHp75VdHT3g91AirBQGodw1sHbq7U=oKnJq3oSqDcNYS+OUOKQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Content-Language: en-US
In-Reply-To: <CAHp75VdHT3g91AirBQGodw1sHbq7U=oKnJq3oSqDcNYS+OUOKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

13.08.2024 18:52, Andy Shevchenko пишет:
...
>>> but somewhere in the replies
>>> here I would like to hear about roadmap to get rid of the
>>> pm_runtime_irq_safe() in all Tegra related code.
>>
>> What is the problem with pm_runtime_irq_safe()?
> 
> It's a hack. It has no reasons to stay in the kernel. It also prevents
> PM from working properly (in some cases, not Tegra).

Why is it a hack? Why it can't be made to work properly for all cases?

>> There were multiple
>> problems with RPM for this driver in the past, it wasn't trivial to make
>> it work for all Tegra HW generations. Don't expect anyone would want to
>> invest time into doing it all over again.
> 
> You may always refer to the OMAP case, which used to have 12 (IIRC,
> but definitely several) calls to this API and now 0. Taking the OMAP
> case into consideration I believe it's quite possible to get rid of
> this hack and retire the API completely. Yes, this may take months or
> even years. But I would like to have this roadmap be documented.

There should be alternative to the removed API. Otherwise drivers will
have to have own hacks to work around the RPM limitation, re-invent own
PM, or not do RPM at all.

Looking at the i2c-omap.c, I see it's doing pm_runtime_get_sync() in the
atomic transfer, which should cause a lockup without IRQ-safe RPM,
AFAICT. The OMAP example doesn't look great so far.


