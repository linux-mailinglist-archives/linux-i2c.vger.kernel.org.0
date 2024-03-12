Return-Path: <linux-i2c+bounces-2338-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C23187971F
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 16:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFF231C21C92
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 15:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3097E7C084;
	Tue, 12 Mar 2024 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvhpX5Va"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C077BB08
	for <linux-i2c@vger.kernel.org>; Tue, 12 Mar 2024 15:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710255956; cv=none; b=AxCz3W2wxXGqYFdjScg8GeQ5KMgQob66Y/WZ9uZhk8Ndp3svKh6HulQJ/ewfWdbRDOFjP/IqTi05Fr5PCVrgPU8sfkEBFOtpCpKZ9HdNALgNI1Oy3dyCCQjCSNRzPwJMs6+NkR9xyiNCaOSc49NUlLA13u58RA/tlDD7cPaeQUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710255956; c=relaxed/simple;
	bh=gwvlVXMj8YzA9NTNKw5EKX6GuDQ9HZKERGAoTtteNgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVIbW9htQkgc/UwGNRCVEG3TI9+ibXYNn+3X4q7+jv8kI6deXn8aqijXE8RtQf/fYinvFuXEVT/F9lGPQep6wo32fkBkAzyQvJaJ+FWcS9xKvmQYYTxY/Pi1fxgBL9qbcVS5RPPbrtsswYstF5emP8AVM0QFjyWLtIDaaxYt9C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TvhpX5Va; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33e8b957a89so1938547f8f.0
        for <linux-i2c@vger.kernel.org>; Tue, 12 Mar 2024 08:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710255952; x=1710860752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYqdQQe+WczGEpCgZYhlnOFJftP0P2ToYmG/ZyjPUWg=;
        b=TvhpX5VaElIiH5BcTeIGtaidfUOu6UwUb4DwCVsSrsRpCbDV1eHYfG4zCDewC0GhRH
         eVw13Qawpg6wwthXroC64kvjrzy4gPpjkcRRZZQFhB0UtOi/q5pSgP7JwwRZHyRdnRXR
         wtjiEE20SOjAsroPgDtzIvb0EI5qIbn6EIsMS8IGc4/sRQkHLHrOLUX2ArkGhC+Q20Tt
         /nLmTl89z8N8b7w/cO6Ali6TYOU30IsY6pBL/ZK5NgUT2zuIXRysX2JtFw56ejgwsMu1
         fgedpFRyJyPm+mgAZxAT12rpCXC/nba8Do3//35NxIZqS2ZwNq60nc8G4srevAVJCwxk
         l0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710255952; x=1710860752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYqdQQe+WczGEpCgZYhlnOFJftP0P2ToYmG/ZyjPUWg=;
        b=OIpwtZT/HPRmECJqDMU18dJFLyWW+pMZgyq8EvG6rwttt8eP8aCgN3nAnbDcEUTtAi
         CTcTGovWrthB0eqam7TKc+JPLQYgwijnOVw/ZqPztVZkO/E8OZ+ZhCJq3N+jVIlidIea
         DcDDKS+e5lfhDzqsfMt/JG3qoPIMSPtaPFSuNdtemrBitC4byK511qakye4RcGniSAp9
         BM21vtMF1p1fIeE9P97Xs3q3ckTw96iZx0qzJCd1ejb1Ekp+AcnKLwW2txBx/iozkUNS
         JZH7GGRSMRG4RFvxpMN3Rl3n6WkD8zMiW8Y9VGj13OqSqkzsya+WckeXtaRTPBd/tGaR
         tgvw==
X-Forwarded-Encrypted: i=1; AJvYcCUTx9geMOMAvGufk+XmqFQ2S1/kvjL3j0+vEX83dVENkQtxJB/ogyPQ+7Lwxb/593IKgfDk4XNUXyEYxSeGXKMplvfPPDEI0Dnf
X-Gm-Message-State: AOJu0YxVohnbH4dL7zRgGYkTSeSJupNt46RmIMztZAJcBErdibghVzOn
	8Ycn3zE5xB2ZyUFEEJpdHEEffaDfFgWi5s2DZ+n+zY/y04D64sEVJzdZnALJxq0=
X-Google-Smtp-Source: AGHT+IE+DzqnVMCFpQavnFuorsliCJRjh9NfcuUo2WAPFlSKOVBYqoFxasK1ZqCcterU2zRfqNYkWQ==
X-Received: by 2002:a5d:5505:0:b0:33d:277d:a2c7 with SMTP id b5-20020a5d5505000000b0033d277da2c7mr5763716wrv.16.1710255952383;
        Tue, 12 Mar 2024 08:05:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d45cc000000b0033e786abf84sm9216968wrs.54.2024.03.12.08.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 08:05:51 -0700 (PDT)
Message-ID: <0df9adfe-c869-4502-93e1-fb3516aedc0c@linaro.org>
Date: Tue, 12 Mar 2024 16:05:49 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: i2c: renesas,riic: Document R9A09G057
 support
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <7082ed3b-d6d0-4228-b7a6-7c0e0e46b8e2@linaro.org>
 <CA+V-a8tM29h10DULurMJtBZBnLK_ZF7pH_Y0bhZTvWO0O7-G-Q@mail.gmail.com>
 <2974085a-d9b4-4a66-b60f-c02a06a74647@linaro.org>
 <CAMuHMdVgp_vFnWr5ruzdyc1vNQKoCdM=pLZmgmkDjmUHvQBJJw@mail.gmail.com>
 <b04f9c39-9797-40b8-a25b-8154ad559cd5@linaro.org>
 <CAMuHMdV6yHcTaZKMJxS7sabzhCGKt4i6bjKJiNDaCoHkeZXUvA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdV6yHcTaZKMJxS7sabzhCGKt4i6bjKJiNDaCoHkeZXUvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/03/2024 15:06, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, Mar 12, 2024 at 12:04 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 11/03/2024 10:00, Geert Uytterhoeven wrote:
