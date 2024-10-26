Return-Path: <linux-i2c+bounces-7604-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B69B1605
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 09:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8992B21DD3
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 07:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8446A1991D5;
	Sat, 26 Oct 2024 07:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Awhl0R+r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E58190663;
	Sat, 26 Oct 2024 07:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729928391; cv=none; b=RuGM2aK9PxYqdPETy0JTAzptoCV7yoZ0W52hhYbaSQfulrmtGJfosKxyqsrW+O1EWvkqNKzX8KMeKgsr9nPFwhWII/Q5Hhl+rmLqCUeqBxsp8aCc5EnJaBA/836XIXxFd/VxFx12btcRco+6lTictguh0SlgBwo6UNr+ncK/VaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729928391; c=relaxed/simple;
	bh=HfHFzQkaGqX3ZnCK6+fwCyvYGmRCG/K2nzb//m/8PT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fl1wqn/Icg9+BdZWGPW6C/2/juzG+gRPAbITdRthKKJVv1VvFyzQ7kOQbtWlSRnUT+/79GiWFVicVfYvnx+8Sl49QwoEV8yCiAFL2+0MZB0oj9Tu/39B1OM/xVD9vOwVwfKjpyEfaYKBE67SJ+jdthLidzRfvhlr8tMozsbtnto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Awhl0R+r; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7205646f9ebso1048714b3a.0;
        Sat, 26 Oct 2024 00:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729928389; x=1730533189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnvSUU21/sgza98oDgzndxQMMdo8WMEKuBRSgRisqXw=;
        b=Awhl0R+rDpaYdc0l73QH6y9UneZqCgB4E9xWgLstCFivL/QxHGfGFhozCXRZM1hZ7G
         EXUteWcTt9OcyboqqECOMYiukWWJ5WAK4OIgPbdGyOnxleCEjJ3o8vJUbzHerp7GbjnT
         GdmSupd+6t+QunEmovP+8DMiQBNwfWQZzoW9cCl1lk+LzmreOWDSsK5666HBEUPz0fev
         eLCSjux0mFfZb5wfvCGRD8dUb38NUFNS42Owr10F3fiTO9iPXIGJLeN12voyEVMcYbhA
         /0Fru2+iI/RPxDdZ17XtTmtCq51BlIQxM2C4bG7recDtXvPlWTYsLu+BCxkRDBRqGUyj
         NV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729928389; x=1730533189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnvSUU21/sgza98oDgzndxQMMdo8WMEKuBRSgRisqXw=;
        b=a2plJiH6HSQ+MpH9X985zcXSQedqEobLoSaU4infH6BAUJpQ0qmkBRGuzPy+Oz81lh
         GVeoAFKbgP5twlEMK5L+ngTbLJsZajs6kyvR/fZNqyKcBai0JagNRI1FjQeL/c4mxfZm
         D78ZCiUqAg5f4Kub5y/xaqAA31shTG48bazKjAmAM50MzcggIdG1X0rLLanzDE+Xpj2l
         FP1II2KHKDxeuENfl136gICbqsCXTJHiez6SN/p7YNHoeW5wNkOMk5YZ47l0iISlbg8W
         J5t1oIG4DtVnqft0qlzbeu8qOuvuKi1wvvE+g8+Uf5wofuUv7pVN+r8vi2vpN/vgKSs2
         4SxA==
X-Forwarded-Encrypted: i=1; AJvYcCUcnI0GOx8+lY4romAoF72ZNSVe1K7ut1IPscrCehR/M8/PdxByu4KbBYijmDRNLomzsdkGOIGefEeUpiBs@vger.kernel.org, AJvYcCUnJztg522q7SNdtYuBoMfLr0Nay4khxnr2Pk8q7ld6aGPxr2gTAe7lWR6nazyJdpiZgbsWKnHbNfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsfCbgsxKiPMG5VQeakj/rBx38WVynmHCYY2cAkZ8lyM2Wl/f0
	9mvXRquPLYts0MwjTL25ZwGD3DsgveyE2etb9imEoF/TfYurKPf6
X-Google-Smtp-Source: AGHT+IE6IqDnyb8H4lSFcrWrSDOnz4q5cRAvXdqLU+xmy1HIgmDjRQ2T5T/W2o9Xr3UrcqoVo5aNQQ==
X-Received: by 2002:a05:6a00:1398:b0:71e:59d2:9c99 with SMTP id d2e1a72fcca58-72062f8376emr3609396b3a.4.1729928388403;
        Sat, 26 Oct 2024 00:39:48 -0700 (PDT)
Received: from ?IPV6:2409:40c0:233:2700:4dc8:1441:1668:ab33? ([2409:40c0:233:2700:4dc8:1441:1668:ab33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a3c20fsm2212000b3a.200.2024.10.26.00.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 00:39:48 -0700 (PDT)
Message-ID: <771b8d5a-f0a9-4d82-bb59-5fdd1fe7447a@gmail.com>
Date: Sat, 26 Oct 2024 13:09:41 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: busses: fix uninit-value in pci1xxxx_i2c_xfer
To: Andi Shyti <andi.shyti@kernel.org>
Cc: tharunkumar.pasumarthi@microchip.com,
 kumaravel.thiagarajan@microchip.com, UNGLinuxDriver@microchip.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241022190845.23536-1-surajsonawane0215@gmail.com>
 <2nyxcv7yearclljgnqrrrobburq7cvqog46ct56lvtn4zux6z7@twxxpmbuce3c>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <2nyxcv7yearclljgnqrrrobburq7cvqog46ct56lvtn4zux6z7@twxxpmbuce3c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/24 04:32, Andi Shyti wrote:
> Hi Suraj,
> 
> Thanks for your patch, but...
> 
> On Wed, Oct 23, 2024 at 12:38:45AM +0530, Suraj Sonawane wrote:
>> Fix an issue reported by the smatch static analysis tool:
>> drivers/i2c/busses/i2c-mchp-pci1xxxx.c:1030 pci1xxxx_i2c_xfer() error:
>> uninitialized symbol 'retval'.
>>
>> The error occurs because retval may be used without being set if the
>> transfer loop does not execute (e.g., when num is 0). This could cause
>> the function to return an undefined value, leading to unpredictable
>> behavior.
> 
> ... if num is '0', then we would never reach here, check
> __i2c_transfer().
> 
> Thanks,
> Andi
> 
>> Initialize retval to 0 before the transfer loop to ensure that the
>> function returns a valid value even if no transfers are processed. This
>> change also preserves proper error handling within the loop.
>>
>> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
Thank you for reviewing and clarifying.

Best regards,
Suraj Sonawane

