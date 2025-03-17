Return-Path: <linux-i2c+bounces-9848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE48A6441E
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 08:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA7C7188EFAA
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 07:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A2F1DDA00;
	Mon, 17 Mar 2025 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qx2MvfYY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D27664C6;
	Mon, 17 Mar 2025 07:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742197563; cv=none; b=EzrVCy+uukDekz1+I6GoHaGWNfdJHypZRTBqoemEvDQwsIWy/OBvRZ4qP8xVP6Pza3d+b5uHLIE+2IUTa9O6BRpwd1NwpnsY2lHl2Z5/2kr246XCZyGU8DYVTPvIdUQaiqdlNc21Yn+O58kKq22mjzBsCampfa0RgLeCBB0UYU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742197563; c=relaxed/simple;
	bh=E/ATrqhvoWqVxOEgCo2VlQn8yYVwmdA17L8rJAlpqMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WsyR4CqALmulML1rZVtAZsoLX3JQhK6iuUJ+lhSmuT6loZ8+5s+c8RXr0tKNi6LMb1ydbANUmStxqWphb3Cvx4BK7zolOTyaXxH9q2xkPmrorvVowEFObgyPWxCyKXcQO8qRnraPYJ5nY29xDbM+OV+PUQZB38BPrc9nEytVz7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qx2MvfYY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6047AC4CEE3;
	Mon, 17 Mar 2025 07:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742197562;
	bh=E/ATrqhvoWqVxOEgCo2VlQn8yYVwmdA17L8rJAlpqMw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qx2MvfYYWHOs0TXdinCtDhi37zof6hhV3lFSxgPcUlocrfn+giHOs9PqW4yvNN3CV
	 MRSLPiMQIX+aLR/gZ2gDc+PkJW08Kcq7OUwovxWC33aFFqW/9UWgGINPZhpCTUn9lQ
	 7TGWz/DFTvMuS61nKPHLCNdRjI4qBXtzCqY6hs9bomZnR9gX6wLOv0ltlGneIZgf39
	 JzMj4Bouav1y4Ih533LZnRitFgWO2jwRo18DbzWdSDvFVyfc921z8aB0zMYbkzXAXb
	 0nientZciDzfEyqxzY5N4h7oXIOINfre26il5FJfbogXpHDfDkOlTpa3g20lOo/48W
	 pyNoQfJTFIMcw==
Message-ID: <069b9fe4-c54a-4efd-923e-1558c59fe3f4@kernel.org>
Date: Mon, 17 Mar 2025 08:45:52 +0100
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
 <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
 <OS8PR06MB7541B0DBC64B3EF6838DFE74F2CD2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <d1b184c5-84c1-4d76-a1d0-a9f37f1e363c@kernel.org>
 <OS8PR06MB7541D1D2E16C5E77037F3BB0F2CB2@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <OS8PR06MB7541D1D2E16C5E77037F3BB0F2CB2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2025 10:35, Ryan Chen wrote:
>> Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
>> AST2600-i2cv2
>>
>> On 27/02/2025 09:19, Ryan Chen wrote:
>>>>
>>>>
>>>>> aspeed,enable-byte:
>>>>> Force i2c controller use byte mode transfer. the byte mode transfer
>>>>> will send i2c data each byte by byte, inlcude address read/write.
>>>>
>>>> Isn't this standard FIFO mode?
>>> Yes, it is.
>>>>
>>>> Why anyone would need to enable byte mode for given board?
>>> By default, it is buffer-mode, for performance, I don't want user enable
>> byte-mode, it will increase CPU utilize.
>>> But someone want to be force enable byte-mode, so I add properties.
>>> https://patchwork.ozlabs.org/project/linux-aspeed/patch/20241007035235
>>> .2254138-3-ryan_chen@aspeedtech.com/
>>
>>
>> I don't see the reason why this would be a board property.
>>
>> I understood need for DMA because it is shared and only some of the
>> controllers can use it. But why choice between buffer and FIFO depending on
>> hardware?
> 
> By default, the I2C controller runs in buffer mode. Each i2c bus have 16bytes buffer to transmit data.
> Enabling byte mode will increases CPU utilization, so it is not recommended. 
> However, some user might require forcing byte mode, so I added this property to allow that.


