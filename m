Return-Path: <linux-i2c+bounces-10515-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B21A96095
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 10:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEB4918820FA
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 08:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92BD235BFB;
	Tue, 22 Apr 2025 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYv+/pYI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8453A1E7C32;
	Tue, 22 Apr 2025 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309333; cv=none; b=LpwpxKSmg/mrOzsQRCJToKuwasVafPwuMK/5uEKdJH/p0nARbnQsbqSce8vtgP1hQx1clwYcqbpYA9kMpEm8bvZGWuaFoKdN+ZZaLF17o7G5fyiVxXF8IXm/L2OZ8rtGMerdT9IBKXtowbXJWP7v60yXc5E6CXcCg9Zv3pGGvKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309333; c=relaxed/simple;
	bh=cjxeTIBjmGDBo3MhtyDpWmP+BZTYc/JTlOwvci9CQTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SkCO88mc4YTNQZsguE9E3YB9Ce516Z90gbPqDpNN35pVZaVsVsmzmB9idZdQjEwpbqjiE5Sm18277ineAqZfRiHBqgTdRCNCs60ApOAYHtUVPfvUxplUhwWwt0WhAaa2rXXSGeC8J12f9r3tDYKPQrEVANIR33SkGQ8lJBqyOzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYv+/pYI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93959C4CEEA;
	Tue, 22 Apr 2025 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745309333;
	bh=cjxeTIBjmGDBo3MhtyDpWmP+BZTYc/JTlOwvci9CQTY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fYv+/pYIPEf1BOh4BavScuPJYtjWNwaFWhndS7H1TtiwqP/rDqM6fk00o1uZG4opD
	 UYRwUStlpRweKSPIpdx4AqHbCfAseLNyoR7WkbKpadjdWf9Fq3j+52kwd7wgnkvYcS
	 HFw4/P3UPCfPcx/Pf7w/nzRzuxHcJFYnadVqnRhomdAfL0uRuhsQxNwZtQC5M0AFOG
	 A9s+qhrcdYFnCJm6DCkvdgWWtYFMVRnnIYGCuxRg2+sp9AcFq4qKMD8fJ16su56nhT
	 dCtnULXRrkttGHNnGgrrw2ygxpaesNSTmT/AG7fgTILnL5Hl6lqO7cNXpXt8b+WP3i
	 6IWF06kixtj2g==
Message-ID: <14de236b-e2a7-4bde-986d-1e5ffddd01b4@kernel.org>
Date: Tue, 22 Apr 2025 10:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
To: Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com>
 <20250416201407.GC3811555-robh@kernel.org>
 <CABjd4YyTKquLcYC+DVg_koi3p7AhqwBNiazCiC713DQKjCaBSA@mail.gmail.com>
 <CABjd4Yxi4SLqsAk_fb9C=1BW6XjnZ8LQ_JKYu6KZ3TtMS0fnhg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CABjd4Yxi4SLqsAk_fb9C=1BW6XjnZ8LQ_JKYu6KZ3TtMS0fnhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/04/2025 14:38, Alexey Charkov wrote:
>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    items:
>>>> +      - description: SDMMC controller interrupt
>>>> +      - description: SDMMC controller DMA interrupt
>>>> +
>>>> +  sdon-inverted:
>>>> +    type: boolean
>>>> +    description: SD_ON bit is inverted on the controller
>>>
>>> This implies I know what the non-inverted state is. If you know, please
>>> state that here.
>>
>> This is a tricky one. The only answer I have is "it's inverted in
>> later versions vs. the first version I saw in the wild, and I'm not
>> sure if it's board related or IP version related - nor if the original
>> was active low or high". No docs, no schematics, no vendor left around
>> to chase for answers.
>>
>> Will dig around some more and update the description if I succeed in
>> uncovering any further clues :)
> 
> I've found some extra clues and would like to consult on the best way forward.
> 
> It turns out (if my understanding of the decompiled binary-only WM8505
> vendor driver is correct) that all chips before (not including) WM8505
> rev. A2 treated their "clock stop" bit (register offset 0x08 a.k.a.
> SDMMC_BUSMODE, bit 0x10 a.k.a. BM_CST in vendor sources, BM_SD_OFF in
> mainline) as "set 1 to disable SD clock", while all the later versions
> treated it as "set 0 to disable SD clock". Which means that there are
> WM8505 based systems that rely on either of those behaviours, while
> any later chips need "set 0 to disable". This is not a board related
> quirk but an on-chip SDMMC controller revision related quirk.
> 
> I'd love to switch to a compatible-based logic and drop the
> "sdon-inverted" flag altogether from the binding I'm writing, but here
> are my doubts where I'd love to consult.
> 
> * Looks like WM8505 rev. A2 needs a separate compatible string vs.
> prior WM8505. Can we have something like "wm,wm8505a2-sdhc" and
> "wm,wm8505-sdhc" respectively? WM8505a2 not being an actual chip name,
> but something discoverable by reading its hardware ID from a system
> configuration register at runtime

Then maybe it can be fully detected runtime? E.g. via soc_id driver (see
drivers/soc/)?

> * If I introduce new compatible strings for "wm,wm8650-sdhc",
> "wm,wm8750-sdhc", "wm,wm8850-sdhc" and "wm,wm8880-sdhc" in bindings,
> DTS and driver code, then the new driver and new DTB should work fine,
> and the DTS should pass schema checks. New driver code won't work with
> older DTB unless I keep the logic to parse "sdon-inverted" which
> wouldn't be part of the binding. Old driver code would not work with
> newer DTB except for pre-A2 versions of WM8505. Is that acceptable?
> * Existing DTS doesn't differentiate between pre-A2 vs. post-A2
> revisions of WM8505 and is bound to fail on the latter

That's an old platform, so we should not break the ABI, thus drivers
must fully support old DTBs.

> 
> I realize that breaking backward/forward compatibility is undesirable,
> but frankly these systems seem to have few mainline users, and those
> people who do run mainline on them ought to be compiling the kernel
> and its DTB at the same time, because the firmware doesn't know

There might be other users of DTS and anyway what would be exactly the
benefit? This hardware aspect is already documented via sdon-inverted
property.

> anything about DT and any modern kernel can only be booted in
> "appended DTB" mode. I also don't know of any non-Linux code that
> might be using these device trees.
> 
> Any guidance would be much appreciated.
> 


Best regards,
Krzysztof

