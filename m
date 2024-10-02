Return-Path: <linux-i2c+bounces-7174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F2998D06F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 11:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E06FF1C21350
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 09:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E341E1E4118;
	Wed,  2 Oct 2024 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwVsEj3j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975D21A2561;
	Wed,  2 Oct 2024 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862636; cv=none; b=Lu91a6eun48v+WcFlaefdr7bah2JDrm1A3dLlzVYcO2YyoXcvJie0pgG3u7iP0nKPncRQHIgKqrtkyiOIWOj5DYtGlHaVlTIJ9bttsazaF6blL/OyfN3pRyeomgR2ISA85W8XUMwdDv6FTRRkbjGXI1TagZ4WWGr+jxp7nyVRIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862636; c=relaxed/simple;
	bh=tgOv91OiDd8J5MOXQ01xCtdDOt7IXkWmGZgDsxQWysg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIQj+rRGoozmoEnDOAHp0fSYaZfwD/wzlT/osm8f3BHFQ153cnZ4Ihl6f068nb4fkn9JXvTnEzxVQI2QbMO0R1ayy8587f6QaADtzhDVrZYf4JlKezthtB22azYnYAP3FYjOGTpLTu93Rx247UM3kQ52N+EjkKrM4Za3O4MQatg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwVsEj3j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7902C4CEC5;
	Wed,  2 Oct 2024 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727862636;
	bh=tgOv91OiDd8J5MOXQ01xCtdDOt7IXkWmGZgDsxQWysg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LwVsEj3jeoM0odvHxt4LDHtF4MIwJO4mPTIf55X4mn2jWJJL+WbQO4IEC6ar7UL5k
	 3UOlsCH77ahMtf5In92Sig/TQj9bXTNpylj7ZBx9Ly5WzXP0dl6vtDINu+G3nDMFs8
	 oM4kCBBgpTfHIokysAltnNPEe3dvHgKngV0YlnMl6q4bodBxyyGDPweC4Ikw9dl5Sp
	 GsSw/a2jRce3IqLUdgI4BEH7jh8el8c/ZNtYlpUHHFZOPWYhyqY0WEWyroLvloO6lB
	 UkXLPyfWq1SuVmWbO9ANVWsukGCohtSPXSuJWDLOY89UOO6kfgv/vEg3DxzIwmBGqP
	 hEWgC2KOUyAQg==
Message-ID: <f67bcf92-ded6-42cb-827b-8a3d79f8f7d0@kernel.org>
Date: Wed, 2 Oct 2024 11:50:28 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: snps,designware-i2c: declare bus
 capacitance and clk freq optimized
To: Michael Wu <Michael.Wu@kneron.us>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 morgan chang <morgan.chang@kneron.us>,
 "mvp.kutali@gmail.com" <mvp.kutali@gmail.com>
References: <20241001082937.680372-1-michael.wu@kneron.us>
 <20241001082937.680372-2-michael.wu@kneron.us>
 <cmm7l2kxu2wl55rmcoi3q43ieejnivi5rvjdy6j3wvj6qahse7@ocgi7nyju4je>
 <IA1PR14MB6224944B2294577212DB26508A702@IA1PR14MB6224.namprd14.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <IA1PR14MB6224944B2294577212DB26508A702@IA1PR14MB6224.namprd14.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/10/2024 11:20, Michael Wu wrote:
>> On Tue, Oct 01, 2024 at 04:29:33PM +0800, Michael Wu wrote:
>>> Since there are no registers controlling the hardware parameters
>>> IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION, their values can only be
>>> declared in the device tree.
>>>
>>> snps,bus-capacitance-pf indicates the bus capacitance in picofarads (pF).
>>> It affects the high and low pulse width of SCL line in high speed mode.
>>> The legal values for this property are 100 and 400 only, and default
>>> value is 100. This property corresponds to IC_CAP_LOADING.
>>>
>>> snps,clk-freq-optimized indicates whether the hardware input clock
>>> frequency is reduced by reducing the internal latency. This property
>>> corresponds to IC_CLK_FREQ_OPTIMIZATION.
>>>
>>> The driver can calculate hs_hcnt and hs_lcnt appropriate for the hardware
>>> based on these two properties.
>>>
>>> Signed-off-by: Michael Wu <michael.wu@kneron.us>
>>> ---
>>>  .../bindings/i2c/snps,designware-i2c.yaml     | 24
>> +++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>> diff --git
>> a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
>> b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
>>> index 60035a787e5c..c373f3acd34b 100644
>>> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> ...
>>> +      This property indicates the bus capacitance in picofarads (pF).
>>> +      This value is used to compute the tHIGH and tLOW periods for high
>> speed
>>> +      mode.
>>> +    default: 100
>>
>> I asked for some constraints here. min/maximum. I think you never
>> replied to this.
>>
> 
> In I2C DesignWare Databook v2.03a the mandatory option is provided to
> select whether the bus capacitance is 400pF or 100pF. It presents the
> description like that:
> 
>   Description:
>     For high speed mode, the bus loading (pF) affects the high and low
>     pulse width of SCL.
>   Values: 100, 400
>   Default Value: 100
>   Parameter Name: IC_CAP_LOADING
> 
> There is no further information describing this option except to the
> declaration of legal values ​​above, let alone minimum and maximum limits.

So only two values are valid? Then not min/max but enum.


> As a user I don't think I have the right to define a value range for the
> vendor.
> 
> From the information provided in the data sheet, I prefer to list the
> legal values like the following:
> 
>   enum: [100, 400]
>   default: 100
> 
> ​​instead of declaring its range. What do you think?
> 
> In patches v2 I used if (dev->bus_capacitance_pf == 400) {... } else {...}
> and other statements in the driver code to indicate that the capacitance
> can only be 400pf or not. Maybe this is a metaphor. I'm sorry that I
> wasn't more explicit about the constraints.
> 
>>> +
>>> +  snps,clk-freq-optimized:
>>> +    description: >
>>> +      This property indicates whether the hardware input clock frequency
>> is
>>> +      reduced by reducing the internal latency. This value is used to
>> compute
>>> +      the tHIGH and tLOW periods for high speed mode.
>>> +    type: boolean
>>> +
>>>  unevaluatedProperties: false
>>>
>>>  required:
>>> @@ -146,4 +161,13 @@ examples:
>>>        interrupts = <8>;
>>>        clocks = <&ahb_clk>;
>>>      };
>>> +  - |
>>> +    i2c@c5000000 {
>>> +      compatible = "snps,designware-i2c";
>>
>> Extend EXISTING example. Not add new example.
> 
> Should I insert these two properties into one or all existing examples?

Into any example, where it looks reasonable.

Best regards,
Krzysztof