>>>>>>> -          - renesas,riic-r9a07g054  # RZ/V2L
>>>>>>> -      - const: renesas,riic-rz      # generic RIIC compatible
>>>>>>> +    oneOf:
>>>>>>> +      - items:
>>>>>>> +          - enum:
>>>>>>> +              - renesas,riic-r7s72100   # RZ/A1H
>>>>>>> +              - renesas,riic-r7s9210    # RZ/A2M
>>>>>>> +              - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
>>>>>>> +              - renesas,riic-r9a07g044  # RZ/G2{L,LC}
>>>>>>> +              - renesas,riic-r9a07g054  # RZ/V2L
>>>>>>> +          - const: renesas,riic-rz      # generic RIIC compatible
>>>>>>> +
>>>>>>> +      - items:
>>>>>>> +          - enum:
>>>>>>> +              - renesas,riic-r9a09g057  # RZ/V2H(P)
>>>>>>
>>>>>> No, that does not look right. If you added generic compatible for all
>>>>>> RIIC then how can you add a new RIIC compatible which does not follow
>>>>>> generic one?
>>>>>>
>>>>> The generic compatible above which was added previously was for the
>>>>> RZ/(A) SoCs and not for all the RIICs. The RZ/G2L family was also
>>>>
>>>> No, it said: "generic RIIC compatible". It did not say "RIIC RZ/A". It
>>>> said RIIC RZ
>>>
>>> At the time the original bindings were written, only RZ/A1, RZ/T1,
>>> and RZ/N1 existed, and all RIIC modules present in these SoCs were
>>> identical.  Later, we got RZ/A2, which also included a compatible
>>> RIIC block.
>>>
>>> Somewhere along the timeline, the marketing department became creative,
>>> and we got RZ/G1 (RZ/G1[HMNEC]) and RZ/G2 (RZ/G2[HMNE]), which were
>>> unrelated to earlier RZ series :-(  When marketing started smoking
>>> something different, we got RZ/G2L, which is unrelated to RZ/G2,
>>> but reuses some parts from RZ/A.  Recently, we got RZ/G3S, which is
>>> similar to RZ/G2L...
>>
>> That's fine, but then the comment "generic RIIC compatible" is confusing
>> for anyone not knowing this. Commit msg could also mention why the
>> generic compatible covers actually entirely different hardware. The
>> commit msg so far focused on the differences between these hardwares,
>> thus my questions - why do you create generic compatibles which are not
>> generic?
> 
> I agree the comment should be updated when adding a new variant which
> is not compatible with the old generic variant (i.e. in this patch).
> 
>>>> So don't use generic compatibles as fallbacks. That's the point.
>>>
>>> It's indeed difficult to predict the future. So SoC-specific compatible
>>> values are safer.
>>> At the same time, we want to avoid having to add compatible values for
>>> each and every SoC to each driver, so we try to group SoCs per family.
>>> For R-Car that worked out reasonably well, however, for RZ...
>>
>> I did not propose that. Nothing changes in your driver with my proposal.
>> Use SoC-compatibles only: for fallbacks and for specific(frontbacks?) parts.
>>
>> To give you some sort of guidance for any future submission:
>> 1. Use SoC-like fallback compatible, prepended with SoC-specific compatible.
>> 2. If you insist on generic fallback compatible, its usage should be
>> limited to the cases where you can guarantee for 99.9% that future
>> devices will be compatible with this. I doubt anyone can guarantee that,
>> thus we keep repeating on mailing lists the same: go to point (1).
> 
> Personally, I am not such a big fan of method 1, for several reasons:
> 
>   - Support for new SoCs is not always added in chronological SoC
>     release date order.  So you could end up with:
> 
>         compatible = "vendor,socB-foo", "vendor,socA-foo";
> 
>      with socA being (much) newer than socB.

Which is not a problem. We already have such examples in Qualcomm and
once you get used to seeing it, no one wonders. Of course it's not like
we target such reversed compatibility, but if it happens - does not
matter. compatible expresses compatibility, not timeframe.

> 
>   - Worse, adding support for different modules in different SoCs
>     can be unordered, too, leading to
> 
>         compatible = "vendor,socB-foo", "vendor,socA-foo";
> 
>     but
> 
>         compatible = "vendor,socA-bar", "vendor,socB-bar";

Yeah, that looks not nice, indeed, but it's a rare case and still does
not matter for actual meaning. compatible does not express timeframe.

> 
>     Which is inconsistent.  Fortunately we now have "make dtbs_check"
>     to catch mistakes there.
> 
>   - When a third SoC arrives, which one do you pick?
> 
>         compatible = "vendor,socC-foo", "vendor,socA-foo";
> 
>     or
> 
>         compatible = "vendor,socC-foo", "vendor,socB-foo";

compatibility defines this.

> 
>     Obviously you pick the former (unless you detected the issues
>     below first ;-)
> 
>   - When socA-foo turns out to be slightly different from socB-foo,
>     socC-foo, ... you have to add of_device_id entries for all
>     socX-foo to the driver.  With a family-specific fallback, you'd
>     be limited to one entry for the family-specific callback and
>     a second entry for the misbehaving socA.

Yes and we have exactly that kind of argument from Bjorn A. for
Qualcomm. I repeat: this means your generic family-fallback changes
meaning, which is not really correct. Bindings (and DTS) are used for
outside projects, so if you need to change the driver for generic
fallback, all outside projects might be affected. You basically changed
ABI without telling it to anyone.

Best regards,
Krzysztof


