Return-Path: <linux-i2c+bounces-11735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C771AAEFA02
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 15:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A634518866E4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 13:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BC1246784;
	Tue,  1 Jul 2025 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYSsreTH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B4022094
	for <linux-i2c@vger.kernel.org>; Tue,  1 Jul 2025 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375831; cv=none; b=KSN38VDmbFhyEZ3q72C+Lw83hTWPda3lEusZktN1CFVo/GiESH5ijcaXahXDqAMFjNvrTSn69trBKcuuSh/pqv088iC2T/d2dChmcayBifA808aq2jGTpQVMjWS0yYc+Z0g6Am0rwDCEDnQcacWfMLShiHuPDwKOei0OTeKEWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375831; c=relaxed/simple;
	bh=dX5xvueEYvrbFQRXN9JLmLYWMYP51QpILbcA9HXoRwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9pjTpt0Vu4Sil4hmOk7Id5zKOzYPTiRQn81z1U3AhVPSF4ljS/alWcYFrzDtuLOCx4RfUa3g/CSEM0IO+SqnAES/WB1yIzjUm2ABLxxGk5otHqOdJlMt4bEVcJA3eGUeqvzTM3vlpJf+dlm7SalMEyJEDOPnf3UNOAvfNi7Cys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYSsreTH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82F2C4CEEB;
	Tue,  1 Jul 2025 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751375830;
	bh=dX5xvueEYvrbFQRXN9JLmLYWMYP51QpILbcA9HXoRwI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uYSsreTHR57FxdoblF4boG6R9WZsGKDnsI5tgRCu+LwGCoyaH/bNtE5RonoFESpfe
	 Br+27Ub0DgIDRLj36SV9NIdN07QrmTZsahWQqVG2TmUWygDsjJw2sEutHJIZwcQZEn
	 6HkG/PIF32ORfO40LQIUJUjtW2H2k7crXm0RSA7fsN5lI7bUx4F6W8tehIIk/R3jRs
	 0iUHdVhk8vwRDI9A2NOA5Wrr3gN/xAvhWHzWB9Cu6TJCmJfRQamf33J8Z04kvsijPq
	 nQeFOseIIzZ+qdIufiJyVHCm5WEBhjDVNqUFxlmiXwoSGpx/wJHeuwH43uAi/HJ3Td
	 khpn9Fo2qPjrQ==
Message-ID: <b3e58bf1-d51b-481c-892c-4115bd106ed9@kernel.org>
Date: Tue, 1 Jul 2025 15:17:05 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
To: Jonas Jelonek <jelonek.jonas@gmail.com>, linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20250701091737.3430-1-jelonek.jonas@gmail.com>
 <20250701091737.3430-4-jelonek.jonas@gmail.com>
 <d123375e-48ec-43f1-bc5a-1256c2f377ec@kernel.org>
 <ad8d7f0b-1c25-4a1b-89db-6631d918f9a1@gmail.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <ad8d7f0b-1c25-4a1b-89db-6631d918f9a1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2025 14:34, Jonas Jelonek wrote:
> Hi Krzysztof,
> 
> 
> On 01.07.2025 13:33, Krzysztof Kozlowski wrote:
>> On 01/07/2025 11:17, Jonas Jelonek wrote:
>>> This extends the dt-bindings for the I2C driver for RTL9300 to account
>> Please do not use "This commit/patch/change", but imperative mood. See
>> longer explanation here:
>> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> I'll fix this in v2.
>>> for the added support for RTL9310 series.
>>>
>>> A new property is added to explicitly set the SCL num/hardware instance
>>> of the controller that is used. In contrast to RTL9300 the driver needs
>>> to know that explicitly for RTL9310 because the SCL selection is now in
>>> a global register instead of a master-specific register.
>>>
>>> The regex for child-node address is adjusted to account for the fact
>>> that RTL9310 supports 12 instead of 8 SDA lines.
>>>
>>> A single generic compatible "realtek,rtl9310-i2c" is added. To best
>>> knowledge, all existing SoCs of RTL9310 series (RTL9311, RTL9312,
>>> RTL9313) have equal I2C capabilities thus don't need special treatment.
>>
>> You always need specific front compatible (and fallback if applicable).
>>
> Since I only have RTL9313 variant in my device, I'd be able to add
> 'realtek,rtl9313-i2c' as a verified compatible. For others, I do not 
> have a list
> of which variants actually exist, if there are more variants than just 
> RTL9311,
> RTL9312 and RTL9313. Should I add compatibles for those anyway or just for
> that variant I have?


You have some very odd wrapping of emails.

Anyway, you keep mentioning in multiple places rtl9311-9313, so that's
confusing. If you mention them, I would expect compatibles. They cannot
use rtl9310 compatible alone.

I don't mind skipping them, but then just don't mention any sort of
treatment for other devices. You add this and only this hardware, if you
do not want to follow the make-binding-complete principle (see writing
bindings).

> 

> 'realtek,rtl9301-i2c' seems to be such a fallback for RTL9300, should 
> the one
> for RTL9310 be 'realtek,rtl9311-i2c' or is 'realtek,rtl9310-i2c' fine?
> Just asking because this isn't obvious to me right now.
>>
>>> However, in the unlikely case of future differences with specific
>>> SoCs within this series, more can be added as needed.
>>>
>>> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
>>> ---
>>>   .../bindings/i2c/realtek,rtl9301-i2c.yaml     | 33 ++++++++++++++++---
>>>   1 file changed, 29 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
>>> index eddfd329c67b..3b32da3de2af 100644
>>> --- a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
>>> @@ -10,9 +10,11 @@ maintainers:
>>>     - Chris Packham <chris.packham@alliedtelesis.co.nz>
>>>   
>>>   description:
>>> -  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line (which
>>> -  if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
>>> -  assigned to either I2C controller.
>>> +  The RTL9300 SoCs have two I2C controllers. Each of these has an SCL line
>>> +  (which if not-used for SCL can be a GPIO). There are 8 common SDA lines
>>> +  that can be assigned to either I2C controller.
>>> +  The RTL9310 SoCs have equal capabilities but support 12 common SDA lines
>>> +  which can be assigned to either I2C controller.
>>>   
>>>   properties:
>>>     compatible:
>>> @@ -24,6 +26,7 @@ properties:
>>>                 - realtek,rtl9303-i2c
>>>             - const: realtek,rtl9301-i2c
>>>         - const: realtek,rtl9301-i2c
>>> +      - const: realtek,rtl9310-i2c
>>>   
>>>     reg:
>>>       description: Register offset and size this I2C controller.
>>> @@ -34,8 +37,18 @@ properties:
>>>     "#size-cells":
>>>       const: 0
>>>   
>>> +  scl-num:
>>
>> No, you do not get own instance IDs.
> Is that meant for the wording/naming of the property and/or its
> description or for the general idea of this property?

You do not get such property. We don't accept it, it's generic rule.
Nowhere in the kernel... unless this is a standard, generic property
(there is no vendor prefix), but I could not find it. If it is standard
property, where is it defined in dtschema or common bindings?

I don't get the need for this property and description does not help, so
just drop it.


Best regards,
Krzysztof

