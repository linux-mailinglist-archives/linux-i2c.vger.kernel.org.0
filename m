Return-Path: <linux-i2c+bounces-11979-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B093B0B814
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jul 2025 21:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5C0C7A850A
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jul 2025 19:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E50221720;
	Sun, 20 Jul 2025 19:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RA6Sy04t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D22204866;
	Sun, 20 Jul 2025 19:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753041090; cv=none; b=kqfCVM/vR1rS/ijfCPCjmNaflwcE2E20xkX2t3OwvJ/jlSJUQXlFxgxxv8JlpgBdsFeAC47+4XZVSCDYROfsLPjqLHBZnw3nToftjju7EdeP2e9EdjrBY02daEuiE1kF/GecNFiFxlasOzAOkFmgBkNF5tuU4oVMT1iZ4KhgasI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753041090; c=relaxed/simple;
	bh=qOsIxA97IITUd+yl9dvmO+aUvms8OxRzYVHcfojfXdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XecEa4O9YRWmZJY6yLPydzYxOSoxwqtDPmBczfx0gbFrTSdcHlNzV/ivIQwzIP8Pktq163JG8gMT9hnSmB5IpjNPj6KE/YAcyuTf3eIjKLT1Akc1pXhX4vBIiZvgDQLdxDQizQUREkWFIFHIGJi7nO9Ox5yGIJWNWGaK80MyN+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RA6Sy04t; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so38153925e9.0;
        Sun, 20 Jul 2025 12:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753041087; x=1753645887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ORKaYSW+0DS70Ut8rRvu8xLUy32VpcjZ83O5mq3akq0=;
        b=RA6Sy04t2V1nIA+WWuMVwXfGQa04zXZuWCxEdFn9dVc85BGennGzQfVv312IYb/HBw
         6ytCPUak2wFw1dfNxlxAaoy2pHPz//o/vp53aXi5LWp8UW7PkauHaZuVcfSMmn4NA3By
         /1czBjq/wSx1kMZl/4D9cWX7o0ADf+mlEwkGJlSF8G0n3BWtwemLx0w4RYojBZ2pAsgj
         VhwUs74IX+N5BLN3/25CSBlyHf7pC0vBMbLYw1TPuMaVxX+dsEwPfDpyZfCdzXJR/BWM
         t2XTRnQHdTptzS93XHHln2+7mMA+9+NZWGFIJcCEu+qjBTSYLMLObcI9fqHQ1FSywyFO
         edLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041087; x=1753645887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORKaYSW+0DS70Ut8rRvu8xLUy32VpcjZ83O5mq3akq0=;
        b=sh7sn4GyPdCS4CJg/8rrTXvIj6uTWc0nLCIokSOmby64e0KiZPmNV50UY5/jZ6UMcC
         s/4WsS0pIJBEOk6s9+zEuxM7R9Z+W6uyOLp1oyDTJVx+vkmYqi+6JEQLa78X1uQkzm0Y
         pq8FCtGKgzyAK0s/NkglYgSW1+BCWqzdRtIqMAEO/BrB7b/ip9j4lAYb0jtkff02fmhZ
         3rzgXsUQ5UhogRF9hXcEBA84hsxMx9plKa4UbTrbeIAjNsJcnri/zngb7t2OO4zFlPtd
         0K31h2OSEf9CEDA7Tzv9+bUBQ5kxdf9ufdsOj4CNcaqc4RqmpLzG86w3z0JF9/Y8h/2d
         BOWg==
X-Forwarded-Encrypted: i=1; AJvYcCUyH2X5zfZuYTPMcKzgtlsz/gfxAI4n1gtHLLhwJKj/P0yYFJCDvqfA5bTBl6/mSAQKax+0UvGHhxav@vger.kernel.org, AJvYcCWkcSmCgJ1WwbjOb8fEBtr68pLzLFG2yX35OWKl4ZyTSkCD7F49WzRmHxFsnZrhzXHvaY9J/HezQKQ6G3T/@vger.kernel.org
X-Gm-Message-State: AOJu0YxRYnYtDhAYiH/pSEfty0WAfIwuu9q2/mmO3tUbNbsKfniQthy2
	FgYtCq691DTozDjApfuNTO+coKVBYn/73av5PMnGdhODGHUDDN/eSkRsdcWgdQ==
