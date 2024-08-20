Return-Path: <linux-i2c+bounces-5586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8E09583F2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 12:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B103287D3A
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 10:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A4C18C906;
	Tue, 20 Aug 2024 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NiyHc3gs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDAA18D637
	for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149008; cv=none; b=QTKrZNBqGHWo69VuIeZQT2RGdQ2WXJN6eWSrWlIuieiIZu+38tIym8NkHmWLVDYbTiOT5e5QBAbPdmfGqz94Sn7s0F2w3kWHNE8AzknVs4BhOv1T/FxJ8dHpOqVYPMRT2PwoXANceGKm4leb/vgoi4m1VYoaV90nDTeb0zXATjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149008; c=relaxed/simple;
	bh=TqRjFWkKbWeEkGzEJaqHB/W+KKXTwGUJgPmIKjqEgeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajG832IHfCCofUKhE4FQqSwz4XSG7G0tFH0J+2k12rNPyQ4JOAlS1IT0uKJDTSZTS7jstWQIfX9ne3TuzYkVuIWatktwrvszsGbOfakjs5dNutCHYibU0SRCiWxBQOzD8EoW9tfzIe/8b1d3MpILy5xaPchqeijn6VAkVAQo1eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NiyHc3gs; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8384008482so560988466b.2
        for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724149005; x=1724753805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUgvdkKemsynJw871Va8xFCJPoIgK/+NkAwAS5w3iD4=;
        b=NiyHc3gsseKQH7eI2t8a/4IaoStNIzdMgpTm/uKYaxaibPwT2VYgxdsnMjXY3HgT0a
         P9VuLOnxwmCqGEqCnL052SYDm1kXoFsQ0FASq9jHRIPl3Yeq6YFfvno8kD7QQPiZt6dz
         KGq0GmMs9hwI9IRO5A6m77+4SBO8ymGs4P3PyZI6u3UD28wfPIAlLCZNGvmiU1r7ABbZ
         S8u8B1ryQ6HjR7k04PGAz3lsBVpHUd25r0815xa48Q9X5mjU8VACwdi08L9rZ/KzoX/l
         z+o9jQp2cMAS9T6MocOYfVtohTGEQc4Xoob9DjIdsipgUu4nN7M5G2kkbhLd3teQMcdj
         rWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149005; x=1724753805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUgvdkKemsynJw871Va8xFCJPoIgK/+NkAwAS5w3iD4=;
        b=cw6L7g+THI47i0gc2KJ3auysOEl0c/TXNWQd2Ps0cYQddLcVa+hkV7r1X4cFAiEUBK
         nMvGqJddZw0UPr5pK1aA9wwe9gbd6KcGyG4VXGPvOQ9xH0BNbtfnOKDRcGhD/9UIYpdX
         JHRryyNvEHLnLAsU7XPUZYlHdmxqiCbc7bJ1YS0vFJK2f0OP2LsRvbHudMo/MIY+TDfp
         rurjDveLc7IcI9pRHa4rfTsOKTWejl0KSWdr7OtoYSPLNDiu4tskFF+jNol7UimTKcbh
         egcWG2Xc0qwoozE/qsu3h0IbI3yGiyrLmKwmWjd3xs/O6KpMjOCA+BHy8n+o+OJj6DmD
         puFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYUOFOrjutEjSdyXW2SglrPOSzEtvGXbJxsggRC3m3n0B7PY8beEnXtwlZYargRWonPq58++9eDjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3EHsioCCAWo1xPWbBQv9drcyo+htNqEjyVK3aZUho0kqGe7xQ
	kY7ymeTb+dwRsKy4YykdlnqRWYhiOjKgXIhJOtZuk6bFyPAF+wStLY7HuO1iVMM=
X-Google-Smtp-Source: AGHT+IEHAOpi6gAtu1Bdiww8ysONKnU4SlvU51Tmtq6mrQBDcD9AG75eGftS0eZMJPQuXiI1ekXrsw==
X-Received: by 2002:a17:907:97d2:b0:a77:cdaa:88a3 with SMTP id a640c23a62f3a-a86479e45efmr127114366b.27.1724149004495;
        Tue, 20 Aug 2024 03:16:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838d023dsm736934766b.64.2024.08.20.03.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 03:16:44 -0700 (PDT)
Message-ID: <2fc8ea3c-9074-4291-8355-4b646f51d0e9@tuxon.dev>
Date: Tue, 20 Aug 2024 13:16:42 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] i2c: riic: Add support for Renesas RZ/G3S
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <gc3fqib4iflzmwu2wv33436anbrfywxoj5p7ah3m67sqp3u4h4@2ttbj7kgmjyx>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <gc3fqib4iflzmwu2wv33436anbrfywxoj5p7ah3m67sqp3u4h4@2ttbj7kgmjyx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Andi,

On 19.08.2024 23:23, Andi Shyti wrote:
> Hi Claudiu,
> 
>> Claudiu Beznea (11):
>>   i2c: riic: Use temporary variable for struct device
>>   i2c: riic: Call pm_runtime_get_sync() when need to access registers
>>   i2c: riic: Use pm_runtime_resume_and_get()
>>   i2c: riic: Enable runtime PM autosuspend support
>>   i2c: riic: Add suspend/resume support
>>   i2c: riic: Define individual arrays to describe the register offsets
>>   dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
> 
> Looks good until here, do you want me to apply these first 7
> patches to unburden you a bit?

I already prepared the new set. I will send a new version containing
everything.

> 
> Unless Geert has some notes on patch 6.
> 
>>   i2c: riic: Add support for fast mode plus
> 
> Small things here
> 
>>   arm64: dts: renesas: r9a08g045: Add I2C nodes
>>   arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
>>   arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node
> 
> I'd like someone to ack here.

Usually, these are picked by Geert.

Thank you,
Claudiu Beznea

> 
> Thanks,
> Andi

