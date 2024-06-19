Return-Path: <linux-i2c+bounces-4113-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6439990EF3F
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 15:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 792FE1C22C73
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 13:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BEF14EC5C;
	Wed, 19 Jun 2024 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzfYs/eZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D28278C73;
	Wed, 19 Jun 2024 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718804552; cv=none; b=CSN8osZ8zqRLU/zU55/nhs349vBatdeGoeTispndunT2qp1ZcQmAHiqiR+g784j4KBxCKTkbc8zSklW7GT/KVG0irjrGPScmS23im1E7JbYcH4TiiJea5v8TIRbpLEEc85U2AeQ/85JiYhMFJPnhQwXxXOc7dkJ3o9rcd+pULAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718804552; c=relaxed/simple;
	bh=9r5Ceks4s8d+tHDH0o9Hm+jP9uqytN7Zxvu/USoXgjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bv0HEr54f/Puj7/kkCoeR6gM72c4ZBxj3zZr41gVa4BQ2Ho+D2rY5BA3xHHllmvFpJ4p+SX4Sw1+AOvG1uZl7LL+gWFWT7hnIEBM+x44DiugquB90e6BAjX7+1Avf1unnjgdAgylXGemm1KFF+Rw6IvY9GuGD8emzC1PhjRi5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzfYs/eZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718804551; x=1750340551;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9r5Ceks4s8d+tHDH0o9Hm+jP9uqytN7Zxvu/USoXgjg=;
  b=UzfYs/eZO+8QLLtrSZ+XM9DCbFSzYgJwWaXbfD+vDRetp98mwIRLKRIx
   yh0UOJ8kG4Gcd/mX/K1eqCUVfvCZ+4FCwRtjNUWg+YWO67ugaj9Ny+WCc
   F9ouAJU4lm+djmpiIHSIALwrjvzBVB71NuhSglk56ijAdTCdhqv11d8vh
   D7hNS+sOoHvOrHxwwBmC5P7pDBMPQqd1Z44gka/SUuFg20Uf4kHvzja/M
   ZFVwb57+Cm5YWEkFd/EScpkRhFPGXBogo7blBer0eBpjNp9eW+tjLI0fh
   tXtrammZiZGTVfbJsHsDHg8jd7MZprrElGtwkZeRZ9K5TjQ5e3emykNVb
   g==;
X-CSE-ConnectionGUID: XoBXw+wcTXKlu4dPlVWQ1w==
X-CSE-MsgGUID: qz/72pKYSMG0qyxyMh3XXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15577283"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15577283"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 06:42:23 -0700
X-CSE-ConnectionGUID: zwlqVW2gR3mlObMXteFd9A==
X-CSE-MsgGUID: s15hi+FUQGeDZBs4Rf3zLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="42603106"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP; 19 Jun 2024 06:42:18 -0700
Message-ID: <51c1faeb-c54d-4ee4-b913-50aed7a0909c@linux.intel.com>
Date: Wed, 19 Jun 2024 16:42:16 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: dw: Document compatible
 thead,th1520-i2c
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Drew Fustini <dfustini@tenstorrent.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
 <20240618-i2c-th1520-v3-1-3042590a16b1@bootlin.com>
 <f427b28c-420b-4174-a670-70f626f8061e@linux.intel.com>
 <a55524d8-40f0-44ba-a42f-c63a487ccb45@kernel.org>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <a55524d8-40f0-44ba-a42f-c63a487ccb45@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/24 10:39 AM, Krzysztof Kozlowski wrote:
> On 19/06/2024 08:40, Jarkko Nikula wrote:
>> Hi
>>
>> On 6/18/24 10:42 AM, Thomas Bonnefille wrote:
>>> Add documentation for compatible string thead,th1520-i2c which can be
>>> used specifically for the TH1520 SoC.
>>>
>>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>    Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
>>> index d9293c57f573..60035a787e5c 100644
>>> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
>>> @@ -33,6 +33,10 @@ properties:
>>>              - const: snps,designware-i2c
>>>          - description: Baikal-T1 SoC System I2C controller
>>>            const: baikal,bt1-sys-i2c
>>> +      - description: T-HEAD TH1520 SoCs I2C controller
>>> +        items:
>>> +          - const: thead,th1520-i2c
>>> +          - const: snps,designware-i2c
>>>    
>>
>> Your comment below makes me thinking is this change needed? So is it
>> enough to specify "snps,designware-i2c" for the compatible string in
>> patch 2/3?
> 
> SoC specific compatible is always required (see writing bindings doc).
> 
Fair enough.

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>


