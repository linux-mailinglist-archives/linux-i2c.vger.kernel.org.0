Return-Path: <linux-i2c+bounces-12094-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0976FB16C79
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 09:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D210D3B7BAD
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 07:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5ABF299AAB;
	Thu, 31 Jul 2025 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEBd2D/Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFBB298CDC;
	Thu, 31 Jul 2025 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753946110; cv=none; b=FQFw/85bjwYGPRe9HXFFfbhXxOQEiVkgk2HG2G/63UVm9lcwmYUAbNatFg2a2m2SENXV6x9hVWpyBN9Q85wCeobkALyNzT3ZMJgh4hksrnnxjK6FWBmLUTYqg4f51xDhrA0e0s62OVSqyCj3Y+hIzIvYDyKyqW4oO9aw1QiFjA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753946110; c=relaxed/simple;
	bh=kaGRuID6Gw4ABkKJNm3RUFQHP0yLaJdyJQGX0CNBM2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMNDUrO1Fp6q2XcDon/bWLfdb2teC90V5PTl5/rjPHnVQxgL2paCuvEVNpPcp+VJ8qAjU6mPqOIYBugby4LU2q3vvLIY4ZZ+qGWhBbYmtT/Iix1Gbp3j1oXBHaSKmS3t7N8YDcVxZYO8ruRh4bM/NnbiIJ8/llM7GXYPeEpF37k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEBd2D/Y; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61557997574so810074a12.3;
        Thu, 31 Jul 2025 00:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753946107; x=1754550907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReDl4lct6GxYUcSfC4SvSmbtgNlET1js6mKE1s81Uyg=;
        b=GEBd2D/Yzfa/mVWe4JapyRs+ZDpWMm4Fipi7ZWr2CXL4kPjSWxCSnrQUaqTZKcCYvK
         qj8j29eqZpY5H2aNNnVdw6Q9MpdZTnGqcd0CK/O8TFnA15WyCnN58sNH4xmhgLSBY3Ml
         jBQnKa9V6aJQRMKLXUAH+88fV3mpe3ojvEeXMBVYsQSBaL7t7o8kcNNiVwDUw4ezupTs
         n7cOjCrCFvj2c6jcxS+Wv6e9mK6jrdmyEGb6DcfrxjlEcAGAgwja8fy3ozJtXljJym/s
         sDW97AHYki+jrGSzIEUkli1H54JfFnhWy+QdujbWbXeK8kEX/j/1AIu4WiGs6u0J/Nh7
         ADbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753946107; x=1754550907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReDl4lct6GxYUcSfC4SvSmbtgNlET1js6mKE1s81Uyg=;
        b=G5hHkDgBU3QkLtOfTO9ZAMDv6b28O8M3FfwaV8N3E8iu+UA+2ePrxsmIJCAnUHZiAW
         +STrOuC32oV83JSEeaQZNkvkzzXVSorXfi7kY0NXjWtmMCHxQyjc+uF8xVCk5cx6i2wK
         bOh8phbCMHx1tJ3satpV65R7hC5QykEQps+1zWF4KZlXBSPMSz4/760HaP+Bmz25RxX5
         QW1tH3cGzt94P28RL8ANZXI0An1H8tUyhroiqEgzxGpi12vGiLeDiFCeDjrfZVTnsx+R
         42TnRrtfYQYmlTHAk/RifrGRw2IOJfs1/rnlneJGB99GVyLNaOoJdiLiJTqrjR6RhMNC
         ZOTw==
X-Forwarded-Encrypted: i=1; AJvYcCVAxJrh671v73fho/vOsygTLWqZ0DVhhqsHE0ZYynYxGH4bob7JZV7bgqQrBz5XcmdStvQLXewhF2NR/V9D@vger.kernel.org, AJvYcCXZLlT2lrnXELk4rXZez6YZJAPBZYuH3RCnrG2P5sMPElLErv5R8bhzkEaprvTdriCjWjsw27HIIWyi@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ/PrIRS9Z41DIlOQVulkUnRiHk2UfMpv+hcfJ7zt64AmyOWYg
	mXX6eM9XWMW0oIezBjNjgO1lKUh+K1D5bCcfTGogWYoibsPrf3SZ4r/s
