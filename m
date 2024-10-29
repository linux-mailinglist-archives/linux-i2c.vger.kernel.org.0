Return-Path: <linux-i2c+bounces-7645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6427D9B4453
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 09:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 298C2283AEE
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 08:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC702038B2;
	Tue, 29 Oct 2024 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLQG3eo7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F71F7565;
	Tue, 29 Oct 2024 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730190970; cv=none; b=cvEfh7TOc4e2NEBsABbhIm+Ey1u+lnQRNzPUu94M78OVOW8j6dxEBrWHBU/rubBM1lCrfChUVivyOT8J+GlnODjyliw3g0Ge8mh2AzSLPD7Oh2eavEh1I9djPiRu4Rk2XDIV7kGtsXHE6DZTQsSEcWG/thQ+KypkPC9YqoXdAJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730190970; c=relaxed/simple;
	bh=fGKUqwVOOnFLbG89wMtYJqLDlQo4wwQpAOCeJx3ljtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISNCBrUh0Th0KEyYlbxUI132jhDE5RmyxDUlLftse+kmFskRLzIr274+PrzrpZEb6yVnd3DtUfirRYWlzwnfxptsxV4mijEGGJ+Q0aFJmYtT0oBS9zNB63SE/25HZn1iKdnb3d26F3IS8aUZtPEiYSIpB8jNGM9twhKBQYo9vVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLQG3eo7; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3454630a12.2;
        Tue, 29 Oct 2024 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730190968; x=1730795768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8NSLt5gROai5eNjRnyzeHIXUrIA3Ff+xSmUEHde5ls=;
        b=YLQG3eo7C4WSsRViTBlp1AfaTXrIXncroof1mrfq1NXD6/1kNKHFL1ME0tsLiCgsPr
         QA+tql6KOkygPCfyrSx2Sv2xJh+vb2eF+HkbxfnjWNx5VWcLSUe4VINO0synVQqatysO
         WJjGjOPnfYt5bZH1OZ97tLamKvbXlj+cwdK/mxR4+YrCKA+q/LfPTtfdAEHwLHNXFDW1
         vFTHn/K15op3s9TGTCJ7ESwwg8cvAoeews2v51bDqtiLETePKln1V3CnF72Cx8VN4sbT
         Wg8Pq8Z62kEYb7GQnDCpLcGdK8FZxYzFPpLEx+qOD/988qw18EVRBthetcyRpokerdUr
         46CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730190968; x=1730795768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8NSLt5gROai5eNjRnyzeHIXUrIA3Ff+xSmUEHde5ls=;
        b=hwpBk7dycdZYolmF9ybnQ+pA491tFZOJO8Xbm9hyISZ2GlcRL+MQBZr2b4gQB+3z7I
         kFuFgTbp6NHejqXwkH24zPDXAyUeRruGXu8BVcVGO4zQsbm1GsZeT6bY+x2x7gdssffs
         7AwLgejjMD7RWkDGDDoYJQoTcMOvK2axDspAMGxGDqCh8uBfks3VXwFyC+FATrjtwgu+
         7N6BblM5tn5a2+19SbyMTNV7Fw03jG4fvikQjzjLINCBjFZo5f0F3nkFjwrzUWxTeeXq
         GFYQVIVFxueWTzjRhrc0XRxs7O8PI1DTUc9Yn2mUXvfsKyrUWduczL45gckdiGe9j3+i
         eHqw==
X-Forwarded-Encrypted: i=1; AJvYcCUroq8+If4URmjOB2Q8DmSedDwNpuvtFq8V+xxTNKrXQxw7vFrzwMqkFCHuFcQsO9LMIShTIMlUJRpv@vger.kernel.org, AJvYcCVkMVVsUdE1daC7ZQlUIN9mI2zpfexO6J0JYRoTeA+hbB9uIr+HbDS9LNJ0FtoMw7QJtHnIUW2Jfkr628DX@vger.kernel.org, AJvYcCVmbQfCsaakNMr49yieN00ChrBjjYHe81PdVBbJv8qvhSLcAzJ0BgAYu26461epKZhYTOjOF9CSumdJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzXgJvax6WwUdbl3C8FFnd3Tvg//3fIiBlc00UF1WH/CKKUaiKG
	pMryIG7SzDrY5x1Zz4iodJvwOTeOCJ6aiVjo+8rMYAspdwfHfPSz
X-Google-Smtp-Source: AGHT+IHBlSsRarPjE08Y8GtoBvAeCWe8nYN7P9fMO3ywfLAmEctgr9vvRZpfDmJHAhNB1E9ogzoalQ==
X-Received: by 2002:a05:6a21:390:b0:1d9:83cc:fd48 with SMTP id adf61e73a8af0-1d9a83ca001mr14773602637.17.1730190967861;
        Tue, 29 Oct 2024 01:36:07 -0700 (PDT)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf6d605sm62414185ad.93.2024.10.29.01.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 01:36:07 -0700 (PDT)
Message-ID: <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
Date: Tue, 29 Oct 2024 16:36:00 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/10/28 15:38, Krzysztof Kozlowski wrote:
> On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>> and supports FIFO transmission.
>>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> ---
> 
> Where is the changelog? Nothing here, nothing in cover letter.
> 
> I asked for several changes, so now I don't know if you implemented
> them.

I deleted the FIFO property because I believe your suggestion is correct.
this should be decided by the driver, even though the FIFO is provided
by the hardware.

Apologies for missing the changelog. To correct this, should I send a v3 
version with the changelog or resend v2?
> 
> Best regards,
> Krzysztof
> 