You are not answering the question. I asked why the choice depends on
hardware and you answer "user might required".

Do you understand that this is about hardware, not user choices?


>>
>>
>>>>
>>>>>
>>>>>>
>>>>>>> +      may require a DTS to manually allocate which controller can
>>>>>>> + use
>>>>>> DMA mode.
>>>>>>> +      The "aspeed,enable-dma" property allows control of this.
>>>>>>> +
>>>>>>> +      In cases where one the hardware design results in a specific
>>>>>>> +      controller handling a larger amount of data, a DTS would likely
>>>>>>> +      enable DMA mode for that one controller.
>>>>>>> +
>>>>>>> +  aspeed,enable-byte:
>>>>>>> +    type: boolean
>>>>>>> +    description: |
>>>>>>> +      I2C bus enable byte mode transfer.
>>>>>>
>>>>>> No, either this is expressed as lack of dma mode property or if you
>>>>>> have three modes, then rather some enum (aspeed,transfer-mode ?)
>>>>>
>>>>> Thanks suggestion, I will using an enum property like
>>>>> aspeed,transfer-mode
>>>> instead.
>>>>>>
>>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +  aspeed,global-regs:
>>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>>>> +    description: The phandle of i2c global register node.
>>>>>>
>>>>>> For what? Same question as usual: do not repeat property name, but
>>>>>> say what is this used for and what exactly it points to.
>>>>>>
>>>>>> s/i2c/I2C/ but then what is "I2C global register node"? This is how
>>>>>> you call your device in datasheet?
>>>>>>
>>>>> I do descript in cover, should add into the yaml file ?
>>>>
>>>>
>>>> Again, cover letter does not matter. Your hardware must be explained here.
>>> Will add into commit.
>>>>
>>>>>
>>>>> aspeed,global-regs:
>>>>> This global register is needed, global register is setting for new
>>>>> clock divide control, and new register set control.
>>>>
>>>> So this means you implement clock controller via syscon?
>>> No, it is just mode switch. It also explain in cover. I will add it in commit.
>>> The legacy register layout is mix controller/target register control together.
>> The following is add more detail description about new register layout. And
>> new feature set add for register.
>>>>
>>>>>
>>>>>>
>>>>>>> +
>>>>>>>  required:
>>>>>>>    - reg
>>>>>>>    - compatible
>>>>>>>    - clocks
>>>>>>>    - resets
>>>>>>>
>>>>>>> +allOf:
>>>>>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>>>>>> +  - if:
>>>>>>> +      properties:
>>>>>>> +        compatible:
>>>>>>> +          contains:
>>>>>>> +            const: aspeed,ast2600-i2cv2
>>>>>>
>>>>>> NAK, undocumented compatible.
>>>>>
>>>>> Sorry, I should add what kind of document about this compatible?
>>>>
>>>> You cannot add new compatibles without documenting them.
>>>> Documentation is in the form of DT schema and each compatible must be
>>>> listed (in some
>>>> way) in compatible property description.
>>>
>>> Sorry, do you mean, I add following in yaml or commit message?
>>
>> You need to list this in compatibles first.
> 
> I will add it in compatible in next submit.
> 
> 	enum:
> 		-aspeed,ast2600-i2cv2
>>
>>>
>>> This series add AST2600 i2cv2 new register set driver. The i2cv2 driver is new
>> register set that have new clock divider option for more flexiable generation.
>> And also have separate i2c controller and target register set for control, patch
>> #2 is i2c controller driver only, patch #3 is add i2c target mode driver.
>>
>> All this describes driver, not hardware.
> 
> Sorry, the cover letter description the register. I will add int in commit message.
> 
> -Add new clock divider option for more flexible and accurate clock rate
> generation -Add tCKHighMin timing to guarantee SCL high pulse width.
> -Add support dual pool buffer mode, split 32 bytes pool buffer of each
> device into 2 x 16 bytes for Tx and Rx individually.
> -Increase DMA buffer size to 4096 bytes and support byte alignment.
> -Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
> -Re-define registers for separating controller and target mode control.
> -Support 4 individual DMA buffers for controller Tx and Rx,
> target Tx and Rx.
> 
> And following is new register set for package transfer sequence.
> -New Master operation mode:
>  S -> Aw -> P
>  S -> Aw -> TxD -> P
>  S -> Ar -> RxD -> P
>  S -> Aw -> RxD -> Sr -> Ar -> TxD -> P
> -Bus SDA lock auto-release capability for new controller DMA command mode.
> -Bus auto timeout for new controller/target DMA mode.
> 
> The following is two versus register layout.
> Old:
> {I2CD00}: Function Control Register
> {I2CD04}: Clock and AC Timing Control Register
> {I2CD08}: Clock and AC Timing Control Register
> {I2CD0C}: Interrupt Control Register
> {I2CD10}: Interrupt Status Register
> {I2CD14}: Command/Status Register
> {I2CD18}: Slave Device Address Register
> {I2CD1C}: Pool Buffer Control Register
> {I2CD20}: Transmit/Receive Byte Buffer Register
> {I2CD24}: DMA Mode Buffer Address Register
> {I2CD28}: DMA Transfer Length Register
> {I2CD2C}: Original DMA Mode Buffer Address Setting
> {I2CD30}: Original DMA Transfer Length Setting and Final Status
> 
> New Register mode
> {I2CC00}: Master/Slave Function Control Register
> {I2CC04}: Master/Slave Clock and AC Timing Control Register
> {I2CC08}: Master/Slave Transmit/Receive Byte Buffer Register
> {I2CC0C}: Master/Slave Pool Buffer Control Register
> {I2CM10}: Master Interrupt Control Register
> {I2CM14}: Master Interrupt Status Register
> {I2CM18}: Master Command/Status Register
> {I2CM1C}: Master DMA Buffer Length Register
> {I2CS20}: Slave~ Interrupt Control Register
> {I2CS24}: Slave~ Interrupt Status Register
> {I2CS28}: Slave~ Command/Status Register
> {I2CS2C}: Slave~ DMA Buffer Length Register
> {I2CM30}: Master DMA Mode Tx Buffer Base Address
> {I2CM34}: Master DMA Mode Rx Buffer Base Address
> {I2CS38}: Slave~ DMA Mode Tx Buffer Base Address
> {I2CS3C}: Slave~ DMA Mode Rx Buffer Base Address
> {I2CS40}: Slave Device Address Register
> {I2CM48}: Master DMA Length Status Register
> {I2CS4C}: Slave  DMA Length Status Register
> {I2CC50}: Current DMA Operating Address Status
> {I2CC54}: Current DMA Operating Length  Status

