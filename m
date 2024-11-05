Return-Path: <linux-i2c+bounces-7772-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDC29BC360
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 03:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 337F71F22BF5
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 02:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D55952F9E;
	Tue,  5 Nov 2024 02:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="frcZ2JyS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3620A957
	for <linux-i2c@vger.kernel.org>; Tue,  5 Nov 2024 02:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730775058; cv=none; b=p9vSzwXKh7PQomWWlogX88nkSjNCIYLmVMcLqxJuaCxkm4xvb8u+y/2FbXFZmXWFcC+8OcHM0P64y2595mG+Gjk04IfhRn3MUq4EVCGMsLACadeTPWGbrUj56KnB1ZYrLGs4qPo0n/626xG4m8fCYrsxot8GPcNC9v6R3t3NwLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730775058; c=relaxed/simple;
	bh=vbiJPHegxNQ2CbHFn19WOVEY31A9cQbMk+3TsF29fLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6xQijxBRvDH8kh25gSgUfAJBPU+D3AYvH4phf8CeS4fW6Qr+cPOp4Ro5HOURFXe+kZjrP+OaZPJJqlqeJ/3v6vN7CEKQLZlws5KXkoSSWrX22K+oA8uJmQDpc5cbxq41oVGUNlRUMGw1/6lSp+F3ZYkx3vLY3JBoe/iWvSNFp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=frcZ2JyS; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-83ab694ebe5so195891739f.0
        for <linux-i2c@vger.kernel.org>; Mon, 04 Nov 2024 18:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730775055; x=1731379855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ul3hkd/tGZUgdB/NcC3+w2ZkqD0S/VDimfThwQCgdHo=;
        b=frcZ2JyS8wY+r4SxHLjfJ0xUjmN46CrkaOZgSYc0FDtcxphpwkpjaoq9o0cvSXGSzB
         eUG0rFIZFKbBcICahMmOxiFHEU1uHXvu7AXYxIQoBrutOfu1EGfq2UUhlovt9iiKasJW
         Q7/WZmDi0WGwfAPB6I0tTiypS18LlXStwzX2IRW220NliTaORksv1ihUT/0H8O7nwhRZ
         RQ7oCpf60/gOoYAOoZqqiVIE6KQVYxcDUPvWLKiKI5JJKncCEKymDDVKw0M3xdpWcIq2
         rtUF5+uYwgX5FcQlowm59CiGvOBOBYgsz0FhWA2tM0blYcqkeQFldo3YLO9hD4tqe8Tz
         +DzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730775055; x=1731379855;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ul3hkd/tGZUgdB/NcC3+w2ZkqD0S/VDimfThwQCgdHo=;
        b=klCDAkSvr4RbHzSyXxq1gfg6zbxrgU2td1w6sC88N9jwLAWCQy3/73Z545XFYcbpQw
         i/KwalssO42vfkeOMIW4GpQ7S+3L+TEuVLI5oQ1qDSkpOKiz1Oe/UwhsLSqh54naqZaK
         LdZ0x9yrxql4rWXSYIW5HZ0HQL88154I1RPfT+zaJTm2jjg00TZonfrg0Cu9dvI6T8al
         Sg2iQ2NZHYQ+eEdCK9cRxulo/zvaXUHhcJVJG4eSbr6zsQvA3eys7cJyGbmXwZqCBnTO
         hGnIMuiAF2SVEdr21BsdD1jsXkI3e7HrcIhKDpwQptM9M/RA5MvI6iPgkOvdGy/s1dNY
         LaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOnoMVDyZa7B7+3Qe6AwTZYuqUG52AM4Eyc95UxPwVowAZFtX8tAbatSN0m9fa/Gnzvz7yoxL1hI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/ynfJzITR94PuuW6KlORxch6c5lmMgdngsq8bj6agC1YiHLD
	vOzmQDVGGTl6w5uTacUpyTMg7T49fMDgjJ4jm5+b6tdHoyQpwyEK/JA0q51tyx0tdEO/tJTDcJS
	b
X-Google-Smtp-Source: AGHT+IFCnX1dntppVfh7JOMx6QPmo5cW1xeoynpjMcWrKPYAnWrp50DBwRG8U2h/uLNbyAAUxQqaZQ==
X-Received: by 2002:a05:6602:2dce:b0:835:4278:f130 with SMTP id ca18e2360f4ac-83b1c5d43acmr2984623839f.13.1730775054965;
        Mon, 04 Nov 2024 18:50:54 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de04977ce7sm2193935173.119.2024.11.04.18.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 18:50:54 -0800 (PST)
Message-ID: <8a04f84b-453b-44e5-9053-204a08d38e19@sifive.com>
Date: Mon, 4 Nov 2024 20:50:52 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
 <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
 <6cce463e-25cc-4a07-971f-6260347cb581@gmail.com>
 <502b0b14-0e1f-4a59-85ad-7edeb9d3033d@kernel.org>
 <a08384bf-6747-4975-b025-f8fd3685fc30@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <a08384bf-6747-4975-b025-f8fd3685fc30@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Troy,

On 2024-11-04 7:14 PM, Troy Mitchell wrote:
> 
> On 2024/11/4 22:48, Krzysztof Kozlowski wrote:
>> On 04/11/2024 14:01, Troy Mitchell wrote:
>>>
>>> On 2024/10/31 16:00, Krzysztof Kozlowski wrote:
>>>> On Tue, Oct 29, 2024 at 04:36:00PM +0800, Troy Mitchell wrote:
>>>>> On 2024/10/28 15:38, Krzysztof Kozlowski wrote:
>>>>>> On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
>>>>>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>>>>>> and supports FIFO transmission.
>>>>>>>
>>>>>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>>>>>> ---
>>> Change in v2:
>>>  - Change the maxItems of reg from 1 to 2 in properties
>>
>> Why?
> I need the address and size. In v1, I wrote it as 1, and I got the make
> dt_binding_check error.

One "<address size>" element is just one item. maxItems > 1 would be for
hardware with multiple discontiguous register ranges: <address1 size1>,
<address2 size2>.

Regards,
Samuel


