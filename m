Return-Path: <linux-i2c+bounces-9590-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7750A45AFA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 10:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A0747A7F72
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 09:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE2026FA5F;
	Wed, 26 Feb 2025 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDIsy8iO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138F12459E0;
	Wed, 26 Feb 2025 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563784; cv=none; b=PHu2MMB1gT/X0OTdwQabecvwpJHGzy/hmchjCBAMzV0rVVA38cgCNLAY6SlmKsx1MDv19i85zyO8EuDpl/eO8rp6jHdeTYvnXTXLnf5iYd0xTZzVnHoonTvHMzDCwwKJ23V/HIPlk4ngh/KgIrEGfZkhaa8gsecrI5nsbixjBaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563784; c=relaxed/simple;
	bh=1Quf7/c1ehY7FhlfL5b4CSIvNDLhWomMOOrwdf5C1bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVIRK+15LhqMyjq88CmBa3wEEY8b9xvcC3w8bBX9bNZm04hAGkIPxlnhOOEZe3zgFulczDujym4CDoj1vj1mJTUQkz2pZ8E+3PwxhOTb5QPgbL+kqnAW6KgwoFvry3/5stj4FHPeQkzNlHlm7vJHKldFhGhcQbHNtDBvgF01EjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDIsy8iO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B313C4CED6;
	Wed, 26 Feb 2025 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740563783;
	bh=1Quf7/c1ehY7FhlfL5b4CSIvNDLhWomMOOrwdf5C1bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nDIsy8iONaUkV3zCR4j24aHleHJTprg4Ra22sC6KXhc8VhmIPceVBmDcFBURrhIje
	 cu7kCS/JqDVLynQAq47qWpSXY+sx1LXQCf5NthVCR4cz70GDprSdoMxNf44f1F0s7f
	 lkEttvPtA4icjYlN+6PjUfTSuiI9sIE6I9xCe9ofUGVGLmM7CL4DSqrjZD3A4feDS7
	 AslZqbM90UNfJmjSBXyskmUlDyJs3dBrwl+snCUs4gQK8ctVFdz/qce6nP2MR416XY
	 BGHC2WMTKEKN3BV+K4HMnG4jWxihC9Yt8F6DDtUxVnTebz0sPKInn95MHwTb0TxxJI
	 5vrkFmbgouSTw==
Message-ID: <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
Date: Wed, 26 Feb 2025 10:56:17 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
 <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
 <OS8PR06MB75415E95342F26F576B5CF8AF2C22@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <OS8PR06MB75415E95342F26F576B5CF8AF2C22@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/02/2025 10:28, Ryan Chen wrote:
>> Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
>> AST2600-i2cv2
>>
>> On Mon, Feb 24, 2025 at 01:59:34PM +0800, Ryan Chen wrote:
>>> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
>>> and description for ast2600-i2cv2.
>>>
>>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>>> ---
>>>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 58 +++++++++++++++++++
>>>  1 file changed, 58 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> index 5b9bd2feda3b..356033d18f90 100644
>>> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>>> @@ -44,12 +44,60 @@ properties:
>>>      description: frequency of the bus clock in Hz defaults to 100 kHz when
>> not
>>>        specified
>>>
>>> +  multi-master:
>>> +    type: boolean
>>> +    description:
>>> +      states that there is another master active on this bus
>>
>> Except that this wasn't ever tested...
>>
>> Don't duplicate properties. i2c-controller schema has it already.
> 
> I will remove it to avoid duplication.
>>
>>> +
>>> +  aspeed,enable-dma:
>>> +    type: boolean
>>> +    description: |
>>> +      I2C bus enable dma mode transfer.
>>> +
>>> +      ASPEED ast2600 platform equipped with 16 I2C controllers that
>> share a
>>> +      single DMA engine. DTS files can specify the data transfer mode
>> to/from
>>> +      the device, either DMA or programmed I/O. However, hardware
>>> + limitations
>>
>> so what is byte mode?
> I explain in cover, I will add here also. 

Cover letters do not get merged and we do not read them, except when
looking for dependencies and explanations of process (like RFC). Your
hardware description must be fully contained in commits, not cover letter.


> aspeed,enable-byte:
> Force i2c controller use byte mode transfer. the byte mode transfer
> will send i2c data each byte by byte, inlcude address read/write.

Isn't this standard FIFO mode?

Why anyone would need to enable byte mode for given board?

> 
>>
>>> +      may require a DTS to manually allocate which controller can use
>> DMA mode.
>>> +      The "aspeed,enable-dma" property allows control of this.
>>> +
>>> +      In cases where one the hardware design results in a specific
>>> +      controller handling a larger amount of data, a DTS would likely
>>> +      enable DMA mode for that one controller.
>>> +
>>> +  aspeed,enable-byte:
>>> +    type: boolean
>>> +    description: |
>>> +      I2C bus enable byte mode transfer.
>>
>> No, either this is expressed as lack of dma mode property or if you have three
>> modes, then rather some enum (aspeed,transfer-mode ?)
> 
> Thanks suggestion, I will using an enum property like aspeed,transfer-mode instead.
>>
>>
>>
>>> +
>>> +  aspeed,global-regs:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: The phandle of i2c global register node.
>>
>> For what? Same question as usual: do not repeat property name, but say what
>> is this used for and what exactly it points to.
>>
>> s/i2c/I2C/ but then what is "I2C global register node"? This is how you call your
>> device in datasheet?
>>
> I do descript in cover, should add into the yaml file ?


Again, cover letter does not matter. Your hardware must be explained here.

> 
> aspeed,global-regs: 
> This global register is needed, global register is setting for
> new clock divide control, and new register set control.

So this means you implement clock controller via syscon?

> 
>>
>>> +
>>>  required:
>>>    - reg
>>>    - compatible
>>>    - clocks
>>>    - resets
>>>
>>> +allOf:
>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: aspeed,ast2600-i2cv2
>>
>> NAK, undocumented compatible.
> 
> Sorry, I should add what kind of document about this compatible?

You cannot add new compatibles without documenting them. Documentation
is in the form of DT schema and each compatible must be listed (in some
way) in compatible property description.


Best regards,
Krzysztof