X-Gm-Gg: ASbGncsG8/k99HFKbvWx089G64skq6EQJx3jOztC6GA7jyBPa7Vltho91WC1fieziLd
	S63wyaFcyISUDXROM/oZPfzcQEa9294TbLQxgT0+sFiKam7px5/croXczc91nXOT889F+3gCGpR
	xlUe9BVaizaaVw1EqwvBlXQdDcnTg0Scfh0YRReeO9m11TTIhsxJdm7EvbKocbCrshyezjbkQwY
	NKXKXem29BrFBVmBkc8o5KsUeQof4VCmAdj4YAmvDiuwh7u6lPbqyzAUAC2t7i26C0qLqwMMyx9
	ZrIWNbbxWLeAzcti1IF5QGwh2XYIDqCrPjmmaCfPK8rzqas21Y1ps3l8CCrrEqw/HnsL1aTdOJM
	dkn4PuNi6xjiLlMrFcip7IJmNX+xjWu9yoTjNi+S7S/+fNhtsx8VHBB2Qwn4uLKtb3QDi4Zx5W/
	J5VA4txIvKsu8vzyGYizTJcw==
X-Google-Smtp-Source: AGHT+IFmGtBuksQ6P5PdNIbQw/A4UQJWAuTSWXSJGH0oAGHp8kg1Nj2KCUnW8SO9/TmJdv8yL061wQ==
X-Received: by 2002:a17:907:72cb:b0:ade:9b52:4cc0 with SMTP id a640c23a62f3a-af8fd7d695bmr754828166b.26.1753946106665;
        Thu, 31 Jul 2025 00:15:06 -0700 (PDT)
Received: from [192.168.44.44] (138-8-142-46.pool.kielnet.net. [46.142.8.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a2437desm62918966b.127.2025.07.31.00.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 00:15:06 -0700 (PDT)
Message-ID: <2391e661-5946-4898-8302-f032c542aee9@gmail.com>
Date: Thu, 31 Jul 2025 09:14:59 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
Cc: linux-i2c@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20250729075145.2972-1-jelonek.jonas@gmail.com>
 <20250729075145.2972-3-jelonek.jonas@gmail.com>
 <20250730222932.GA1810634-robh@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20250730222932.GA1810634-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rob,

On 31.07.2025 00:29, Rob Herring wrote:
> On Tue, Jul 29, 2025 at 07:51:44AM +0000, Jonas Jelonek wrote:
>>  
>>    reg:
>>      items:
>> @@ -35,8 +45,15 @@ properties:
>>    "#size-cells":
>>      const: 0
>>  
>> +  realtek,mst-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Realtek-internal ID of the I2C controller/master.
>> +    minimum: 1
>> +    maximum: 2
> We normally try to avoid instance IDs. Why not just a property defining 
> the SCL # to use.
>

I argued with the following reasons to use the master id:
- Realtek mentions 'Master 1' and 'Master 2' a lot in their documentation while
   the SCL number is barely mentioned and probably also confusing in their
   docs [1]
- other specifics could be inferred from that master id, not only the SCL
   number. While this is not relevant yet, future SoC series might need this
   if support for them can be added in this driver

However, using `realtek,scl-num` would be perfectly fine for now if you'd
really like to avoid this master ID. Either way, this property has to match the
other settings anyway (i. e. unit address) to make this actually work.
The master ID only would have made this more flexible if not only the SCL
number is different, but this actually isn't relevant for RTL9300 and RTL9310.

>> +
>>  patternProperties:
>> -  '^i2c@[0-7]$':
>> +  '^i2c@([0-9]|1[0-1])$':
> Unit-addresses are typically hex.

Will fix that.

>>  required:
>>    - compatible
>>    - reg
>> @@ -68,3 +104,15 @@ examples:
>>          #size-cells = <0>;
>>        };
>>      };
>> +  - |
>> +    i2c@100c {
>> +      compatible = "realtek,rtl9310-i2c";
>> +      reg = <0x100c 0x18>;
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +      realtek,mst-id = <1>;
>> +
>> +      i2c@0 {
>> +        reg = <0>;
>> +      };
>> +    };
> Is this really different enough to justify another example?

Probably not, would be only to showcase the subtle differences between
RTL9300 and RTL9310.
I just added it, temporarily with another unit address, to check with
dt_binding_check if this is working.


Best,
Jonas Jelonek

