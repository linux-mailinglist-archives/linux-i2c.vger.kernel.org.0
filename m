Return-Path: <linux-i2c+bounces-3375-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D273A8B9B31
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 14:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D5E11F21437
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 12:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C33824AC;
	Thu,  2 May 2024 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXAHvlTp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0BB7F481;
	Thu,  2 May 2024 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714654727; cv=none; b=gNQaYaVvykTdif5WL3J/zEQJ/HI9g+fijTqrtokhJQT20Zll36bdmas3qbC6CsqN1rsKJHkYWQKHorDvZSBG7QHumn0gQR56mywWiF82jNnCy2ZcKGfYkDPkHP8Vg7iDAkl1+SLmI/JekW7PdlPFURhajI4tI+7iiQNhdttiI9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714654727; c=relaxed/simple;
	bh=d5lIMO407MDnIQ9/e79pnEoYgUg36/5ZYRteDB8/LzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BccmvGRmHnLB6xKvkBZVaKqdHBVvFiTjqSk5M+suchU8yF/GxPTHR/Xk9ifLtFDTRfkQeyshGp8hMMYRcpedVpwXu+qoFt3Olpl5M73+33Xlrc2gYuRhghQZx0bEno2JLHHV7Cfba/avIKQnrz3+mJEgxWY/jSXY9ljvSojv1MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXAHvlTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93977C113CC;
	Thu,  2 May 2024 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714654725;
	bh=d5lIMO407MDnIQ9/e79pnEoYgUg36/5ZYRteDB8/LzI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RXAHvlTpuULfleDV9iketGFXPT6pbR60YDBiVvOqF9bUgBAW+dxymgKhIqXjbaiN3
	 3+Ixu+Vt/U8w1ZX6IMprYSkHBSd4qoSkHvR4Eifa1Q8jV8HfoKoYHN9Wbq26qU7pJA
	 dsAtSag72IDUrYruCrxb2H2cMY29ANlylCokpF+iPtBPovQT7KmNw857QpX0xKZpzB
	 7061dyk2a0L8fAvA0DYgNYwZmwNGeYGJiq9YjaVWVeBT1AniSjRpVToOZrtA0tlJml
	 HbYn1gFXFC/om3b67m/Or8S3lFonLuXcuJdUs/gbOsp/eYAFdYg65563pDXbWyOnN5
	 MFqH+aQ6xxeNw==
Message-ID: <59cdb557-cffd-41f3-b487-2f1890e7cac3@kernel.org>
Date: Thu, 2 May 2024 14:58:39 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/17] dt-bindings: i2c: i2c-fsi: Convert to
 json-schema
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, andi.shyti@kernel.org
References: <20240429210131.373487-1-eajames@linux.ibm.com>
 <20240429210131.373487-11-eajames@linux.ibm.com>
 <bbf12675-e0f5-4150-96d1-097eb7abd81a@kernel.org>
 <1ebaaa48-9812-467e-9189-c1cd3369b6cb@linux.ibm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <1ebaaa48-9812-467e-9189-c1cd3369b6cb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2024 18:16, Eddie James wrote:
> 
> On 4/30/24 02:35, Krzysztof Kozlowski wrote:
>> On 29/04/2024 23:01, Eddie James wrote:
>>> Convert to json-schema for the FSI-attached I2C controller.
>>>
>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>> ---
>>> Changes since v3:
>>>   - Update MAINTAINERS
>>>   - Change commit message to match similar commits
>>>
>>>   .../devicetree/bindings/i2c/i2c-fsi.txt       | 40 -------------
>>>   .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  | 58 +++++++++++++++++++
>>
>> Please split independent patches to separate patchsets, so they can be
>> reviewed and picked up by respective maintainers.
>>
>> I don't see any dependency here. Neither in 1st patch.
> 
> 
> OK, I guess that makes it complicated for Andrew to pull together with 
> the device tree changes in a way that avoids warnings, but I agree there 
> is no direct dependency.

SoC tree should not pull subsystem patches. Plus DTS must be separate
from drivers...


>>> +
>>> +examples:
>>> +  - |
>>> +    i2c@1800 {
>>> +        compatible = "ibm,i2c-fsi";
>>> +        reg = <0x1800 0x400>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        i2c-bus@0 {
>>> +            reg = <0>;
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>> This does not look right. Why do you have multiple i2c-bus children? I
>> do not think i2c-controller.yaml schema allows this.
> 
> 
> It does seem to allow it, as this validates here and in the device tree. 

Only because children are treated as I2C devices.

> It is this way because the I2C controller provides multiple busses. 

It does not look like I2C controller anymore. I think I2C controller
sits on the bus, not on multiple busses. How are SDA/SCL lines connected?

This looks like you are describing something which is not I2C bus
controller as I2C bus controller...

I'll let I2C maintainer comment on that - is this real I2C bus which
consists of multiple buses.


> Should I change it so to add "bus" pattern properties that reference 
> i2c-controller.yaml?

Not sure if I get it right... whatever is the I2C bus controller, should
reference i2c-controller.yaml. Not some other entity.

Best regards,
Krzysztof