X-Gm-Gg: ASbGncsfQVAKwqYhEG5hZJDcgq61bQgPtjZzi9vg3CWHHqZg0hFNcYqzwaVn+LHKUlI
	dSbceotwd/ZoZoi8PQpn8M3FbYIeNNHpnA1TiIxdD5FRj01Exms+L9JrPcysPgxlH9WWigVJ/1t
	iHq7/5FsPek0YrWnYfxfw3C+2Y9XUvoPtj8yFLS1IRIgf2o+WzjXh3INicQpY+ByvS/8UnXmRfw
	iG/Oy1Uz5kR6jztVM0LFHb6pb1AtmLKVBTs/MKbaeH2PKlhauYH5DUmJKyXG5n5DSYQ4wCNS0/5
	UAB849Nwoq4VpOGowj8kICjKbSTkwugOkRtfGWNdYcTgwve2DJt7443Xx/yiWl3c5tYBTuQl5Yv
	CMSt04o3XOiKg0o1lrQaNXP7NiNKcrs56pvAFRAfDuj8m+jY9Pl/BcRha5NAnZK3y5Uc77fcHO3
	MqEK/iAQGIoe7LRk+8
X-Google-Smtp-Source: AGHT+IHbROicXgIbFXt4H2trn3TgwRdZgCpt1/XSB+sTWjHrdlpcqHOi+10wzwuYUbnTNKUUz76ycQ==
X-Received: by 2002:a05:6000:4211:b0:3b5:e714:9770 with SMTP id ffacd0b85a97d-3b60e4c8eb5mr13096381f8f.14.1753041086716;
        Sun, 20 Jul 2025 12:51:26 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f12d:7332:185c:3e5:d93f:669? ([2001:9e8:f12d:7332:185c:3e5:d93f:669])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f2d4fsm143228585e9.4.2025.07.20.12.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 12:51:26 -0700 (PDT)
Message-ID: <0a2a0fa6-ee82-40be-b62d-847a4ef04626@gmail.com>
Date: Sun, 20 Jul 2025 21:51:25 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-i2c@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20250712194255.7022-1-jelonek.jonas@gmail.com>
 <20250712194255.7022-3-jelonek.jonas@gmail.com>
 <20250714-magnificent-powerful-nuthatch-afcc01@krzk-bin>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20250714-magnificent-powerful-nuthatch-afcc01@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,


On 14.07.2025 08:00, Krzysztof Kozlowski wrote:
> On Sat, Jul 12, 2025 at 07:42:54PM +0000, Jonas Jelonek wrote:
>>  properties:
>>    compatible:
>> @@ -23,7 +25,14 @@ properties:
>>                - realtek,rtl9302c-i2c
>>                - realtek,rtl9303-i2c
>>            - const: realtek,rtl9301-i2c
>> +      - items:
>> +          - enum:
>> +              - realtek,rtl9311-i2c
>> +              - realtek,rtl9312-i2c
>> +              - realtek,rtl9313-i2c
>> +          - const: realtek,rtl9310-i2c
>>        - const: realtek,rtl9301-i2c
>> +      - const: realtek,rtl9310-i2c
> So these two are just enum.

Could you be more precise on that please? Sadly, I don't get what you're trying
to tell me.
>> +    minimum: 1
>> +    maximum: 2
>> +
>>  patternProperties:
>> -  '^i2c@[0-7]$':
>> +  '^i2c@([0-9]|1[0-1])$':
>>      $ref: /schemas/i2c/i2c-controller.yaml
>>      unevaluatedProperties: false
>>  
> As mentioned last time, missing constraints.
>
> How did you solve this:
>
> "you should clearly narrow this per variant"?
>
> See example schema. It has EXACTLY this case.
>
> https://elixir.bootlin.com/linux/v5.19/source/Documentation/devicetree/bindings/example-schema.yaml#L212
>
> You also need to narrow the number of children.

I missed that from your previous review by mistake, sorry for that.

I managed to narrow it per variant whether 'realtek,mst-id' is required or not.
But I'm not really able to do the same for the different regex patterns or the
number of children. Although I'm trying to follow various examples,
dt_binding_check just fails not taking the regex patterns into account.

Since you have a lot of expertise on that and I obviously fail to find
documentation that helps me to do that properly, could you give me some hints
on how that has to look? I'd really appreciate this.

>
> Best regards,
> Krzysztof
>


