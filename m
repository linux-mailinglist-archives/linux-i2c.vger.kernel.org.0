Return-Path: <linux-i2c+bounces-13960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A2C34238
	for <lists+linux-i2c@lfdr.de>; Wed, 05 Nov 2025 08:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9683818C2B31
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Nov 2025 07:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63E22D1303;
	Wed,  5 Nov 2025 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4X3IsWa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2472C324F;
	Wed,  5 Nov 2025 07:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762326352; cv=none; b=u85PqWT4begKDKN4YfOh+mxWFQ/Ig62R/KZD8HYfZyp5xoCh2SLBoITL+0QIxCYkUMc4vmmFpP7OntWwj6wlH06HogfVdsmoux3TN7tn3L/Y+pQiafzoyvMIkOPVXIbeqqRhWR27sAqnWMfdIRBopNypDDq90oWQPtebtz5uk4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762326352; c=relaxed/simple;
	bh=kPX9V0mH+TczUnYq0BMN/eI2YdpBbqz0jEK+VU5Ajks=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e3VOanmkUy8mXO932l34y7ZN0hoyiJWMSFKidiLRew1xyv5wj6sejBMQoOfDyMwwFsIuoIndYRlMdTezoLDsyLKvv1leacm8Xov9VLutSC4Y7Y+UY3q+Ycbciskp32ZTZrDgLb1EmxTOJoXpsEm6bVLp3tYffCzLP0EgssyPg6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4X3IsWa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA207C4CEF8;
	Wed,  5 Nov 2025 07:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762326351;
	bh=kPX9V0mH+TczUnYq0BMN/eI2YdpBbqz0jEK+VU5Ajks=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=m4X3IsWauFdhf3VenL4oXaFt8vQd1O7cZENoOOCac6EWsv1HNKEs6szPvqHFzb/m9
	 g817Sjs80Kv5Mibkq3a72m3ZbINMvEw/DKGQt1fOJPEewZjvSknXybSG9lnpM66gkC
	 04QGSrOwavlwNAJN1kgURXHLc5y3YoMHyPzKWveyUKUX0sLdVPNMBaAuWrEgfRmKJ5
	 9meOxvx+fi3L5P1QApLI9bWLj5GJwuI88+TZeHvqJvMd6sbJrTDCQ3fIZ/FuD7Igo/
	 aT+E4cYMbDUrMPcjnv5xcbgE7vkGmPAF3nbEIWuT8aoeZ/78rIjRHr3zyvOqCFtKND
	 FeME6A1ACuCqA==
Message-ID: <7e3c1b0b-2880-4abc-b80f-30ffc16d6158@kernel.org>
Date: Wed, 5 Nov 2025 08:05:45 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
To: Ryan Chen <ryan_chen@aspeedtech.com>, BMC-SW <BMC-SW@aspeedtech.com>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-3-ryan_chen@aspeedtech.com>
 <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
 <TY2PPF5CB9A1BE6DCA78BEDC3178B74FD75F2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <36e2b87f-5567-4bd6-bd1b-789623441461@kernel.org>
 <TY2PPF5CB9A1BE62BD449193B23A22DF941F2FBA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <TY2PPF5CB9A1BE62BD449193B23A22DF941F2FBA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/10/2025 02:48, Ryan Chen wrote:
>> Subject: Re: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add global-regs
>> and transfer-mode properties
>>
>> On 29/10/2025 10:25, Ryan Chen wrote:
>>>> Subject: Re: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
>>>> global-regs and transfer-mode properties
>>>>
>>>> On 27/10/2025 07:12, Ryan Chen wrote:
>>>>> The AST2600 I2C controller supports three transfer modes: byte,
>>>>> buffer, and DMA. To allow board designers and firmware to explicitly
>>>>> select the preferred transfer mode for each controller instance.
>>>>> "aspeed,transfer-mode" to allow device tree to specify the desired
>>>>> transfer method used by each I2C controller instance.
>>>>>
>>>>> And AST2600 i2c controller have two register mode, one is legacy
>>>>> register layout which is mix controller/target register control
>>>>> together, another is new mode which is separate controller/target
>>>>> register control.
>>>>>
>>>>
>>>> This implies your "reg" properties have now completely different
>>>> meaning and this would be quite an ABI break. We discussed this probably
>> 15 revisions ago.
>>>> Where did you document the resolution of that discussion?
>>>
>>> Let me explain more about "reg"
>>> The 'reg' property continues to describe the same register regions
>>> (bus and buffer) as in the legacy layout. The selection between the
>>> legacy and new register layout is controlled by a bit in the SoC-level
>>> global register block, referenced through the new 'aspeed,global-regs'
>> property.
>>> Therefore, the meaning of the 'reg' property does not change and no DT
>>> ABI break occurs.
>>>
>>> Should I add it in commit message about "reg" ?
>>
>> Then why does the address change from 0x40 to 0x80. If it is the same, it
>> cannot change.
>>
>> You are describing the IO address space, total address space, as defined by
>> datasheet. Not whatever is in the driver.
> 
> Thanks for pointing that out.
> 
> But to clarify: the address change from 0x40 to 0x80 in the example is not
> arbitrary. It comes directly from the AST2600 SoC datasheet, where the

How so? Binding has an example for ast2600 with address 0x40. You now
claim the change is to adjust to ast2600. But it is ALREADY ast2600!


Best regards,
Krzysztof

