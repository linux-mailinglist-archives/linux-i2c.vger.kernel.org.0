Return-Path: <linux-i2c+bounces-3272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 895CB8B4CD0
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 18:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 916121C20A94
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 16:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9F171B25;
	Sun, 28 Apr 2024 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwqSkNv7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61416138C;
	Sun, 28 Apr 2024 16:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714322490; cv=none; b=u99t/Mu0s/ZggxIA8ykyrWld3+EKpLTrEqKZYyWZ2eTFyFuRn7h+5zPJvtesX3lX9XRnankWMjLOfqaSwDNOpmRbw8QJsnPRjbfyjnXPsasbf9IGc4BnNBq1qChU8LZEFikgodnNaV1sq7XflLhterF74WFAMhBkikJ8TBPsmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714322490; c=relaxed/simple;
	bh=Lv37Gg/npKIgGnyNYYv9foJSbP38xlfXbSo0dGpIkVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfsKBP4cko5Sm9o6dliMSrZKdyAOLATBXzbLwu3uF78KjIger4rc7W497vyVNv6NHwQD4nnWMh3hbiLcM+S+VTPCqQGP8bEiO86z+B8q3NdyA31uFkUwkzIyVdraqZ1Szce2oaKCZ5J7EDZqDisp2mIxBL5nUh8SwfNYNwQJw3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwqSkNv7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16B5C113CC;
	Sun, 28 Apr 2024 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714322489;
	bh=Lv37Gg/npKIgGnyNYYv9foJSbP38xlfXbSo0dGpIkVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JwqSkNv7BLw9SFwlgFoNeAtv1rwZZ5Jp234UkBz2nsHrKPCVytptg1KKOb2FEqky+
	 dZIS3nGkLt1y9KDvKAtcGiQDv6YgAzEIC3v3392RaxW5Ts2KVHwq/froYagP62lHKw
	 VaITJZ4btJLK3BsUNSVjm5tZetIz6hzsmuzK0pkvLOuBdH9nPtguwASFbhvXbZO6jn
	 t3RmfyHecx2sdd7KiktAz/wCbMPdZ/zJVh8TxmxFIywBYA1HbRV4HDNrmer4iV3L4U
	 Fo/1QOseFRv6wf7wW649u16q9kdR5IV4WM4qy1+dLGFvFMiahtuzvCQqY0THD0p7ZJ
	 BaKHXhHy7vMLw==
Message-ID: <5ef318a3-7fc9-47e8-9944-07365c9e377f@kernel.org>
Date: Sun, 28 Apr 2024 18:41:23 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] dt-bindings: fsi: Document the FSI2PIB engine
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-4-eajames@linux.ibm.com>
 <3f822b56-8e6a-43e4-afb0-15c964f9474e@kernel.org>
 <b89d39d2-ec54-4a88-aee5-7b5c95b3fca7@linux.ibm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <b89d39d2-ec54-4a88-aee5-7b5c95b3fca7@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/04/2024 17:00, Eddie James wrote:
> 
> On 4/26/24 01:18, Krzysztof Kozlowski wrote:
>> On 25/04/2024 23:36, Eddie James wrote:
>>> The FSI2PIB or SCOM engine provides an interface to the POWER processor
>>> PIB (Pervasive Interconnect Bus).
>>>
>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>> ---
>>>   .../devicetree/bindings/fsi/ibm,fsi2pib.yaml  | 38 +++++++++++++++++++
>>>   1 file changed, 38 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml b/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>>> new file mode 100644
>>> index 000000000000..4d557150c2e3
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/fsi/ibm,fsi2pib.yaml
>>> @@ -0,0 +1,38 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/fsi/ibm,fsi2pib.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: IBM FSI-attached SCOM engine
>>> +
>>> +maintainers:
>>> +  - Eddie James <eajames@linux.ibm.com>
>>> +
>>> +description:
>>> +  The SCOM engine is an interface to the POWER processor PIB (Pervasive
>>> +  Interconnect Bus). This node will always be a child of an FSI CFAM node;
>>> +  see fsi.txt for details on FSI slave and CFAM nodes.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - ibm,fsi2pib
>>> +      - ibm,i2cr-scom
>> Sometimes you call these p9, sometimes p10... what is the system or SoC
>> here? Aren't you adding some generic compatibles? writing-bindings and
>> numerous guides are clear on that.
> 
> 
> Open source FSI support started with P9 chips so we initially added 
> p9-sbefifo, p9-occ, etc. P10 has all of the same engines as P9 plus the 
> SPI controller, so that's why SPI is p10-spi. P11 has the same engines 
> as P10. For scom/fsi2pib we could call it p9-scom I suppose... This 
> series isn't just documentation for a new system, I'm adding 
> documentation that should have been added for P9. Anyway I'm not sure 
> what you mean about generic compatibles? You mean just add a "scom" or 
> "fsi2pib" compatible? writing-bindings says "DO make 'compatible' 
> properties specific"

Usually it means that parts of SoC must have the name of the SoC, as
first component of the name. Your boards are a bit different here,
because I suppose no one will ever make a product except you, but still
code could follow same set of rules.

Best regards,
Krzysztof


