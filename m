Return-Path: <linux-i2c+bounces-8196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0ED9D8301
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 11:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AE7F163615
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 10:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C4D190696;
	Mon, 25 Nov 2024 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9iqC30b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94060156962;
	Mon, 25 Nov 2024 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732529178; cv=none; b=qiBEQUXK5Euk0OrJbTYYSBXxThOiFWCr2peJI0IbegBQBTdCAQwnFV+WnD0agmMrFJ/9sMSFqy226fYUCwriIAl1yYeIgSfItmNahKh3lqNJmhHNlbSt4V32mV6C6ydoX1VweJlfUdl8Q09AsST1+F1ZIgxHvYm6jIcde7zAGyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732529178; c=relaxed/simple;
	bh=UOThc3b93MmdjWLKZ3YHh6qM55YpPcWryivzMSZuqFA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EfOQK7yEjy/ljYs3WEFTL+DqBz24AFaScvYpaDdroxGWjuEizqVs/5KkeuI5WCGOmYTGcLmfeKdoUqWHSoBEBX8gSSYEIVbFWw3JpMt3cybNFHLZaRhFF3vxsIDWt873lqlSqMdIBMJakc7+7T4GV/cn/9r5ArHKsmI6TQd9wpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9iqC30b; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-212583bd467so41714495ad.3;
        Mon, 25 Nov 2024 02:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732529176; x=1733133976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+3NtaabvUmPRFjMjNpaL6YcolhVFVdItTli/OILgxGw=;
        b=j9iqC30bO9/6zucExNV4Ckt7IxTDKDCBxptvUfFqz4luiUeD5pKs7L4kDtxdwTRXRZ
         NI17BzpdbHZDdwC8hDIcnii/reJNMD4KIDVji26pyVjpN9nt64JSHi+685GdRbvlJyXW
         P/pYQiLkykO/PP/jAyiPCtLitLMORjC8UVr/Y6qDwpHNtyKXrDdMbXM6PgqXFaVSTFPR
         t3S7+zkwRo7dpmaolzjEEvL6mWGOfbryij082vy6LBCIJwM1vVfaFIvIoiznOk00ypkg
         88ipQNYwnLkM5qTyCnupo+UBG2hawNkxgjcFtMCEgV5CS9hgL/n0jwmIkY1WsLEICNf0
         +7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732529176; x=1733133976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3NtaabvUmPRFjMjNpaL6YcolhVFVdItTli/OILgxGw=;
        b=IZGHvzx8Tnr4eJBo6GLly3OyVxUceKgeocwpsw7+B9O1mCRlqgaJMz7kbAp5M6Xd0f
         GAWtaF+wYCoPOsjNuIZIKep3IEzW8NKkMOOwLoEwqLz4ApzSjbNW2DyBybiTqDL6M2Yv
         PToRQbN4jGl+RhDQ6uEFtl+AMh+61Qf7Qmkr7n+STWU2w97hzc2SiWSxHFd7Np8XBXTM
         uY2RFD/UHce9dXsVYtv9xGcxy0UAz4v7khURz704s87ENhmONoEclEuHwTCzO8GKA4BQ
         ybkraINaq15PR6ZAhpJY9bgRMYSgPkZcVLFyZWYwaxEhDiP0vkAZ9ZKe0kVS2+ZL9nmE
         ioYA==
X-Forwarded-Encrypted: i=1; AJvYcCUMtlnfVDHPgPtFlkQvxXj82JBk461VVSl/OMaVifHAs1vYMbiTuDpAU8kDkD53uHnlh+XfRp/sYOTb@vger.kernel.org, AJvYcCV56zGwb+CWPkg9dpOpaPVqIjasY6IcFcmuSSJ905S7RpYqT4e5dsyDIx0oIHxhErP+Vlsp8IsKpcquDwNk@vger.kernel.org, AJvYcCW6Dpxo4VDyG5W+yzxRNVmDq35HXh2i+zpQE4vTWMRad2QLNFi1zYmagfWlkiCWcLIzO3mg5TBuVBjZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgS9CFjTExxW1OezE1F4xHpbi0NuvYNL7Tp/rOQjYFESFlKQCV
	9GhM5ocC3jBf7Di2uGJwZ6mx0yii08D+pVV3kH1qnam9ZJjLSkia
X-Gm-Gg: ASbGncu7V4tDX4VLcjjl2/1439JVRwe3OMZ1wnEKLBZ/BZiKCqqhCOUm4glE8bvKSCx
	je59vUqNDbuISBeAGP5ar2FXC37aAJ6e86mf4OFJQI4vFyM+pSHeRdUjV22AQDinZEb34Mk/c3H
	ulOPnC3Yec/846fMKkCIVbuElN8TEN5vURMvRNkk9MnavxDk+HEG5IVYBj5T+gqNJcGfoox9wyd
	s1XtmheUqTfRpOVksNauQHJEIiIaoLAfg==
X-Google-Smtp-Source: AGHT+IEkrIBkU0kksKhlyCcZZn5FcNKqYFGe1JjIsnZSYTKhWsKjEk+jkzD+EU534TMoVqDbZ2NxhQ==
X-Received: by 2002:a17:902:e741:b0:211:fb2b:7053 with SMTP id d9443c01a7336-2129fd240ffmr164761745ad.33.1732529175741;
        Mon, 25 Nov 2024 02:06:15 -0800 (PST)
Received: from [127.0.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc13239sm60710905ad.177.2024.11.25.02.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 02:06:15 -0800 (PST)
Message-ID: <062192c5-4482-4c83-b127-fae0942ab114@gmail.com>
Date: Mon, 25 Nov 2024 18:05:58 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] riscv: spacemit: add i2c support to K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
 <5d69e1db-2ec5-445d-9336-9345c918722a@kernel.org>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <5d69e1db-2ec5-445d-9336-9345c918722a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024/11/25 16:06, Krzysztof Kozlowski wrote:
> On 25/11/2024 07:49, Troy Mitchell wrote:
>> Hi all,
>>
>> This patch implements I2C driver for the SpacemiT K1 SoC,
>> providing basic support for I2C read/write communication which
>> compatible with standard I2C bus specifications.
>>
>> In this version, the driver defaults to use fast-speed-mode and
>> interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.
>>
>> The docs of I2C can be found here, in chapter 16.1 I2C [1]
>>
>> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
>> ---
>> Change in v4:
>> - Patch #1:
>> 	- Change the default value of clock-frequency from 100000 to
>> 	  400000. This is to correspond to the driver's default value.
>> 	- Drop the minimum of clock-frequency
>> 	- Modify the description of clock-frequency
> 
> Explain why do you request re-review.
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag. Tag is "received", when
> provided in a message replied to you on the mailing list. Tools like b4
> can help here. However, there's no need to repost patches *only* to add
> the tags. The upstream maintainer will do that for tags received on the
> version they apply.
> 
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof
Thank you, I accidentally forgot to add it, and it was not intentional.

-- 
Troy Mitchell