I don't understand anything from that and how is this relevant to our
discussion.

> 
>>
>>>
>>> The legacy register layout is mix controller/target register control together.
>> The following is add more detail description about new register layout. And
>> new feature set add for register.
>>>
>>> -Add new clock divider option for more flexible and accurate clock rate
>> generation -Add tCKHighMin timing to guarantee SCL high pulse width.
>>> -Add support dual pool buffer mode, split 32 bytes pool buffer of each device
>> into 2 x 16 bytes for Tx and Rx individually.
>>> -Increase DMA buffer size to 4096 bytes and support byte alignment.
>>> -Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
>>> -Re-define registers for separating controller and target mode control.
>>> -Support 4 individual DMA buffers for controller Tx and Rx, target Tx and Rx.
>>
>> Does it mean hardware changed on AST2600? 
> No Hw change, it is different mode setting will have another mode register setting.
> Mode setting is in global register, I will add in next commit message

Neither this.

So it seems you describe already existing and documented I2C, but for
some reason you want second compatible. The problem is that you do not
provide reason from the point of view of bindings.

To summarize: what your users want - don't care. Start properly
describing hardware and your SoC.


> 
> I2CG00: Device Master Mode Interrupt Status Register (I2CG0C[3]=1)
> I2CG00: Device Master/Slave Mode Interrupt Status Register (I2CG0C[3]=0)
> I2CG04: Device Slave Mode Interrupt Status Register
> I2CG0C: Global Control Register
> I2CG10: New Clock Divider Control Register (I2CG0C[1] = 1)
> 
>> Or these are different devices
>> than aspeed,ast2600-i2c-bus? If this is not a different device, how one SoC can
>> have two different flavors of same device in the same instance?
> 
> When global setting for new, will new register mapping, no setting will keep old register mapping.


I cannot parse this.


Best regards,
Krzysztof

